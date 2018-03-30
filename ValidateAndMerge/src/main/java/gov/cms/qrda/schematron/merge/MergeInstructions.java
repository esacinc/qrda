package gov.cms.qrda.schematron.merge;
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

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.FileUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import gov.cms.qrda.schematron.validate.MergeProperties;
import gov.cms.qrda.schematron.validate.TestFile;
import gov.cms.qrda.schematron.validate.Validator;

/**
 * This is the class that holds all of the data required to merge a group of scheamtron templates into a
 * single schematron file. It generates both the merged schematron file and a merge report file which is
 * simply a text file containing logged messages generated during the merge process.
 * 
 * @author Dan Donahue ESAC Inc.
 *
 */
public class MergeInstructions extends MergeProperties{

	/**
	 * xmlDoc is the XML document resulting from parsing the input source xml file
	 */
	private Document xmlDoc;
	/**
	 * The full pathname to the xml source file containing the merge instructions
	 */
	private String sourceFile;
	/**
	 * The list of schematron template objects resulting from parsing the sourceDirectory
	 * elements in the merge instruction files.
	 */
	private ArrayList<SchematronTemplate> schematrons = new ArrayList<SchematronTemplate>();
	
	/**
	 * Stop processing if true.
	 */
	private boolean globalStop = false;  // This may get set to true if processing needs to stop due to a detected error somewhere.

	
	/**
	 * INDENT final static Strings used for pretty formatting the merge report output file
	 */
	public final static String INDENT1 = "    ";
	public final static String INDENT2 = "        ";
	public final static String INDENT3 = "            ";
	public final static String INDENT4 = "                ";
	public final static String INDENT5 = "                    ";
	
	public MergeInstructions() {
		super();
		validator = new Validator(this);
	}
	
	public ArrayList<SchematronTemplate> getSchematrons() {
		return schematrons;
	}

	public void setXmlDoc(Document val) {
		xmlDoc = val;
	}
	
	public Document getXmlDoc() {
		return xmlDoc;
	}
	
	public void setSourceFile(String val) {
		sourceFile = val;
	}
	
	public String getSourceFile() {
		return sourceFile;
	}

	public boolean getGlobalStop() {
		return globalStop;
	}
	
	public void setGlobalStop(boolean val) {
		globalStop = val;
	}

	public boolean getSeparateErrorsFromWarnings() {
		return separateErrorsFromWarnings;
	}
	
	public void setSeparateErrorsFromWarnings(boolean val) {
		separateErrorsFromWarnings = val;
	}

	/**
	 * Reads a mergeInstructions xml file, populates the data in the object, begins collecting status result strings.
	 * 
	 * @param filename The full pathname to the merge directions file
	 * @return Document xml document containing the results of parsing the merge directions file
	 */
	// 
	public Document open(String filename) {
		globalStop = false;
		sourceFile = filename;
		addResult(" ");
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db;
		addResult("************************************************************************************************************");
		addResult(INDENT1 + "SCHEMATRON MERGE REPORT ");	
		addResult("************************************************************************************************************");
		try {
			db = dbf.newDocumentBuilder();
			Document doc = db.parse(new File(filename));
			setXmlDoc(doc);
			Element mergeProfile = doc.getDocumentElement();
			setSeparateErrorsFromWarnings(!"false".equalsIgnoreCase(mergeProfile.getAttribute("separateErrorsFromWarnings"))); // Default will be true if attribute not present
			setVerbose("true".equalsIgnoreCase(mergeProfile.getAttribute("verboseDebug")));
			setSummaryOnly("true".equalsIgnoreCase(mergeProfile.getAttribute("summaryOnly")));
			setDoValidation("true".equalsIgnoreCase(mergeProfile.getAttribute("doValidation")));
			setApplyXSD("true".equalsIgnoreCase(mergeProfile.getAttribute("applyXSD")));
			setAuxXSDFilename(getNodeValue(mergeProfile,"useXSDFilename"));
			setStopOnError("true".equalsIgnoreCase(mergeProfile.getAttribute("stopOnError")));
			setStopOnWarning("true".equalsIgnoreCase(mergeProfile.getAttribute("stopOnWarning"))); // deprecated
			setMergeFilename(getNodeValue(mergeProfile,"generatedFilename"));
			setFinalTestFilename(getNodeValue(mergeProfile,"finalTestFilename"));
			setMainSourceDirectory(getNodeValue(mergeProfile,"sourceMainDirectory"));
			setTitle(getNodeValue(mergeProfile,"title"));
			setVersion(getNodeValue(mergeProfile,"version"));
			// Get comment text, if any, to place at the head of the merged file
			setFileHeader(getNodeValue(mergeProfile,"fileHeader"));
			String hf = getNodeValue(mergeProfile,"headerFormat");
			if (hf != null && !hf.isEmpty()) {
				setHeaderFormat(hf);
			}
			// Get comment text, if any, to place at the beginning of the error patterns.
			// (Only used if "separateErrorsFromWarnings" is true)
			String eh = getNodeValue(mergeProfile,"errorsHeader");
			if (eh != null && !eh.isEmpty()) {
				setErrorsHeader(eh);
			}
			// Get comment text, if any, to place at the beginning of the warning patterns.
			// (Only used if "separateErrorsFromWarnings" is true)
			String wh = getNodeValue(mergeProfile,"warningsHeader");
			if (wh != null && !wh.isEmpty()) {
				setWarningsHeader(wh);
			}
			setMergeReportFilename(getNodeValue(mergeProfile,"mergeReportFilename"));
			System.out.println(INDENT1+  "See merge report in: " + getMergeReportFilename());
			
			
			addResult(INDENT1+"Instructions file: " + filename);

			if (getMergeReportFilename() == null || getMergeReportFilename().isEmpty()) {
				useSystemOut = true;;
				System.out.println(INDENT2 + "Merge Report filename not specified. Results will output to console.");
			}
			
			if (getSummaryOnly()) {
			} else {
				
			}
			
			addResult(INDENT1 + "Title: " + getTitle());
			addResult(INDENT1 + "Version: "   + getVersion());
			addResult(INDENT1 + "Generated on " + new Date());
			
			String verboseMsg = "";
			if (getSummaryOnly()) {
				verboseMsg = INDENT1+ "Only summary information presented in report. (Set instruction file's mergeProfile attribute summaryOnly='false' for normal or verbose debugging.)";
			} else {
				verboseMsg = INDENT1 + "Verbose Reporting is turned " + ((getVerbose())?"on":"off");
			}
			addResult(verboseMsg);
			System.out.println(verboseMsg);
			
			addResult(INDENT1 + "Merged file: " + getMergeFilename());
			if (getSeparateErrorsFromWarnings() && !getSummaryOnly()) {
				addResult(INDENT2 + "  All Error patterns are generated before all Warning patterns");
			}
			else {
				addResult(INDENT2 + "  Error patterns and Warning patterns are generated together for each template");
			}
			
			setCompareSchematronFilename(getNodeValue(mergeProfile,"compareSchematronFilename"));
			if (!getSummaryOnly() && getCompareSchematronFilename() != "") {
				addResult(INDENT2 + "  Compare generated schematron asserts to asserts in file: " + getCompareSchematronFilename());
			}


			addResult(INDENT1 + "Merge report file located at: " + getMergeReportFilename());
			//addResult(INDENT1 + "File header: " + getFileHeader());
			
			addResult(INDENT1 + "Validation is turned " + ((getDoValidation())?"on":"off"));
			if (!globalStop && getDoValidation()) {
				addResult(INDENT2 + "Validate final merged file using: " + getFinalTestFilename());
				addResult(INDENT3 + "XML XSD validation of test file is turned " + ((getApplyXSD())?"on":"off"));
				if (getApplyXSD()) {
					if (getAuxXSDFilename() == null || getAuxXSDFilename().isEmpty()) {
						setAuxXSDFilename(MergeProperties.XSD_FILENAME);
					}
					addResult(INDENT4 + "  For XML Validation of test file, use the XSD File found at: " + getAuxXSDFilename());
				}

				if (!getSummaryOnly()) {
					addResult(String.format(INDENT2 + "Merge Process will %sstop when validation inconsistencies are encountered in the template schematrons", (getStopOnError() ?"":"not ")));
					maybeCopyVocabFile(getNodeValue(mergeProfile,"vocabFilename"));
				}
			}


			addResult(INDENT1 + "Collect schematron template information from source directories...");
			NodeList nodes = mergeProfile.getElementsByTagName("sourceDirectory");
			for (int i = 0; i < nodes.getLength(); i++) {
				if (getGlobalStop()) {
					break;
				}
				Element node = (Element)nodes.item(i);
				String selector = node.getAttribute("selector");
				schematrons = this.appendLists(schematrons, this.getSourceDirectoryFiles(node, selector));
			}
			if (!globalStop) {
				addSchematronListToResults();
			}
		}
		catch (ParserConfigurationException e) {
				globalStop = true;
				addResult("Parser Configuration Exception: " + e.getLocalizedMessage());
				addResult(INDENT1 + "Process HALTED");
				if (getVerbose() && !getSummaryOnly()) e.printStackTrace();
		} catch (SAXException e) {
			globalStop = true;
			addResult("SAXException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose() && !getSummaryOnly()) e.printStackTrace();
		} catch (FileNotFoundException e) {
			globalStop = true;
			addResult("FileNotFoundException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose() && !getSummaryOnly()) e.printStackTrace();
		} catch (IOException e) {
			globalStop = true;
			addResult("IOException: " + e.getLocalizedMessage());
			addResult(INDENT1 + "Process HALTED");
			if (getVerbose() && !getSummaryOnly()) e.printStackTrace();
		} 
		if (globalStop) {
			String msg = INDENT1 + "An error was encountered during setup causing processing to stop";
			System.err.println(msg);
			addResult(msg);
		}

		addResult(INDENT1+"Merge Setup Complete");
		return xmlDoc;
	}
	

	/**
	 * Returns the text content of the first occurrence of the given node name under the given start node.
	 * 
	 * @param startNode The parent node element under which to start searching for the node name
	 * @param nodeName The name of the node to search for
	 * @return The text content of the first node found matching nodeName
	 */
	// 
	private String getNodeValue(Element startNode, String nodeName) {
		String res = null;
		if (xmlDoc != null) {
			NodeList nodes = startNode.getElementsByTagName(nodeName);
			if (nodes != null && nodes.getLength() > 0) {
				res = nodes.item(0).getTextContent().trim();
			}
			else {
				if (!getSummaryOnly()) {
				    addResult(INDENT1 + "ALERT: Failed to locate element: <" + nodeName + ">");
				}
				
			}
		}
		return res;
	}
	
	/**
	 * Returns a list of strings corresponding to the values of child nodes of a given name of the given start node.
	 * 
	 * @param startNode The parent node element under which to start searching for the node name
	 * @param nodeName the name of the child node under startNode to search for
	 * @return an ArrayList of values of each child node found
	 */
	// 
	private ArrayList<String> getSubnodeValues(Element startNode, String nodeName) {
		ArrayList<String> res = new ArrayList<String>();
		if (xmlDoc != null) {
			NodeList nodes = startNode.getElementsByTagName(nodeName);
			for (int i = 0; i < nodes.getLength(); i++) {
				Node node = nodes.item(i);
				res.add(node.getTextContent().trim());
			}
		}
		return res;
	}
	
	/**
	 * Given a sourceDirectory element from the directions file, return a list where
	 * each element of the list item corresponding to each subdirectory of the source directory. 
	 * Each list item is a list of file names, the first of which is the schematron (.sch) located in the subdirectory,
	 * and the remaining file names are the .xml test files also in the subdirectory.

	 * @param parentNode The parent node element under which to start the search
	 * @param selector can be one of "all" or "some", determining how to collect the child directories under the parent node
	 * @return An array list of SchematronTemplate objects representing the schematron subdirectories under the parent node.
	 */
	private ArrayList<SchematronTemplate> getSourceDirectoryFiles(Element parentNode, String selector) {
		ArrayList<SchematronTemplate> fileList = new ArrayList<SchematronTemplate>();
		ArrayList<String> dirNames;
		ArrayList<String> exceptions;
		String relativePath = getNodeValue(parentNode,"directoryName");
		String fullPath = this.getMainSourceDirectory() + relativePath;

		if ("all".equalsIgnoreCase(selector)) {
			exceptions = getSubnodeValues(parentNode,"exclude");
		}
		else  {
			exceptions = getSubnodeValues(parentNode,"include");
		}
		fileList = this.getSchematrons(fullPath, exceptions, selector);
		return fileList;
	}
	
	/**
	 * Given a directory, returns a list of filenames from that directory. The first item in the list is the schematron file (ext .sch)
	 * and the rest of the filenames in the list are the test files (.xml) from the directory.
	 * 
	 * @param fullDirPath the full pathname to the directory under which the search begins
	 * @return a SchematronTemplate object  resulting from examining the files in the given fullDirPath
	 */
	private SchematronTemplate getFilesFromDirectory(String fullDirPath) {
		SchematronTemplate template = new SchematronTemplate(fullDirPath);
		File dir = new File(fullDirPath);
		if (dir== null || !dir.exists()) {
			this.addResult(INDENT3 + "Unable to locate directory: " + fullDirPath);
		}

		if (dir.isDirectory()) {
			boolean schFound = false;
			File[] files = dir.listFiles();
			for (File file : files) {
				if (file.getName().endsWith(".sch")) {
					schFound = true;
					template.setSchematronPath(file.getAbsolutePath());
					if (verbose  && !getSummaryOnly()) {
						results.add(INDENT3 + "Located schematron file: " + file.getName());
					}
					break;
				}
			}
			if (!schFound) {
				if ( !getSummaryOnly()) {
					results.add(INDENT3 + "Could not find a schematron file in template directory: " + fullDirPath);
				}
				return null;
			}
			else {
				for (File file : files) {
					if (file.getName().endsWith(".xml")) {
						template.addTestFile(file.getAbsolutePath());
					}
				}
			}
		}
		return template;
		
	}
	
	/**
	 * Given a pathname to a directory, return a list of items corresponding to the subdirectories under the given parent directory.
	 * Each item is itself a list of filenames found under the subdirectory. The first filename is a schematron file, the remaining
	 * are xml files.
	 * 
	 * @param parentDirPath the full pathname to a directory containing subdirectories which contain schematron and test files
	 * @param exceptions a list of subdirectory names under the the parent directory. Can either represent subdirectories
	 * to include, or those to exclude depending on the value of the selector param
	 * @param selector a string that can be either 'all' or 'some'. 'all' implies include all subdirectories other than those
	 * listed in the exceptions list. 'some' implies include ONLY those subdirectories listed in the exceptions list
	 * 
	 * @return an ArrayList of SchematronTemplate objects resulting from the parsing of the subdirectories as described above.
	 */
	// 
	private ArrayList<SchematronTemplate> getSchematrons(String parentDirPath, List<String> exceptions, String selector) {
		results.add(INDENT2 + "Processing template directory: " + parentDirPath + ", selector: " + selector);
		boolean doAll= ("all".equalsIgnoreCase(selector));
		ArrayList<SchematronTemplate> fileList = new ArrayList<SchematronTemplate>();
		File dir = new File(parentDirPath);
		if (dir== null || !dir.exists()) {
			this.addResult(INDENT3 + "Unable to locate schematron directory: " + parentDirPath);
			this.addResult(INDENT3 + "   Process HALTED");
			globalStop = true;
		}
		else {
			int foundCount = 0;
			int exceptionsSize=exceptions.size(); // Remember original size, since the list will shrink during processing.
			int expectedSize = 0;
			File[] dirFiles = dir.listFiles();
			for (File subdir : dirFiles) {
				// Only look at subDirectories...
				if (subdir.isDirectory()) {
					if (doAll) {
						// We are processing all the subDirs in the source folder, with the exception of those listed in the exceptions list...
						if (!exceptions.contains(subdir.getName())) {
							foundCount++;
							SchematronTemplate files = getFilesFromDirectory(subdir.getAbsolutePath());
							if (files != null) {
								fileList.add(files);
							}
						}
						else {
							exceptions.remove(subdir.getName()); // This subdir was, indeed, found in the exceptions list, so remove it.
						}
					}
					else if (exceptions.contains(subdir.getName())) {
						// We are only processing some subDirs in the source folder, so see if this one is in the include (aka exceptions) list...
						exceptions.remove(subdir.getName()); // It is in the list, so remove it.
						foundCount++;
						SchematronTemplate files = getFilesFromDirectory(subdir.getAbsolutePath());
						if (files != null) {
							fileList.add(files);
						}
					}
				}
			}
			// Now we need to see if the exceptions list is empty (it should be, because we've been removing found subdirs from the list.)
			if (doAll) {
				expectedSize = foundCount = exceptionsSize; // Note what were expecting in the case where we process all subdirs.
				if (verbose) {
					this.addResult(INDENT3 + "Processed " + foundCount + " (" + expectedSize + " expected) schematron folders.");
				}
				if (exceptions.size() > 0) {
					//globalStop = stopOnError; // Only halt processing when an excluded subdir is missing if stopOnError is true;
					globalStop = true;  // 
					this.addResult(INDENT3 + "The following schematron folders to be excluded were not found in " + parentDirPath);
					for (String subdir : exceptions) {
						this.addResult(INDENT4 + "'"+subdir+"'");
					}
					if (globalStop) {
						this.addResult(INDENT3 + "PROCESS HALTED");
					}
					else {
						// This will never get printed as long as we set globalStop=true above.
						this.addResult(INDENT3 + "(Set stopOnError=true to halt processing when folders in the exclude lists are not found.)");
					}
				}
			}
			else {
				expectedSize = exceptionsSize; // Note what were expecting in the case where we process only some subdirs
				if (verbose){
					this.addResult(INDENT3 + "Processed " + foundCount + " (" + expectedSize + " expected) schematron folders.");
				}
				if (exceptions.size() > 0) {
					globalStop = true; // Always halt processing if an included subdir is missing
					this.addResult(INDENT3 + "The following schematron folders were expected but not found in " + parentDirPath);
					for (String subdir : exceptions) {
						this.addResult(INDENT4 + "'"+subdir+"'");
					}
					this.addResult(INDENT3 + "PROCESS HALTED");
				}
			}
		}
		return fileList;
	}
	
	/**
	 *  Adds the elements of the additions list param to the currentList param
	 *  
	 * @param currentList the current ArrayList of SchematronTemplate objects
	 * @param additions the ArrayList of SchematronTemplate objects to add
	 * 
	 * @return the new, combined ArrayList of SchematronTemplates
	 */
	private ArrayList<SchematronTemplate> appendLists(ArrayList<SchematronTemplate> currentList, ArrayList<SchematronTemplate> additions) {
		for (SchematronTemplate item : additions) {
			currentList.add(item);
		}
		return currentList;
	}
	
	/**
	 *  Returns the filenames of the schematrons found in the list of schematron template objects
	 *  
	 * @return an ArrayList of strings containing the schematron filenames from all of the schematron templates currently
	 * in the object's schematrons list.
	 */
	public ArrayList<String> getSchematronsOnly() {
		ArrayList<String> filenames = new ArrayList<String>();
		for (SchematronTemplate schematron : schematrons) {
			filenames.add(schematron.getSchematronPath());
		}
		return filenames;
	}
	
	/**
	 *  Static method to read a file containing a list of mergeInstruction filenames.
	 * @param instructionFileListFilename the full pathname to a file containing a list of mergeInstructions filenames,
	 * one filename per line. 
	 * Note: Lines beginning with "#" are ignored.
	 * @return an ArrayList of full pathnames for each mergeInstructions filename found in the given filename.
	 */
	// 
	public static ArrayList<String> getInstructionFiles(String instructionFileListFilename) {
		ArrayList<String> mergeInstructionFiles = new ArrayList<String>();
		try {
			File file = new File(instructionFileListFilename);
			FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			while((strLine = br.readLine()) != null ) {
				strLine = strLine.trim();
				if (!strLine.isEmpty() && !strLine.startsWith("#")) {
					mergeInstructionFiles.add(strLine.trim());
				}
			}
			br.close();
		}
		catch (IOException e) {
			System.out.println("Error reading merge instruction master file: "+instructionFileListFilename + ", " + e.getMessage());
		}
		return mergeInstructionFiles;
	}

	/**
	 * Returns a formatted string using this object's header format as a formatter, and the values of
	 * the object's title, version, fileHeader values along with the current date as data elements.
	 * 
	 * @return a string representing the header text to insert into the merge file
	 */
	public String getHeaderText() {
		return String.format(getHeaderFormat(), getTitle(), (getVersion().isEmpty()?"":"Version " + getVersion()), getFileHeader(),new Date());
	}
	
	/**
	 * Copies the file found at filename to the application's main directory with the name "voc.xml"
	 * 
	 * @param filename the full pathname to the voc.xml file to copy. Note, regardless of the name of the 
	 * given file, the copied version will be named "voc.xml"
	 */
	private void maybeCopyVocabFile(String filename) {
		if (getDoValidation()) {  // No need for vocab file if we aren't doing validation.
			if (filename != null && !filename.isEmpty()) {
				addResult(INDENT2+"vocabFilename is " + filename);
				setVocabFilename(filename);	
				File source = new File(filename);
				File dest = new File("voc.xml");
				try {
				    FileUtils.copyFile(source, dest);
				    if (getVerbose() && !getSummaryOnly()) {
				    	addResult(INDENT3+"Copied vocabulary file: " + filename + " into project space as 'voc.xml'");
				    }
				} catch (IOException e) {
				    if (getVerbose() && !getSummaryOnly()) {
				    	System.err.println(INDENT3 + "IOException Error copying vocabulary from " + source.getAbsolutePath() + " to " + dest.getAbsolutePath());
				    	e.printStackTrace();
				    }
				    addResult(INDENT3+"IOException Error copying vocabulary file from " + filename + ": " + e.getMessage());
				}
			}
			else {
				addResult(INDENT2+"No vocabFilename specified.");
			}
		}
	}
	
	/**
	 *  Add a listing of the schematron templates to the results list, The nature of the listing depends on the
	 *  verbose and validation settings.
	 */
	// 
	private void addSchematronListToResults() {
		addResult(String.format("%s%d schematron templates identified for merging", INDENT2,schematrons.size()));
		if (!getSummaryOnly()) {
			if (getVerbose()) {
				addResult(INDENT1+"Schematron files gleaned from merge instructions: ");
				if (getVerbose() && getDoValidation()) {
					for (SchematronTemplate schematron : schematrons) {
						addResult(INDENT2+"------------------------------------");
						addResult(INDENT2 + "Template Directory: " + schematron.getParentPath());
						addResult(INDENT2 + "Schematron: " + schematron.getSchematronPath());
						addResult(INDENT2 + "Test File(s): ");
						for (String filename : schematron.getTestFiles()) {
							addResult(INDENT3 + filename);
						}
					}
				}
				else {
					for (SchematronTemplate schematron : schematrons) {
						addResult(INDENT2 + schematron.getSchematronPath());
					}	
				}
				addResult(INDENT2+"-------------- end schematron file list-------------------");
			}
		}
	}
	
	/**
	 *  Writes the results string array to a file indicated by the value of mergeReportFilename
	 */
	public void writeResults() {
		if (mergeReportFilename == null || mergeReportFilename.isEmpty()) {
			System.err.println("Error writing to report filename: Merge instructions had no mergeReportFilename set.");
		}
		else {
			File file = new File(mergeReportFilename);
			try {
				FileOutputStream fos = new FileOutputStream(file);
				 
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
			 
				for (String line : getResults()) {
					bw.write(line);
					bw.newLine();
				}
			 
				bw.close();
			}
			catch (Exception e) {
				System.err.println("Error writing results to file " + mergeReportFilename + ": " + e.getMessage());
				e.printStackTrace();
			}
		}
	}

	/**
	 *  Opens the given file and attempts to read the expectedErrors and expectedWarnings line from the file.
	 *  
	 * @param path the full pathname to the xml test file in which to search for the expectedErrors and expectedWarnings
	 * comments.
	 * 
	 * @return a TestFile object containing information about the file (including its pathname) and expected errors and
	 * warnings.
	 */
	public TestFile findExpectedErrorText(String path) {
		final Integer MAXLINE = 100; // Search only the first 100 lines.
		try {
			File file = new File(path);
			FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			Integer lineNum = 0;
			TestFile spec = new TestFile();
			boolean errTxtFound = false;
			boolean warnTxtFound = false;
			// Search each line of the first MAXLINEs in the file, and search for token error and/or warning text. If found, set value in give FileSpec object
			while((strLine = br.readLine()) != null && lineNum < MAXLINE) {
				lineNum++;
				
				strLine = strLine.toLowerCase();
				if (!errTxtFound && strLine.contains("total errors expected")) {
					String[] split = strLine.trim().split(" ");
					spec.setExpectedErrors(Integer.valueOf(split[split.length-1]));
					errTxtFound = true;;
				}
				if (!warnTxtFound && strLine.contains("total warnings expected")) {
					String[] split = strLine.trim().split(" ");
					spec.setExpectedWarnings(Integer.valueOf(split[split.length-1]));
					warnTxtFound = true;
				}
			}
			br.close();
			return spec;
		}
		catch (IOException e) {
			if (getVerbose()  && !getSummaryOnly()) addResult(INDENT3+"IOError reading expected error/warning count from file: " + path + ", " + e.getMessage());
		}
		return null;
	}
	

 }
