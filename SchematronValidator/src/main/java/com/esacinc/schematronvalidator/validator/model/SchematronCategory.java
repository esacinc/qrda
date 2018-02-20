package com.esacinc.schematronvalidator.validator.model;
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
 * major directories defined in the SCHEMATRON_VALIDATOR_HOME/validator filespace.
 * 
 * A SchematronCategory object is basically a definition of a directory under the schematron, testfile, isofile, vocabulary and results directories.
 * Each spec contains the name of the directory on the disc, and the display name of the directory as shown in the UI.
 * 
 * A lsit of the directory specs is serialized to disc and loaded into memory as needed.
 * 
  *  
 * @author Dan Donahue
 *
 */
public class SchematronCategory implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2983856471501981661L;
	
	/**
	 * 
	 */
	private String name;                      // The name of the directory on disc
	private String origName;				  // Temp aid for determining name changes
	private String displayName;               // The name of the directory as displayed in the UI
	private boolean active = true;			  // Whether or not we are using this directory
	private List<FileSpec> files = null;      // List of files in the directory. (Dynamically generated depending on situation)
	private List<FileSpec> filesSec = null;   // List of secondary files in the directory. (Dynamically generated depending on situation)
	
	public SchematronCategory() {} // We need an empty constructor for this entity so that the Spring MVC can instantiate it when posting from a form
	
	public SchematronCategory(String name, String displayName) {
		this.name = name;
		this.displayName = displayName;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String val) {
		name = val.trim().replaceAll("[^a-zA-Z0-9]", "_"); // Insure only alphanumeric characters in name. Replace others with "_"
		
	}
	
	public String getOrigName() {
		return origName;
	}
	
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
