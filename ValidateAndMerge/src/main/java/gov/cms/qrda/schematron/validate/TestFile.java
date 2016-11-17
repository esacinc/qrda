package gov.cms.qrda.schematron.validate;
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

/**\
 * A class that holds the expected error and warning count present in schematron test files, along
 * with the actual error and warning counts found during validation.
 * @author dandonahue
 *
 */
public class TestFile {
	private int expectedErrors = -1;    // -1 implies expected count not present in file comments
	private int expectedWarnings = -1;  // -1 implies expected count not present in file comments
	private int errors = 0;
	private int warnings = 0;
	
	public int getExpectedErrors() {
		return expectedErrors;
	}
	public void setExpectedErrors(int val) {
		 expectedErrors = val;
	}
	public int getExpectedWarnings() {
		return expectedWarnings;
	}

	public void setExpectedWarnings(int val) {
		 expectedWarnings = val;
	}
	
	public int getErrors() {
		return errors;
	}
	public void setErrors(int val) {
		 errors = val;
	}
	public int getWarnings() {
		return warnings;
	}

	public void setWarnings(int val) {
		 warnings = val;
	}
	
	/**
	 * Returns true if the actual error count matches the expected error count.
	 * If there is no expected error count, returns true if actual error count = 0.
	 *  
	 * @return boolean
	 */
	public boolean asExpected(){
		boolean res = false;
		// If there are no expectations, then return true if no errors or warnings.
		if (expectedErrors < 0 ) {
			res = true ; // No expectations, assume ok.    (errors == 0); // Ignore warnings && warnings == 0);
		}
		else { // otherwise, return true if expected error count = actual error count.
			   // If expected warnings is set, then check that, too.
			res = (errors == expectedErrors);
			if (expectedWarnings > -1) {
				res = res && (warnings == expectedWarnings);
			}
		}
		return res;
	}
}
