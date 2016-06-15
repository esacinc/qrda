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
import java.util.Properties;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

// import java.util.EProperties;
// Use EProperties to suppoirt Command line arguments in a standard way
// import net.jmatrix.eproperties.EProperties;

public class MergeConfigure {


	//private static String defaultName = "HL7 QRDA Category I STU 3.1.properties";
	private static String defaultName = "HL7 QRDA Category III STU 1.1.properties";  // DD: Not using this. Processing all prop files at once, now.


	// DD: Make this list public so that schematronMerge bean can know which properties files to process.
	public static  List<String> legalPropertyFileNames = Arrays.asList(  "HL7 QRDA Category I STU 3.1.properties",
			"HL7 QRDA Category III STU 1.1.properties",
			"EP CMS 2017 QRDA Category I.properties",
			"EP CMS 2017 QRDA Category III.properties",
			"EH CMS 2017 QRDA Category I.properties");
	
	// If actual property file names have been identified (say as command arguments) then
	// use those property files - otherwise use the default list of file
	// name given by the static  legalPropertyFileNames SDV
	public static  List<String> getPropertyFileNames () {
		if (actualPropertyFileNames == null)
		 return (legalPropertyFileNames );
		else
		 return (actualPropertyFileNames );	
	}
	
	public static  List<String> actualPropertyFileNames = null;
	
	private Properties properties     = new EProperties();

	private boolean propsLoaded       = false;

	private String propertiesFileName = defaultName;


	// Check to see that the filename for the property
	// is one of the "legal" names - if not -note the non-standard name
	// being used for the file
	private static String checkPropFilename(String filename){
		String baseFileName = getbaseFileName(filename);

		if (!legalPropertyFileNames.contains(baseFileName)) {

			System.err.println("Property file given as " + filename);
			System.err.print("Expecting one of " );
			for (String s : legalPropertyFileNames) System.err.print(s + " ");
			System.err.println(".");

			filename = legalPropertyFileNames.get(0);
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

	// this is actual worker method it loads the actual propeerty file
	// Each property file is expected to contain the 
	//    1) number of file
	//    2)  a line naming each (schematron) file
	//    3) The name of the merged files thatholds the  collection of files in (2) that will be merged.
	//
	private void loadPropertiesFile(){
		try {
			File file = new File(getPropertiesFileName());
			FileInputStream fileInput = new FileInputStream(file);

			properties.load(fileInput);
			propsLoaded  = true;
			fileInput.close();


		} catch (FileNotFoundException e) {
			System.err.println("Could not load property file " + getPropertiesFileName());
			propsLoaded  = false;
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("Could not load property file " + getPropertiesFileName());
			propsLoaded  = false;
			e.printStackTrace();
		}		
	}


	public static void main (String[] args){

		
		System.out.println("Start....");
		// DD: Loop through all properties files and process one by one.
		for (int i = 0; i < getPropertyFileNames().size(); i++) {
			MergeConfigure tool = new MergeConfigure();
			
			tool.propertiesFileName = getPropertyFileNames().get(i);
			System.out.println("Prop file: " + tool.propertiesFileName);
			
			tool.propsLoaded = false;
			String[] files = tool.getFilesToMerge();
			for (String f : files){
				System.out.println(f);
			}
		}

	}

	// DD:  Public accessor used by schematronMerge bean to set up  a particular properties file for processing.
	public void setupSchematronMerge(int i) {
		propsLoaded = false;
		propertiesFileName = getPropertyFileNames().get(i);
	}

	// DD: Public accessor used by schematronMerge to get the current properties filename being processed.
	public String getPropertiesFileName() {
		return(propertiesFileName);
	}

	// The MergeTool can be passed a single file named a property file
	public MergeConfigure (String filename){
		filename = checkPropFilename(filename);
		propertiesFileName = filename;
	}

	// The MergeTool can be passed a list of property file(s)
	public MergeConfigure (String[] propFilenames){
		this(propFilenames[0]);  // start with the first one
		actualPropertyFileNames = Arrays.asList(propFilenames);
		
	}
	
	// The MergeTool can be passed no  property file(s), in which case
	// a set of default files are used that have been deemed as "legal"
	public MergeConfigure (){
		String filename = defaultName;
		filename = checkPropFilename(filename);
		propertiesFileName = filename;
	}

    // IN the current implementation we see which files to merge
	// by consulting the properties file
	public String[] getFilesToMerge(){
		
		// if the file hasn't isn't already loaded - then load it
		if (!propsLoaded) loadPropertiesFile();
		int nof = 0;

		// See how many file are referenced in the property file
		String value = properties.getProperty("NumberOfFiles");

		// If the file doesn't say how many schematron files there should
		// be - it is assumed that the property file is in error
		if (value == null) {
			System.err.println("The definion of NumberOfFiles parameter is missing from property file named " + 
		                        getPropertiesFileName());
			System.exit(-1);
		}

		nof = Integer.parseInt(value);

		// Read in the references to the schematron file form
		// Schematron_1 .. Schematron_<nof> ...
		
		String[] filesToMerge = new String [nof];
		String propName = "Schematron_";

		for (int i = 1; i <= nof ; i++) {
			String thePropName = propName + i;
			String propValue = properties.getProperty(thePropName);

			if (propValue == null) {
				System.err.println("The definion of " + thePropName + " is missing from property file named " + 
			                       getPropertiesFileName());
				System.exit(-1);
			}

			filesToMerge[i-1] = propValue;
			//System.out.println(i + " " + filesToMerge[i-1] );
		}
		return (filesToMerge);
	}

	// Returns the string naming the merged file name that will be used to hold
	// the merged files named by Schematron_1 .. Schematron_<nof> ...
	
	public String getMergedFileName(){
		String mergedFileName = "missing";

		if (!propsLoaded) loadPropertiesFile();

		String baseFileName = "missing";

		mergedFileName = properties.getProperty("MergedFileName");

		if (mergedFileName != null) {
			baseFileName = getbaseFileName(mergedFileName);
		}

		return (mergedFileName);
	}

	
}
