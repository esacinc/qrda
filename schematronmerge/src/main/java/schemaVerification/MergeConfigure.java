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
POSSIBILITY OF SUCH DAMAGE
 */


// This code implements the logic to configure what files will be 
// merged into an aggregated schematron
// At present it is works with property files.
// SDV ESAC

package schemaVerification;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.FileSystem;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Hashtable;


// import java.util.EProperties;
// Use EProperties to suppoirt Command line arguments in a standard way
// import net.jmatrix.eproperties.EProperties;

public class MergeConfigure {

	//private static String defaultName = "HL7 QRDA Category I STU 3.1.properties";
	private static String defaultName = "HL7 QRDA Category III STU 1.1.properties";  // DD: Not using this. Processing all prop files at once, now.


	private static  String[] legalPropertyFileNames = {
			"HL7 QRDA Category I STU 3.1.properties",
			"HL7 QRDA Category III STU 1.1.properties",
			"EP CMS 2017 QRDA Category I.properties",
			"EP CMS 2017 QRDA Category III.properties",
			"EH CMS 2017 QRDA Category I.properties" ,
			"HL7 QRDA Category I STU 4.properties"
			};

	private static String MergedFileNameKeyword = "MergedFileName";

	public static synchronized List<String> getDefaultLegalPropertyFileNames () {
		return (Arrays.asList(legalPropertyFileNames));
	}

	// Getting/setting the property files associated with a run of the merge tool

	// If actual property file names have been identified (say as command arguments) then
	// use those property files - otherwise use the default list of file
	// name given by the static  legalPropertyFileNames SDV
	// see also constructors

	private static  List<String> actualPropertyFileNames = null;

	public  List<String> getPropertyFileNames ( ) {
		if (actualPropertyFileNames == null)
			return (getDefaultLegalPropertyFileNames());
		else
			return (actualPropertyFileNames );	
	}


	public static  synchronized List<String> setActualPropertyFileNames(String[] propFilenames){
		//System.out.println("setActualPropertyFileNames " + propFilenames.length);

		actualPropertyFileNames = Arrays.asList(propFilenames);
		return (actualPropertyFileNames);
	}


	private static Hashtable<String, Properties> fileToPropertyMapping = new Hashtable<String, Properties>();

	private synchronized Hashtable<String, Properties> putFileToPropertyMapping(String propFile,Properties properties){
		Hashtable<String, Properties> theFileToPropertyMapping = getFileToPropertyMapping();
		theFileToPropertyMapping.put(propFile, properties);
		return(fileToPropertyMapping);
	}

	private synchronized Hashtable<String, Properties> getFileToPropertyMapping(){
		return(fileToPropertyMapping);
	}

	private synchronized Properties propsLoaded(String propFile){
		Hashtable<String, Properties> theFileToPropertyMapping = getFileToPropertyMapping();
		return (theFileToPropertyMapping.get(propFile));
	}


	// Load the Environment variable around at loading of class
	static private Map<String, String> globalEnvironment = System.getenv();

	// The name of the environment variable that names the place used to
	// resolve where the .sch files reside. All paths to .sch are relative to this place
	static private String SchematronHomeVariable = "SchematronHome";


	// The name of the environment variable that names the place used to
	// resolve where the property file(s) reside. 
	static private String PropertyFileHomeVariable = "PropertyFileHome";


	// Method to check to see that the filename for the property
	// is one of the "legal" names - if not -note the non legal (i.e non-standard) name
	// being used for the file

	private static String checkPropFilename(String filename){
		String baseFileName = getbaseFileName(filename);

		List<String> legalFiles = getDefaultLegalPropertyFileNames();
		if (!legalFiles.contains(baseFileName)) {

			System.err.println("Property file given as " + filename);
			System.err.print("Expected one of " );
			for (String s : legalPropertyFileNames) System.err.print(s + " ");
			System.err.println(".");

			filename = legalFiles.get(0);
			System.err.println("Will try to use  " + filename + " as the properties file");
		}
		return(filename);
	}

	// get the basename for use in checking for the standard files
	private static String getbaseFileName(String fullpath){
		Path p = Paths.get(fullpath);
		String file = p.getFileName().toString();
		return(file);
	}


	// loadPropertiesFile(String file)
	// loads a property file named by its argument file (a String naming an absolute path
	//
	// this is actual worker method it loads the actual property file
	// Each property file contains
	//    1) A property declaring the number of files (i.e. NumberOfFiles) - technically this is optional
	//       but if supplied will be used as a declartion of the intended number of schmematrons referenced by property file
	// 
	//    2)  a line for each named schematron file (e.g. Schematron_1,  Schematron_2, ....) 
	//        (these are just identifiers, they need not be consecutive, nor must the highest be the value given by the  NumberOfFiles parameter if supplied)
	//
	//    3) The name of the file to be used for the merged file. The merged file holds the  collection of files in (2)
	//        
	// Each of the referenced schmematron file may be referenced in the following four ways as illustrated in the following 
	// property file fragment
	//
	//          # (1) The first schematron file is a relative path
	//          Schematron_1= exampleFile.sch

	//          # (2) The the second schematron file is an absolute path
	//          Schematron_2 = /user/foo/exampleFile.sch
	//
	//          # (3) The the third schematron file is an absolute path (after expansion)
	//          Schematron_Home = /user/foo/
	//          Schematron_3 = {$Schematron_Home}/user/foo/exampleFile.sch
	//          
	//          # (4) The the fourth schematron file is an relative path (after expansion)
	//          Schematron_Home = ./foo/
	//          Schematron_3 = {$Schematron_Home}/user/foo/exampleFile.sch
	//    
	//          These cases only consider the processing AFTER the logic in the maven file
	//          which can't (easily) assure the semantics of the properties files
	//  
	// If after expansion of global variables a Schmematron remains relative, it is considered relative to the variable
	// (e.g. cases (1) and (4) above) The path is considered relative to the global variable $SchmetronHome in the current runtime environment
	// If the variable $SchmetronHome  is not defined in the current runtime environment
	// If  that variable is undefined or it is defined such that after expansion the file does not name an absolute path, an error occurs
	//

	private synchronized Properties loadPropertiesFile(String file){

		Properties properties     = new EProperties();

		properties = propsLoaded(file);
		if (properties != null) { // if so just return it
			return(properties);
		}


		// Otherwise create the  the properties data structure from from file

		properties     = new EProperties();
		FileInputStream propFileInput = null;
		try {
			File propFile = new File(file);
			// Make the path to the Properties file an absolute path
			Path propPath = makePropertiesFileAbsolutePath(propFile.toPath());

			System.out.println("---------- Loading Property file from " + propPath);
			
			propFile = propPath.toFile();
			propFileInput = new FileInputStream(propFile);

			properties.load(propFileInput);
			propFileInput.close();

		} catch (Exception  e) {
			System.err.println("Could not load property file " + file);
			e.printStackTrace();	
		} finally {
			if (propFileInput != null)
				try {
					propFileInput.close();
				} catch (IOException e) {
					System.err.println("Could not close property file " + file);
					e.printStackTrace();
				}

		}


		// Store it 

		putFileToPropertyMapping(file,properties);
		return (properties);
	}

	private Path makePropertiesFileAbsolutePath(Path propPath )  {
		// if the path is absolute just leave it alone
		
		//Path schematronPlace = Paths.get("../Schematron");
		
		// System.out.println("************************ schematronPlace (makePropertiesFileAbsolutePath):" + makePropertiesFromRelativePath(schematronPlace ,propPath ));
		// System.out.println("************************ propPath.isAbsolute (makePropertiesFileAbsolutePath):" + propPath.isAbsolute());
		
		if (!propPath.isAbsolute()) {
			// Check to see if the global environment variable is set -
			// if the environment var Schematron_Home is defined use this

			//System.out.println("************************ In makePropertiesFileAbsolutePath Found Relative path: " + propPath  );

			String propertyFileHome = globalEnvironment.get(PropertyFileHomeVariable);
			if (propertyFileHome != null){
				propPath = makePropertiesFromRelativePath(propertyFileHome ,propPath);
			}
			else {
				
				Path filename = propPath.getFileName();
				
				//System.out.println("************************ filename (makePropertiesFileAbsolutePath):" + filename);
				//System.out.println("************************ propPath  (makePropertiesFileAbsolutePath):" + propPath );
				
				
				// Otherwise figure out the current working directory
				// see (http://stackoverflow.com/questions/4871051/getting-the-current-working-directory-in-java)
				// for an explanation of the following lines
				Path currentRelativePath = Paths.get("");
				
				// See if it exists in the current directory
				if (propPath.toAbsolutePath().toFile().exists()){
					//System.out.println("************************ Found in current directory");
					return(propPath.toAbsolutePath());
				}
				
				// Otherwise look up in the hierarchy to find SChematron directory
				// String s = currentRelativePath.toAbsolutePath().toString();
				// System.out.println("Current relative path is: " + s);
				propPath = makePropertiesFromRelativePath(currentRelativePath,propPath );
				
				//System.out.println("************************ propPath (makePropertiesFileAbsolutePath):" + propPath);
			}
		}
		return (propPath);
	}

	//TODO finish this method
	private Path makeSchematronFileAbsolutePath(Path propPath )  {
		// if the path is absolute just leave it alone
		
		//System.out.println("************************  propPath  " + propPath);
		//System.out.println("************************  isabsolute " + propPath.isAbsolute());
		
		if (!propPath.isAbsolute()) {
			// Check to see if the global environemnt variable is set -
			// if the environment var Schematron_Home is defined use this

			String schematronHome = globalEnvironment.get(SchematronHomeVariable);
			if (schematronHome != null){
				propPath = makePropertiesFromRelativePath(schematronHome,propPath);
			}
			else {
				// Otherwise figure out the current working directory
				// see (http://stackoverflow.com/questions/4871051/getting-the-current-working-directory-in-java)
				// for an explanation of the following lines
				Path currentRelativePath = Paths.get("../Schematron");
				//String s = currentRelativePath.toAbsolutePath().toString();
				// System.out.println("Current relative path is: " + s);
				propPath = makePropertiesFromRelativePath(currentRelativePath,propPath );
				//System.out.println("************************  propPath " + propPath);
			}
		}
		return (propPath);
	}

	//TODO finish this method
	// Takes two Paths base and path
	// 
	private Path makePropertiesFromRelativePath(String rel, Path path) {

		//System.out.println("************************ rel   = " + rel);
		//System.out.println("************************ path  = " + path);


		Path effectivePath = path;
		if (!path.isAbsolute()) {
			Path base = Paths.get(rel);
			effectivePath = base.resolve(path).toAbsolutePath();
		}
		return (effectivePath.normalize());

	}

	
	private Path makePropertiesFromRelativePath(Path relativeTo, Path filePlace) {
		
		//System.out.println("************************ relativeTo (makePropertiesFromRelativePath) = " + relativeTo);
		//System.out.println("************************ filePlace  (makePropertiesFromRelativePath) = " + filePlace.toAbsolutePath());
		
		Path parent = filePlace.toAbsolutePath().getParent();
		
		//System.out.println("************************ parent  (makePropertiesFromRelativePath)  = " + parent );
		
		
		Path schematronHome = findParentNamed(filePlace.toAbsolutePath().toFile(), "Schematron");
		
		//System.out.println("************************ schematronHome (makePropertiesFromRelativePath)  = " + schematronHome);
		
		Path effectivePath = schematronHome.resolve(filePlace);
		
		//System.out.println("************************ effectivePath (makePropertiesFromRelativePath)  = " + effectivePath);
		return (effectivePath.normalize());
	}

	Path findParentNamed(File curFile, String dirName){
		//System.out.println();
		//System.out.println("************************ curFile (findParentNamed) -> " + curFile);
		//System.out.println("************************ dirName(findParentNamed) -> " + dirName);
		
		if (curFile == null) 
			return(null);
		
		if (!curFile.isDirectory())
			return(findParentNamed(curFile.getParentFile(), dirName));
		
		File next = new File(curFile, dirName);
		
		if (next.exists())
			return(next.toPath());
		else 	
			return(findParentNamed(curFile.getParentFile(), dirName));
	}
	
/*
	public static void main (String[] namesOfPropertyFiles){

		MergeConfigure tool = new MergeConfigure(namesOfPropertyFiles);

		System.out.println("Start....");

		for (String propertyFile : tool.getPropertyFileNames()) {
			System.out.println("Prop file: " + propertyFile);


		}

	}

	 */
	// Returns the List of values matching the attributePattern param
	// If not present returns empty list

	private List <String> getAttributeMultipleValues(String attributePattern, Properties properties ){
		Set<String>	allKeys = properties.stringPropertyNames();

		// Ignore case for attributes (keys) in properties table

		Pattern pat = Pattern.compile(attributePattern.toLowerCase());


		List<String> existingValues =  new ArrayList<String>();
		for (String key: allKeys){
			String lcKey  = key.toLowerCase();
			Matcher matcher = pat.matcher(lcKey);


			if (matcher.matches()) {
				String val= properties.getProperty(key);
				existingValues.add(val);
			}
			//System.out.println("**** getAttributeMultipleValues (Added length) " + existingValues.size());;
		}
		// System.out.println("**** getAttributeMultipleValues (Matched lenth) " + existingValues.size());

		return (existingValues);
	}

	// Returns the  value matching the attributePattern attribute
	// If not present returns empty list
	private String getAttributeValue(String attribute,  Properties properties ) {

		return  properties.getProperty(attribute);

	}



	// The Merge configuration tool (class MergeConfigure) can be initialized in any of three ways
	// 
	//  1) passed a single file named a property file names a single file the contains references to all the Schematron and other parameters
	//  2) an array of strings naming property file
	//  3) nothing - in which the names of the property files are taken from the list

	//
	public MergeConfigure (String filename){
		this(new String[] { filename });
	}

	// The MergeTool can be passed a list of property file(s)
	public MergeConfigure (String[] propFilenames){

		if (propFilenames.length != 0) {
			setActualPropertyFileNames(propFilenames);
			for (String file : getPropertyFileNames()){
				checkPropFilename(file);
			}
		}
		//System.out.println(getPropertyFileNames());

	}

	// The MergeTool can be passed no  property file(s), in which case
	// a set of default files are used that have been deemed as "legal"
	public MergeConfigure (){

		this(legalPropertyFileNames);

	}



	public Properties getProperties(String forPropFile){
		Hashtable<String, Properties> propertiesMappingTable  = getFileToPropertyMapping();
		Properties properties = propertiesMappingTable.get(forPropFile);

		// If the properties associated with the file named by the forPropFile
		// aren't already loaded 
		if (properties == null) {
			// load them 
			propertiesMappingTable.put(forPropFile, loadPropertiesFile(forPropFile));
			// put them in the table
			properties = propertiesMappingTable.get(forPropFile);
		}

		return (properties);
	}

	public List<String>getFilesToMerge(String forPropFile){

		List<String> filesToReturn = new ArrayList<String>();

		Properties properties = getProperties(forPropFile);


		// Now look up all the values that start with "Schematron_"

		if (properties == null){
			System.err.println("----------  Warning - no properties found for " + forPropFile);
			return(filesToReturn);
		}

		filesToReturn = getAttributeMultipleValues("Schematron_(\\d)*", properties );


		//TODO add check that this isn't null
		int numberOfFileParameter = getNumberOfFilesToMerge(forPropFile);

		if (numberOfFileParameter != filesToReturn.size()){
			if (numberOfFileParameter >= 0){
				System.err.println(String.format("---------- Warning - NumberOfFiles (i.e. %d) and actual Number of Files (i.e. %d) differ for file \"%s\"." ,
						numberOfFileParameter, filesToReturn.size(), forPropFile));
			}
		}	                      

		return(filesToReturn);
	}


	// In the current implementation we see which files to merge  by consulting the properties file
	// 
	// 	returns -1 If the value was missing or not an integer value  for "NumberOfFiles" property
	// 	returns 0 If the value was valid unsigned  value  for "NumberOfFiles" property
	// 	otherwise returns the value of the "NumberOfFiles" property

	public int getNumberOfFilesToMerge(String forPropFile){

		//System.out.println(" **** getNumberOfFilesToMerge(Entering)");

		Properties properties = getProperties(forPropFile);
		String valueNof = getAttributeValue("NumberOfFiles", properties);

		//System.out.println(" **** getNumberOfFilesToMerge(NumberOfFiles attribute) = " +  valueNof);

		int nof = -1;
		// If the file doesn't say how many schematron files there should be - the  property file is in error
		
		String numbFilesWarning = "";
		if (valueNof  == null) {
			
			numbFilesWarning = String.format("---------- Warning - the definition of NumberOfFiles parameter is missing from property file named \"%s\"", forPropFile);
			System.err.println(numbFilesWarning );
			return (nof);
		}


		nof = 0;
		try {
			nof = Integer.parseInt(valueNof);
		}
		catch(NumberFormatException e){
			numbFilesWarning = String.format("---------- Warning - Ignoring the definition of NumberOfFiles parameter (e.g. %s) -not given as an number in" , valueNof, forPropFile);
			System.err.println(numbFilesWarning );
		}

		return (nof);
	}

	// Returns the string naming the merged file name that will be used to hold
	// the merged files named by Schematron_1 .. Schematron_<nof> ...

	public String getMergedFileName(String forPropFile){

		Properties properties = getProperties(forPropFile);

		String attribMergedFileName = properties.getProperty(MergedFileNameKeyword);

		Path pathForMergeFile = makeSchematronFileAbsolutePath(Paths.get(attribMergedFileName));



		return (pathForMergeFile.toString());

	}


	boolean isValidSchematronFile (String fileName){
		Boolean isValid = true;

		//System.out.println("Checking " + fileName);
		Path pathForFile = makeSchematronFileAbsolutePath(Paths.get(fileName));

		//System.out.println("CPath  = " + pathForFile);

		isValid = !Files.notExists(pathForFile);

		//System.out.println("Is Valid? " + isValid);

		return(isValid);
	}




	boolean isValidSchematronFile (List<String> namesOfiles) {

		Boolean isValid = true;
		for (String fileName :namesOfiles) {
			if (!isValidSchematronFile(fileName)){
				String msg = String.format("Schematron File \"%s\" is invalid and or missing ", fileName);
				System.err.println(msg);
				isValid = false;
				break;
			}

		}
		return(isValid);
	}


}
