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
	 * Required for serialization
	 */
	private static final long serialVersionUID = 8482863478279873637L;

	private static Logger logger = LoggerFactory.getLogger(ValidationSuite.class);

    private String name;
    /**
     * Corresponds to folder structure in our qrda schematron file repository.
     */
	private String schematronType;           
	/**
	 * The name of the schematron file, as found in the qrda schematron file repository
	 */
	private String schematronFilename;       
	/**
	 * The XSD file to validate the schematron xml with
	 */
	private String CDAXsdFilename;           
	/**
	 * The name of the ISO Include transform file located in the qrda isoFiles folder
	 */
	private String isoIncludeFilename;       
	/**
	 * The name of the ISO Abstract transform file located in the qrda isoFiles folder
	 */
	private String isoAbstractFilename;      
	/**
	 * The name of the ISO XSLT transform file located in the qrda isoFiles folder
	 */
	private String xsltFilename;             
	
	/**
	 * The name of the transformed schematron file after applying the isoInclude xform.
	 */
	private String includeTransformFilename;       
	/**
	 * The name of the transformed schematron file after applying the isoAbstract xform.
	 */
	private String abstractTransformFilename;      
	/**
	 * The name of the transformed schematron file after applying the isoXSLT xform.
	 */
	private String transformedSchematronFilename;  
	
	/**
	 * The date/time string to add to filenames (and results folder) to make them unique
	 */
	private String nameTimestamp = "";             
	/**
	 * The name of the folder in the qrda results file repository where all result files are written
	 */
	private String resultsFolderBase = "";         
	
	/**
	 * A class that resolves relative URIs in schematron files to local pathnames.
	 */
	private QRDA_URIResolver fileResolver = null;  
	
	/**
	 * Set to true if the given schematron file makes in through the 3 ISO transforms successfully.
	 */
	private boolean isTransformed = false;   
	
	/**
	 * We build up informational text as we go for display on the UI
	 */
	private ArrayList<String> statusText = new ArrayList<String>();  
	/**
	 * The list of test filenames used in this suite
	 */
	private ArrayList<String> testFilenames = new ArrayList<String>();
	/**
	 * The list of test case objects representing the test files we are to validate in this suite.
	 */
	private List<TestCase> testCases;  

	/**
	 * // The filename of this validation suite as saved on disk
	 */
	private String mySavedFilename; 
	
	public ValidationSuite() {
		// for serialization
	}
	
	/**
	 * This constructor removes all non-alphanumeric characters in the resultsFolderBase name, and then calls the class's init() method.
	 * @see #init(String, String)
	 * @param name
	 * @param schematronType
	 * @param schematron
	 */
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
	
	/**
	 * Initializes the class instance. Create interim filenames for files that are generated during the validation process.
	 * Also creates the filename used for saving/serializing this instance to disc. The saved filename is of the form:
	 * <p align='center'>name_timestamp.vs</p>
	 * 
	 * @param schematronType
	 * @param schematron
	 */
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
	
	/**
	 * Reads the names of the files needed to transform a schematron into a useable .xsd file for validation.
	 * The filenames are stored in the validator.properties file found on the resource classpath.
	 * @param props
	 */
	public void initIsoFilenames(Properties props) {
		// Get the names of the ISO transform files to use from the validator.properties file.
		this.CDAXsdFilename = props.getProperty("iso.xsd");
		this.isoIncludeFilename = props.getProperty("iso.include");
		this.isoAbstractFilename = props.getProperty("iso.abstract");
		this.xsltFilename = props.getProperty("iso.svrl");
		logger.debug("Iso include file: " + isoIncludeFilename);
		logger.debug("Iso abstract file: " + isoAbstractFilename);
		logger.debug("Iso xslt file: " + xsltFilename);
	}
	
	public void reset() {
		init(this.schematronType,schematronFilename);
		this.isTransformed = false;
		this.statusText = new ArrayList<String>();
	}
	
	/** 
	 * Returns the nth test case (0-based), or null if not found.
	 * @param n
	 * @return A TestCase object, or null.
	 */
	public TestCase getNth(Integer n) {
		if (n == null || n < 0 || n >= testCases.size()) {
			return null;
		}
		return testCases.get(n);
	}

	public String getTransformedSchematronFilename() {
		return transformedSchematronFilename;
	}

	public String getCDAXsdFilename() {
		return CDAXsdFilename;
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
