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

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.web.multipart.MultipartFile;

import gov.cms.qrda.validator.model.FileSpec;
import gov.cms.qrda.validator.model.TestCase;
import gov.cms.qrda.validator.model.ValidationSuite;

public interface FileService {
	
	/**
	 * Loads a properties file where the file is on  the context class path.
	 * 
	 * @return The properties file
	 */
	public Properties loadProperties(String propertiesFilename);
	
	/**
	 * Loads a properties file where the file is on an external directory on the server, under a "properties" folder.
	 * By default, look in <QRDA_HOME>/qrda/properties.
	 * 
	 * @return The properties file
	 */
	public Properties loadPropertiesExt(String filename);

	/**
	 *  Get a property with a string value from the given resource (e.g. "enfora.properties").
	 *  Provide a default value to use if the given key is not found
	 */
	public String getProperty(String propertiesFilename, String key, String defaultVal);

	/**
	 *  Get a property with an integer value from the given resource (e.g. "enfora.properties")
	 *  Provide a default value to use if the given key is not found.
	 */
	public Integer getProperty(String propertiesFilename, String key, Integer defaultVal);

	
	/**
	 * Opens a file for reading. The file is expected to be in the QRDA filespace located in
	 * QRDA_HOME/qrda on the server.  BaseDir represents the immediate subfolder under the qrda
	 * folder (One of "isofiles", "schematrons", "testfiles" or "result").  The subDir argument is a subfolder under
	 * the baseDir folder (For example "HL7", "HQR", "CEC", or "PQRS").  The filename is the name of the file
	 * in the qrda/baseDir/subDir directory.
	 */
	public FileInputStream openExtFileForReading(String baseDir, String subDir, String filename);
	
	/**
	 * Opens a file for writing. The file is expected to be created in the QRDA filespace located in
	 * QRDA_HOME/qrda on the server.  BaseDir represents the immediate subfolder under the qrda
	 * folder (One of "schematrons", "testfiles" or "result").  The subDir argument is a subfolder under
	 * the baseDir folder (For example "HL7", "HQR", "CEC", or "PQRS").  The filename is the name of the file
	 * in the qrda/baseDir/subDir directory.
	 */
	public FileOutputStream openExtFileForWriting(String baseDir, String subDir, String filename);

	/**
	 * Opens a file and returns the contents of the file as a String.
	 * The file is expected to be in the QRDA filespace located in
	 * QRDA_HOME/qrda on the server.  BaseDir represents the immediate subfolder under the qrda
	 * folder (One of "isofiles", "schematrons", "testfiles" or "result").  The subDir argument is a subfolder under
	 * the baseDir folder (For example "HL7", "HQR", "CEC", or "PQRS").  The filename is the name of the file
	 * in the qrda/baseDir/subDir directory.
	 * 
	 */
	public String readExtFileUnparsed (String baseDir, String subDir, String filename);
	
	/**
	 * Opens a file and returns the contents of the file as a String.
	 * This method takes a string argument representing the absolute path to the file on the server.
	 */
	public String readExtFileUnparsed (String absolutePath);
	
	/**
	 * Returns a list of FileSpec objects representing the files present in the 
	 * QRDA_HOME/qrda/<baseDir>/subDir folder on the server. The list returned contains FileSpec objects
	 * for files only. Directories are not included. Files may be sorted in reverse chronological order by supplying
	 * a true value for the sortByDate parameter.
	 */
	public ArrayList<FileSpec> getExtRepositoryFiles(String baseDir, String subDir, String contains, boolean sortByDate);

	/**
	 * Returns a list of FileSpec objects representing the files present in the 
	 * QRDA_HOME/qrda/<baseDir>/subDir folder on the server. The list returned contains FileSpec objects
	 * for files only. Directories are not included.
	 */
	public ArrayList<FileSpec> getExtRepositoryFiles(String baseDir, String subDir, String contains);

	
	/**
	 * Creates a directory under the QRDA_HOME/qrda/result/ folder on the server. The dirname is the
	 * name of the folder to create. The name should not contain characters that are disallowed in folder names.
	 */
	public boolean createResultsDir(String dirname);
	
	/**
	 * Renames a category folder under each of the main folders in the QRDA filespace.
	 * @param currName
	 * @param newName
	 */
	public void renameCategoryDirectories(String currName, String newName);
	
	/**
	 * Creates a new category folder under each of the main folders in the QRDA filespace
	 * @param newName
	 */
	public void createCategoryDirectories(String newName);
	
	/**
	 * Removes a category folder (and all of its contents) under each of the main folders in the QRDA filespace
	 * @param catName
	 * @return
	 */
	public boolean deleteCategoryDirectories(String catName);
	
	/**
	 * Copies the contents of the original iso file subfolder to a folder under the isofiles directory in the QRDA filespace
	 * @param newName
	 * @return
	 */
	public boolean copyIsoFiles(String newName); 
	
	/**
	 * Returns a list of validation TestCases from a list of filenames of files located in the 
	 * QRDA_HOME/qrda/testfiles/<schematronType>  folder on the server.  
	 * The filenamePostfix value is appended to results file names that are created as part of each test case.
	 * The filenamePostfic values in normally a string representing a data-time value.
	 */
	public List<TestCase> createTestCases(String schematronFilename, String schematronType, List<String>testFilenames, String filenamePostFix, String resultsFolder);
	
	/**
	 * Uploads a file from the user's machine into a directory on the validator server. The file is 
	 * uploaded to the QRDA_HOME/qrda/<base>/subdir  directory on the server.
	 * If the name argument is non-null and non-empty, the file is given that name. Otherwise, the file
	 * retains the name it had on the client's machine.
	 */
	public boolean uploadFile(MultipartFile file, String base, String subdir, String name);
	
	/**
	 * Removes the file found in QRDA_HOME/qrda/<base>/<subdir>/<filename>
	 */
	public boolean deleteFile(String filename, String base, String subdir);
	
	/**
	 * Returns the full (absolute) pathname of the file located in QRDA_HOME/qrda/<base>/</subdir>/<filename>
	 */
	public String getAbsolutePath(String filename, String base, String subdir);

	/**
	 * Test files submitted to the QRDA Validator for validation may have a comment line indicating the number
	 * of errors and warnings expected to be present when validated. These values are used in reporting the 
	 * validation results on the Validator UI.
	 * 
	 * This method searches the first 20 lines of the given file for either of the following text lines:
	 *       "Total Errors Expected:  <n>"
	 *       "Total Warnings Expected: <m>"
	 * If either of those lines are found, the integer values (n and m, above) are entered into the given FileSpec object.
	 * 
	 */
	public void findExpectedErrorText(File file, FileSpec spec);
	
    /**
     * Serializes the ValidationSuite object to the proper subfolder under the result folder in the QRDA filespace.
     * @param vs
     */
	public void writeTestSuite(ValidationSuite vs);
	
	/**
	 * Reads (unserializes) a ValidationSuite object from the contents of the filename stored in the subDir category folder 
	 * in the result folder of the QRDA filespace.
	 * 
	 * @param subDir
	 * @param filename
	 * @return
	 */
	public ValidationSuite readTestSuite(String subDir, String filename);
	
	/**
	 * Takes a full pathname to a file on the server filespace and creates a URL that points to the same file.
	 * 
	 * @param pathname - the full path to the file
	 * @param topDir - the top-most directory in the QRDA filespace (e.g. "results" or "testfiles", etc.)
	 * @return a URL that references the same file
	 */
	public String convertToURL(String pathname, String topDir);
}
