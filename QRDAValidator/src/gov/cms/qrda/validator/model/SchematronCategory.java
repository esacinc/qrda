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
import java.util.List;

/**
 * The SchematronCategory class contains information describing a type of schematron file, which maps directly to a sub-directory underneath the
 * major directories defined in the QRDA_HOME/qrda filespace.
 * 
 * A SchematronCategory object is basically a definition of a directory under the schematron, testfile, isofile, vocabulary and results directories.
 * Each spec contains the name of the directory on the disc, and the display name of the directory as shown in the UI.
 * 
 * A lsit of the directory specs is serialized to disc and loaded into memory as needed.
 * 
  *  
 * @author Dan Donahue ESAC Inc.
 *
 */
public class SchematronCategory implements Serializable{
	/**
	 * Needed for serialization
	 */
	private static final long serialVersionUID = 2983856471501981661L;
	
	/**
	 * The name of the directory on disc
	 */
	private String name;                      
	/**
	 * Temp aid for determining name changes
	 */
	private String origName;				  
	/**
	 * The name of the directory as displayed in the UI
	 */
	private String displayName;               
	/**
	 * Whether or not we are using this directory
	 */
	private boolean active = true;			  
	/**
	 * List of files in the directory. (Dynamically generated depending on situation)
	 */
	private List<FileSpec> files = null;       
	/**
	 * List of secondary files in the directory. (Dynamically generated depending on situation)
	 */
	private List<FileSpec> filesSec = null;    
	
	public SchematronCategory() {}
	
	
	public SchematronCategory(String name, String displayName) {
		this.name = name;
		this.displayName = displayName;
	}
	
	public String getName() {
		return name;
	}
	
	/**
	 * This method replaces all non-alphanumeric characters with an underscore ("_") character to insure a properly formed directory name
	 * created from this name.
	 * @param val string representing the new name. 
	 */
	public void setName(String val) {
		name = val.trim().replaceAll("[^a-zA-Z0-9]", "_"); 
		
	}
	
	public String getOrigName() {
		return origName;
	}
	
	/**
	 * This method replaces all non-alphanumeric characters with an underscore ("_") character to insure a proper
	 * comparison to the Name field.
	 * @param val string representing the new value
	 */
	public void setOrigName(String val) {
		origName = val.trim().replaceAll("[^a-zA-Z0-9]", "_"); // Insure only alphanumeric characters in name. Replace others with "_"
		
	}
	public String getDisplayName() {
		return displayName;
	}
	
	public void setDisplayName(String val) {
		displayName = val.trim();
	}

	
	public boolean isActive() {
		return active;
	}
	
	public boolean getActive() {
		return active;
	}
	public void setActive(boolean val) {
		active = val;
	}

	public List<FileSpec> getFiles() {
		return files;
	}
	
	public void setFiles(List<FileSpec> val) {
		files = val;
	}
	
	public List<FileSpec> getFilesSec() {
		return filesSec;
	}
	
	public void setFilesSec(List<FileSpec> val) {
		filesSec = val;
	}

}
