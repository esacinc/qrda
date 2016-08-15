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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import gov.cms.qrda.validator.model.SchematronCategory;
import gov.cms.qrda.validator.model.FileSpec;
import gov.cms.qrda.validator.web.form.UploadFileForm;
import gov.cms.qrda.validator.web.service.CommonUtilsImpl;
import gov.cms.qrda.validator.web.service.SchematronCategoryService;
import gov.cms.qrda.validator.web.service.FileService;
import gov.cms.qrda.validator.xml.QRDA_URIResolver;

/**
 * Handles requests to/from the Test Files Inventory page
 * @author dandonahue
 *
 */
@Controller
@RequestMapping(value = "/vocabularyFiles")
public class VocFileController extends CommonUtilsImpl{
	
	private static final Logger logger = LoggerFactory.getLogger(VocFileController.class);

	@Autowired
	public SchematronCategoryService categoryService;

	/**
	 * Default mapping.  Gathers the file specs from each sub folder in the Vocabulary Files folder of the QRDA_HOME/qrda file space on the server.
	 * Also creates a form enabling users to upload files to those same folders.
	 * 
	 * @param locale
	 * @param model
	 * @return  test files inventory jsp page
	 * 
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String manageVocFiles(Locale locale, Model model, HttpSession session) {
		logger.info("VOCABULARY FILES");

		// Load the directory specs from disc to be sure we are up to date on categories.
		List<SchematronCategory> dirSpecs =  categoryService.loadOrBuild();
		model.addAttribute(SchematronCategoryService.SCHEMATRON_CATEGORY, dirSpecs);

		// For each type of schematron we support (mapping one-to-one to the list of directory specs), gather the 
		// proper files from each subdirectory and set the directory spec's file list to that list.
		for (SchematronCategory dir : dirSpecs) {
			if (dir.isActive()) {
				String subDir = dir.getName();
				logger.info("Getting files for subdir " + subDir);

				ArrayList<FileSpec> files = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_ISO,subDir, ".xml");
				dir.setFiles(files);
				model.addAttribute(subDir+"List",files);
				UploadFileForm uff = new UploadFileForm();
				uff.setSubDir(subDir);
				model.addAttribute("upload"+subDir, uff);
			}
		}
        /*
		ArrayList<FileSpec> cecs = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_ISO,QRDA_URIResolver.REPOSITORY_TYPE_CEC, ".xml");
		model.addAttribute("cecList",cecs);
		UploadFileForm uffCEC = new UploadFileForm();
		uffCEC.setSubDir(QRDA_URIResolver.REPOSITORY_TYPE_CEC);
		model.addAttribute("uploadCEC", uffCEC);

		ArrayList<FileSpec> hl7s = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_ISO,QRDA_URIResolver.REPOSITORY_TYPE_HL7, ".xml");
		model.addAttribute("hl7List",hl7s);
		UploadFileForm uffHL7 = new UploadFileForm();
		uffHL7.setSubDir(QRDA_URIResolver.REPOSITORY_TYPE_HL7);
		model.addAttribute("uploadHL7", uffHL7);

		ArrayList<FileSpec> hqrs = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_ISO,QRDA_URIResolver.REPOSITORY_TYPE_HQR, ".xml");
		model.addAttribute("hqrList",hqrs);
		UploadFileForm uffHQR = new UploadFileForm();
		uffHQR.setSubDir(QRDA_URIResolver.REPOSITORY_TYPE_HQR);
		model.addAttribute("uploadHQR", uffHQR);

		
		ArrayList<FileSpec> pqrs = fileService.getExtRepositoryFiles(QRDA_URIResolver.REPOSITORY_ISO,QRDA_URIResolver.REPOSITORY_TYPE_PQRS, ".xml");
		model.addAttribute("pqrsList",pqrs);
		UploadFileForm uffPQRS = new UploadFileForm();
		uffPQRS.setSubDir(QRDA_URIResolver.REPOSITORY_TYPE_PQRS);
		model.addAttribute("uploadPQRS", uffPQRS);

        */
		
		// Older versions of app can't handle history files, so determine if we should show the history tab or not.
		if (fileService.existHistoryFiles()) {
			model.addAttribute("showHistory",true);
		}

		return "vocabularyInventory";
	}

	/**
	 * This method is called by AJAX from the vocabulary files inventory page. It reads the contents of the given file
	 * (as specified by the filename and the folder name - type - of the folder where the particular test file file resides)
	 * into a string and puts that string into the response of this call.
	 * 
	 * @param locale
	 * @param model
	 * @param type
	 * @param filename
	 * @param session
	 * @return
	 */

	@RequestMapping(value = "getXML", method = RequestMethod.GET)
	public @ResponseBody String gettext (Locale locale, Model model,  @RequestParam("type") String type, @RequestParam("file") String filename) {
		logger.info("Called via ajax getXML: type:" + type + ", file:" + filename);
		String response = fileService.readExtFileUnparsed(QRDA_URIResolver.REPOSITORY_ISO, type, filename);
		logger.info(response);
		return response;
	}

	/**
	 * Removes the given file (as specified by the filename and the folder name - type - of the folder where the particular vocabulary file resides)
	 * from the system.
	 * 
	 * @param filename
	 * @param subdir
	 * @param locale
	 * @param model
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/remove/{filename}&{subdir}", method = RequestMethod.GET)
    public String processRemoveFile(@PathVariable String filename,  @PathVariable String subdir, Locale locale, Model model, HttpServletRequest request) {
		
		logger.info("Delete file: " + filename + " in " + QRDA_URIResolver.REPOSITORY_ISO + "/" + subdir);
		fileService.deleteFile(filename,  QRDA_URIResolver.REPOSITORY_ISO, subdir);
		return "redirect:/vocabularyFiles";
	}

	/**
	 * Uploads a file into the sub directory under the vocabulary file repository.
	 * 
	 * @param uploadFileForm
	 * @param result
	 * @param locale
	 * @param model
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/upload", method = RequestMethod.POST)
    public String processUploadFileForm(UploadFileForm uploadFileForm, BindingResult result, Locale locale, Model model, HttpServletRequest request) {
		
        // Redirect to the page with any errors
        if (result.hasErrors()) {
        	return manageVocFiles(locale, model, request.getSession());
        }
 		fileService.uploadFile(uploadFileForm.getPath(), QRDA_URIResolver.REPOSITORY_ISO, uploadFileForm.getSubDir(), uploadFileForm.getName());
		return "redirect:/vocabularyFiles";
	}

}
