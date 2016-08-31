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
import org.springframework.web.bind.annotation.ResponseBody;

import gov.cms.qrda.validator.model.FileSpec;
import gov.cms.qrda.validator.model.SchematronCategory;
import gov.cms.qrda.validator.model.TestCase;
import gov.cms.qrda.validator.model.ValidationSuite;
import gov.cms.qrda.validator.web.form.ValidationSubmissionForm;
import gov.cms.qrda.validator.web.service.CommonUtilsImpl;
import gov.cms.qrda.validator.web.service.SchematronCategoryService;
import gov.cms.qrda.validator.web.service.ValidationService;
import gov.cms.qrda.validator.xml.QRDA_URIResolver;


/**
 * Handles requests validation workbench page.
 * 
 * @author Dan Donahue
 * 
 */
@Controller
@RequestMapping("/workbench")
public class WorkbenchController extends CommonUtilsImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkbenchController.class);
	
	@Autowired
	ValidationService validator;

	@Autowired
	public SchematronCategoryService categoryService;

	/**
	 * Default mapping for the workbench UI. Collects all the file specifications for both the schematron and
	 * the test files stored in the QRDA file repository residing in QRDA_HOME/qrda file space.
	 * 
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String workbench(Locale locale, Model model, HttpSession session) {
		logger.info("VALIDATION WORKBENCH");

		ArrayList<String> res = new ArrayList<String>();
		res.add("report.svrlt");
		res.add("reports.svrlt");
		model.addAttribute("resultFiles",res);

		// Load the directory specs from disc to be sure we are up to date on categories.
		List<SchematronCategory> dirSpecs =  categoryService.loadOrBuild();
		model.addAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY, dirSpecs);

		// For each type of schematron we support (mapping one-to-one to the list of directory specs), gather the 
		// proper schematron files from each subdirectory and set the directory spec's file list to that list. Also get
		// the corresponding test files for the test file subdirectory for each type.
		for (SchematronCategory dir : dirSpecs) {
			if (dir.isActive()) {
				String subDir = dir.getName();
				logger.info("Getting files for subdir " + subDir);

				ArrayList<FileSpec> schFiles = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_SCHEMATRONS,subDir, null);
				dir.setFiles(schFiles);
				model.addAttribute(subDir+"List",schFiles);

				ArrayList<FileSpec> testFiles = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_TESTFILES,subDir, null);
				dir.setFilesSec(testFiles);
				model.addAttribute(subDir+"Tests",testFiles);

			}
		}
		
		ValidationSubmissionForm form = new ValidationSubmissionForm();
		// Grab the test name from the session, if there is one.
		form.setName((session.getAttribute("testName") == null)? ValidationSubmissionForm.DEFAULT_NAME:(String)session.getAttribute("testName"));
		model.addAttribute("validationSubmissionForm", form);

		return "validationWorkbench";
	}
	
	/**
	 * This is the method called when the user clicks on the "Validate" button on the validation workspace UI.
	 * It creates a ValidationSuite object populated with the values selected on the UI. It then uses the ValidationService
	 * to invoke the validation process on the validationSuite object. Once completed, it returns to the workbench UI which then displays
	 * the results of the validation.
	 * 
	 * @param theForm
	 * @param result
	 * @param locale
	 * @param model
	 * @param session
	 * @return workbench jsp page
	 * 
	 * @see gov.cms.qrda.validator.model.ValidationSuite
	 * @see gove.cms.qrda.validator.web.serviceValidationService
	 * 
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String run (ValidationSubmissionForm theForm, BindingResult result,Locale locale, Model model, HttpSession session) {
		ArrayList<String> tests = new ArrayList<String>();
		theForm.setName(theForm.getName().trim());
		
		if (theForm.getName().isEmpty()) {
			theForm.setName(ValidationSubmissionForm.DEFAULT_NAME);
		}
		session.setAttribute("testName", theForm.getName()); // Preserve the test name from run to run.
		session.setAttribute("filter", theForm.getName()); // By default, filter history by this test name
		for (int i=0 ; i<theForm.getTestFilenames().length; i++) {
			tests.add(theForm.getTestFilenames()[i]);
		}
		ValidationSuite vs = validator.setupValidationSuite(theForm.getName(),
				theForm.getSchematronType(), 
				theForm.getSchematronFilename(),
				tests);
		validator.runValidation(vs);
		session.setAttribute("validationResults", vs);
		return changeTestCase(-1, locale,model, session);
	}

	/**
	 * Re-runs the validation tests contained in the Validation Suite object currently stored in the session.
	 * Does nothing if no such object exists.
	 * 
	 * @param locale
	 * @param model
	 * @param session
	 * @return workbench jsp page
	 */
	@RequestMapping(value = "rerun", method = RequestMethod.GET)
	public String rerunTest (Locale locale, Model model, HttpSession session ) {
		ValidationSuite vs = (ValidationSuite)session.getAttribute("validationResults");
		if (vs != null) {
			validator.resetValidationSuite(vs);
			validator.runValidation(vs);
			session.setAttribute("validationResults", vs);
		}
		else {
			//response = "File " + filename + " not found in " + type + " history.";
		}
		return changeTestCase(-1, locale,model, session);
	}
	/**
	 * This is called by AJAX from the workbench UI. It retrieves the contents of the given file (as specified by the
	 * source - main directory, folder - subdirectory, and filename in the QRDA_HOME/qrda filespace) for display in a 
	 * div element on the UI.
	 * 
	 * @param source
	 * @param filename
	 * @param folder
	 * @param locale
	 * @param model
	 * @return  String: contents of the given file, presumably as an XML string.
	 */
	@RequestMapping(value = "getXML/{source}&{filename}&{folder}", method = RequestMethod.GET)
	public @ResponseBody String getXMLText (@PathVariable String source, @PathVariable String filename, @PathVariable String folder, Locale locale, Model model) {
		logger.debug(String.format("Called via ajax gettext: filename: %s, folder %s",filename,folder));
		String base = QRDA_URIResolver.REPOSITORY_RESULTS;
		if (source != null) {
			if (source.equals("TEST")) {
				base = QRDA_URIResolver.REPOSITORY_TESTFILES;
			}
			else if (source.equals("SCHEMATRON")) {
				base = QRDA_URIResolver.REPOSITORY_SCHEMATRONS;
			}
		}
		String response = fileService.readExtFileUnparsed(base, folder, filename);
		//logger.info(response);
		return response;
	}

	/**
	 * Called when a user clicks on a particular test case filename in the UI display of validation results on the 
	 * validation workbench page.  It pre- populates the current test case (testCase) model element with the selected
	 * test case. This element is then used to populate the details tabs on the validation results UI.
	 * 
	 * @param index
	 * @param locale
	 * @param model
	 * @param session
	 * @return worbench jsp
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
		//return "redirect:/workbench";
		return workbench(locale,model,session);
	}

}
