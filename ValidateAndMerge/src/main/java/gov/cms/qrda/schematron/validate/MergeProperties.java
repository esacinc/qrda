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

import java.util.ArrayList;
import java.util.List;

/**
 * This class holds the values found in a merge instructions xml file.
 * @author dandonahue
 *
 */
public class MergeProperties {
	protected ArrayList<String> results;   // A running list of status messages collected during a merge operation.
	protected String mergeFilename = null;
	protected String finalTestFilename = null;
	protected String mainSourceDirectory = null;
	protected String title = null;
	protected String fileHeader = null;
	
	protected boolean verbose = true;
	protected boolean doValidation = false;
	protected boolean stopOnError = true;
	protected boolean stopOnWarning = false; // deprecated
	protected Validator validator = null;
	
	protected String mergeReportFilename = "";
	protected String vocabFilename = "";

	protected boolean useSystemOut = false;
	
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
		title = val;
	}

	public String getFileHeader() {
		return fileHeader;
	}
	public void setFileHeader(String val) {
		fileHeader = val;
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

	public boolean getVerbose() {
		return verbose;
	}
	public void setVerbose(boolean val) {
		verbose = val;
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
