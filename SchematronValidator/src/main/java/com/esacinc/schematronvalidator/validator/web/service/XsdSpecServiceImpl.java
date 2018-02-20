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

import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.esacinc.schematronvalidator.validator.model.XSDSpec;
import com.esacinc.schematronvalidator.validator.xml.SCHEMATRON_URIResolver;

/**
 * This class is the implementation class for the XSDSpec interface. It handles all of the reading and writing of files used in the Schematron Validator application. 
 * the files used by the application are stored in the SCHEMATRON_VALIDATOR_HOME/validator file space on the server running the application.
 * 
 * @see com.esacinc.schematronvalidator.validator.web.service.XsdSpecService
 * 
 * @author Dan Donahue
 *
 */
@Service
public class XsdSpecServiceImpl extends CommonUtilsImpl implements XsdSpecService {
	private static final Logger logger = LoggerFactory.getLogger(XsdSpecServiceImpl.class);


	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XsdSpecService.create
	 */
	@Override
	public XSDSpec create(String name, String dir, String filename, String desc) {
		XSDSpec newSpec = new XSDSpec(name, dir, filename, desc);
		return newSpec;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.loadOrBuild
	 */

	@Override
	public List<XSDSpec> loadOrBuild() {
		// Load the serialized XSDSpecs from disc. If none exists we will
		// create some with some hard-coded values and go from there.  
		List<XSDSpec> specs = load(); 
		if (specs == null) {
			logger.error("No XSD specifications found. Building from scratch. ");
			specs = initialBuild();
		}
		if (specs == null) {
			logger.error("Error loading XSDSpec and-or building from scratch. Returning empty list. ");
			specs = new ArrayList<XSDSpec>();
		}
		return specs;

	}
	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.initialBuild
	 */
	@Override
	public List<XSDSpec> initialBuild() {
		// Create an initial list of schematron category objects corresponding to known schematron types we support. These can be edited later.
		// This list will be serialized to disc for loading during runtime.
		List<XSDSpec> specs = new ArrayList<XSDSpec>();
		this.save(specs);
		return specs;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.activate
	 */
	@Override
	public boolean activate(XSDSpec spec, boolean val) {
		spec.setActive(val);
		return val;
	}

	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.load
	 */
    @SuppressWarnings("unchecked")
	@Override
	public List<XSDSpec> load() {
		// Try to load the schematron categories from disc (in a known place.) If not present, flag an error and return null.
    	List<XSDSpec> specs = new ArrayList<XSDSpec>();
     	try {
			FileInputStream str = fileService.openExtFileForReading(SCHEMATRON_URIResolver.REPOSITORY_PROPERTIES, null, XsdSpecService.XSD_SPECS_FILE);
			ObjectInputStream oin = new ObjectInputStream(str);
			specs = (List<XSDSpec>)oin.readObject();
			oin.close();
			for (XSDSpec spec : specs) {
				spec.setVerified(verifyXSDFile(spec));
			}

    	}
	    catch (Exception e) {
			logger.error("Error reading XSDSpec objects from file: " + XsdSpecService.XSD_SPECS_FILE,e);
			return null;
		}
    	return specs;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.loadLocal
	 */
    @SuppressWarnings("unchecked")
	@Override
	public List<XSDSpec> loadLocal(HttpSession session) {
		return (List<XSDSpec>) session.getAttribute(XsdSpecService.XSD_FILES);
	}
	
	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.XSDSpecService.save
	 */
    @Override
	public boolean save(List<XSDSpec> specs) {
		// Serialize the XSDSpec list to disc in a known location.
		boolean ok = true;
	    try {
				FileOutputStream str = fileService.openExtFileForWriting(SCHEMATRON_URIResolver.REPOSITORY_PROPERTIES, null, XsdSpecService.XSD_SPECS_FILE);
				ObjectOutputStream oout = new ObjectOutputStream(str);
				oout.writeObject(specs);
				oout.close();
		}
		catch (Exception e) {
			ok = false;
			logger.error("Error writing XSDSpec list to file: " + XsdSpecService.XSD_SPECS_FILE,e);
		}
	    return ok;
	}
 
    @Override
    public XSDSpec uploadXsdZipfile(InputStream zipFile, String xsdName, String fileLocPathname, String desc) {
        String destDirectory = SCHEMATRON_URIResolver.XSD_HOME;
        XSDSpec newSpec = null;
        UnzipUtility unzipper = new UnzipUtility();
        try {
            String homeDir = unzipper.unzip(zipFile, destDirectory);
            newSpec = new XSDSpec(xsdName, homeDir, fileLocPathname, desc);
            logger.info("New XSD Spec: " + newSpec.toString());
        } catch (Exception ex) {
            logger.error("Error unzipping: " + ex.getMessage(),ex);// some errors occurred
            ex.printStackTrace();
        }
        return newSpec;
    }

    @Override
    public boolean verifyXSDFile(XSDSpec spec) {
    	String path = SCHEMATRON_URIResolver.getXSDFilename(spec);
    	boolean isOk = false;
    	if (spec == null) return isOk;
		try {  
		    File file = new File(path);
		    isOk = file.exists();
		} catch (Exception e) {     
			e.printStackTrace();
			isOk = false;
		}
		spec.setVerified(isOk);
		return isOk;

    }
    
    @Override
    public XSDSpec get(List<XSDSpec> specs, String name) {
    	XSDSpec res = null;
    	if (specs != null && name != null) {
    		for (XSDSpec spec : specs) {
    			if (spec != null && name.equals(spec.getDisplayName())) {
    				res = spec;
    				break;
    			}
     		}
    	}
    	return res;
    }
}
