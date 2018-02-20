package com.esacinc.schematronvalidator.validator.web.controller;
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
import java.util.Locale;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.ObjectError;

import com.esacinc.schematronvalidator.validator.model.SchematronCategory;
import com.esacinc.schematronvalidator.validator.model.XSDSpec;
import com.esacinc.schematronvalidator.validator.web.form.AddCategoryForm;
import com.esacinc.schematronvalidator.validator.web.form.CategoryListForm;
import com.esacinc.schematronvalidator.validator.web.form.AddXsdForm;
import com.esacinc.schematronvalidator.validator.web.form.UploadXsdForm;
import com.esacinc.schematronvalidator.validator.web.form.XsdSpecListForm;
import com.esacinc.schematronvalidator.validator.xml.SCHEMATRON_URIResolver;

import com.esacinc.schematronvalidator.validator.web.service.CommonUtilsImpl;
import com.esacinc.schematronvalidator.validator.web.service.SchematronCategoryService;
import com.esacinc.schematronvalidator.validator.web.service.XsdSpecService;

/**
 * Handles requests to/from the Admin page
 * @author Dan Donahue
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends CommonUtilsImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	public SchematronCategoryService categoryService;
	
	@Autowired
	public XsdSpecService xsdService;

	/**
	 * Default mapping.  Gathers the categories from disc and displays them on the UI
	 * 
	 * @param locale
	 * @param model
	 * @param session
	 * @return  admin jsp page
	 * 
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String showAdminPage(Locale locale, Model model, HttpSession session) {
		
		if (!directoriesAreValid(model)) return "homeNotSet";

		logger.info("Admin Page ... Session setting: " + session.getAttribute("isAuthenticated"));
		// Go to login page if not authenticated
		if (session.getAttribute("isAuthenticated") == null) {
			return "redirect:authenticate";
		}
		logger.info("ADMIN MANAGEMENT");
		
		// Load the directory specs from disc to be sure we are up to date on categories.
		List<SchematronCategory> dirSpecs =  categoryService.loadOrBuild();
		for (SchematronCategory cat : dirSpecs) {
			cat.setOrigName(cat.getName());
		}
		model.addAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY, dirSpecs);


		// Add the form we'll use to edit categories
		CategoryListForm categoryForm = new CategoryListForm();
		categoryForm.setCategoryList(dirSpecs);
		model.addAttribute("categoryForm",categoryForm);
		
		// Add the form we'll use to add a new category
		AddCategoryForm addCategoryForm = new AddCategoryForm();
		model.addAttribute("addCategoryForm", addCategoryForm);

		// Load the xsd specs from disc to be sure we are up to date on xsd files available.
		List<XSDSpec> xsdSpecs =  xsdService.loadOrBuild();
		for (XSDSpec spec : xsdSpecs) {
			spec.setOrigName(spec.getDisplayName());
		}
		model.addAttribute(XsdSpecService.XSD_FILES, xsdSpecs);

		// Add the form we'll use to edit xsd files
		XsdSpecListForm xsdForm = new XsdSpecListForm();
		xsdForm.setXsdList(xsdSpecs);
		model.addAttribute("xsdForm",xsdForm);
		
		// Add the form we'll use to add a new xsd file
		AddXsdForm addXsdForm = new AddXsdForm();
		model.addAttribute("addXsdForm", addXsdForm);

		// Add the form we'll use to add a new xsd file
		UploadXsdForm uploadXsdForm = new UploadXsdForm();
		model.addAttribute("uploadXsdForm", uploadXsdForm);
		
		return "adminPage";
	}

	/**
	 * Called when user clicks on save button on the categories management section of the admin page.
	 * 
	 * @param categoryForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin jsp page
	 */
	@RequestMapping(value = "/saveCat", method = RequestMethod.POST)
	public String save(@ModelAttribute("categoryForm") CategoryListForm categoryForm, Locale locale, Model model, HttpSession session) {
		logger.info("SCHEMATRON CATEGORY SAVING");
		List<SchematronCategory> dirSpecs =  categoryForm.getCategoryList();
		session.setAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY, dirSpecs);
		// Process each category in the form, some of which may have been changed...
		for (SchematronCategory cat : dirSpecs) {
			logger.debug("Orig: " + cat.getOrigName() + ", New: " + cat.getName() + ", Active: " + cat.getActive());
			// If user changed the name, then we need to change the directory name(s) on the server for this category.
			String catName = cat.getName().trim();
			if (catName != null && !catName.isEmpty() && !catName.equals(cat.getOrigName())) {
				fileService.renameCategoryDirectories(cat.getOrigName(), catName);
				cat.setOrigName(cat.getName());
			}
		}
		// Serialize categories to disc
		categoryService.save(dirSpecs);
		model.addAttribute("currView","cats");
		return showAdminPage(locale, model,session);
	}

	/**
	 * Called when user clicks on add button he categories management section of the admin page.
	 * 
	 * @param categoryForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin jsp page
	 */
	@RequestMapping(value = "/addCat", method = RequestMethod.POST)
	public String add(@ModelAttribute("addCategoryForm") AddCategoryForm categoryForm, Locale locale, Model model, HttpSession session) {
		logger.info("SCHEMATRON CATEGORY ADDING");
		String catName = categoryForm.getName().trim();
		logger.debug("Name: " + categoryForm.getName() + ", Display: " + categoryForm.getDisplayName() + ", active: " + categoryForm.getActive());
		if (catName == null || catName.isEmpty()) {
			logger.error("Not category name provided");
		}
		else {
			// Create a new category from the form info
			fileService.createCategoryDirectories(categoryForm.getName());
			if (!fileService.copyIsoFiles(categoryForm.getName())) {
				logger.error("Copy ISO files failed for " + categoryForm.getName());
			};
		    List<SchematronCategory> cats = categoryService.load();
			SchematronCategory newCat = new SchematronCategory(categoryForm.getName(), categoryForm.getDisplayName());
			newCat.setActive(categoryForm.getActive());
			cats.add(newCat);
			categoryService.save(cats);
		}
		model.addAttribute("currView","cats");
		return showAdminPage(locale, model,session);
	}
	
	/**
	 * Called when user clicks on an "x" to remove a category from the system.
	 * 
	 * @param catName
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin jsp page
	 */
	@RequestMapping(value = "/removeCat/{catName}", method = RequestMethod.GET)
	public String remove(@PathVariable String catName,  Locale locale, Model model, HttpSession session) {
		logger.info("SCHEMATRON CATEGORY REMOVING " + catName);
		if (catName == null || catName.isEmpty()) {
			logger.error("Not category name provided");
		}
		else {
			// Remove the category and associated directories from the system.
		    fileService.deleteCategoryDirectories(catName);
		    List<SchematronCategory> cats = categoryService.load();
		    for (SchematronCategory cat : cats) {
		    	if (cat.getName().trim().equals(catName.trim())) {
		    		cats.remove(cat);
		    		break;
		    	}
		    }
			categoryService.save(cats);
		}
		model.addAttribute("currView","cats");
		return showAdminPage(locale, model,session);
	}
	
	/**
	 * Called when user clicks on save button on the xsd management section of the admin page.
	 * 
	 * @param XsdSpecListForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin jsp page
	 */
	@RequestMapping(value = "/saveXsd", method = RequestMethod.POST)
	public String saveXsd(@ModelAttribute("xsdForm") XsdSpecListForm xsdForm,  Locale locale, Model model, HttpSession session) {
		logger.info("XSD SPEC SAVING");
		List<XSDSpec> xsdSpecs =  xsdForm.getXsdList();
		logger.info("xsd list: " + xsdSpecs);
		session.setAttribute(XsdSpecService.XSD_FILES, xsdSpecs);
		// Process each xsd spec in the form, some of which may have been changed...
		//for (XSDSpec spec : xsdSpecs) {
			//logger.info("Orig: " + spec.getOrigName() + ", New: " + spec.getDisplayName() + ", Active: " + spec.getActive());
			// If user changed the name, then we need to change the directory name(s) on the server for this category.
			//String specName = spec.getDisplayName().trim();
			//if (specName != null && !specName.isEmpty() && !specName.equals(spec.getOrigName())) {
			//	spec.setOrigName(spec.getDisplayName());
			//}
		//}
		// Serialize categories to disc
		logger.info("Saving xsd list...");
		xsdService.save(xsdSpecs);
		model.addAttribute("currView","xsd");
		return showAdminPage(locale, model,session);
	}

	/**
	 * Called when user clicks on add button on the xsd management section of the admin page.
	 * 
	 * @param xsdForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin page
	 */
	@RequestMapping(value = "/addXsd", method = RequestMethod.POST)
	public String addXsd(@ModelAttribute("addXsdForm") AddXsdForm xsdForm, Locale locale, Model model, HttpSession session) {
		logger.info("XSD ADDING");
		String catName = xsdForm.getDisplayName().trim();
		logger.info("Name: " + xsdForm.getDisplayName() +  "Directory: " + xsdForm.getDir() +  "File: " + xsdForm.getFileLoc() +  ", active: " + xsdForm.getActive());
		if (catName == null || catName.isEmpty()) {
			logger.error("No XSD name provided");
		}
		else {
			// Create a new XSD Spec from the form info
			//fileService.createCategoryDirectories(categoryForm.getName());
			//if (!fileService.copyIsoFiles(categoryForm.getName())) {
			//	logger.error("Copy ISO files failed for " + categoryForm.getName());
			//};
		    List<XSDSpec> cats = xsdService.load();
		    XSDSpec newCat = new XSDSpec(xsdForm.getDisplayName(), xsdForm.getDir(), xsdForm.getFileLoc(), xsdForm.getShortDesc());
		    logger.info("XSD file should be at: " + SCHEMATRON_URIResolver.getXSDFilename(newCat));
			newCat.setActive(xsdForm.getActive());
			cats.add(newCat);
			xsdService.save(cats);
		}
		model.addAttribute("currView","xsd");
		return showAdminPage(locale, model,session);
	}
	
	/**
	 * Called when user clicks on an "x" to remove an xsd spec from the system.
	 * 
	 * @param specName
	 * @param locale
	 * @param model
	 * @param session
	 * @return admin page
	 */
	@RequestMapping(value = "/removeXsd/{specName}", method = RequestMethod.GET)
	public String removeXsd(@PathVariable String specName,  Locale locale, Model model, HttpSession session) {
		logger.info("XSD SPEC REMOVING " + specName);
		if (specName == null || specName.isEmpty()) {
			logger.error("Not XSD name provided");
		}
		else {
			// Remove the category and associated directories from the system.
		   // fileService.deleteCategoryDirectories(catName);
		    List<XSDSpec> specs = xsdService.load();
		    for (XSDSpec spec : specs) {
		    	if (spec.getDisplayName().trim().equals(specName.trim())) {
		    		specs.remove(spec);
		    		break;
		    	}
		    }
			xsdService.save(specs);
		}
		model.addAttribute("currView","xsd");
		return showAdminPage(locale, model,session);
	}

	@RequestMapping(value="/uploadXsd", method = RequestMethod.POST)
    public String processUploadFileForm(UploadXsdForm uploadXsdForm, BindingResult result, Locale locale, Model model, HttpSession session) {
		
        // Redirect to the page with any errors
        if (result.hasErrors()) {
        	logger.error("Errors....");
        	for (ObjectError err : result.getAllErrors()) {
        		logger.error("    " + err.getObjectName() +  ": " + err.getDefaultMessage());
        	}
        	model.addAttribute("currView","xsd");
        	return showAdminPage(locale, model,session);
        }
        
        MultipartFile uploadedZip = uploadXsdForm.getZipFile();
 		logger.info("    Loading zip file: " + uploadedZip.getOriginalFilename());
 		try {
 			XSDSpec newSpec = xsdService.uploadXsdZipfile(uploadedZip.getInputStream(), uploadXsdForm.getName(), uploadXsdForm.getFileLoc(), uploadXsdForm.getShortDesc());
 			if (newSpec != null) {
 	            List<XSDSpec> specs = xsdService.load();
 	            specs.add(newSpec);
 	            xsdService.save(specs);
 	            boolean ok = xsdService.verifyXSDFile(newSpec);
 	            logger.info("Verification of newSpec: " + ok);
 			}
 		}
 		catch (IOException e) {
 			logger.error("IO Exception unzipping file: " + e.getMessage(), e);
 		}
 		model.addAttribute("currView","xsd");
 		return showAdminPage(locale, model,session);
	}

}
