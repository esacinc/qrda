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


package schemaVerification;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.Namespace;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


public class SchematronMerge {

private SAXBuilder builder = new SAXBuilder();
	
// Creates the files associated with the Schematrons to be merged
// exits if all files are not valid - otherwise returns array of references to files

public File[]  createFiles(String[] files){
	File xmlFiles[] = new File[files.length];
	for (int i = 0 ; i < files.length; i++) {
		File xFile = new File(files[i]);
		xmlFiles[i]  = xFile;
		// Check that the  two schematron files are valid names
		if(!xFile.exists() ) { 
			System.err.println ("File " + files[i]+ " is invalid - schematron does not exist");
			System.exit(1);
		    
		}
		
		if(xFile.isDirectory() ) { 
			System.err.println ("File " + files[i]+ " is invalid - names a directory not a file");
			System.exit(1);
		    
		}
		
	}
	return (xmlFiles);
}

public Document[]  createDocuments(File xmlFiles[] ){
	Document[]  docs = new Document[xmlFiles.length];
	
	for (int i = 0 ; i < xmlFiles.length; i++) {
		// Build the internal representations
		File file= xmlFiles[i] ;

		try {
			docs[i]= builder.build(file);

		} catch (IOException io) {
			System.err.println ("Could not build file " + file );
			System.err.println(io.getMessage());
			System.exit(1);
		} catch (JDOMException jdomex) {
			System.err.println ("Could not build file " + file );
			System.err.println(jdomex.getMessage());			
			System.exit(1);
		}

		
	}
	return (docs);
}


Schematron[] createSchematronRep(Document[] documents){
	Schematron[] sReps = new Schematron[documents.length];
	for(int i = 0; i < documents.length; i++){
		sReps[i] = new Schematron(documents[i]);
		//System.out.println("Created internal schematron rep for  " + sReps[i]);
	}
	return (sReps);
}


// Find the namespaces that are added to in the root of each schematron
List<Namespace> findNamespacesInScope(Schematron[] sReps){
	List<Namespace> nsl = new ArrayList<Namespace>();
	Hashtable <String,String> nsSeenSoFar = new Hashtable <String,String>();
	
	// For each schematron
	for (Schematron s : sReps ){
		// Find the namespaces alluded to in the root
		Element root = s.getRoot();
		List<Namespace> nsElems = root.getNamespacesInScope();
		
		// Record the namespaces that have not been seenso far
		for (Namespace ns : nsElems ){
			
			if (nsSeenSoFar.get(ns.getPrefix()) == null) {
				nsl.add(ns);
				//System.out.println("Added " + ns);
				nsSeenSoFar.put(ns.getPrefix(),ns.getURI());
			
				
			}
		}
	}
	
	return(nsl)	;
}


private List<Element> constructMergedSpaces(Schematron[] sReps){
	Hashtable<String,Element> nsSeenSoFar = new Hashtable<String,Element>();
	List<Element> mergedSpaces = new ArrayList<Element> ();
	
	for (Schematron s : sReps) {
		Hashtable<String,Element> ns = s.makeNamespaces();
		for (String nsKey : ns.keySet()) {
			if (nsSeenSoFar.get(nsKey) == null) {
				Element value = ns.get(nsKey);
				nsSeenSoFar.put(nsKey, value);
				mergedSpaces.add(value.clone());
			}
		}
		
	}
	return (mergedSpaces);

}



private List<Element> constructMergedErrors(Schematron[] sReps){
	Hashtable<String,Element> errorsSoFar = new Hashtable<String,Element>();
	List<Element> mergedErrors = new ArrayList<Element> ();
	
	for (Schematron s : sReps) {
		Hashtable<String,Element> errs = s.makeErrors();
		for (String errKey : errs.keySet()) {
			if (! errorsSoFar.contains(errKey)) {
				Element elemValue = errs.get(errKey);
				mergedErrors.add(elemValue.clone());
				errorsSoFar.put(errKey, elemValue);
				
			}
		}
		
	}
	return (mergedErrors );
	
}

private List<Element> constructMergedWarnings(Schematron[] sReps){
	Hashtable<String,Element> warningsSoFar = new Hashtable<String,Element>();
	List<Element> mergedWarnings = new ArrayList<Element> ();
	
	for (Schematron s : sReps) {
		Hashtable<String,Element> warnings = s.makeWarnings();
		for (String warnKey : warnings.keySet()) {
			if (! warningsSoFar.contains(warnKey)) {
				Element elemValue = warnings .get(warnKey);
				mergedWarnings.add(elemValue.clone());
				warningsSoFar.put(warnKey, elemValue);
				
			}
		}
		
	}
	return (mergedWarnings);
	
}


public static void main(String[] args) {

	SchematronMerge  merger = new SchematronMerge();
	
	MergeConfigure configTool;
	
	// The Merged file name and schematron files are taken from the properties file
	// The property file name can either be taken from the first argument to SchematronMerge
	// (if run on the command line or supplied as an Eclipse property)
	
	if (args.length == 0)
		configTool = new MergeConfigure();
	else
		configTool = new MergeConfigure(args[0]);
		
	
	 PrintStream console = System.out;
	
	 // DD: Loop through each propertes file in the list of properties files managed in the MergeConfigure bean.
	 // Process the merge laid out in each file.
	 for (int i =0; i < MergeConfigure.legalPropertyFileNames.size(); i++) {
		 
		configTool.setupSchematronMerge(i);
		System.out.println("---- Processsing properties file: " + configTool.getPropertiesFileName());
		String[] files = configTool.getFilesToMergeFromPropertiesFile();
		String mergedFileName = configTool.getMergedFileNameFromPropertiesFile();
		
		Document mergedDoc = merger.merge(files);
		
		
		OutputStream output = null;
		try {
			output = new FileOutputStream(mergedFileName);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		PrintStream printOut = new PrintStream(output);
	
		
		System.setOut(printOut);
		
		
		
		
		// Actually output the merged file by redirecting stdout
		
	    try {
	
	      new XMLOutputter(Format.getPrettyFormat()).output(mergedDoc, System.out);
	    }
	    catch (IOException e) {
	      System.err.println(e);
	    }
	
	   
		// Redirect stdout back to the console
	   System.setOut(console);
	   System.out.println("     Wrote merged Schematron file to " + mergedFileName  );
	}
}


public Document merge(String[] files) {
		

		File xmlFiles[] = createFiles(files);
		Document documents[] = createDocuments(xmlFiles);
		
		Schematron[] sReps = createSchematronRep(documents);
		Schematron firstSchematron = sReps[0];
		Element root = firstSchematron.getRoot();
		Element top = new Element(root.getName(), root.getNamespace());
		
		
		List<Namespace> nsl = findNamespacesInScope(sReps);
		for (Namespace n : nsl) top.addNamespaceDeclaration(n);
		
		
		List<Element> mergedSpaces = constructMergedSpaces(sReps);
		List<Element> mergedErrors = constructMergedErrors(sReps);
		List<Element> mergedWarnings = constructMergedWarnings(sReps);
		

		
		// Tool requires that every item added must have only one parent
		// so you need to detach all the parents before completing
		// the assembly into the merged representation
		
		mergedWarnings = Schematron.detachAll(mergedWarnings);
		mergedErrors   = Schematron.detachAll(mergedErrors);
		mergedSpaces   = Schematron.detachAll(mergedSpaces);
		
		// Construct the error and warning representations
		
		Element pe1 = firstSchematron.makePhaseElement("errors" );
		Element pe2 = firstSchematron.makePhaseElement("warnings" );
		
		pe1.addContent(mergedErrors);
		pe2.addContent(mergedWarnings);
		
		
		// Add the Namespaces used in each of the merged file
	    top.addContent(mergedSpaces);
	    
	    // Construct the new document that will hold the merge
		Document mergedDoc = new Document(top); 
		
		// Add the merged content
		mergedDoc.getRootElement().addContent(pe1);
		mergedDoc.getRootElement().addContent(pe2);
		
		// Add the patterns (w/ rules, assertions, etc)
		// from each of the files to be merged
		for (Schematron s :sReps) {
			Hashtable<String,Element> patterns = s.makePatterns();
			mergedDoc.getRootElement().addContent(patterns.values());
		}
		
	
		return (mergedDoc);
	}
		

}
