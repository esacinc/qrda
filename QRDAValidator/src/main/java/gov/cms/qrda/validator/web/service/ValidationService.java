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

import java.util.ArrayList;

import gov.cms.qrda.validator.model.ValidationSuite;

/**
 * The ValidationService creates and run validation suites. A validation suite consists of a schematron file, and a list
 * of test case files to validate against the schematron. All results are stored in the validation suite object.
 * 
 * @author dandonahue
 *
 */
public interface ValidationService {
	
    /**
    * Creates a ValidationSuite from the arguments provided. The schematronType argument is one of "HL7", "CEC", "HQR" or "PQRS" and
    * represents a subdirectory under the QRDA_HOME/qrda/schematrons folder on the server.
    *
    **/
	public ValidationSuite setupValidationSuite(String name, String schematronType, String schematronFile, ArrayList<String> testCases);
	
	/**
     * Applies the schematron of the validation suite to each of the test cases in the suite.
     * The schematron is first transformed into an .xsl file prior to applying it to the test cases.
     * Interim result status text is added to the validation suite and each test case as the validation process proceeds.
     * 
     */
	public void runValidation(ValidationSuite vs);
}
