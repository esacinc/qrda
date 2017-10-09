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

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import gov.cms.qrda.validator.model.FileSpec;
import gov.cms.qrda.validator.model.TestCase;
import gov.cms.qrda.validator.model.ValidationSuite;
import gov.cms.qrda.validator.xml.QRDA_URIResolver;

/**
 * This class is the implementation class for the FileService interface. It handles all of the reading and writing of files used in the QRDA Validator application. 
 * the files used by the application are stored in the QRDA_HOME/qrda file space on the server running the application.
 * 
 * @see gov.cms.qrda.validator.web.service.FileService
 * 
 * @author Dan Donahue
 *
 */
@Service
public class FileServiceImpl implements FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	//////////  METHODS FOR RETRIEVING PROPERTIES FROM SYSTEM PROPERTIES FILES ////////////////////////////
    //
    //   Contains methods for reading files from a directory on the classpath (internal to the .war file)
    //   and also for files in a directory external to the .war file in a specific location as defined by the private QRDAURIResolver.

    
    ////////////////////////////// CLASSPATH FILES ////////////////////////////////////////////////////////
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.loadProperties
	 */
	@Override
	public Properties loadProperties(String propertiesFilename) {
		Properties props = new Properties();
		InputStream propsIn = this.getClass().getClassLoader().getResourceAsStream(propertiesFilename);
		logger.debug("Load properties file: " + propertiesFilename + ", input stream: " + propsIn);
		// If file found, load it in as a Properties map
		if (propsIn != null) {
			try {
				props.load(propsIn);
			} catch (IOException e) {
	        	logger.error("Exception reading " + propertiesFilename + ": " + e.getMessage(), e);
				props = null;
			}
		}
		
		return props;

	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.getProperty
	 */
	@Override
	public String getProperty(String propertiesFilename, String key, String defaultVal) {
	        try {
	            Properties props = loadProperties(propertiesFilename);
	            if (props == null) {
	    			logger.error("Unable to read " + propertiesFilename + " file");
	    			return null;
	    		}
	    		
	            String res = props.getProperty(key); 
	            if (res == null ){
	            	return defaultVal;
	            }
	            else {
	            	return res;
	            }
	        }
	        catch(Exception e) {
	             return defaultVal;
	        }
	}

	
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.getProperty
	 */
	@Override
	public Integer getProperty(String propertiesFilename, String key, Integer defaultVal) {
        try {
            Properties props = loadProperties(propertiesFilename);
            if (props == null) {
    			logger.error("Unable to read " + propertiesFilename + " file");
    			return null;
    		}
    		
            String res = props.getProperty(key);
            if (res == null) {
            	return defaultVal;
            }
            else {
            	return Integer.valueOf(res);
            }
        }
        catch(Exception e) {
             return defaultVal;
        }
	}


    ////////////////////////////// EXTERNAL FILES - LOCATED OUTSIDE THE SERVER CONTEXT //////////////////////////////////////////////////

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.loadPropertiesExt
	 * @return The properties file
	 */
	@Override
	public Properties loadPropertiesExt(String filename) {
		Properties props = null;
		try {
			File fileDirectory = fileRepository(QRDA_URIResolver.REPOSITORY_PROPERTIES,null);
		    File file = new File(fileDirectory, filename);
		    FileInputStream propsIn = new FileInputStream(file);
			if (propsIn != null) {
				try {
					props = new Properties();
					props.load(propsIn);
				} 
				catch (IOException ioe) {
		        	logger.error("Exception reading " + file.getAbsolutePath() + ": " + ioe.getMessage(), ioe);
				}
			}
		}
		catch (Exception e) {
			logger.error("Exception finding properties file (ext); " + filename + " in qrda/properties folder", e);
		}
		return props;
	}



	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.openExtFileForReading
	 */
	@Override
	public FileInputStream openExtFileForReading(String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory where the file should be found
		    File file = new File(fileDirectory, filename);
		    logger.debug("Accessing external for reading " + file.getAbsolutePath());
		    FileInputStream fileStream = new FileInputStream(file);
		    return fileStream;
		} catch (IOException e) {     
			e.printStackTrace();
			return null;
		}
		
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.openExtFileForWriting
	 */
	@Override
	public FileOutputStream openExtFileForWriting(String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir, subDir); // Returns the directory where the file should be written
		    File file = new File(fileDirectory, filename);
		    logger.debug("Opening external for writing " + file.getAbsolutePath());
		    FileOutputStream fileStream = new FileOutputStream(file);
		    return fileStream;
		} catch (IOException e) {     
			e.printStackTrace();
			return null;
		}
		
	}


	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.readExtFileUnparsed
	 * 
	 */

	@Override
	public String readExtFileUnparsed (String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory where the file should be found
		    File file = new File(fileDirectory, filename);
		    String str = null;
		    if(!file.exists()) {
		    	str =  "237: Cannont find File " + file.getAbsolutePath();
		    	logger.error(str);
		    }
		    else {
		    	logger.debug("Accessing " + file.getAbsolutePath());
		    	str = FileUtils.readFileToString(file);    
		    } 
		    return str;
		} catch (IOException e) {     
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.readExtFileUnparsed
	 */
	@Override
	public String readExtFileUnparsed (String absolutePath) {
		try {  
		    File file = new File(absolutePath);
		    String str = null;
		    if(!file.exists()) {
		    	str =  "259: Cannont find File " + file.getAbsolutePath();
		    	logger.error(str);
		    }
		    else {
		    	logger.debug("Accessing " + file.getAbsolutePath());
		    	str = FileUtils.readFileToString(file);    
		    } 
		    return str;
		} catch (IOException e) {     
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.getExtRepositoryFiles
	 */
	@Override
	public ArrayList<FileSpec> getExtRepositoryFiles(String baseDir, String subDir, String contains, boolean sortByDate) {
		logger.debug(String.format("Get repository files in: %s, subdir: %s %s",baseDir ,subDir,((contains == null)?"":" with name containing: " + contains))) ;
	    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory to search
	    File[] listOfFiles = fileDirectory.listFiles();      // Returns the array of file objects found in the directory
	    
	    if (sortByDate) {
	    	logger.debug("Sorting by date modified.");
	    	LastModifiedComparator[] pairs = new LastModifiedComparator[listOfFiles.length];
		    for (int i = 0; i < listOfFiles.length; i++)
		        pairs[i] = new LastModifiedComparator(listOfFiles[i]);
		    // Sort them by timestamp.
		    Arrays.sort(pairs);
	
		    // Take the sorted pairs and extract only the file part, discarding the timestamp.
		    for (int i = 0; i < listOfFiles.length; i++)
		    	listOfFiles[i] = pairs[i].f;
	    }
	    else {
	    	logger.debug("Sorting by name.");
	    	Arrays.sort(listOfFiles);
	    }
	    
	    logger.debug("    " + ((listOfFiles == null)?"No":listOfFiles.length) + " total files found");
	    ArrayList<String> filenames = new ArrayList<String>();
	    ArrayList<FileSpec> fileSpecs = new ArrayList<FileSpec>();
	    // For each file, create a FileSpec object...
	    if (listOfFiles != null) {
	        for (int i = 0; i < listOfFiles.length; i++) {
	          if (listOfFiles[i].isFile() && (contains == null || listOfFiles[i].getName().toLowerCase().contains(contains.toLowerCase()))) {
	        	  File thisFile = listOfFiles[i];
	           	  filenames.add(thisFile.getName());
	           	  FileSpec fs = new FileSpec();
	           	  initFileSpec(fs, thisFile,baseDir, subDir);
	           	  if (fs != null) {
	           		  fileSpecs.add(fs);
	           	  }
	          }
	        }
	    }
	    logger.debug("    " + fileSpecs.size() + " collected");
        return fileSpecs;
	}

	@Override
	public ArrayList<FileSpec> getExtRepositoryFiles(String baseDir, String subDir, String contains) {
		return getExtRepositoryFiles(baseDir,subDir,contains,false);
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.createTestCases
	 */
	@Override
	public List<TestCase> createTestCases(String schematronFilename, String schematronType, List<String>testFilenames, String filenamePostFix, String resultsFolder) {
		ArrayList<TestCase> cases = new ArrayList<TestCase>();
		for (String name : testFilenames) {
			TestCase tc = createTestCase(schematronFilename, schematronType, name, filenamePostFix, resultsFolder);
			cases.add(tc);
		}
		return cases;
	}


	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.createResultsDir
	 */
	@Override
	public boolean createResultsDir(String dirname) {
		File results = fileRepository(QRDA_URIResolver.REPOSITORY_RESULTS, dirname);
		if (!results.exists()) {
			if (results.mkdir()) {
				logger.info("Created results folder: " + results.getPath());
				return true;
			}
			else {
				logger.error("Failed to create folder " + results.getPath());
				return false;
			}
		}
		return false;
	}

	
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.uploadFile
	 */
	public boolean uploadFile(MultipartFile file, String base, String subdir, String name) {
		boolean result = false;
		
        if (file != null && !file.isEmpty()) {
            try {
        		logger.info(String.format("UPLOAD FILE: Original name: %s, My name: %s, base: %s, subdir: %s", file.getOriginalFilename(), name, base, subdir));
        		if (name == null || name.isEmpty()) {
        			name = file.getOriginalFilename();
        		}
                byte[] bytes = file.getBytes();
 
                // Creating the directory to store file
                File dir =  fileRepository(base, subdir);
 
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
 
                logger.debug("   Server File Location=" + serverFile.getAbsolutePath());
                result = true;
                logger.debug("   File successfully uploaded file:" + name);
            } catch (Exception e) {
                logger.error("   Failed to upload " + name,e);
            }
        } else {
           logger.error("Failed to upload empty or null file: " + file);
        }
        return result;
    }

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.deleteFile
	 */
	@Override
	public boolean deleteFile(String filename, String base, String subdir) {
		boolean result = false;
		File fileDirectory = fileRepository(base, subdir);
		File file = new File(fileDirectory, filename);
		if (file != null && file.exists() && file.isFile()) {
			file.delete();
			result = true;
        } else {
           logger.error("Failed to delete file: " + filename);
        }
        return result;
    }

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.getAbsolutePath
	 */
	@Override
	public String getAbsolutePath(String filename, String base, String subdir) {
		File fileDir = fileRepository(base,subdir);
		File file = new File(fileDir,filename);
		if (file != null && file.exists() && file.isFile()) {
			String val = file.getAbsolutePath().replace('\\', '/');
			return val;
		}
		return null;
	}
	
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.findExpectedErrorText
	 * 
	 */
	@Override
	public void findExpectedErrorText(File file, FileSpec spec) {
		final Integer MAXLINE = 100; // Search only the first 100 lines.
		try {
		FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			Integer lineNum = 0;
			spec.setExpectedWarnings(-1);
			spec.setExpectedErrors(-1);
			boolean errTxtFound = false;
			boolean warnTxtFound = false;
			// Search each line of the first MAXLINEs in the file, and search for token error and/or warning text. If found, set value in give FileSpec object
			while((strLine = br.readLine()) != null && lineNum < MAXLINE) {
				lineNum++;
				// Make sure there are at least space-separated tokens, the fourth of which is expected to be the warning/error count.
				strLine = strLine.toLowerCase();
				logger.debug("Line " + lineNum +": " + strLine);
				if (!errTxtFound && strLine.contains("total errors expected")) {
					String[] split = strLine.trim().split(" ");
					if (split.length >= 4 ) {
						logger.debug("Total Errors are: " + split[split.length-1] );
						try {
							int val = Integer.valueOf(split[3]);
							spec.setExpectedErrors(val);
							errTxtFound = true;
						}
						catch (Exception e) {
							logger.error("Exception reading total errors expected value: " + split[3]);
						}
					}				
				}
				if (!warnTxtFound && strLine.contains("total warnings expected")) {
					String[] split = strLine.trim().split(" ");
					if (split.length >= 4 ) {
						logger.debug("Total Warnings are: " + split[split.length-1] );
						try {
							int val = Integer.valueOf(split[3]);
							spec.setExpectedWarnings(val);
							warnTxtFound = true;
						}
						catch (Exception e) {
							logger.error("Exception reading total warnings expected value: " + split[3]);
						}
					}
				}
			}
			br.close();
		}
		catch (IOException e) {
			logger.error("Error: ", e);
		}
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.renameCategoryDirectories
	 */
	@Override
	public void renameCategoryDirectories(String currName, String newName) {
		renameDirectory(QRDA_URIResolver.REPOSITORY_ISO,currName,newName);
		renameDirectory(QRDA_URIResolver.REPOSITORY_SCHEMATRONS,currName,newName);
		renameDirectory(QRDA_URIResolver.REPOSITORY_TESTFILES,currName,newName);
		renameDirectory(QRDA_URIResolver.REPOSITORY_RESULTS,currName,newName);
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.createCategoryDirectories
	 */
	@Override
	public void createCategoryDirectories(String newName) {
		createDirectory(QRDA_URIResolver.REPOSITORY_ISO,newName);
		createDirectory(QRDA_URIResolver.REPOSITORY_SCHEMATRONS,newName);
		createDirectory(QRDA_URIResolver.REPOSITORY_TESTFILES,newName);
		createDirectory(QRDA_URIResolver.REPOSITORY_RESULTS,newName);
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.deleteCategoryDirectories
	 */
	@Override
	public boolean deleteCategoryDirectories(String catName) {
		boolean ok = true;
		ok = deleteDirectory(QRDA_URIResolver.REPOSITORY_ISO,catName)
		     & deleteDirectory(QRDA_URIResolver.REPOSITORY_SCHEMATRONS,catName)
		     & deleteDirectory(QRDA_URIResolver.REPOSITORY_TESTFILES,catName)
		     & deleteDirectory(QRDA_URIResolver.REPOSITORY_RESULTS,catName);
		return ok;
	}
	
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.copyIsoFiles
	 */
	@Override
	public boolean copyIsoFiles(String newName) {
		boolean ok = true;
		File source = fileRepository(QRDA_URIResolver.REPOSITORY_ISO,"originalDONOTDELETE");
		File dest = fileRepository(QRDA_URIResolver.REPOSITORY_ISO,newName);
		try {
		    FileUtils.copyDirectory(source, dest);
		} catch (IOException e) {
		    logger.error("Error copying original ISO files from " + source.getAbsolutePath() + " to " + dest.getAbsolutePath());
		    ok = false;
		}
		return ok;
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.writeTestSuite
	 */
	@Override
	public void writeTestSuite(ValidationSuite vs) {
		// Seriallizes a validation suite object to a file indicated by the object's "mySavedFilename" value, if present.
	    try {
		    if (vs == null || vs.getMySavedFilename().trim().isEmpty()) {
		    	logger.error("Error writing validation suite. Provided suite is null, or suite's saved filename is empty");
		    }
		    else {
				FileOutputStream str = openExtFileForWriting(QRDA_URIResolver.REPOSITORY_RESULTS, vs.getSchematronType(), vs.getMySavedFilename());
				ObjectOutputStream oout = new ObjectOutputStream(str);
				oout.writeObject(vs);
				oout.close();
		    }
		}
		catch (Exception e) {
			logger.error("Error writing validation suite object to file: " + vs.getMySavedFilename(),e);
		}
	}
	
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.readTestSuite
	 */
    @Override
	public ValidationSuite readTestSuite(String subDir, String filename) {
    	// Reads in a validation suite object that has been output to a file.
    	ValidationSuite newVs = null;
    	try {
			FileInputStream str = openExtFileForReading(QRDA_URIResolver.REPOSITORY_RESULTS, subDir, filename);
			ObjectInputStream oin = new ObjectInputStream(str);
			newVs = (ValidationSuite)oin.readObject();
			oin.close();
    	}
	    catch (Exception e) {
			logger.error("Error reading validation suite from file: " + filename,e);
			return null;
		}
    	return newVs;
    }

 	/**
 	 * @see gov.cms.qrda.validator.web.service.FileService.convertToURL
 	 */
     @Override
     public String convertToURL(String pathname, String topDir){
     	logger.debug("Converting " + pathname + " to URL...(subdir: " + topDir + ")");
     	String url = "";
     	if (pathname != null) {
     		// Replace everything up to the given top directory name with the /files/ prefix.
     		// (Then use <c:url> in the UI to form a qualifed url.)
 	    	int i = pathname.indexOf(topDir);
 	    	if (i >= 0) {
 	    		url = String.format("/files/%s", pathname.substring(i));
 	    	}
 	    	logger.debug("Converted " + pathname + " to " + url);
     	}
     	return url;
     }
     

////////////////////////////// PRIVATE/PROTECTED METHODS //////////////////////////////////////////////////
	
	// Returns the file object (directory) for QRDA_HOME/qrda/<baseDir>/<subDir> where QRDA_HOME is defined by 
	// the QRDAURIResolver class.
	protected File fileRepository(String baseDir, String subDir) {
		String propertyHome = QRDA_URIResolver.QRDA_HOME;
		logger.debug("QRDA Home: " + propertyHome + ", baseDir: " + baseDir + ", subDir: " + subDir );
		if (subDir != null && !subDir.isEmpty()) {
			baseDir = baseDir + File.separator + subDir;
		}
	    File fileDirectory = new File(propertyHome,  baseDir);
		logger.debug("          Directory: " + fileDirectory.getAbsolutePath());
	    
	    return fileDirectory;
	}

	// Renames a directory under the subDir category folder in the baseDir directory.
	private File renameDirectory(String baseDir, String subDir, String newSubDir) {
		File dir = fileRepository(baseDir,subDir);
		if (dir != null && dir.isDirectory()) {
			File newDir = fileRepository(baseDir,newSubDir);
			logger.info("Renaming " + dir.getAbsolutePath() + " to " + newDir.getAbsolutePath());
			dir.renameTo(newDir);
		}
		return dir;
	}

	// Creates a directory under the subDir category folder in the baseDir directory.
	private File createDirectory(String baseDir, String newSubDir) {
		File newDir = fileRepository(baseDir,newSubDir);
		logger.info("Creating " + newDir.getAbsolutePath());
		newDir.mkdir();
		return newDir;
	}

	// Removes a category directory and its contents under the basedir folder.
	private boolean deleteDirectory(String baseDir, String dirName) {
		boolean ok = true;
		File dir = fileRepository(baseDir,dirName);
		if (dir.isDirectory()) {
			try {
				FileUtils.deleteDirectory(dir);
			}
			catch (Exception e) {
				logger.error("Error removing directory " + dir.getAbsolutePath(), e);
				ok = false;
			}
		}
		return ok;
	}


	// Initializes a FileSpec object using information from the given file and dir values.
	// baseDir is the immediate child directory under the QRDA_HOME directory where the file is located. One of "schematrons", "testFiles", "result", "isofiles" or "properties".
	// subDir is expected to be the name of a directory under the baseDir , and represents
	// the name of a sub-directory under QRDA_HOME/schematrons or QRDA_HOME/testfiles.  subDir may be null or "", indicating the file is in the baseDir directory.
	protected  FileSpec initFileSpec(FileSpec fs, File file, String baseDir, String subDir) {
		String name = file.getName();
        BasicFileAttributes attr;
        try {
        	logger.debug("Init filespec for: " + file.getAbsolutePath());
        	Path path = Paths.get(file.getAbsolutePath());
	        attr = Files.readAttributes(path, BasicFileAttributes.class);
	        Date udate = new Date(attr.lastModifiedTime().toMillis());
			fs.setFilename(name);
			fs.setUploadDate(udate);
			fs.setSubDir(subDir);
	        findExpectedErrorText(file,fs);
	        // Build the url corresponding to the location of the file on the server.
	        // The servlet mapping for the FileServlet, defined in web.xml, maps all URLS of form "files/*" to directories on the server..
	        // If subDir not provided, then build the url to the baseDir location only
	        if (subDir == null || subDir.length() == 0) {
	        	fs.setFileURL(String.format("files/%s/%s", baseDir,file.getName()));
	        }
	        else {
	        	fs.setFileURL(String.format("files/%s/%s/%s", baseDir,subDir,file.getName()));
	        }
	        logger.debug("Set file spec URL to:" + fs.getFileURL());
	        return fs;
        } 
        catch (IOException e) {
        	logger.error("Error creating filespec for " + name,e );
        }
        return null;
	}

	// Returns a validation TestCase from a  filename of a file located in the 
	// QRDA_HOME/testfiles/<schematronType>  folder on the server (Where QRDA_HOME is defined by the QRDAURIResolver class).  
	// The filenamePostfix value is appended to results file names that are created as part of each test case.
	// The filenamePostfic values in normally a string representing a data-time value.
	protected TestCase createTestCase(String schematronFilename, String schematronType, String testFilename, String filenamePostFix, String resultsFolder) {
		logger.info(String.format("Create Test Case: schematron: %s, type: %s, testFile: %s, postfix: %s",schematronFilename, schematronType, testFilename, filenamePostFix));
		TestCase tc = new TestCase(schematronFilename, schematronType, testFilename, filenamePostFix);
		File fileDir = fileRepository(QRDA_URIResolver.REPOSITORY_TESTFILES, schematronType); // Returns the directory where the test file resides
		File file = new File(fileDir,testFilename);  // Gets the file from the above directory
		this.initFileSpec(tc, file, QRDA_URIResolver.REPOSITORY_TESTFILES,schematronType); // Initializes the FileSpec part of the TestCase object (TestCase derives from Filespec)
		//tc.setValidationReportURL(String.format("/files/%s/%s/%s", QRDA_URIResolver.REPOSITORY_RESULTS,resultsFolder,tc.getValidationReportFilename()));
        //logger.info("Validation report url: " + tc.getValidationReportURL());
		return tc;
	}
	
    
     
    // Internal class for sorting file lists by last modified date
    @SuppressWarnings("rawtypes")
	class LastModifiedComparator implements Comparable {
        public long t;
        public File f;

        public LastModifiedComparator(File file) {
            f = file;
            t = file.lastModified();
        }

        public int compareTo(Object o) {
            long u = ((LastModifiedComparator) o).t;
            return t > u ? -1 : t == u ? 0 : 1;  // t > u sorts in reverse chrono order (newest first)
        }
    };
 
}
