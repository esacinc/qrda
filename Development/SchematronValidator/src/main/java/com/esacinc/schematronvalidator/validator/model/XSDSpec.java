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

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;

import com.esacinc.schematronvalidator.validator.model.Failure;
import com.esacinc.schematronvalidator.validator.model.FileSpec;
import com.esacinc.schematronvalidator.validator.xml.SCHEMATRON_URIResolver;

/**
 * XSDSpec is an object class that describes the location of an xsd file and it's associated
 * include files. The object contains the name of a directory under which the xsd files are located,
 * and the location of the main xsd file within that direcory struction.
 *  
 * @author Dan Donahue
 *
 */
public class XSDSpec implements Serializable {

	/**
	 * Required for serialization
	 */
	private static final long serialVersionUID = 5617969L;
	private String origName;				  // Temp aid for determining name changes
	/**
	 * Name as displayed in the UI
	 */
	private String displayName = null;                  
	/**
	 * The name of the directory located in the xsdfiles directory of the SCHEMATRON_VALIDATOR_HOME directory
	 */
	private String directory = null;           
	/**
	 * The path location of the xsd file to use, relative to the directory value
	 */
	private String xsdFileLoc = null;          
	/**
	 * Explanatory text, as displayed in the UI
	 */
	private String shortDesc = null;           
	/**
	 * Indicates whether this spec is presented to the user in the UI
	 */
	private boolean active = true;            
	/**
	 * True if the xsdFileLoc exists within the directory
	 */
	private boolean verified = false;          
	private ArrayList<String> statusText = new ArrayList<String>();;           

	public XSDSpec() {
		// We need an empty constructor for this entity so that the Spring MVC can instantiate it when posting from a form
	}
	
	public XSDSpec(String name, String dir, String fileLoc, String desc) {
		displayName = name;
		directory = dir;
		xsdFileLoc = fileLoc;
		shortDesc = desc;
		active = true;
		verified = false;
 	}
	
	public String getDisplayName() {
		return displayName;
	}
	
	public void setDisplayName(String val) {
		displayName = val.trim(); 
	}

	public String getOrigName() {
		return origName;
	}
	
	public void setOrigName(String val) {
		origName = val.trim(); 
		
	}

	
	public String getDirectory() {
		return directory;
	}
	
	public void setDirectory(String val) {
		directory = val;
	}

	public String getXsdFileLoc() {
		return xsdFileLoc;
	}
	
	public void setXsdFileLoc(String val) {
		xsdFileLoc = val;
	}

	public String getShortDesc() {
		return shortDesc;
	}
	
	public void setShortDesc(String val) {
		shortDesc = val;
	}
	
	public ArrayList<String> getStatusText() {
		return statusText;
	}
	
	public void addStatusText(String txt) {
		statusText.add(txt);
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

	public boolean isVerified() {
		return verified;
	}
	
	public boolean getVerified() {
		return verified;
	}
	public void setVerified(boolean val) {
		verified = val;
	}

	//public String toString() {
	//	return String.format("Name: %s, Directory: %s, XSD Relative Location: %s, Active: %b, Location verified: %b", displayName,directory, xsdFileLoc, active, verified);
	//}
}
