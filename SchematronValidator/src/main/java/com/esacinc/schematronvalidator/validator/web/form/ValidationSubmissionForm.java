package com.esacinc.schematronvalidator.validator.web.form;
import com.esacinc.schematronvalidator.validator.model.XSDSpec;
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

/**
 * Spring MVC form containing user input required for creating a ValidationSuite object.
 * The ValidationService will run the validation tests on the ValidationSuite created from data in this form.
 * 
 * @see com.esacinc.schematronvalidator.validator.model.ValidationSuite
 * @see com.esacinc.schematronvalidator.validator.web.service.ValidationService
 * 
 * @author Dan Donahue
 *
 */
public class ValidationSubmissionForm {

	public final static String DEFAULT_NAME ="TestRun";
	private String name=DEFAULT_NAME;
	private String schematronType = "";                  // Maps to a subdirectory under the Schematrons directory in SCHEMATRON_VALIDATOR_HOME/validator filespace
	private String schematronFilename = "";              // The filename of the Schematron to use
	private String xsdFilename = null;
	private String [] testFilenames = {};                // List of test filenames to use

	public String getName() {
		return name;
	}
	public void setName(String val) {
		name = val;
	}

	public String getSchematronType() {
		return schematronType;
	}
	public void setSchematronType(String val) {
		schematronType = val;
	}
	
	public String getSchematronFilename() {
		return schematronFilename;
	}
	public void setSchematronFilename(String val) {
		schematronFilename = val;
	}

	public String getXsdFilename() {
		return xsdFilename;
	}
	public void setXsdFilename(String val) {
		xsdFilename = val;
	}

	public String [] getTestFilenames() {
		return testFilenames;
	}
	public void setTestFilenames(String [] val) {
		testFilenames = val;
	}
}
