package gov.cms.qrda.schematron.validate;

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
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import gov.cms.qrda.schematron.merge.MergeInstructions;
import net.sf.saxon.TransformerFactoryImpl;

/**
 * This class validates an xml file using a schematron.
 * 
 * @author michaelholck
 *
 */
public class Validator {
	private static final String propertiesFile = "validator.properties";
	private MergeInstructions results = null; // For collecting info during the validation process.

		public Validator (MergeInstructions mergeInst) {
			results = mergeInst;
		}
		
		// Validate all of the files in the testFiles list using the given schematron. Populate the results list
		// in the mergeInstructions with status messages generated during the merge process.
		public int  validate(String schematronFile, List<String> testFiles, MergeInstructions mergeInstructions) {
			boolean isVerbose = mergeInstructions.getVerbose();
			if (results == null) {
				results = mergeInstructions;
			}
			//if (results.getVerbose()) results.addResult(MergeInstructions.INDENT2+"Validating schematron: " + schematronFile);

			int failCount = 0; // count number of files that did not meet error count expectations
			Properties props = loadProperties(propertiesFile);
		
			// If we could not read the properties file then exit with error
			if (props == null) {
				String msg = "Unable to read properties file: " + propertiesFile;
				results.addResult(MergeInstructions.INDENT3+msg);
				System.err.println(msg);
				//return 1;
				return failCount;
			}
		
			boolean transformResult = transformSchematron(schematronFile,props);
		
			if (transformResult == false) {
				//res = 2;
				System.err.println("No transformResult returned for transformSchematron call");
				//return res;
				return failCount;
			}
		
			// If that worked we now have an XSL file to use on the XML to validate
			// So for each sample file in the properties file run a validation and report process
			if (isVerbose) {
				results.addResult(MergeInstructions.INDENT1 + "_______________________________________________________________");
				results.addResult(MergeInstructions.INDENT1 + "SCHEMATRON: " + schematronFile);
			}
			for (String testFile : testFiles) {
				boolean reportResult = performValidation(props, testFile);
				
				if (!reportResult) {
					String msg = "Unable to process the report file " + props.getProperty("qrda.reportFile");
					results.addResult(MergeInstructions.INDENT3+msg);
					if (isVerbose) System.err.println(msg);
					//return 3;
					return failCount;
				}
				
				// Create an error report object populated with the expected error and warning count present in the test file, if any.
				TestFile errorReport = results.findExpectedErrorText(testFile);
				// Count failures and add to the errorReport object.
				ArrayList<Failure> failures = null;
				try {
					failures = processReport(props);
				} catch (ParserConfigurationException e) {
					String msg = "ParserConfigurationException Error processing the report file " + props.getProperty("qrda.reportFile") + ", " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (isVerbose) System.err.println(msg);
					//return 4;
					return failCount;
				} catch (SAXException e) {
					String msg = "SAXException Error processing the report file " + props.getProperty("qrda.reportFile") + ", " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (isVerbose) System.err.println(msg);
					//return 5;
					return failCount;
				} catch (IOException e) {
					String msg = "IO Exception Error processing the report file " + props.getProperty("qrda.reportFile") + ", " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (isVerbose) System.err.println(msg);
					//return 6;
					return failCount;
				}
				if (isVerbose) {
					//results.addResult(MergeInstructions.INDENT2 + "_______________________________________________________________");
					//results.addResult(MergeInstructions.INDENT2 + "Schematron File: " + schematronFile);
					results.addResult(MergeInstructions.INDENT2 + " ");
					results.addResult(MergeInstructions.INDENT2 + "TEST FILE: " + testFile);
				}
				System.out.println("TESTFILE: " + testFile);
				if (failures != null) {
					int errs = 0;
					int warns = 0;
					for (Failure fail : failures) {
						if (fail.isCritical()) {
							if (isVerbose) {
								results.addResult(MergeInstructions.INDENT4+"Error: " + fail.getId() + " at " + fail.getLocation() + ": " + fail.getTest());
								results.addResult(MergeInstructions.INDENT5+ fail.getStatement());
							}
							errs++;
						}
						else {
							if (isVerbose) {
								results.addResult(MergeInstructions.INDENT4+"Warning: " + fail.getId() + " at " + fail.getLocation() + ": " + fail.getTest());
								results.addResult(MergeInstructions.INDENT5+ fail.getStatement());
							}

							warns++;
						}
					}
					errorReport.setErrors(errs);
					errorReport.setWarnings(warns);
					int warningExp = errorReport.getExpectedWarnings();
					int errorExp = errorReport.getExpectedErrors();
					if (errorExp < 0) { // No expected errors value (and presumably expected warnings) present in the test file header.
						if (errorReport.getErrors() == 0) { // No actual errors encountered, so assume file is good. No message needed.
							//res = 0;  
						}
						else { // Actual errors present, so assume file has unintended errors.
							//res = 97;
							mergeInstructions.addResult(MergeInstructions.INDENT4+testFile+": Expected Errors value not specified.  (" + errs + " critical error(s) and " + warns + " warning(s))");
						}
					}
					else { // Expected error value present in file header...
						
						if (!errorReport.asExpected()) { // If expected doesn't match actual, then output a message.
							//res = 98;
							failCount++;
							mergeInstructions.addResult(MergeInstructions.INDENT4+testFile+": Failure count inconsistent with expectations for this file. (Errors: expected " + errorReport.getExpectedErrors() + ", actual " + errs + ") (Warnings: expected " + ((warningExp < 0)?"N/A":warningExp) + ", actual " + warns +")");
						}
						else { // Otherwise, results as expected. No message needed.
							//res = 0;
						}
					}
					if (isVerbose) {
						results.addResult(MergeInstructions.INDENT3 + "");
						results.addResult(MergeInstructions.INDENT3 + "(Errors: expected " + errorReport.getExpectedErrors() + ", actual " + errs + ") (Warnings: expected " + ((warningExp < 0)?"N/A":warningExp) + ", actual " + warns +")");
					}

				}
			}

			return failCount;
	}
	
	/**
	 * loads the properties file
	 * 
	 * @return The properties file
	 */
	protected Properties loadProperties(String propertiesFilename) {
		Properties props = new Properties();
		InputStream propsIn = ClassLoader.getSystemResourceAsStream(propertiesFilename);
		
		// Try to read the properties file for what files to use
		if (propsIn != null) {
			try {
				props.load(propsIn);
			} catch (IOException e) {
				props = null;
			}
		}
		
		return props;
	}
	
	/**
	 * Performs the XSLT transforms to the Schematron file to create the XSL for validation
	 * 
	 * @param props The properties file to use for locating the files to use
	 * @return a boolean indicating success or not
	 */
	protected boolean transformSchematron(String schematronFile, Properties props) {
		boolean result = false;
		props.put("qrda.schematron", schematronFile);
		
		//System.out.println("Starting Schematron Transformation");
		//System.out.println("Transform using " + props.getProperty("iso.include"));
		
		// Now read the first set of input files and do the first transform
		File file = new File(schematronFile);
		try {
		    FileInputStream propsIn = new FileInputStream(file);
		    FileInputStream qrdaSchematron = new FileInputStream(file);
			InputStream includeXsl = ClassLoader.getSystemResourceAsStream(props.getProperty("iso.include"));
			FileOutputStream qrdaFirstTransform = performTransform(qrdaSchematron, includeXsl, props.getProperty("qrda.firstTransform"));
		
			// Now if that worked do the second phase
			FileOutputStream qrdaSecondTransform = null;
			if (qrdaFirstTransform != null) {
				//System.out.println("Transform using " + props.getProperty("iso.abstract"));
				InputStream abstractXsl = ClassLoader.getSystemResourceAsStream(props.getProperty("iso.abstract"));
				FileInputStream firstTransform = null;
				try {
					firstTransform = new FileInputStream(props.getProperty("qrda.firstTransform"));
				} catch (FileNotFoundException e) {
					String msg = "FileNotFoundException, First transform. Unable to read file " + props.getProperty("qrda.firstTransform") + ", " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (results.getVerbose()) System.err.println(msg);
					result = false;
				}
				qrdaSecondTransform = performTransform(firstTransform, abstractXsl, props.getProperty("qrda.secondTransform"));
			}
			
			// If the second phase worked then do the final transform
			FileOutputStream qrdaFinalTransform = null;
			if (qrdaSecondTransform != null) {
				//System.out.println("Transform using " + props.getProperty("iso.svrl"));
				InputStream abstractXsl = ClassLoader.getSystemResourceAsStream(props.getProperty("iso.svrl"));
				FileInputStream secondTransform = null;
				try {
					secondTransform = new FileInputStream(props.getProperty("qrda.secondTransform"));
				} catch (FileNotFoundException e) {
					String msg = "FileNotFoundException, Second Transform. Unable to read file " + props.getProperty("qrda.firstTransform") + ", " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (results.getVerbose()) System.err.println(msg);
					result = false;
				}
				qrdaFinalTransform = performTransform(secondTransform, abstractXsl, props.getProperty("qrda.thirdTransform"));
			}
			
			if (qrdaFinalTransform != null) {
				result = true; // true means ok
			}
			else {
				results.addResult(MergeInstructions.INDENT3+"Third transform failed: " + props.getProperty("qrda.thirdTransform"));
			}
		}
		catch (Exception e) {
			String msg = "Exception during transformation process: " + e.getMessage();
			results.addResult(MergeInstructions.INDENT3+msg);
			if (results.getVerbose()) System.err.println(msg);
			result = false;
		}
		
		return result;
	}
	
	/**
	 * Uses the generated transform file against the provided sample XML file to perform the validation
	 * and generate the validation report
	 * 
	 * @param props
	 * @return
	 */
	protected boolean performValidation (Properties props, String testFile) {
		boolean result = false;
		//props.put("testFile", testFile);
		FileOutputStream validationReport = null;
		//System.out.println("Validate " + props.getProperty("sample.xml." + fileIndex) + " using " + props.getProperty("qrda.thirdTransform"));
		File file = new File(testFile);
		FileInputStream sampleXml = null;
		try {
			sampleXml = new FileInputStream(file);
		}
		catch (Exception e) {
			String msg = "Exception performing validation on file " + testFile + ", " + e.getMessage();
			results.addResult(MergeInstructions.INDENT3+msg);
			if (results.getVerbose()) System.err.println(msg);
			result = false;
		}
		//InputStream sampleXml = ClassLoader.getSystemResourceAsStream(props.getProperty("testFile"));
		FileInputStream thirdTransform = null;
		
		try {
			thirdTransform = new FileInputStream(props.getProperty("qrda.thirdTransform"));
		} catch (FileNotFoundException e) {
			String msg = "FileNotFoundException while performing validation. Unable to read file " + props.getProperty("qrda.thirdTransform");
			results.addResult(MergeInstructions.INDENT3+msg);
			if (results.getVerbose()) System.err.println(msg);
			result = false;
		}
		
		validationReport = performTransform(sampleXml, thirdTransform, props.getProperty("qrda.reportFile"));
		if (validationReport != null) {
			result = true; // true means ok
		}
		else {
			results.addResult(MergeInstructions.INDENT3+"performTransform operation on " + testFile + " failed");
		}
		
		return result;
	}
	
	/**
	 * Performs an XSLT transformation on the source stream using the transform stream and writes the result to
	 * a file named by outputFilename.
	 * 
	 * @param source This should be an XML file that needs to be transformed in some way
	 * @param transform This should be an xslt file to perform the transformation
	 * @param outputFilename This is the name of the file to write the transformed output too
	 * @return
	 */
	protected FileOutputStream performTransform(InputStream source, InputStream transform, String outputFilename) {
		//System.out.println("Transform output: " + outputFilename);
		FileOutputStream result = null;
		
		// Force the use of Saxon for the transformer
		TransformerFactory factory = new TransformerFactoryImpl();
		Transformer transformer;

		try {
			result = new FileOutputStream(outputFilename);
			
			try {
				transformer = factory.newTransformer(new StreamSource(transform));
				transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
				transformer.setOutputProperty(OutputKeys.INDENT, "yes");
							    
				try {
					transformer.transform(new StreamSource(source), new StreamResult(result));
				} catch (TransformerException e) {
					String msg = "TransformerException: " + e.getMessage();
					results.addResult(MergeInstructions.INDENT3+msg);
					if (results.getVerbose()) {
						System.err.println(msg);
						e.printStackTrace();
					}
				}
			} catch (TransformerConfigurationException e) {
				String msg = "TransformerConfigurationExcetpion: " + e.getMessage();
				results.addResult(MergeInstructions.INDENT3+msg);
				if (results.getVerbose()) {
					System.err.println(msg);
					e.printStackTrace();
				}
			}
								
			try {
				result.close();
			} catch (IOException e) {
				String msg = "IOException closing output file " + outputFilename + ", " + e.getMessage();
				results.addResult(MergeInstructions.INDENT3+msg);
				if (results.getVerbose()) {
					System.err.println(msg); 
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException e) {
			String msg = outputFilename + "FileNotFoundException on file " + outputFilename + ": " + e.getMessage();
			results.addResult(MergeInstructions.INDENT3+msg);
			if (results.getVerbose()) {
				System.err.println(msg); 
				e.printStackTrace();
			}
		} finally {
			try {
				result.close();
			} catch (IOException e) {
				if (results.getVerbose()) {
					System.err.println(MergeInstructions.INDENT3+"IOException when closing file. " + e.getMessage()); 
					e.printStackTrace();
				}

			}
		}
			
		return result;
	}
	
	/**
	 * Opens the report file generated and collects the failures to be returned
	 * 
	 * @param props The properties file with the file values
	 * @return An ArrayList of failures
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 */
	protected ArrayList<Failure> processReport(Properties props) throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse(new File(props.getProperty("qrda.reportFile")));
		
		// Look at the failed-assert elements to see what failed
		NodeList failureNodes = doc.getElementsByTagName("svrl:failed-assert");
		
		// Create the list of failures
		ArrayList<Failure> failures = new ArrayList<Failure>(failureNodes.getLength());
		
		for (int i = 0; i < failureNodes.getLength(); i++) {
			Node failure = failureNodes.item(i);
			Failure fail = new Failure();
			NamedNodeMap attrs = failure.getAttributes();
			
			// Get the rule element that this failure corresponds to
			Node rule = getPreviousSibling(failure);
			while (!rule.getNodeName().equals("svrl:fired-rule")) {
				rule = getPreviousSibling(rule);
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
			Node text = findSubNode("svrl:text", failure);
			if (text != null) {
				String failureText = getNodeText(text);
				fail.setStatement(failureText);
			}
			
			failures.add(fail);
		}
		
		return failures;
	}
	
	/**
	 * Find the named subnode in a node's sublist.
	 * <ul>
	 * <li>Ignores comments and processing instructions.
	 * <li>Ignores TEXT nodes (likely to exist and contain
	 *         ignorable whitespace, if not validating.
	 * <li>Ignores CDATA nodes and EntityRef nodes.
	 * <li>Examines element nodes to find one with
	 *        the specified name.
	 * </ul>
	 * @param name  the tag name for the element to find
	 * @param node  the element node to start searching from
	 * @return the Node found
	 */
	private Node findSubNode(String name, Node node) {
	    if (node.getNodeType() != Node.ELEMENT_NODE) {
	        System.err.println("Error: Search node not of element type");
	        System.exit(22);
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
	
	/**
	 * Returns the previous sibling but only if it is an element. This handles the text
	 * nodes that may be in between them.
	 * 
	 * @param node The node to get the previous sibling of
	 * @return Node The previous sibling element
	 */
	private Node getPreviousSibling(Node node) {
		if (node.getNodeType() != Node.ELEMENT_NODE) {
	        System.err.println("Error: Search node not of element type");
	        System.exit(22);
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
	
	/**
	  * Return the text that a node contains. This routine:
	  * <ul>
	  * <li>Ignores comments and processing instructions.
	  * <li>Concatenates TEXT nodes, CDATA nodes, and the results of
	  *     recursively processing EntityRef nodes.
	  * <li>Ignores any element nodes in the sublist.
	  *     (Other possible options are to recurse into element 
	  *      sublists or throw an exception.)
	  * </ul>
	  * @param    node  a  DOM node
	  * @return   a String representing its contents
	  */
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
	
	// This validates an xml file against a CDA xsd schema file. Returns true if valid xml, false otherwise.
	public boolean validateXML(MergeInstructions mergeInstructions) {
		boolean result = false;
		String xmlFilename = mergeInstructions.getFinalTestFilename();
		String xsdFilename = MergeInstructions.XSD_FILENAME;
		final ArrayList<String>  exceptions = new ArrayList<String>();
		try {
			//URL schemaFile = new URL(xsdFilename);
			File schemaFile = new File(xsdFilename);
			Source xmlSource = new StreamSource(new File(xmlFilename));
			SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
			Schema schema = schemaFactory.newSchema(schemaFile); 
			javax.xml.validation.Validator validator = schema.newValidator();
			
			validator.setErrorHandler(new ErrorHandler() {
						@Override
						public void warning(SAXParseException e) throws SAXException { exceptions.add(e.getLocalizedMessage()); }
						@Override
						public void fatalError(SAXParseException e) throws SAXException { exceptions.add(e.getLocalizedMessage()); }
						@Override
						public void error(SAXParseException e) throws SAXException { exceptions.add(e.getLocalizedMessage()); }
			});
			validator.validate(xmlSource);
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "Successful XML validation against " + xsdFilename);
			result = true;
		} 
		catch (SAXException e) {
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "Failed XML validation against " +xsdFilename);
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "Reason: " + e.getMessage()); 
		} catch (MalformedURLException e) {
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "MalformedURLException during XML validation: " + e.getLocalizedMessage());
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "Reason: " + e.getLocalizedMessage());
			if (mergeInstructions.getVerbose()){
				e.printStackTrace();
			}
		} catch (IOException e) {
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "IOException during XML validation: " + e.getLocalizedMessage());
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "Reason: " + e.getLocalizedMessage());
			if (mergeInstructions.getVerbose()){
				e.printStackTrace();
			}
		}
		return result;
	}
	


}
