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

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * The FileSpec class contains information enabling access to a file resident in the QRDA file repository
 * defined in the QRDA_HOME/qrda filespace.
 * 
 * A FileSpec object is used primarily as a display object for displaying information about a file in a UI.
 * 
 * The FileSpec class is also the base class for the TestCase class, used by the validation process in conjunction with
 * a ValidationSuite instance.
 * 
 *  @see gov.cms.qrda.validator.model.ValidationSuite
 *  @see gov.cms.qrda.validator.model.TestCase
 *  
 * @author Dan Donahue
 *
 */
public class FileSpec implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4013857936438104637L;
	private String filename;                  // The base filename of a file located in the QRDA file repository
	private String uploadDate;                // The date/time to show as the date when the file was uploaded into the repository
	private String subDir;                    // The name of the subfolder where the file is located in the repository
	private Integer expectedErrors = -1;      // For QRDA test files, this number is found within the first 20 lines of the file
	private Integer expectedWarnings = -1;    // For QRDA test files, this number is found within the first 20 lines of the file
	private String fileURL;                   // The URL of the file on the server filespace. Used in conjunction with the FileServlet to turn URLs into paths
	                                          // to files external to the server enviornment.
	
	public FileSpec() {}
	
	public FileSpec(String name, String date, String subdir) {
		filename = name;
		uploadDate = date;
		subDir = subdir;
	}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String val) {
		filename = val;
		
	}
	
	public String getUploadDate() {
		return uploadDate;
	}
	
	public void setUploadDate(String val) {
		uploadDate = val;
	}

	
	public String getSubDir() {
		return subDir;
	}
	
	public void setSubDir(String val) {
		subDir = val;
	}

	public void setUploadDate(Date date){
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm:ss");
		uploadDate = dateFormat.format(date); 

	}
	
	public Integer getExpectedErrors() {
		return expectedErrors;
	}
	
	public void setExpectedErrors(Integer val) {
		expectedErrors = val;
	}
	
	public Integer getExpectedWarnings() {
		return expectedWarnings;
	}
	
	public void setExpectedWarnings(Integer val) {
		expectedWarnings = val;
	}
	
	public String getFileURL() {
		return fileURL;
	}
	
	public void setFileURL(String val) {
		fileURL = val;
	}

}
