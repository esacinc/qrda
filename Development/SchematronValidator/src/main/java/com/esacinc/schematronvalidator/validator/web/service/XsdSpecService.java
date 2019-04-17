package com.esacinc.schematronvalidator.validator.web.service;
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

import java.util.List;
import java.io.InputStream;
import javax.servlet.http.HttpSession;
import com.esacinc.schematronvalidator.validator.model.XSDSpec;

/**
 * Interface for manipulating and maintaining XSDSpec objects as maintained by the application.
 * 
 * @author Dan Donahue
 * @see com.esacinc.schematronvalidator.validator.model.XSDSpec
 * 
 */
public interface XsdSpecService {

	public static final String XSD_SPECS_FILE = "xsdSpecs.spec";
	/**
	 * XSD_FILES  is the name of an attribute in a Spring model where the current schematron categories are stored.
	 */
	public static final String XSD_FILES = "xsdFiles";

	public List<XSDSpec> loadOrBuild();
	public XSDSpec create(String name, String dir, String fileLoc, String desc);
	
	/**
	 * Activates or Deactivates an XSDSpec object
	 * @param spec
	 * @param val
	 * @return active status
	 */
	public boolean activate(XSDSpec spec, boolean val);
	
	/**
	 * Loads the XSDSpec objects from disc,
	 * @return List of schematron categories
	 */
	public List<XSDSpec> load();
	
	/**
	 * Returns the list of XSDSpec objects as stored in the given session object.
	 * @param session
	 * @return List of XSDSpec categories
	 */
	public List<XSDSpec> loadLocal(HttpSession session);
	
	/**
	 * Creates and saves (serializes) a new list of XSDSpec objects from hardcoded default values.
	 * @return List of schematron categories
	 */
	public List<XSDSpec> initialBuild();
	
	/**
	 * Serializes the current list of XSDSpec objects to a file.
	 * @param specs
	 * @return true if serialization was successful
	 */
	public boolean save(List<XSDSpec> specs);
	
	/**
	 * Given an input stream to a zip file on disc, unzips the contents of the zip file into the
	 * SCHEMATRON_VALDIATOR_HOME/xsdfiles directory, and creates an XSDSpec object using the
	 * parameter values provided.
	 * 
	 * @param zipFile
	 * @param xsdName The name of the created XSDSpec, as presented in the UI
	 * @param fileLocPathname The relative path within the zip file to the xsd file to use
	 * @param desc A short description of the xsd file as presented in the UI
	 * @return XSDSpec created during the upload process
	 * @see com.esacinc.schematronvalidator.validator.model.XSDSpec
	 * @see java.io.InputStream
	 */
	public XSDSpec uploadXsdZipfile(InputStream zipFile, String xsdName, String fileLocPathname, String desc);
	
	/**
	 * Returns true if there is an xsd file of the name and location specified in the xsdFileLoc under
	 * the directory of the object
	 * @param spec
	 * @return True if xsd file exists
	 * @see com.esacinc.schematronvalidator.validator.model.XSDSpec
	 */
	public boolean verifyXSDFile(XSDSpec spec);
	
	/**
	 * Returns the XSDSpec object of the given display name in the list of XSDSpec objects maintained by the application.
	 * @param specs
	 * @param name
	 * @return
	 * @see com.esacinc.schematronvalidator.validator.model.XSDSpec
	 */
	public XSDSpec get(List<XSDSpec> specs, String name);
}
