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

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.esacinc.schematronvalidator.validator.model.SchematronCategory;
import com.esacinc.schematronvalidator.validator.xml.SCHEMATRON_URIResolver;

/**
 * This class is the implementation class for the SchematronCategoryService interface. It handles all of the reading and writing of files used in the Schematron Validator application. 
 * the files used by the application are stored in the SCHEMATRON_VALIDATOR_HOME/validator file space on the server running the application.
 * 
 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService
 * 
 * @author Dan Donahue
 *
 */
@Service
public class SchematronCategoryServiceImpl extends CommonUtilsImpl implements SchematronCategoryService {
	private static final Logger logger = LoggerFactory.getLogger(SchematronCategoryServiceImpl.class);


	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.create
	 */
	@Override
	public SchematronCategory create(String name, String displayName) {
		SchematronCategory newCat = new SchematronCategory(name,displayName);
		return newCat;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.loadOrBuild
	 */

	@Override
	public List<SchematronCategory> loadOrBuild() {
		// Load the serialized schematron categories from disc. If none exists we will
		// create some with some hard-coded values and go from there.  
		List<SchematronCategory> cats = load(); 
		if (cats == null) {
			logger.error("No categories found. Building from scratch. ");
			cats = initialBuild();
		}
		if (cats == null) {
			logger.error("Error loading schematron categories and-or building from scratch. Returning empty list. ");
			cats = new ArrayList<SchematronCategory>();
		}
		return cats;

	}
	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.initialBuild
	 */
	@Override
	public List<SchematronCategory> initialBuild() {
		// Create an initial list of schematron category objects corresponding to known schematron types we support. These can be edited later.
		// This list will be serialized to disc for loading during runtime.
		List<SchematronCategory> cats = new ArrayList<SchematronCategory>();
		SchematronCategory next = new SchematronCategory("HL7 QRDA I","HL7 QRDA I");
		cats.add(next);
		next = new SchematronCategory("CMS QRDA I","CMS QRDA I");
		cats.add(next);
		next = new SchematronCategory("HL7 QRDA III","HL7 QRDA III");
		cats.add(next);
		next = new SchematronCategory("CMS QRDA III","CMS QRDA III");
		cats.add(next);
		this.save(cats);
		return cats;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.activate
	 */
	@Override
	public boolean activate(SchematronCategory cat, boolean val) {
		cat.setActive(val);
		return val;
	}

	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.load
	 */
    @SuppressWarnings("unchecked")
	@Override
	public List<SchematronCategory> load() {
		// Try to load the schematron categories from disc (in a known place.) If not present, flag an error and return null.
    	List<SchematronCategory> cats = new ArrayList<SchematronCategory>();
     	try {
			FileInputStream str = fileService.openExtFileForReading(SCHEMATRON_URIResolver.REPOSITORY_PROPERTIES, null, SchematronCategoryService.SCHEMATRON_CATEGORY_FILE);
			ObjectInputStream oin = new ObjectInputStream(str);
			cats = (List<SchematronCategory>)oin.readObject();
			oin.close();
    	}
	    catch (Exception e) {
			logger.error("Error reading schematron categories from file: " + SchematronCategoryService.SCHEMATRON_CATEGORY_FILE,e);
			return null;
		}
    	return cats;
	}

	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.loadLocal
	 */
    @SuppressWarnings("unchecked")
	@Override
	public List<SchematronCategory> loadLocal(HttpSession session) {
		return (List<SchematronCategory>) session.getAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY);
	}
	
	
	/**
	 * @see com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService.save
	 */
    @Override
	public boolean save(List<SchematronCategory> cats) {
		// Serialize the schematron categories list to disc in a known location.
		boolean ok = true;
	    try {
	    	    // Clear out any file specs  prior to saving.
	    		for (SchematronCategory cat : cats) {
	    			cat.setFiles(null);
	    			cat.setFilesSec(null);
	    		}
				FileOutputStream str = fileService.openExtFileForWriting(SCHEMATRON_URIResolver.REPOSITORY_PROPERTIES, null, SchematronCategoryService.SCHEMATRON_CATEGORY_FILE);
				ObjectOutputStream oout = new ObjectOutputStream(str);
				oout.writeObject(cats);
				oout.close();
		}
		catch (Exception e) {
			ok = false;
			logger.error("Error writing schematron categories to file: " + SchematronCategoryService.SCHEMATRON_CATEGORY_FILE,e);
		}
	    return ok;
	}


}
