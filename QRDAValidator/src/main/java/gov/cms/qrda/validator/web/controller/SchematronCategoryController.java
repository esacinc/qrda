package gov.cms.qrda.validator.web.controller;
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

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gov.cms.qrda.validator.model.SchematronCategory;
import gov.cms.qrda.validator.web.form.AddCategoryForm;
import gov.cms.qrda.validator.web.form.CategoryListForm;
import gov.cms.qrda.validator.web.service.CommonUtilsImpl;
import gov.cms.qrda.validator.web.service.SchematronCategoryService;

/**
 * Handles requests to/from the Categories management page
 * @author dandonahue
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class SchematronCategoryController extends CommonUtilsImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(SchematronCategoryController.class);

	@Autowired
	public SchematronCategoryService categoryService;

	/**
	 * Default mapping.  Gathers the categories from disc and displays them on the UI
	 * 
	 * @param locale
	 * @param model
	 * @param session
	 * @return  categories management jsp page
	 * 
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String showCategories(Locale locale, Model model, HttpSession session) {
		logger.info("Categories ... Session setting: " + session.getAttribute("isAuthenticated"));
		// Go to login page if not authenticated
		if (session.getAttribute("isAuthenticated") == null) {
			return "redirect:authenticate";
		}
		logger.info("SCHEMATRON CATEGORY MANAGEMENT");
		
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

		// Older versions of app can't handle history files, so determine if we should show the history tab or not.
		if (fileService.existHistoryFiles()) {
			model.addAttribute("showHistory",true);
		}

		return "schematronCategories";
	}

	/**
	 * Called when user clicks on save button on category management page.
	 * 
	 * @param categoryForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return category management jsp page
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
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

		return showCategories(locale, model,session);
	}

	/**
	 * Called when user clicks on add button on category management page.
	 * 
	 * @param categoryForm
	 * @param locale
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
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
		return showCategories(locale, model,session);
	}
	
	/**
	 * Called when user clicks on an "x" to remove a category from the system.
	 * 
	 * @param catName
	 * @param locale
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/remove/{catName}", method = RequestMethod.GET)
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
		return showCategories(locale, model,session);
	}
}
