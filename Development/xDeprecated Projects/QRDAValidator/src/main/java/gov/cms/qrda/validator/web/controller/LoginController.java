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
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gov.cms.qrda.validator.web.form.LoginForm;
import gov.cms.qrda.validator.web.service.CommonUtilsImpl;
import gov.cms.qrda.validator.web.service.SchematronCategoryService;

/**
 * Handles requests for the application home page.
 * Also maps the url /info to this page.
 * 
 * @author Dan Donahue
 *
 */
@Controller
@RequestMapping(value = { "/authenticate" })
public class LoginController extends CommonUtilsImpl {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	public SchematronCategoryService categoryService;
	

	@RequestMapping(method = RequestMethod.GET)
	public String showLogin(Locale locale, Model model, HttpSession session) {
		logger.info("LOGIN PAGE");
		
		LoginForm loginForm = new LoginForm();
		model.addAttribute("loginForm", loginForm);
		return "login";
	}

	@RequestMapping(value="/authenticate", method = RequestMethod.POST)
	public String authenticate(@ModelAttribute("loginForm") LoginForm loginForm, Locale locale, Model model, HttpSession session) {
		logger.info("AUTHENTICATE");
	
		Integer attempts = (Integer)session.getAttribute("loginAttempts");
		if  (attempts == null) {
			attempts = 0;
		}
		if (attempts >= 3){
			double delay = 2;
			delay = Math.pow(delay, attempts-2) * 1000;
			try {
				Thread.sleep((long)delay);
			}
			catch (Exception e) {
				logger.error("Login Exception: " + e.getMessage());
			}
		}
		session.setAttribute("loginAttempts", ++attempts);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// Read password from properties file. If not present, use the default one defined as a static variable on the LoginForm + "!"
		Properties props = fileService.loadPropertiesExt("validator.properties");
		String pwd = props.getProperty("adminPassword",LoginForm.ADMINP + "!");
		if (loginForm.getUsername().equalsIgnoreCase(LoginForm.ADMIN) &&
		    loginForm.getPassword().equals(pwd)) {
			logger.info("Successful admin login");
			session.setAttribute("isAuthenticated", "true");
			logger.info("Session setting: " + session.getAttribute("isAuthenticated"));
			return "redirect:/admin";
		}
		else {
			logger.error("Unsuccessful admin login");
			session.removeAttribute("isAuthenticated");
			return showLogin(locale,  model,  session) ;
		}

	}
	

}
