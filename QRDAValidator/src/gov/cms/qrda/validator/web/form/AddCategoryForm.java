package gov.cms.qrda.validator.web.form;

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
 * Spring MVC form containing user input required for adding a category to the system.
 *  
 * 
 * @author Dan Donahue, ESAC Inc.
 *
 */
public class AddCategoryForm {

	private String name = "";                      // The name of the directory on disc
	private String displayName = "";               // The name of the directory as displayed in the UI
	private boolean active = true;			       // Whether or not we are using this directory

	public AddCategoryForm() {}
	
	public AddCategoryForm(String name, String displayName) {
		this.name = name;
		this.displayName = displayName;
		this.active = true;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String val) {
		name = val.trim().replaceAll("[^a-zA-Z0-9]", "_"); // Insure only alphanumeric characters in name. Replace others with "_"
		
	}
	
	public String getDisplayName() {
		return displayName;
	}
	
	public void setDisplayName(String val) {
		displayName = val.trim();
	}

	public boolean getActive() {
		return active;
	}
	public void setActive(boolean val) {
		active = val;
	}

}
