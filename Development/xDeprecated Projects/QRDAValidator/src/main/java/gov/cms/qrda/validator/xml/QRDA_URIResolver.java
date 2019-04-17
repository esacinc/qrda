package gov.cms.qrda.validator.xml;
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
import java.io.Serializable;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This class is used by the validation transformers so that relative href references in import and include
 * statements in the source files are resolved (mapped) to specific locations on the server filespace.
 * 
 * @author Dan Donahue
 *
 */
public class QRDA_URIResolver implements URIResolver, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6823571272835035039L;

	private static final Logger logger = LoggerFactory.getLogger(QRDA_URIResolver.class);

	// The following string values are one-to-one mappings to directory names in the QRDA_HOME filespace on the server.

	public static final String REPOSITORY_SCHEMATRONS = "schematrons";
	public static final String REPOSITORY_TESTFILES = "testfiles";
	public static final String REPOSITORY_ISO = "isofiles";
	public static final String REPOSITORY_RESULTS = "result";
	
	public static final String REPOSITORY_PROPERTIES = "properties";

	public    static String QRDA_HOME = System.getenv("QRDA_HOME"); 

	public    static String XSD_HOME = QRDA_HOME + File.separator + REPOSITORY_ISO + File.separator + "xsd" + File.separator + "CDA" + File.separator + "infrastructure" + File.separator + "cda" + File.separator;

	// The following string values are absolute paths to directories in the QRDA_HOME filespace on the server

	private   String ISO_HOME = QRDA_HOME + File.separator + REPOSITORY_ISO + File.separator;
	private   String SCHEMATRON_HOME = QRDA_HOME + File.separator + REPOSITORY_SCHEMATRONS + File.separator;
	private   String TESTFILE_HOME = QRDA_HOME + File.separator + REPOSITORY_TESTFILES + File.separator;
	private   String RESULT_HOME = QRDA_HOME + File.separator + REPOSITORY_RESULTS + File.separator;
	private   String PROPERTIES_HOME = QRDA_HOME + File.separator + REPOSITORY_PROPERTIES + File.separator;
	
	private   String isoSubfolder = "";

	public QRDA_URIResolver(String isoSubFolder) {
		isoSubfolder = isoSubFolder;
	   // logger.info("QRDA Resolver created, resolving QRDA HOME to: " + QRDA_HOME + ", ISO files in: " + ISO_HOME + isoSubFolder);
	      // For debugging...
	    Map<String, String> envMap = System.getenv();
		SortedMap<String, String> sortedEnvMap = new TreeMap<String, String>(envMap);
		Set<String> keySet = sortedEnvMap.keySet();
		for (String key : keySet) {
			String value = envMap.get(key);
			logger.debug("[" + key + "] " + value);
		}
	  }


	/** The resolve method is called by transformers (and the transform factory) when an href is encountered. 
	 * This method will map the filename provided in the href to a pathname on the server in the directory pointed
	 * to by the class' private static string ISO_HOME
	 */
	@Override
	public Source resolve(String href, String base) throws TransformerException {
		StringBuffer path = new StringBuffer(ISO_HOME + isoSubfolder + File.separator);
	    path.append(href);
	    File file = new File(path.toString());
	    if(file.exists()) {
	    	logger.error("QRDA Resolver resolved " + href + " to: " + file.getAbsolutePath());
	    	return new StreamSource(file);
	    }
	    else {
	    	logger.error("QRDA Resolver failed to resolve " + href + ".  No file found at : " + path.toString());
	    	return null;
	    }

	}

	/**
	 * Returns the absolute pathname to the directory containing qrda files and directories. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getQrdaHome() {
		return QRDA_HOME;
	}

	/**
	 * Returns the absolute pathname to the directory containing the iso files. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getISOHome() {
		return ISO_HOME;
	}

	public String getXsdHome() {
		return XSD_HOME;
	}
	/**
	 * Returns the absolute pathname to the directory containing qrda schematron directories. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getSchematronHome() {
		return SCHEMATRON_HOME;
	}
	
	/**
	 * Returns the absolute pathname to the directory containing qrda test file directories. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getTestFileHome() {
		return TESTFILE_HOME;
	}
	
	/**
	 * Returns the absolute pathname to the directory containing qrda validation results directories. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getResultHome() {
		return RESULT_HOME;
	}
	
	/**
	 * Returns the absolute pathname to the directory containing qrda properties files. 
	 * Note: not used by transformers.
	 * @return
	 */
	public  String getPropertiesHome() {
		return PROPERTIES_HOME;
	}
}
