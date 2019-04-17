package gov.cms.qrda.validator.web.service;
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

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

/**
 * Common utilities shared by all controllers and services in the QRDAValidator project.
 * 
 * @author Dan Donahue
 *
 */
@Service
public class CommonUtilsImpl  {
    private Locale theLocale = null;
    
	@Autowired
	public MessageSource messageSource; 
	
	@Autowired
	public FileService fileService;   // Used by derived controller and service classes

	
	//////////  METHODS FOR RETRIEVING TEXT FROM MESSAGE PROPERTIES FILES ////////////////////////////
	
	// Used by unit tests to set the msg source bundle 
	public void setMessageSource(MessageSource ms) {
		this.messageSource = ms;
	}
	
    protected Locale getLocale() {
        return (theLocale != null) ? theLocale : Locale.getDefault();    // Create after this class has been instantiated
    }
	
	protected void setLocale(Locale loc) {
		theLocale = loc;
	}

	
	protected String getMessage(String key) {
		return messageSource.getMessage(key, new Object[0], getLocale());
	}
	protected String getMessage(String key, String defaultVal) {
		return messageSource.getMessage(key, new Object[0],  defaultVal, getLocale());
	}

	protected String getMessage(String key, Object[] objs) {
		return messageSource.getMessage(key, objs, getLocale());
	}

	protected String getMessage(String key, Object[] objs, String defaultVal) {
		return messageSource.getMessage(key, objs, defaultVal, getLocale());
	}


	// Methods that use locale other than the one set in this object...
	protected String getMessage(String key, String defaultVal, Locale locale) {
		return messageSource.getMessage(key, new Object[0],  defaultVal, locale);
	}

	protected String getMessage(String key, String defaultVal, HttpServletRequest request) {
		return messageSource.getMessage(key, new Object[0],  defaultVal, request.getLocale());
	}


}
