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

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gov.cms.qrda.validator.model.FileSpec;
import gov.cms.qrda.validator.model.SchematronCategory;
import gov.cms.qrda.validator.model.TestCase;
import gov.cms.qrda.validator.model.ValidationSuite;
import gov.cms.qrda.validator.web.form.HistoryFilterForm;
import gov.cms.qrda.validator.web.form.UploadFileForm;
import gov.cms.qrda.validator.web.service.CommonUtilsImpl;
import gov.cms.qrda.validator.web.service.SchematronCategoryService;
import gov.cms.qrda.validator.web.service.ValidationService;
import gov.cms.qrda.validator.xml.QRDA_URIResolver;

/**
 * Handles requests to/from the Test Files Inventory page
 * @author Dan Donahue, ESAC Inc.
 *
 */
@Controller
@RequestMapping(value = "/history")
public class HistoryController extends CommonUtilsImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(HistoryController.class);

	@Autowired
	ValidationService validator;

	@Autowired
	public SchematronCategoryService categoryService;

	/**
	 * Default mapping.  Gathers the file specs from each sub folder in the Test Files folder of the QRDA_HOME/qrda file space on the server.
	 * Also creates a form enabling users to upload files to those same folders.
	 * 
	 * @param locale, the current Locale
	 * @param model, a org.springframework.ui.Model object
	 * @param session, the current HttpSession object
	 * @return  test files inventory jsp page
	 * 
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String manageHistory(Locale locale, Model model, HttpSession session) {
		logger.info("HISTORY FILES");
		
		String filter = (String)session.getAttribute("filter");
		if (filter == null || filter.isEmpty()) {
			filter = ".vs";
		}
		session.setAttribute("filter",filter);
		HistoryFilterForm form = new HistoryFilterForm();
		form.setFilter(filter);
		model.addAttribute("filterForm", form);
	
		// Load the directory specs from disc to be sure we are up to date on categories.
		List<SchematronCategory> dirSpecs =  categoryService.loadOrBuild();
		model.addAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY, dirSpecs);

		// For each type of schematron we support (mapping one-to-one to the list of directory specs), gather the 
		// proper files from each subdirectory and set the directory spec's file list to that list.
		for (SchematronCategory dir : dirSpecs) {
			if (dir.isActive()) {
				String subDir = dir.getName();
				logger.debug("Getting files for subdir " + subDir);

				ArrayList<FileSpec> files = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_RESULTS,subDir, filter,true); // true = sort by last modified date
				dir.setFiles(files);
				model.addAttribute(subDir+"List",files);
				UploadFileForm uff = new UploadFileForm();
				uff.setSubDir(subDir);
				model.addAttribute("upload"+subDir, uff);
			}
		}

		model.addAttribute((session.getAttribute("testName") == null)? "":(String)session.getAttribute("testName"));

		return "historyInventory";
	}

	@RequestMapping(value="filter", method = RequestMethod.POST)
	public String filterFiles (HistoryFilterForm theForm, BindingResult result, Locale locale, Model model, HttpSession session) {
		session.setAttribute("filter", theForm.getFilter()); 
		return manageHistory(locale, model, session);
	}
	/**
	 * This method is called by AJAX from the test files inventory page. It reads the contents of the given file
	 * (as specified by the filename and the folder name - type - of the folder where the particular test file file resides)
	 * into a string and puts that string into the response of this call.
	 * 
	 * @param locale, the current Locale
	 * @param model, a org.springframework.ui.Model object
	 * @param type, the type (subdirectory under the Testfiles results directory) of the test file
	 * @param filename, the name of the test file results to open
	 * @param session, the current HttpSession
	 * @return to the test results history page.
	 */

	@RequestMapping(value = "getTestResults", method = RequestMethod.GET)
	public String getTest (Locale locale, Model model, HttpSession session, @RequestParam("type") String type, @RequestParam("file") String filename) {
		logger.info("Called via ajax getTestResults, type:" + type + ", file:" + filename );
		String response = "";
		ValidationSuite vs = validator.getValidationFromHistory(type,filename);
		if (vs != null) {
			session.setAttribute("validationResults", vs);
			response = filename + " has name: " + vs.getName();//fileService.readExtFileUnparsed(QRDA_URIResolver.REPOSITORY_RESULTS, type, filename);
			logger.info(response);
			
		}
		else {
			response = "File " + filename + " not found in " + type + " history.";
		}
		return changeTestCase(-1, locale,model, session);
	}

	/**
	 * Removes the given file (as specified by the filename and the folder name - type - of the folder where the particular test file file resides)
	 * from the system.
	 * 
	 * @param filename, the history file to remove
	 * @param subdir, the subdir under the repository results directory where the history file resides
	 * @param locale, the current Locale
	 * @param model, a org.springframework.ui.Model object
	 * @param request, the current HttpServletRequest object
	 * @return to the test results history page.
	 */

	@RequestMapping(value="/remove/{filename}&{subdir}", method = RequestMethod.GET)
    public String processRemoveFile(@PathVariable String filename,  @PathVariable String subdir, Locale locale, Model model, HttpServletRequest request) {
		
		logger.info("Delete file: " + filename + " in " + QRDA_URIResolver.REPOSITORY_RESULTS + "/" + subdir);
		fileService.deleteFile(filename,  QRDA_URIResolver.REPOSITORY_RESULTS, subdir);
		return "redirect:/historyFiles";
	}

	/**
	 * Makes a new test case the current case stored in the session.
	 * 
	 * @param index, the index of the test case in the history list to use
	 * @param locale, the current Locale
	 * @param model, a org.springframework.ui.Model object
	 * @param session, the current HttpSession object
	 * @return return to the manage history page
	 */
	@RequestMapping(value="change/{index}", method = RequestMethod.GET)
	public String changeTestCase (@PathVariable Integer index,Locale locale, Model model, HttpSession session) {
		logger.debug(String.format("Change current test case, index: %d", index)); 
		ValidationSuite vs = (ValidationSuite)session.getAttribute("validationResults");
		TestCase tc = null;
		model.addAttribute("testPresent", true); 
		model.addAttribute("caseSelected", false); // Assume we won't want to show the test case details tabs
		if (vs != null && index != null && index >= 0 ) {
			// An index of -1 implies don't retrieve any test case. (Used on initial page display)
			try {
				tc = vs.getNth(index);
				model.addAttribute("caseSelected", true); // We retrieved an actual test case, so we'll show the tabs
			}
			catch (Exception e) {
				tc = null;
				logger.error("Error getting nth testcase from validation suite. Index: " + index, e);
			}
		}
		model.addAttribute("validationResults",vs);
		model.addAttribute("testCase",tc); 
		session.setAttribute("testCase", tc);
		return manageHistory(locale,model,session);
	}

	/**
	 * Re-runs the current test case stored in the session.
	 * @param locale, the current Locale
	 * @param model, a org.springframework.ui.Model object
	 * @param session, the current HttpSession object
	 * @return to the manage history page
	 */
	@RequestMapping(value = "rerun", method = RequestMethod.GET)
	public String rerunTest (Locale locale, Model model, HttpSession session ) {
		//logger.info("Called via ajax getTestResults, type:" + type + ", file:" + filename);
		ValidationSuite vs = (ValidationSuite)session.getAttribute("validationResults");
		if (vs != null) {
			validator.resetValidationSuite(vs);
			validator.runValidation(vs);
			session.setAttribute("validationResults", vs);
		}
		else {
			
		}
		return changeTestCase(-1, locale,model, session);
	}



}
