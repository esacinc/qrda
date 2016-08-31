package gov.cms.qrda.validator.model;
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

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import gov.cms.qrda.validator.xml.QRDA_URIResolver;

/**
 * The ValidationSuite class contains all of the information required to perform validation on a list
 * of test files against a schematron.
 * 
 * A ValidationSuite consists of the filename of a schematron, the schematron type (which also corresponds to names of
 * subfolders in the QRDA file repository resident in the QRDA_HOME/qrda file space), and a list of TestCase objects.
 * 
 * The ValidationService runs a validation test using an instance of ValidationSuite.
 * 
 * @see gov.cms.qrda.validator.web.service.ValidationService
 * 
 * @author Dan Donahue
 *
 */
public class ValidationSuite implements Serializable {
	

    /**
	 * 
	 */
	private static final long serialVersionUID = 8482863478279873637L;

	private static Logger logger = LoggerFactory.getLogger(ValidationSuite.class);

    private String name;
	private String schematronType;           // Corresponds to folder structure in our qrda schematron file repository.
	private String schematronFilename;       // The name of the schematron file, as found in the qrda schematron file repository
	private String isoIncludeFilename;       // The name of the ISO Include transform file located in the qrda isoFiles folder
	private String isoAbstractFilename;      // The name of the ISO Abstract transform file located in the qrda isoFiles folder
	private String xsltFilename;             // The name of the ISO XSLT transform file located in the qrda isoFiles folder
	
	private String includeTransformFilename;       // The name of the transformed schematron file after applying the isoInclude xform.
	private String abstractTransformFilename;      // The name of the transformed schematron file after applying the isoAbstract xform.
	private String transformedSchematronFilename;  // The name of the transformed schematron file after applying the isoXSLT xform.
	
	private String nameTimestamp = "";             // The date/time string to add to filenames (and results folder) to make them unique
	private String resultsFolderBase = "";         // The name of the folder in the qrda results file repository where all result files are written
	
	private QRDA_URIResolver fileResolver = null;  // A class that resolves relative URIs in schematron files to local pathnames.
	
	private boolean isTransformed = false;   // Set to true if the given schematron file makes in through the 3 ISO transforms successfully.
	
	private ArrayList<String> statusText = new ArrayList<String>();  // We build up informational text as we go for display on the UI
	private ArrayList<String> testFilenames = new ArrayList<String>();
	private List<TestCase> testCases;  // The list of test case objects representing the test files we are to validate in this suite.

	private String mySavedFilename; // The filename of this validation suite as saved on disk
	
	public ValidationSuite() {
		// for serialization
	}
	
	public ValidationSuite(String name, String schematronType, String schematron) {
		this.name = name;
		this.resultsFolderBase = name.replaceAll("[^A-Za-z0-9]", ""); // Prevent generated folder name from having characters other than alphanumeric
		init(schematronType, schematron);
	}
	
	public ValidationSuite(String name, String schematronType, String schematron, String testCaseFilename) {
		this.name = name;
		this.resultsFolderBase = name.replaceAll("[^A-Za-z0-9]", ""); // Prevent generated folder name from having characters other than alphanumeric
		// Validation. Suite expects a list of filenames, so make a list of length 1...
		ArrayList<String> testFilenames = new ArrayList<String>();
		testFilenames.add(testCaseFilename);  
		this.testFilenames = testFilenames;
		init(schematronType,schematron);
	}
	
	protected void init(String schematronType, String schematron) {
		this.schematronType = schematronType; 
		this.schematronFilename = schematron;
		// Fashion a date/time string to use as a postfix for filenames so they are unique.
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-hhmmss");
		nameTimestamp = dateFormat.format(date); 
		// Now create the names of the interrim results files we'll generate as we process the schematron transforms..
		includeTransformFilename = "includeTransform_" + nameTimestamp + ".sch";
		abstractTransformFilename = "abstractTransform_" + nameTimestamp + ".sch";
		transformedSchematronFilename = "xsltTransform_" + nameTimestamp + ".xsl";
		
		fileResolver = new QRDA_URIResolver(schematronType); 
		mySavedFilename = String.format("%s_%s.vs", name, nameTimestamp);
	}

	public String getName() {
		return name;
	}
	
	public void setName(String val) {
		name = val;
	}

	public String getNameTimestamp() {
		return nameTimestamp;
	}
	
	public boolean isSchematronTransformed() {
		return isTransformed;
	}
	
	public void setSchematronTransformed(boolean val) {
		isTransformed = val;
	}
	
	public String getSchematronType() {
		return schematronType;
	}
	
	public void setSchematronType(String val) {
		schematronType = val;
	}
	
	
	public String getSchematronFilename() {
		return schematronFilename;
	}
	
	public void setSchematronFilename(String val) {
		schematronFilename = val;
	}

	public List<TestCase> getTestCases() {
		return testCases;
	}
	
	public void setTestCases(List<TestCase> cases) {
		testCases = cases;
	}
	
	public void addTestCase(TestCase tcase) {
		testCases.add(tcase);
	}

	public List<String> getTestFilenames() {
		return testFilenames;
	}
	
	public void setTestFilenames(List<String> names) {
		testFilenames = (ArrayList<String>)names;
	}

	public QRDA_URIResolver getFileResolver() {
		return fileResolver;
	}
	public void initIsoFilenames(Properties props) {
		// Get the names of the ISO transform files to use from the validator.properties file.
		this.isoIncludeFilename = props.getProperty("iso.include");
		this.isoAbstractFilename = props.getProperty("iso.abstract");
		this.xsltFilename = props.getProperty("iso.svrl");
		logger.info("Iso include file: " + isoIncludeFilename);
		logger.info("Iso abstract file: " + isoAbstractFilename);
		logger.info("Iso xslt file: " + xsltFilename);
	}
	
	public void reset() {
		init(this.schematronType,schematronFilename);
		this.isTransformed = false;
		this.statusText = new ArrayList<String>();
	}
	
	public TestCase getNth(Integer n) {
		if (n == null || n < 0 || n >= testCases.size()) {
			return null;
		}
		return testCases.get(n);
	}

	public String getTransformedSchematronFilename() {
		return transformedSchematronFilename;
	}
	
	public String getIsoIncludeFilename() {
		return isoIncludeFilename;
	}

	public String getIsoXsltFilename() {
		return xsltFilename;
	}

	public String getIsoAbstractFilename() {
		return isoAbstractFilename;
	}
	
	public String getIncludeTransformFilename() {
		return includeTransformFilename;
	}

	public String getAbstractTransformFilename() {
		return abstractTransformFilename;
	}


	public String getResultsFolder() {
		return this.resultsFolderBase+"_"+this.nameTimestamp;
	}

	public ArrayList<String> getStatusText() {
		return statusText;
	}
	
	public void addStatusText(String txt) {
		statusText.add(txt);
	}
	
	 public void readObject(
		     ObjectInputStream aInputStream
		   ) throws ClassNotFoundException, IOException {
		     //always perform the default de-serialization first
		     aInputStream.defaultReadObject();

		     //make defensive copy of the mutable Date field
		     //fDateOpened = new Date(fDateOpened.getTime());

		     //ensure that object state has not been corrupted or tampered with maliciously
		     //validateState();
		  }

	 public String getMySavedFilename() {
			return mySavedFilename;
	 }
	 
	 public void setMySavedFilename(String val) {
			mySavedFilename = val;
	 }

}
