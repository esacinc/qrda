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
import java.util.ArrayList;
import java.util.List;

/**
 * This class holds the values found in a merge instructions xml file.
 * 
 * @author Dan Donahue, ESAC Inc.
 *
 */
public class MergeProperties {
	/**
	 * A running list of status text messages collected during a merge operation.
	 */
	protected ArrayList<String> results;   // 
	protected String mergeFilename = null;
	/**
	 * Controls how error/warning patterns are generated in the merged file
	 */
	protected boolean separateErrorsFromWarnings = true; // 

	protected String finalTestFilename = null;
	protected String mainSourceDirectory = null;
	protected String title = null;
	protected String version = "1.0";
	protected String fileHeader = null;
	/**
	 * A format string used as the first parameter in a String.format command. The format string
	 * must accommodate four text strings:  title, version, header and date, in that order.
	 */
	protected String headerFormat = "%n%s%n%s %n%n    %s %n%n%s%n";  // title, version, header, date
	protected String errorsHeader = null;
	protected String warningsHeader = null;
	
	protected boolean verbose = true;
	protected boolean summaryOnly = false;
	protected boolean doValidation = false;
	protected boolean stopOnError = true;
	/**
	 * @deprecated
	 */
	protected boolean stopOnWarning = false; // deprecated
	protected Validator validator = null;
	
	protected String mergeReportFilename = "";
	protected String vocabFilename = "";
	
	protected String compareSchematronFilename = ""; // Path to a schematron file. Compare asserts in this file to asserts in generated file

	/**
	 * If this value is true, then all log information is written to System.out as well as 
	 * the merge report file (if any).  This value is false by default.  If no merge report filename
	 * is present in the merge instructions file, then useSystemOut is set to true.
	 */
	protected boolean useSystemOut = false;
	
	/**
	 * The name of an XSD file used to validate the final merged schematron file. 
	 * The value is hard-coded to be   <i> Schema/CDA/infrastructure/cda/CDA_SDTC.xsd </i> relative to the deployment
	 * directory of the merge application.  
	 * 
	 * Change the XSD file by over-writing the new file to the existing file in above location.
	 */
	public final static String XSD_FILENAME = "Schema" + File.separator + "CDA" + File.separator + "infrastructure" + File.separator + "cda" + File.separator + "CDA_SDTC.xsd";
	
	public MergeProperties() {
		results = new ArrayList<String>();
	}
	
	public String getMergeFilename() {
		return mergeFilename;
	}
	public void setMergeFilename(String val) {
		mergeFilename = val;
	}
	public String getFinalTestFilename() {
		return finalTestFilename;
	}
	public void setFinalTestFilename(String val) {
		finalTestFilename = val;
	}

	public String getMainSourceDirectory() {
		return mainSourceDirectory;
	}
	public void setMainSourceDirectory(String val) {
		mainSourceDirectory = val;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String val) {
		title = (val == null)? "" : val;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String val) {
		version = (val == null)? "" : val;
	}
	public String getFileHeader() {
		return fileHeader;
	}
	public void setFileHeader(String val) {
		fileHeader = (val == null)? "" : val;
	}

	public String getErrorsHeader() {
		return errorsHeader;
	}
	public void setErrorsHeader(String val) {
		errorsHeader = val;
	}
	public String getWarningsHeader() {
		return warningsHeader;
	}
	public void setWarningsHeader(String val) {
		warningsHeader = val;
	}


	public String getHeaderFormat() {
		return headerFormat;
	}
	public void setHeaderFormat(String val) {
		headerFormat = val;
	}

	public String getMergeReportFilename() {
		return mergeReportFilename;
	}
	public void setMergeReportFilename(String val) {
		mergeReportFilename = val;
	}
	
	public String getVocabFilename() {
		return vocabFilename;
	}
	public void setVocabFilename(String val) {
		vocabFilename = val;
	}

	public String getCompareSchematronFilename() {
		return compareSchematronFilename;
	}
	public void setCompareSchematronFilename(String val) {
		compareSchematronFilename = val;
	}

	public boolean getVerbose() {
		return verbose;
	}
	public void setVerbose(boolean val) {
		verbose = val;
	}

	public boolean getSummaryOnly() {
		return summaryOnly;
	}
	public void setSummaryOnly(boolean val) {
		summaryOnly = val;
	}

	public boolean getDoValidation() {
		return doValidation;
	}
	public void setDoValidation(boolean val) {
		doValidation = val;
	}

	public boolean getStopOnError() {
		return stopOnError;
	}
	public void setStopOnError(boolean val) {
		stopOnError = val;
	}

	public boolean getStopOnWarning() {
		return stopOnWarning;
	}
	public void setStopOnWarning(boolean val) {
		stopOnWarning = val;
	}
	
	public List<String> getResults() {
		return results;
	}
	
	/**
	 * Adds the given string to the end of the current results list 
	 * If the useSystemOut value in this object is true, then the string is
	 * also printed to System.out
	 * 
	 * @see useSystemOut
	 * 
	 * @param line the string to add to the results list
	 */
	public void addResult(String line) {
		results.add(line);
		if (useSystemOut) {
			System.out.println(line);
		}
	}
	
	public Validator getValidator() {
		return validator;
	}
	

}
