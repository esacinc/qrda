package gov.cms.qrda.validator.web.service;
/*
Copyright (c) 2016+, ESAC, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this 
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation 
   and/or other materials provided with the distribution.
 * Neither the name of HL7 nor the names of its contributors may be used to 
   endorse or promote products derived from this software without specific 
   prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.

*/

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import gov.cms.qrda.validator.model.Failure;
import gov.cms.qrda.validator.model.TestCase;
import gov.cms.qrda.validator.model.ValidationSuite;
import gov.cms.qrda.validator.xml.QRDA_URIResolver;

 /**
 * This is the implementation class for the ValidationService interface. It creates and runs validation suites using information provided by
 * the user via form input.
 * 
 * @see gov.cms.qrda.validator.web.service.ValidationService
 * 
 * @author dandonahue
 *
 */
@Service
public class ValidationServiceImpl extends CommonUtilsImpl implements ValidationService {
    private static Logger logger = LoggerFactory.getLogger(ValidationServiceImpl.class);
    
    private final static String ERROR_CSS_CLASS = "bg-danger";  // used by private method wrapErrorSpan
    private final static String OK_CSS_CLASS = "bg-success";    // used by private method wrapSuccessSpan
    
    // The validator.properties file is located in the QRDA_HOME/qrda/properties/ file space.
    // It contains the names of the ISO transform files to use when preparing a schematron for 
    // use as an xsl transform.  (The actual ISO files are located in the QRDA_HOME/qrda/isofiles/ file space.
    private static final String propertiesFile = "validator.properties";

    // Note: the fileService object used throughout this file is autowired in the CommonUtilsImpl from which this class is derived.

    /**
    * @see gov.cms.qrda.validator.web.service.ValidationService.setupValidationSuite
    *
    **/
    @Override
	public ValidationSuite setupValidationSuite(String name, String schematronType, String schematronFile, ArrayList<String> testCaseNames) {
    	Properties props = fileService.loadPropertiesExt(propertiesFile);
    	ValidationSuite vs = new ValidationSuite(name, schematronType, schematronFile);
    	vs.initIsoFilenames(props);
    	vs.setTestFilenames(testCaseNames);
    	vs.setTestCases(fileService.createTestCases(vs.getSchematronFilename(), vs.getSchematronType(), testCaseNames, vs.getNameTimestamp(), vs.getResultsFolder()));
    	if (!fileService.createResultsDir(vs.getResultsFolder())) {
    		vs.addStatusText(wrapErrorSpan("ERROR: Failed to create results folder: " + vs.getResultsFolder()));
    	};
    	return vs;
    }

    @Override
	public ValidationSuite resetValidationSuite(ValidationSuite vs) {
    	Properties props = fileService.loadPropertiesExt(propertiesFile);
    	vs.initIsoFilenames(props);
     	vs.reset();
    	vs.setTestCases(fileService.createTestCases(vs.getSchematronFilename(), vs.getSchematronType(), vs.getTestFilenames(), vs.getNameTimestamp(), vs.getResultsFolder()));
    	if (!fileService.createResultsDir(vs.getResultsFolder())) {
    		vs.addStatusText(wrapErrorSpan("ERROR: Failed to create results folder: " + vs.getResultsFolder()));
    	};
    	return vs;
    }
    /**
    *  @see gov.cms.qrda.validator.web.service.ValidationService.runValidation 
    */
	@Override
	public void runValidation(ValidationSuite vs) {
		// If we haven't done so, apply the appropriate transforms to the schematron to get an .xsl file we can use on the tests...
		if (!vs.isSchematronTransformed()) {
			transformSchematron(vs);
		}
		// If the schematron transform(s) failed, proceed no further.
		vs.addStatusText("Validation Results For Each Test File:");
		if (!vs.isSchematronTransformed()){
			vs.addStatusText(wrapErrorSpan("ERROR: The schematron file was not successfully transformed. Unable to process any test files."));
		}
		if (vs.isSchematronTransformed()) {
			// If there are no test cases to test, proceed no further.
			if (vs.getTestCases() == null || vs.getTestCases().isEmpty()) {
				vs.addStatusText(wrapErrorSpan("ERROR: No test file names were provided, or there were errors attempting to access them."));
			}
			else {
				for (TestCase testCase : vs.getTestCases()) {
					// For each test case, apply the (transformed) schematron file to the test file, and create a results report file for each.
					logger.info("VALIDATE TEST CASE -----------------------------------------------------");
					logger.info("Validate file: " + testCase.getFilename());
					testCase.addStatusText("Validate file: " + testCase.getFilename());
					boolean reportResult = performValidation(vs,testCase);
					
					// If the validation failed to generate a report, continue on to next case.
					if (!reportResult) {
						logger.error("Unable to perform validation on  " + testCase.getFilename());
						testCase.addStatusText(wrapErrorSpan("ERROR: Failed to perform validation on  " + testCase.getFilename()));
						continue;
					}
					
					testCase.addStatusText("Processing validation report: " + testCase.getValidationReportFilename());
					ArrayList<Failure> failures = null;
					// Process the report file, and collect the failures in that report into an array list in the test case.
					try {
						failures = processReport(testCase.getValidationReportFilename(), vs.getResultsFolder(), testCase);
					} catch (ParserConfigurationException e) {
						String errStr = "ERROR: Parse Exception processing the report file " + testCase.getValidationReportFilename();
						logger.error(errStr, e);
						testCase.addStatusText(wrapErrorSpan(errStr + ": " + e.getMessage()));
						continue;
					} catch (SAXException e) {
						String errStr = "ERROR: SAX Excpetion processing the report file " + testCase.getValidationReportFilename();
						logger.error(errStr,e);
						testCase.addStatusText(wrapErrorSpan(errStr + ": " + e.getMessage()));
						continue;
					} catch (IOException e) {
						String errStr = "ERROR: IO Exception processing the report file " + testCase.getValidationReportFilename();
						logger.error(errStr,e);
						testCase.addStatusText(wrapErrorSpan(errStr + ": " + e.getMessage()));
						continue;
					}
					
					// If there were failures in the report, count them (there are two types: errors and warnings) and 
					// store the counts in the test case.
					if (failures != null) {
						
						// Define some format strings for use in reporting status text
						final String summaryTemplate = "<span class='%s'> &nbsp;%d&nbsp; </span>&nbsp; Assertions failed.";
						final String specificTemplate= "<span class='%s'> &nbsp;%d&nbsp; </span>&nbsp;%s failures encountered";
						final String indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"; // Yes, yes.  Brute force. I get it.
						testCase.setErrors(failures);
						
						logger.debug("There were " + failures.size() + "failures");
						testCase.addStatusText(String.format(summaryTemplate,((failures.size() == 0)?"btn-success":""), failures.size()));
						int errorCount = 0;
						int warningCount = 0;
						for (Failure failure: failures) {
							if (failure.isCritical()) {
								errorCount++;
							}
							else {
								warningCount++;
							}
						}
						// Update the status text messages with informative information about the failure counts.
						testCase.setErrorCount(errorCount);
						testCase.setWarningCount(warningCount);
						testCase.addStatusText(String.format(specificTemplate, ((errorCount == 0)?"btn-success":"btn-danger"), errorCount, "Critical/Error"));
						// A test file may have the expected error (and warning) count in its comments header. 
						// If so, note if the expected count matches the acutal count.
						// (Note: the expected counts are determined when the test case is initialized.)
						if (testCase.getExpectedErrors() >= 0) {
							testCase.addStatusText(indent + String.format("Expected %d Critical/Error failures", testCase.getExpectedErrors()));	
							if (testCase.getExpectedErrors() == testCase.getErrorCount()) {
								testCase.addStatusText(indent + wrapSuccessSpan("EXPECTED ERRORS = ENCOUNTERED ERRORS"));
							}
							else {
								testCase.addStatusText(indent + wrapErrorSpan("EXPECTED ERRORS <>  ENCOUNTERED ERRORS"));
							}
						}
						
						testCase.addStatusText(String.format(specificTemplate, ((warningCount == 0)?"btn-success":"btn-warning"), warningCount, "Non-Critical/Warning"));

						if (testCase.getExpectedWarnings() >= 0) {
							testCase.addStatusText(indent + String.format("Expected %d Non-Critical/Warning failures", testCase.getExpectedWarnings()));
							if (testCase.getExpectedWarnings() == testCase.getWarningCount()) {
								testCase.addStatusText(indent + wrapSuccessSpan("EXPECTED WARNINGS = ENCOUNTERED WARNINGS"));
							}
							else {
								testCase.addStatusText(indent + wrapErrorSpan("EXPECTED WARNINGS <>  ENCOUNTERED WARNINGS"));
							}

						}
						
					}
				}
			}
		}
		fileService.writeTestSuite(vs);
	}

	@Override
	public ValidationSuite getValidationFromHistory(String type, String filename) {
		try {
			ValidationSuite newvs = fileService.readTestSuite( type, filename);
			if (newvs != null) {
				for (TestCase tc : newvs.getTestCases()) {
					// Older histories do not have validation report UL set, so we need to insure it is set properly
					String oldURL = tc.getValidationReportURL();
					if (oldURL == null || oldURL.isEmpty()) {
						tc.setValidationReportURL(fileService.convertToURL(tc.getValidationReportPath(), QRDA_URIResolver.REPOSITORY_RESULTS));
					}
				}
				return newvs;
			}
			else {
				return null;
			}
		}
		catch (Exception e) {
			logger.error("Error retrieving validation suite from history at: " + type + ", " + filename + ": ",e);
			return null;
		}
	}
    //////////////////////////////PRIVATE/PROTECTED METHODS //////////////////////////////////////////////////

	
    // Before using a schematron to validate a file, we must apply three transforms to the schematron. The
    // result is an .xsl file that can be used on a test file to perform the validation.
    // The three transforms that must be performed in order are:
	//
    //     ISO Include file
    //     ISO Abstract file
    //     XSLT Transformation
    //
    // This method performs the three transformations, in order. If any one fails, the process stops.
    // If successful, the validation suite's isTransformed value is set to true.
	//
	// Also note that the vocabulary file referenced by the schematron (typically called voc.xml) must 
	// be co-located int he same folder as the transmformation files described here.
	//
	protected boolean transformSchematron(ValidationSuite vs) {
		boolean isTransformed = false;
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss");
		vs.addStatusText("VALIDATION TEST(S): " + vs.getName() + " performed on " + dateFormat.format(date)); 
		if (applyInlcudeTransform(vs)) {
			if (applyAbstractTransform(vs)) {
				if (applyXSLTTransform(vs)) {
					isTransformed = true;
				}
			}
		}
		vs.setSchematronTransformed(isTransformed);
		return isTransformed;
	}
	
	// This applies the ISO Include transformation to the schematron file, and stores the resulting transform file
	// in this validation suites' results directory. 
	//
	private boolean applyInlcudeTransform(ValidationSuite vs) {
		
		String isoIncludeFilename = vs.getIsoIncludeFilename();
		logger.info("FIRST TRANSFORM:  ISO INCLUDES-----------------------------------------------------");
		logger.info("Transform using " + isoIncludeFilename);
		boolean result = true;
		// Now read the first set of input files and open a file for writing the resulting transform results
		InputStream qrdaSchematron = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_SCHEMATRONS, vs.getSchematronType(), vs.getSchematronFilename());
		InputStream includeXsl = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_ISO,vs.getSchematronType(), isoIncludeFilename);
		OutputStream qrdaFirstTransform = fileService.openExtFileForWriting(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getResultsFolder(),vs.getIncludeTransformFilename());
		// If there were problems opening any of the files (for reading or writing), proceed no further.
		if (qrdaSchematron == null) {
			vs.addStatusText(wrapErrorSpan("ERROR:  Unable to open schematron file: " + vs.getSchematronFilename()));
			result = false;
		}
		if (includeXsl == null) {
			vs.addStatusText(wrapErrorSpan("ERROR:  Unable to open ISO Includes transform file: " + isoIncludeFilename));
			result = false;
		}
		if (qrdaFirstTransform == null) {
			vs.addStatusText(wrapErrorSpan("ERROR: Unable to open transform file for writing:" + vs.getIncludeTransformFilename()));
			result = false;
		}

		if (result) {
			// Perform the transform. The results will be in the qrdaFirstTransform file, opened above.
			qrdaFirstTransform = performTransform(qrdaSchematron, includeXsl, qrdaFirstTransform, vs, null);
			if (qrdaFirstTransform == null) {
				vs.addStatusText(wrapErrorSpan("ERROR:  Failed applying transform " + isoIncludeFilename + " to " + vs.getSchematronFilename()));
			}
			else {
				vs.addStatusText("Successfully applied transform " + isoIncludeFilename + " to " + vs.getSchematronFilename());

			}
			result = qrdaFirstTransform != null;
		}
		return result;
	}

	// This applies the ISO Abstract transformation to the results of the ISO Include transformation file, 
	// and stores the resulting transform file in this validation suites' results directory. 
	//
	private boolean applyAbstractTransform(ValidationSuite vs) {

		String isoAbstractFilename = vs.getIsoAbstractFilename();
		logger.info("SECOND TRANSFORM:  ISO ABSTRACTS-----------------------------------------------------");
		logger.info("Transform using " + isoAbstractFilename);
		boolean result = true;
		
		// Open the ISO abstract file for input. If we fail, proceed no further
		InputStream abstractXsl = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_ISO, vs.getSchematronType(), isoAbstractFilename);
		if (abstractXsl == null) {
			vs.addStatusText(wrapErrorSpan("ERROR: Unable to open ISO Abstract transform file: " + isoAbstractFilename));
			result = false;
		}
		if (result) {
			// Open the results file from the ISO transform. If this doesn't work, proceed no further.
			InputStream firstTransform = null;
			try {
				firstTransform = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getResultsFolder(), vs.getIncludeTransformFilename());
			} catch (Exception e) {
				logger.error("Unable to read file " + vs.getIncludeTransformFilename());
				vs.addStatusText(wrapErrorSpan("ERROR: Unable to open includes-transformed schematron file: " + vs.getIncludeTransformFilename()));
				result = false;
			}
			// Create the results file for this transformation. If we fail, proceed no further
			OutputStream qrdaSecondTransform = fileService.openExtFileForWriting(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getResultsFolder(),vs.getAbstractTransformFilename());
			if (qrdaSecondTransform == null) {
				vs.addStatusText(wrapErrorSpan("ERROR: Unable to open abstracts-transform file for writing:" + vs.getAbstractTransformFilename()));
				result = false;
			}

			if (result) {
				// Perform the transform. The results will be in the qrdaSecondTransform file, opened above.
				qrdaSecondTransform = performTransform(firstTransform, abstractXsl, qrdaSecondTransform, vs, null);
				if (qrdaSecondTransform == null) {
					vs.addStatusText(wrapErrorSpan("ERROR: Failed applying transform " + isoAbstractFilename + " to " + vs.getSchematronFilename()));
					result = false;
				}
				else {
					vs.addStatusText("Successfully applied transform " + isoAbstractFilename + " to " + vs.getSchematronFilename());
		
				}
				result =  qrdaSecondTransform != null;
			}
		}
		return result;
	}

	// This applies the transformation to an XSL file of the results of the ISO Abstact transformation file, 
	// and stores the resulting final transform file in this validation suites' results directory. 
	//
	private boolean applyXSLTTransform(ValidationSuite vs) {

		String xsltFilename = vs.getIsoXsltFilename();
		logger.info("THIRD TRANSFORM:  SCHEMATRON TO XSLT -----------------------------------------------------");
		logger.info("Transform using " + xsltFilename);
		boolean result = true;
		
		// Open the XSL transform file. If we fail, proceed no further.
		InputStream abstractXsl = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_ISO,vs.getSchematronType(),xsltFilename);
		if (abstractXsl == null) {
			vs.addStatusText(wrapErrorSpan("ERROR:  Unable to open ISO abstract-transformed schematron file: " + xsltFilename));
			result = false;
		}
		if (result) {
			// Open the results file from the second transformation (Abstract transform). If we fail, proceed no further.
			InputStream secondTransform = null;
			try {
				secondTransform = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getResultsFolder(), vs.getAbstractTransformFilename());
			} catch (Exception e) {
				logger.error("Unable to read file " + vs.getAbstractTransformFilename());
				vs.addStatusText(wrapErrorSpan("ERROR:  Unable to open abstracts-transformed schematron file: " + vs.getAbstractTransformFilename()));
			}
			if (result) {
				// Create the (final) results file. If we fail, proceed no further.
				OutputStream qrdaThirdTransform = fileService.openExtFileForWriting(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getResultsFolder(),vs.getTransformedSchematronFilename());
				if (qrdaThirdTransform == null) {
					vs.addStatusText(wrapErrorSpan("ERROR:  Unable to open xslt file for writing:" + vs.getTransformedSchematronFilename()));
					result = false;
				}
				if (result) {
					// Perform the final transform, which generates an xsl file version of the original schematron.
					// Store the results in the qrdaThirdTransform file, opened above.
					qrdaThirdTransform = performTransform(secondTransform, abstractXsl, qrdaThirdTransform, vs, null);
					if (qrdaThirdTransform == null) {
						vs.addStatusText(wrapErrorSpan("ERROR:  Failed applying transform " + xsltFilename + " to " + vs.getSchematronFilename()));
						result = false;
					}
					else {
						vs.addStatusText("Successfully applied transform " + xsltFilename + " to " + vs.getSchematronFilename());
			
					}
					result= qrdaThirdTransform != null;
				}
			}
		}
		return result;
	}
	
	// Uses the generated schematron transform file against the sample XML file stored in the given TestCase object
	// to perform the validation. Generatea a validation report in the validation suite's results folder in the QRDA_HOME/result filespace.
	protected boolean performValidation (ValidationSuite testSuite, TestCase testCase) {
		boolean result = true;
		logger.info("Validate " + testCase.getFilename() + " using " + testCase.getSchematronFilename());
		// Open the test case file 
		InputStream sampleXml = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_TESTFILES, testSuite.getSchematronType(),testCase.getFilename());
		if (sampleXml == null) {
			testCase.addStatusText(wrapErrorSpan("ERROR:  Unable to open test file for validation:" + testCase.getFilename() ));
			result = false;
		}
		// Open the transformed schematron xsl file
		InputStream schematron = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_RESULTS, testSuite.getResultsFolder(), testSuite.getTransformedSchematronFilename());
		if (schematron == null) {
			testCase.addStatusText(wrapErrorSpan("ERROR:  Unable to open (transformed) Schematron for validation:" + testSuite.getTransformedSchematronFilename() ));
			result = false;
		}
		// Open a report file for writing.
		OutputStream validationReport = fileService.openExtFileForWriting(QRDA_URIResolver.REPOSITORY_RESULTS, testSuite.getResultsFolder(), testCase.getValidationReportFilename());
		if (validationReport == null) {
			testCase.addStatusText(wrapErrorSpan("ERROR:  Unable to open test case validation report for writing:" + testCase.getValidationReportFilename()));
			result = false;
		}
		// Remember the canonical (absolute) path for the results file. (We use this to enable file downloading on the UI)
		testCase.setValidationReportPath(fileService.getAbsolutePath(testCase.getValidationReportFilename(),QRDA_URIResolver.REPOSITORY_RESULTS,testSuite.getResultsFolder()));
		logger.debug("Report path: " + testCase.getValidationReportPath());
		testCase.setValidationReportURL(fileService.convertToURL(testCase.getValidationReportPath(), QRDA_URIResolver.REPOSITORY_RESULTS));
		// If all of the files were opened okay, then proceed with the transform.
		if (result) {
			validationReport = performTransform(sampleXml, schematron, validationReport, testSuite, testCase);
			result = validationReport != null;
		}
		return result;
	}
	
	// Performs an XSLT transformation on the source stream using the transform stream and writes the result to
	// an output file stream.
	//
	// Note: TestCase may be null, indicating we are doing transform on the schematron file prior to the  test case validations

	protected OutputStream performTransform(InputStream source, InputStream transform, OutputStream outputFile, ValidationSuite vs, TestCase ts) {
		logger.info("Perform Transform: " + source + " using " + transform + " to " + outputFile);
		String err = "";
		try {	
			// Set up a URI resolver that the transformer will use to resolve relative URIs encountered in the data file
			// Force the use of Saxon for the transformer
			TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();
			logger.debug("Set factory uri resolver...");
			factory.setURIResolver(vs.getFileResolver());  // Factory needs to be able to resolve relative hrefs in the source transform file when creating a transformer, below.
			Transformer transformer;
				try {
					StreamSource sSource = new StreamSource(transform);
					transformer = factory.newTransformer(sSource);
					transformer.setURIResolver(vs.getFileResolver());  // Set the transformer instance's URI resolver as well so it can resolve relative hrefs in the input file.
					transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
					transformer.setOutputProperty(OutputKeys.INDENT, "yes");
					try {
						transformer.transform(new StreamSource(source), new StreamResult(outputFile)); 
					} catch (TransformerException e) {
						err = wrapErrorSpan("ERROR: Transformer Exception while performing transform. " + e.getMessage());
						if (ts == null)  vs.addStatusText(err); else ts.addStatusText(err);
						logger.error("Transform Exception ", e);
					}
				} catch (TransformerConfigurationException e) {
					err = wrapErrorSpan("ERROR: Transformer Configuration Exception while performing transform. " + e.getMessage());
					if (ts == null)  vs.addStatusText(err); else ts.addStatusText(err);
					logger.error("Transform Configuration Exception ", e);
				}
									
				try {
					outputFile.close();
				} catch (IOException e) {
					err = wrapErrorSpan("ERROR: Exception while closing output file. " + e.getMessage());
					if (ts == null)  vs.addStatusText(err); else ts.addStatusText(err);
					logger.error("Exception closing output stream ", e);
				}
		} catch (Exception e) {
			err = wrapErrorSpan("ERROR: Exception while performing transform. " + e.getMessage());
			if (ts == null)  vs.addStatusText(err); else ts.addStatusText(err);
			logger.error("Catchall Exception performing transform ", e);
		} finally {
			try {
				outputFile.close();
			} catch (IOException e) {
				err = wrapErrorSpan("ERROR: Exception while closing output file. " + e.getMessage());
				if (ts == null)  vs.addStatusText(err); else ts.addStatusText(err);
				logger.error("Exception closing output stream a second time ", e);
			}
		}
			
		return outputFile;
	}
	
	// Opens the report file generated by the transform process, and collects the failures to be returned.
	// The folder argument is the name of the results folder  from the validation suite that ran the transformation tests.
	//
	
	
	protected ArrayList<Failure> processReport(String filename, String folder, TestCase tc) throws ParserConfigurationException, SAXException, IOException {
		logger.info("Process validation report: " + filename);
		
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		InputStream reportFile = fileService.openExtFileForReading(QRDA_URIResolver.REPOSITORY_RESULTS, folder, filename);
		Document doc = db.parse(reportFile);
		
		// Look at the failed-assert elements to see what failed
		NodeList failureNodes = doc.getElementsByTagName("svrl:failed-assert");
		
		// Create the list of failures
		ArrayList<Failure> failures = new ArrayList<Failure>(failureNodes.getLength());
		
		for (int i = 0; i < failureNodes.getLength(); i++) {
			Node failure = failureNodes.item(i);
			Failure fail = new Failure();
			NamedNodeMap attrs = failure.getAttributes();
			
			// Get the rule element that this failure corresponds to
			Node rule = getPreviousSibling(failure, tc);
			while (!rule.getNodeName().equals("svrl:fired-rule")) {
				rule = getPreviousSibling(rule, tc);
			}
			
			// Include info about the fired assert's rule & context
			Node parent = rule.getParentNode();
			NamedNodeMap parentAttrs = rule.getAttributes();
			for (int j = 0; j<parentAttrs.getLength(); j++) {
				Node attr = parentAttrs.item(j);
				String attrText = getNodeText(attr);
				if (attr.getNodeName().equals("id")) {
					fail.setRule(attrText);
				}
				if (attr.getNodeName().equals("context")) {
						fail.setContext(attrText);
				}
			}
			NamedNodeMap ruleAttrs = rule.getAttributes();
						
			// Populate the failure attributes
			for (int j = 0; j < attrs.getLength(); j++) {
				Node attr = attrs.item(j);
				
				String attrText = getNodeText(attr);
				if (attr.getNodeName().equals("id")) {
					fail.setId(attrText);
				}
				
				if (attr.getNodeName().equals("location")) {
					fail.setLocation(attrText);
				}
				if (attr.getNodeName().equals("test")) {
					fail.setTest(attrText);
				}
			}
			
			// Set the critical flag if the rule was an error rule
			for (int j = 0; j < ruleAttrs.getLength(); j++) {
				Node attr = ruleAttrs.item(j);
				
				String attrText = getNodeText(attr);
				
				if (attr.getNodeName().equals("id")) {
					if (attrText.contains("error")) {
						fail.setCritical(true);
					}
				}
			}
			
			// Populate the failure text
			Node text = findSubNode("svrl:text", failure, tc);
			if (text != null) {
				String failureText = getNodeText(text);
				failureText = failureText.replace(". ",".<br/>"); // Make failure text more readable by adding some line breaks
				fail.setStatement(failureText);
			}
			
			failures.add(fail);
		}
		
		return failures;
	}
	

	 // Find the named subnode in a node's sublist.
	 // 
	 // Ignores comments and processing instructions.
	 // Ignores TEXT nodes (likely to exist and contain
	 //         ignorable whitespace, if not validating.
	 // Ignores CDATA nodes and EntityRef nodes.
	 // Examines element nodes to find one with
	 //        the specified name.
	 // 
	private Node findSubNode(String name, Node node, TestCase tc) {
	    if (node.getNodeType() != Node.ELEMENT_NODE) {
	        logger.error("ERROR: Search node not of element type");
	        tc.addStatusText(wrapErrorSpan("ERROR: Report processing - Search for node with name: " + name + ". Node " + node.getNodeName() + " not of ELEMENT_NODE type"));
	        return null;
	    }

	    if (! node.hasChildNodes()) return null;

	    NodeList list = node.getChildNodes();
	    for (int i=0; i < list.getLength(); i++) {
	        Node subnode = list.item(i);
	        if (subnode.getNodeType() == Node.ELEMENT_NODE) {
	           if (subnode.getNodeName().equals(name)) 
	               return subnode;
	        }
	    }
	    return null;
	}
	
	 // Returns the previous sibling but only if it is an element. This handles the text
	 // nodes that may be in between them.
	 // 
	private Node getPreviousSibling(Node node, TestCase tc) {
		if (node.getNodeType() != Node.ELEMENT_NODE) {
	        logger.error("ERROR: Search node not of element type");
	        tc.addStatusText(wrapErrorSpan("ERROr: Report processing - Node " + node.getNodeName() + " not of ELEMENT_NODE type"));
	        return null;
	    }

		Node previous = node.getPreviousSibling();
	    if (previous == null) {
	    	return null;
	    }
	    
	    while (previous.getNodeType() != Node.ELEMENT_NODE) {
	    	previous = previous.getPreviousSibling();
	    }
	    
	    return previous;
	}
	
	  // Return the text that a node contains. This routine:
	  // 
	  // Ignores comments and processing instructions.
	  // Concatenates TEXT nodes, CDATA nodes, and the results of
	  //     recursively processing EntityRef nodes.
	  // Ignores any element nodes in the sublist.
	  //     (Other possible options are to recurse into element 
	  //      sublists or throw an exception.)
	  // 
	private String getNodeText(Node node) {
	    StringBuffer result = new StringBuffer();
	    if (! node.hasChildNodes()) return "";

	    NodeList list = node.getChildNodes();
	    for (int i=0; i < list.getLength(); i++) {
	        Node subnode = list.item(i);
	        if (subnode.getNodeType() == Node.TEXT_NODE) {
	            result.append(subnode.getNodeValue());
	        }
	        else if (subnode.getNodeType() == Node.CDATA_SECTION_NODE) {
	            result.append(subnode.getNodeValue());
	        }
	        else if (subnode.getNodeType() == Node.ENTITY_REFERENCE_NODE) {
	            // Recurse into the subtree for text
	            // (and ignore comments)
	            result.append(getNodeText(subnode));
	        }
	    }

	    return result.toString();
	}
	
	// Wraps an html span element around the given string with a css class indicating an error
	private String wrapErrorSpan(String str) {
		return wrapSpan( ERROR_CSS_CLASS, str);
	}
	
	// Wraps an html span element around the given string with a css class indicating success
	private String wrapSuccessSpan(String str) {
		return wrapSpan( OK_CSS_CLASS, str);
	}
	
	// Wraps an html span element around the given string with a css class 
	private String wrapSpan(String cssClass, String str) {
		return String.format("<span class='%s'>%s</span>", cssClass, str);
	}
}