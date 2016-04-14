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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
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
import gov.cms.qrda.validator.xml.QRDA_URIResolver;

/**
 * This class is the implementation class for the FileService interface. It handles all of the reading and writing of files used in the QRDA Validator application. 
 * the files used by the application are stored in the QRDA_HOME/qrda file space on the server running the application.
 * 
 * @see gov.cms.qrda.validator.web.service.FileService
 * 
 * @author dandonahue
 *
 */
@Service
public class FileServiceImpl implements FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
	
	private static QRDA_URIResolver uriResolver = new QRDA_URIResolver();

	//////////  METHODS FOR RETRIEVING PROPERTIES FROM SYSTEM PROPERTIES FILES ////////////////////////////
    //
    //   Contains methods for reading files from a directory on the classpath (internal to the .war file)
    //   and also for files in a directory external to the .war file in a specific location as defined by the private QRDAURIResolver.

    
    ////////////////////////////// CLASSPATH FILES ////////////////////////////////////////////////////////
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.loadProperties
	 */
	public Properties loadProperties(String propertiesFilename) {
		Properties props = new Properties();
		InputStream propsIn = this.getClass().getClassLoader().getResourceAsStream(propertiesFilename);
		logger.info("Load properties file: " + propertiesFilename + ", input stream: " + propsIn);
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
	 *  @see gov.cms.qrda.validator.web.service.FileService.getURIResolver
	 *  @return QRDA_URIResolver object. 
	 */
	public QRDA_URIResolver getURIResolver() {
		if (uriResolver == null) {
			uriResolver = new QRDA_URIResolver();
		}
		return uriResolver;
	}
	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.loadPropertiesExt
	 * @return The properties file
	 */
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
	public FileInputStream openExtFileForReading(String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory where the file should be found
		    File file = new File(fileDirectory, filename);
		    logger.info("Accessing external for reading " + file.getAbsolutePath());
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
	public FileOutputStream openExtFileForWriting(String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir, subDir); // Returns the directory where the file should be written
		    File file = new File(fileDirectory, filename);
		    logger.info("Opening external for writing " + file.getAbsolutePath());
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

	public String readExtFileUnparsed (String baseDir, String subDir, String filename) {
		try {  
		    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory where the file should be found
		    File file = new File(fileDirectory, filename);
		    String str = null;
		    if(!file.exists()) {
		    	str =  "Cannont find File " + file.getAbsolutePath();
		    	logger.error(str);
		    }
		    else {
		    	logger.info("Accessing " + file.getAbsolutePath());
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
	public String readExtFileUnparsed (String absolutePath) {
		try {  
		    File file = new File(absolutePath);
		    String str = null;
		    if(!file.exists()) {
		    	str =  "Cannont find File " + file.getAbsolutePath();
		    	logger.error(str);
		    }
		    else {
		    	logger.info("Accessing " + file.getAbsolutePath());
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
	public ArrayList<FileSpec> getExtRepositoryFiles(String baseDir, String subDir) {
		logger.debug("Get repository files: " + baseDir + ", " + subDir) ;
	    File fileDirectory = fileRepository(baseDir,subDir); // Returns the directory to search
	    File[] listOfFiles = fileDirectory.listFiles();      // Returns the array of file objects found in the directory
	    logger.debug("    " + ((listOfFiles == null)?"No":listOfFiles.length) + " files found");
	    ArrayList<String> filenames = new ArrayList<String>();
	    ArrayList<FileSpec> fileSpecs = new ArrayList<FileSpec>();
	    // For each file, create a FileSpec object...
	    if (listOfFiles != null) {
	        for (int i = 0; i < listOfFiles.length; i++) {
	          if (listOfFiles[i].isFile()) {
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
        return fileSpecs;
	}

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.createTestCases
	 */
	public List<TestCase> createTestCases(String schematronFilename, String schematronType, List<String>testFilenames, String filenamePostFix) {
		ArrayList<TestCase> cases = new ArrayList<TestCase>();
		for (String name : testFilenames) {
			TestCase tc = createTestCase(schematronFilename, schematronType, name, filenamePostFix);
			cases.add(tc);
		}
		return cases;
	}


	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.createResultsDir
	 */
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
        		logger.info(String.format("Original name: %s, My name: %s, base: %s, subdir: %s", file.getOriginalFilename(), name, base, subdir));
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
 
                logger.info("Server File Location=" + serverFile.getAbsolutePath());
                result = true;
                logger.info("File successfully uploaded file:" + name);
            } catch (Exception e) {
                logger.error("Failed to upload " + name,e);
            }
        } else {
           logger.error("Failed to upload empty or null file: " + file);
        }
        return result;
    }

	/**
	 * @see gov.cms.qrda.validator.web.service.FileService.deleteFile
	 */
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
	public void findExpectedErrorText(File file, FileSpec spec) {
		final Integer MAXLINE = 20;
		try {
		FileInputStream source = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(source));
			String strLine = null;
			Integer lineNum = 0;
			spec.setExpectedWarnings(-1);
			spec.setExpectedErrors(-1);
			// Search each line of the first MAXLINEs in the file, and search for token error and/or warning text. If found, set value in give FileSpec object
			while((strLine = br.readLine()) != null && lineNum < MAXLINE) {
				lineNum++;
				
				strLine = strLine.toLowerCase();
				logger.debug("Line " + lineNum +": " + strLine);
				if (strLine.contains("total errors expected")) {
					String[] split = strLine.trim().split(" ");
					logger.debug("Totals Errors are: " + split[split.length-1] );
					spec.setExpectedErrors(Integer.valueOf(split[split.length-1]));
					break;
				}
				if (strLine.contains("total warnings expected")) {
					String[] split = strLine.trim().split(" ");
					logger.debug("Totals Errors are: " + split[split.length-1] );
					spec.setExpectedWarnings(Integer.valueOf(split[split.length-1]));
					break;
				}
			}
			br.close();
		}
		catch (IOException e) {
			logger.error("Error: ", e);
		}
	}

////////////////////////////// PRIVATE/PROTECTED METHODS //////////////////////////////////////////////////
	
	// Returns the file object (directory) for QRDA_HOME/qrda/<baseDir>/<subDir> where QRDA_HOME is defined by 
	// the QRDAURIResolver class.
	protected File fileRepository(String baseDir, String subDir) {
		String propertyHome = uriResolver.getQrdaHome(); 
		if (subDir != null && !subDir.isEmpty()) {
			baseDir = baseDir + File.separator + subDir;
		}
	    File fileDirectory = new File(propertyHome,  baseDir);
		logger.debug("          Directory: " + fileDirectory.getAbsolutePath());
	    
	    return fileDirectory;
	}

	// Initializes a FileSpec object using information from the given file and dir values.
	// baseDir is the immediate child directory under the QRDA_HOME directory where the file is located. One of "schematrons", "testFiles", "result", "isofiles" or "properties".
	// subDir is expected to be one of "HL7", "CEC", "HQR", or "PQRS" for schematron or test files, and represents
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
	        // If subDir not provided, then build the url to the baseDir location onluy
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
	protected TestCase createTestCase(String schematronFilename, String schematronType, String testFilename, String filenamePostFix) {
		logger.info(String.format("Create Test Case: schematron: %s, type: %s, testFile: %s, postfix: %s",schematronFilename, schematronType, testFilename, filenamePostFix));
		TestCase tc = new TestCase(schematronFilename, schematronType, testFilename, filenamePostFix);
		File fileDir = fileRepository(QRDA_URIResolver.REPOSITORY_TESTFILES, schematronType); // Returns the directory where the test file resides
		File file = new File(fileDir,testFilename);  // Gets the file from the above directory
		this.initFileSpec(tc, file, QRDA_URIResolver.REPOSITORY_TESTFILES,schematronType); // Initializes the FileSpec part of the TestCase object (TestCase derives from Filespec)
		return tc;
	}

}
