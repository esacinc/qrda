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

import java.util.List;
import javax.servlet.http.HttpSession;
import gov.cms.qrda.validator.model.SchematronCategory;

/**
 * An interface describing how schematron categories are to be managed in the QRDA Validator application.
 * 
 * @author Dan Donahue, ESAC Inc.
 *
 */
public interface SchematronCategoryService {

	/**
	 * SCHEMATRON_CATEGORY is the name of an attribute in a Spring model where the current schematron categories are stored.
	 */
	public static final String SCHEMATRON_CATEGORY = "schematronCategories";
	/**
	 * SCHEMATRON_CATEGORY_FILE is the name of the file that contains a serialized version for the current schematron category objects.
	 */
	public static final String SCHEMATRON_CATEGORY_FILE = "schematronCategories.spec";
	
	
	/**
	 * Returns the current list of schematron categories as stored on disc. If none stored, a default list is built, serialized and returned.
	 * @return List of schematron categories
	 */
	public List<SchematronCategory> loadOrBuild();
	
	/**
	 * Creates and saves a new schematron category with the given name and dislayName.  The new schematron is marked 'active'.
	 * @param name, the internal name for the category
	 * @param displayName, the name of the new category as displayed in the UI
	 * @return A newly created schematron category object
	 */
	public SchematronCategory create(String name, String displayName);
	
	/**
	 * Activates or Deactivates a schematron category
	 * @param cat the category to activate 
	 * @param val the value to use:  true = activate, false = deactivate
	 * @return active status
	 */
	public boolean activate(SchematronCategory cat, boolean val);
	
	/**
	 * Loads the serialized schematron category objects from disc,
	 * @return List of schematron categories
	 */
	public List<SchematronCategory> load();
	
	/**
	 * Returns the list of schematron category objects as stored in the given session object.
	 * @param session the current HttpSession
	 * @return List of schematron categories
	 */
	public List<SchematronCategory> loadLocal(HttpSession session);
	
	/**
	 * Creates and saves (serializes) a new list of schematron category objects from hardcoded default values.
	 * @return List of schematron categories
	 */
	public List<SchematronCategory> initialBuild();
	
	/**
	 * Serializes the current list of schematron category objects to a file.
	 * @param specs, a list of SchematronCategory objects
	 * @return true if serialization was successful
	 */
	public boolean save(List<SchematronCategory> specs);
	
}
