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

	private static String defaultName = "HL7_core_STU3.1_schematron.properties";


	private static  List<String> legalPropertyFileNames = Arrays.asList("HL7_core_STU3.1_schematron.properties", 
			                                                    "HQR_CMS_2017_schematron.properties",
			                                                     "PQRS_CMS_2017_schematron.properties");
		
	private static  List<String> legalmergedNames = Arrays.asList("HL7 QRDA Category I STU3.1.sch", 
								      "EH CMS 2017 QRDA Category I.sch",
                                                                      "EP CMS 2017 QRDA Category I.sch");
	


    //	private Properties properties     = new EProperties();
	private Properties properties     = new Properties();
	
	private boolean propsLoaded       = false;
	
	private String propertiesFileName = defaultName;
	
	private String getPropertiesFileName() { 
		return (propertiesFileName);
	}
	
	private static String checkPropFilename(String filename){
		String baseFileName = getbaseFileName(filename);
		
		if (!legalPropertyFileNames.contains(baseFileName)) {
		
			System.err.println("Property file given as " + filename);
			System.err.print("Must be one of " );
			for (String s : legalPropertyFileNames) System.err.print(s + " ");
			System.err.println(".");
			
			filename = legalPropertyFileNames.get(0);
			System.err.println("Will try to use  " + filename + " as the properties file");
		}
		return(filename);
	}

	private static String getbaseFileName(String fullpath){
		Path p = Paths.get(fullpath);
		String file = p.getFileName().toString();
		return(file);
	}
	
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
	

	// Make this a JUnit test that tests for 
	// (a) files to merge
	// (b) name of merged file retreival 
	public static void main (String[] args){
		
		MergeConfigure tool = new MergeConfigure();
		
		// (a)
		String[] files = tool.getFilesToMerge();
		for (String f : files){
			System.out.println(f);
		}
		
		// (b)
		String fileName = tool.getMergedFileName();
		
	}
	
	
	
	
	public MergeConfigure (String filename){
		filename = checkPropFilename(filename);
		propertiesFileName = filename;
	}
	
	public MergeConfigure (){
		String filename = defaultName;
		filename = checkPropFilename(filename);
		propertiesFileName = filename;
	}
	

	public String[] getFilesToMerge(){
		if (!propsLoaded) loadPropertiesFile();
		int nof = 0;
	

		String value = properties.getProperty("NumberOfFiles");
		
		if (value == null) {
			System.err.println("The definion of NumberOfFiles parameter is missing from property file named " + getPropertiesFileName());
			System.exit(-1);
		}
		
		nof = Integer.parseInt(value);
		
		String[] filesToMerge = new String [nof];
		String propName = "Schematron_";
		
		for (int i = 1; i <= nof ; i++) {
			String thePropName = propName + i;
			String propValue = properties.getProperty(thePropName);
			
			if (propValue == null) {
				System.err.println("The definion of " + thePropName + " is missing from property file named " + getPropertiesFileName());
				System.exit(-1);
			}
			
			filesToMerge[i-1] = propValue;
			//System.out.println(i + " " + filesToMerge[i-1] );
		}
		return (filesToMerge);
	}

	
	public String getMergedFileName(){
		String mergedFileName = "missing";
		
		if (!propsLoaded) loadPropertiesFile();
		
		String baseFileName = "missing";
		
		mergedFileName = properties.getProperty("MergedFileName");
		
		if (mergedFileName != null) {
				baseFileName = getbaseFileName(mergedFileName);
		}
		
		if (!legalmergedNames.contains(baseFileName)) {
			
			System.err.println("Property file has merged file as  " + mergedFileName );
			
			System.err.println("Must be one of " );
			for (String s : legalmergedNames) System.err.println(s + " ");
			System.err.println(".");
			
			
			System.exit(-1);
		}
		
		
		return (mergedFileName);
	}
}
