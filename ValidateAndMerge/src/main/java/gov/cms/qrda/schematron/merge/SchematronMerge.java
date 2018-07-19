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


// This file implements 
// 
package gov.cms.qrda.schematron.merge;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Scanner;

import org.jdom2.Comment;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.Namespace;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import gov.cms.qrda.schematron.validate.Validator;
import gov.cms.qrda.schematron.merge.ProgressTimer;

/**
 * The class implements the process of merging schematron template files into a single schematron file.
 * It creates XML Document objects for each of the schematron files to merge, and parses each document,
 * gathering the appropriate sections withing each, and writing them out in a particular order into a single
 * merged document file.
 * 
 * @author Shon Vick, ESAC Inc., additions by Dan Donahue ESAC Inc.
 *
 */
public class SchematronMerge {

	static protected SAXBuilder builder = new SAXBuilder();

	/** 
	 * The main method implements the merge process.
	 * @param namesOfPropertyFiles A String array. Deprecated, can be ignored.
	 */
	public static void main(String[] namesOfPropertyFiles) {

		SchematronMerge mergerTool = new SchematronMerge();
		
		ArrayList<String> mergeInstructionFiles = MergeInstructions.getInstructionFiles("mergeInstructionsFile.txt");
		
		// Run the merge process using each merge instructions file found in mergeInstructionsFile.txt 
		for (String file : mergeInstructionFiles) {
			System.out.println("");
			System.out.println("PROCESSING MERGE INSTRUCTIONS : " + file);
			boolean continueOk = true;
			MergeInstructions mergeInstructions = new MergeInstructions();
			mergeInstructions.open(file);  // Opens the instructions and processes them in preparation for the merge.
			// If we are in summary mode only, or if non-verbose debugging, then create a timer that will
			// output some progress dots on the console to indicate things are still happening.
			ProgressTimer timer = new ProgressTimer(mergeInstructions.getSummaryOnly() || !mergeInstructions.getVerbose()); // Maybe set a timer for console progress indication
			if (!mergeInstructions.getGlobalStop()) {  // Continue as long as there was no error during .open() that dictates a stoppage in processing.
				List<String> namesOfFilesToMerge = mergeInstructions.getSchematronsOnly();
				if (namesOfFilesToMerge == null || namesOfFilesToMerge.isEmpty()) {
					mergeInstructions.addResult(MergeInstructions.INDENT1 +"ERROR:" + " NO files were identified for merging");
					continueOk = false;
				}
				else {
					// If we are to validate each template, do that now for all of the templates. Take note of whether there were any validation discrepancies in any of the templates.
					continueOk = mergerTool.validateTemplates(mergeInstructions);
				}
	
					// If it is ok to continue, then do the merge
				if (continueOk) {
					mergeInstructions.addResult(MergeInstructions.INDENT1 +" ");
					mergeInstructions.addResult(MergeInstructions.INDENT1 +"Merge Process Results....");
	
					// Retrieve the list of schematron template files we are to merge. (The mergeInstructions gathered this list during the "open" process)
					String mergedFileName  = mergeInstructions.getMergeFilename();
					mergeInstructions.addResult(String.format(MergeInstructions.INDENT2 +"Merging files into file \"%s\"." , mergedFileName));
					Document mergedDocument = mergerTool.merge(mergeInstructions);  // Do the big merge
					
					// Write the mergedDocument to the merged file specified in the instructions
					// Remember the console
					// Not sure why the write was done in this convoluted manner, but won't change it now as it seems to work.
					PrintStream console = System.out;
					// Redirect stdout to the File named by mergedFileName
					OutputStream output = null;
					try {
						output = new FileOutputStream(mergedFileName);
					} catch (FileNotFoundException e1) {
						String fileNotFoundMsg = String.format(MergeInstructions.INDENT2 +"Fatal Error: Merged File (i.e. \"%s\" can't be created. Exception message: %s" , mergedFileName, e1.getMessage());
						mergeInstructions.addResult(fileNotFoundMsg);
						if (mergeInstructions.getVerbose()  && !mergeInstructions.getSummaryOnly()) {
							System.err.println(fileNotFoundMsg);
							e1.printStackTrace();
						}
					}
					PrintStream printOut = new PrintStream(output);
					// Now actually print out the merged file
					//First stdout must be rerdirected since the underlying routines print to stdout
					System.setOut(printOut);
					//	Next Print out any Header information
					// Nextrint out that merged document 
					mergerTool.printMergedDocument(mergedDocument);
					try {
						output.close();
					}
					catch (Exception e) {}
					//  Redirect stdout back to the console
					System.setOut(console);
		
					//System.out.println(mergeMsg);
					mergeInstructions.addResult(String.format(MergeInstructions.INDENT2 +"Wrote merged Schematron file to \"%s\"." , mergedFileName));
					if (mergeInstructions.getVerbose() && !mergeInstructions.getSummaryOnly()) {
						compareAsserts(mergeInstructions, mergeInstructions.getCompareSchematronFilename(), mergeInstructions.getMergeFilename());

					}
					mergeInstructions.addResult("\n");
					// Now validate the merged file using the test file specified in the instructions.
					if (!mergeInstructions.getGlobalStop() && mergeInstructions.getDoValidation()) {
						String testFilename = mergeInstructions.getFinalTestFilename();
						mergeInstructions.addResult(MergeInstructions.INDENT1 +"Testing merged file " + mergedFileName + " using: " + testFilename);
						if (testFilename == null || testFilename.isEmpty()) {
							mergeInstructions.addResult(MergeInstructions.INDENT2 + "Test Filename not specified.");
						}
						else {
							if (mergeInstructions.getApplyXSD()) {
								mergeInstructions.addResult(MergeInstructions.INDENT2 +"Test file XML Validation using XSD file: " + mergeInstructions.getAuxXSDFilename());
							    mergeInstructions.getValidator().validateXML(mergeInstructions);
							}
							else {
								mergeInstructions.addResult(MergeInstructions.INDENT2 +"No XML Validation performed");
							}
							mergeInstructions.addResult(MergeInstructions.INDENT2 +"Schematron Validation:");
							ArrayList<String> testFiles = new ArrayList<String>();
							testFiles.add(testFilename);
							int issues = 0;
							issues = mergeInstructions.getValidator().validate(mergedFileName, testFiles, mergeInstructions);
							if ( issues == 0) {
								mergeInstructions.addResult(MergeInstructions.INDENT3 + "Schematron validation of test file results as expected (or no expected error count provided).");
							} else {
								mergeInstructions.addResult(MergeInstructions.INDENT3 + "Schematron validation of test file results did not match expected results.");
							}
							;
						}
					}
				}
				mergeInstructions.addResult(" ");
				mergeInstructions.addResult(MergeInstructions.INDENT1 + "Merge Complete in " + timer.stop() + " seconds");
				mergeInstructions.addResult("**************************************** end merge report ************************************************************************");
				mergeInstructions.addResult(" ");
			}
			mergeInstructions.writeResults();
			System.out.println("Merge Processing Complete");

		}
	}	



	/**
	 *  Prints out the body of the resultant merged Document
	 *  note that the output goes to stdout so stdout must be redirected first (see above)  if you want to send to a file and not stdout
	 *
	 * @param mergedDoc an xml Document object to print
	 */
	private void printMergedDocument(Document mergedDoc) {

		// Actually output the merged file by redirecting stdout redirected from prinout
		try {

			new XMLOutputter(Format.getPrettyFormat()).output(mergedDoc, System.out);
		}
		catch (IOException e) {
			System.err.println(e);
		}

	}



	/**
	 *  Creates the files associated with the Schematrons to be merged
	 *  The method exits if all files are not valid - otherwise returns its an array of references to files
	 *  
	 * @param files a String array containing the full pathnames of files to process
	 * @return an array of File objects
	 */
	private File[]  createFiles(String[] files){
		File xmlFiles[] = new File[files.length];
		for (int i = 0 ; i < files.length; i++) {
			File xFile = new File(files[i]);
			xmlFiles[i]  = xFile;
			//Check that the  two schematron files are valid names
			if(!xFile.exists() ) { 
				System.err.println (MergeInstructions.INDENT1 +"\nFatal Error: File " + files[i]+ " is invalid - schematron does not exist");
				//stem.exit(1);

			}

			if(xFile.isDirectory() ) { 
				System.err.println (MergeInstructions.INDENT1 +"\nFatal Error: File " + files[i]+ " is invalid - names a directory not a file");
				//stem.exit(1);

			}

		}
		return (xmlFiles);
	}

	/**
	 *  Transforms an array of File instance (for files that contained the XML code of the ".sch" file
	 *  to an array of Document references
	 *  
	 * @param xmlFiles an array of File objects to process
	 * @return an array of Document objects
	 */
	private Document[]  createDocuments(File xmlFiles[] ){
		Document[]  docs = new Document[xmlFiles.length];

		for (int i = 0 ; i < xmlFiles.length; i++) {
			// Build the internal representations
			File file= xmlFiles[i] ;

			try {
				docs[i]= builder.build(file);

			} catch (IOException io) {
				System.err.println (MergeInstructions.INDENT1 +"Could not build file " + file );
				System.err.println(MergeInstructions.INDENT1 +io.getMessage());
				io.printStackTrace();
				//System.exit(1);
			} catch (JDOMException jdomex) {
				jdomex.printStackTrace();
				System.err.println (MergeInstructions.INDENT1 +"Could not build file " + file );
				System.err.println(MergeInstructions.INDENT1 +jdomex.getMessage());			
				//System.exit(1);
			}

		}
		return (docs);
	}

	/**
	 *  Transform an array of XML Document references to an array of Schmetron references
	 *  
	 * @param documents an array of Document objects
	 * @return an array of Schematron objects
	 */
	private Schematron[] createSchematronRep(Document[] documents){
		Schematron[] sReps = new Schematron[documents.length];
		for(int i = 0; i < documents.length; i++){
			if (documents[i] != null) {
				sReps[i] = new Schematron(documents[i]);
				//System.out.println("Created internal schematron rep for  " + sReps[i]);
			}
		}
		return (sReps);
	}

	/**
	 *  Find the namespaces that are added to in the root of each schematron
	 *  
	 * @param sReps an array of Schematron objects
	 * @return a List of Namespace objects
	 */
	private List<Namespace> findNamespacesInScope(Schematron[] sReps){
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


	/**
	 * Constructs a list of xml Element objects corresponding the the namespace elements found in the given
	 * array of Schematron objects.
	 * 
	 * @param sReps an array of Schematron objects
	 * @return a List of xml Elements
	 */
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


	/**
	 * Constructs a list of xml Element objects corresponding to the sum of all Error phase elements found
	 * in the given array of Schematron objects.
	 * 
	 * @param sReps an array of Schematron objects
	 * @return a List of xml Elements
	 */
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

	/**
	 * Constructs a list of xml Element objects corresponding to the sum of all Warning phase elements found
	 * in the given array of Schematron objects.
	 * 
	 * @param sReps an array of Schematron objects
	 * @return a List of xml Elements
	 */

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


	/**
	 * This is the main workhorse method in the class that actually performs the merge of schematron template files
	 * into a single schematron document. 
	 * 
	 * @param instructions the MergeInstructions object containing the commands that control the processing of the merge.
	 * @return an xml Document representing the final merged Schematron.
	 */
	public Document merge(MergeInstructions instructions) { 
		
		String[] files = instructions.getSchematronsOnly().toArray(new String[0]);
		Comment header = new Comment(instructions.getHeaderText());
		boolean separateErrorsFromWarnings = instructions.getSeparateErrorsFromWarnings();
		
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



		// Underlying JDom Tool requires that every item added must have only one parent
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

		//System.out.println("TOTAL ERROR patterns: " + mergedErrors.size());
		//System.out.println("TOTAL WARNING patterns: " + mergedWarnings.size());

		// Add the Namespaces used in each of the merged file
		top.addContent(mergedSpaces);

		// Construct the new document that will hold the merge
		Document mergedDoc = new Document(top); 
		
		
		if (header!= null) mergedDoc.getContent().add(0,header);

		// Add the merged content
		mergedDoc.getRootElement().addContent(pe1);
		mergedDoc.getRootElement().addContent(pe2);

		// Read the list of extra attributes (if any) to add to the root element
		List<String> atts = instructions.getRootAttributes();
		if (atts != null) {
			for (String attr : atts) {
				try {
					String[] tokens = attr.split("=");
					if (tokens[1].trim().contains("\"")) {
						instructions.addResult(MergeInstructions.INDENT3 + "Malformed attribute <name>=<value>. Value should not contain quotes: " + attr + ". This attribute will not be added.");
					}
					else {	
						mergedDoc.getRootElement().setAttribute(tokens[0],tokens[1]);
						instructions.addResult(MergeInstructions.INDENT3 + "Added  " + attr + " attribute to root element.");
					}
				}
				catch(Exception e) {
					instructions.addResult(MergeInstructions.INDENT3 + "Malformed attribute <name>=<value>: " + attr + ". This attribute will not be added.");
				}
			}
		}
		
		// Add the patterns (w/ rules, assertions, etc)
		// from each of the files to be merged
		
		// If we are generating all error patterns before all warning patterns, 
		// then we will gather all of them first prior to generating...
		int countPatterns = 0;
		Hashtable<String, Element> allErrorPatterns = new Hashtable<String,Element>();
		Hashtable<String, Element> allWarningPatterns = new Hashtable<String,Element>();
		
		if (!instructions.getSummaryOnly()) {
			if (instructions.getVerbose()) {
				if (separateErrorsFromWarnings && instructions.getVerbose()) {
					instructions.addResult(MergeInstructions.INDENT3 + "Generating all Error patterns first, then all Warning patterns.");
				}
				else {
					instructions.addResult(MergeInstructions.INDENT3 + "Generating Error and Warnings patterns together with each included template");
		
				}
			}
		}
		
		for (Schematron s :sReps) {
			// Get all the patterns from each template schematron...
			Hashtable<String,Element> patterns = s.makePatterns();
			// If we are we are generating all error patterns before all warning patterns, 
			// build up the global error and warning pattern lists...
			if (separateErrorsFromWarnings) {
				// Determine if each template pattern it is an error or warning by 
				// checking against all patterns listed in the error/warning phase lists created earlier
				for (Element pattern : patterns.values()) {
					String patternId = pattern.getAttributeValue("id");
					boolean isError = false;
					// Is this an error pattern?
					for (Element listedPattern : pe1.getChildren()) {
						if (patternId.equals(listedPattern.getAttributeValue("pattern"))) {
							allErrorPatterns.put(patternId, pattern);
							isError = true;
							break;
						}
					}
					// If not an error, then is this a warning pattern? (It had better be!)
					if (!isError) {
						for (Element listedPattern : pe2.getChildren()) {
							if (patternId.equals(listedPattern.getAttributeValue("pattern"))) {
								allWarningPatterns.put(patternId, pattern); 
								isError = true;
								break;
							}
						}
					}
					// If we didn't find this pattern id in either list of phases, then that is an error,
					// most likely a missing phase declaration in the template.  Report that here.
					if (!isError) {
						if (!instructions.getSummaryOnly()) {
							instructions.addResult(MergeInstructions.INDENT3+"ERROR: Assert pattern id '" + patternId + "' not found in corresponding list of sch:active sch:phase elements.");
						}
					}
				}
			}
			// If we aren't separating by error/warning, then just generate the patterns as we found them 
			// in the current template...
			else {
				mergedDoc.getRootElement().addContent(patterns.values());
				countPatterns = countPatterns + patterns.size();
			}
		}
		//  If we are we are generating all error patterns before all warning patterns, 
		//  then generate them now in the proper order...
		if (separateErrorsFromWarnings) {
			if (instructions.getErrorsHeader() != null && !instructions.getErrorsHeader().isEmpty()) {
				mergedDoc.getRootElement().addContent(new Comment(String.format("%n      %s%n  ",instructions.getErrorsHeader())));
			}
			mergedDoc.getRootElement().addContent(allErrorPatterns.values());
			if (instructions.getWarningsHeader() != null && !instructions.getWarningsHeader().isEmpty()) {
				mergedDoc.getRootElement().addContent(new Comment(String.format("%n      %s%n  ",instructions.getWarningsHeader())));
			}
			mergedDoc.getRootElement().addContent(allWarningPatterns.values());
		}
		
		//System.out.println("OLD Generated total patterns: " + countPatterns);
		//System.out.println("NEW generated error patterns: " + allErrorPatterns.size());
		//System.out.println("NEW generated warning patterns: " + allWarningPatterns.size());
		//System.out.println("NEW generated total patterns: " + (allErrorPatterns.size()+allWarningPatterns.size()));
		
		return (mergedDoc);
	}

	// Validate all of the schematron templates described by the merge instructions.
	// Note how many validations did not proceed as expected. If that count is non-zero, then
	// indicate whether it is ok to continue with the merge process based on the stopOnError value in the instructions.
	private boolean validateTemplates(MergeInstructions mergeInstructions) {
		boolean continueOk = true;
		int totalInconsistentSchematrons = 0;
		int noTestsCount = 0;
		if (mergeInstructions.getDoValidation()) {
			if (!mergeInstructions.getSummaryOnly()) {
				mergeInstructions.addResult(MergeInstructions.INDENT1+"");
				mergeInstructions.addResult(MergeInstructions.INDENT1+"Begin Template validations....");
			}
			Validator validator= mergeInstructions.getValidator();
			for (SchematronTemplate schematronTemplate : mergeInstructions.getSchematrons()) {
				if (schematronTemplate.getTestFiles().isEmpty()) {
					noTestsCount++;
				}
				int failCount = validator.validate(schematronTemplate.getSchematronPath(), schematronTemplate.getTestFiles(), mergeInstructions);
				totalInconsistentSchematrons += failCount;
			}
			if (totalInconsistentSchematrons  > 0) {
					continueOk = !mergeInstructions.getStopOnError();
			}
		}
		if (mergeInstructions.getVerbose() && !mergeInstructions.getSummaryOnly()) {
			mergeInstructions.addResult(MergeInstructions.INDENT3 + "_______________________________________________________________");
		}

		mergeInstructions.addResult(MergeInstructions.INDENT2 + "");
		mergeInstructions.addResult(MergeInstructions.INDENT1 + "Found " + totalInconsistentSchematrons + " schematron template(s) that did not process test files as expected");
		mergeInstructions.addResult(MergeInstructions.INDENT1 + noTestsCount + " schematron template(s) had no associated test files.");
		if (!continueOk) {
			mergeInstructions.addResult(MergeInstructions.INDENT1 +"Inconsistencies found in validations. Merge process aborting.");
		}
		return continueOk;
	}

	// This function was written as a debugging function. It looks at two files (source, dest), 
	// each of which is expected to be a schematron file. This function gathers all of the assert IDs from
	// the source file, and then checks to see if each of those Ids is present in the destination file or not.
	// It generates report messages for each missing assert in the destination file.
	// The destination file is expected to be the generated merged schematron file. The source file is expected
	// to be an original schematron file not generated by this process.
	// In the absence of a source file (the default), this function simply counts the asserts generated in the
	// destination file (if given), and reports the count in the merge report.
	static public void compareAsserts(MergeInstructions instructions, String source, String dest) {
		ArrayList<String> sourceAsserts = new ArrayList<String>();
		ArrayList<String> destAsserts = new ArrayList<String>();
		
		if (source != null && !source.isEmpty()) {
			try {
				File file = new File(source);
				FileReader fileReader = new FileReader(file);
				BufferedReader bufferedReader = new BufferedReader(fileReader);
				String line;
				while ((line = bufferedReader.readLine()) != null) {
					String sAssert = getAssertId(line);
					if (sAssert != null) {
						sourceAsserts.add(sAssert);
					}
				}
				fileReader.close();
				instructions.addResult(MergeInstructions.INDENT3 + "Found " + sourceAsserts.size() + " asserts in comparison (original) file " + source);
			} catch (IOException e) {
				System.err.println("Exception collecting assert IDs in source file " + source);
				e.printStackTrace();
			}
		}

		if (dest != null && !dest.isEmpty()) {
			try {
				File file = new File(dest);
				FileReader fileReader = new FileReader(file);
				BufferedReader bufferedReader = new BufferedReader(fileReader);
				String line;
				while ((line = bufferedReader.readLine()) != null) {
					String sAssert = getAssertId(line);
					if (sAssert != null) {
						destAsserts.add(sAssert);
					}
				}
				fileReader.close();
				instructions.addResult(MergeInstructions.INDENT3 + "Generated " + destAsserts.size() + " asserts in generated (merged) file " + dest);
			} catch (IOException e) {
				System.err.println("Exception collecting assert IDs in destination file " + dest);
				e.printStackTrace();
			}
		}
		
		int cnt = 0;
		for (String ass : sourceAsserts) {
			if (!findAssert(ass,dest)) {
				cnt++;
				instructions.addResult(MergeInstructions.INDENT4 + cnt + ": Did  not find assert " + ass + " in destination " + dest);
			}
		}
		
	}
	
	// Given a line of text from a schematron file, returns the assert ID, if present.
	// Expecting line to be of format   '<sch:assert id="assertID" test="....'
	static public String getAssertId(String line) {
		String sAssert = null;
		int start = line.indexOf("<sch:assert id=");
		int end = -1;
		if (start > -1) {
			end = line.indexOf(" test=");
			if (end > -1) {
				sAssert = line.substring(start+16,end-1);
				//System.out.println(sAssert);
			}
		}
		return sAssert;
	}

	// Given an assert ID, and a filename, return true if that assert ID string appears anywhere in the given file
	static public boolean findAssert(String sAssert, String dest) {
		File file = new File(dest);
		boolean res = false;
		try {
		    Scanner scanner = new Scanner(file);
		    while (scanner.hasNextLine()) {
		        String line = scanner.nextLine();
		        if(line.indexOf(sAssert) != -1){
		            res = true;
		            break;
		        }

		    }
		    scanner.close();
		} catch(FileNotFoundException e) { 
		    System.err.println("Exception finding assert " + sAssert +  " in file " + dest);
		    e.printStackTrace();
		}
		return res;
	}


}

