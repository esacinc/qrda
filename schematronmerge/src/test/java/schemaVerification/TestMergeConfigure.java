/**
 * 
 */
package schemaVerification;

import static org.junit.Assert.*;

import java.util.List;
import org.junit.Test;

/**
 * @author shonvick
 *	This file implements the tests on the MergeConfigure class
 *	The purpose of MergeConfigure is to read a file to
 *	see what schematron templates need to be merged to create a larger
 *	schematron 
 *
 *	In the current implementation it reads a Property file
 *	that names 
 *	a) The number of schematrons to read (say n)
 *	b) The  names of the those n files
 *	c) THe name of the merged schematron to be created
 *
 */
public class TestMergeConfigure {

	@Test
	
	public void testGetFilesToMerge() {
		// Reads he  names of the the n schematron files to merge
		
		MergeConfigure tool = new MergeConfigure();
		
		// Retrieve the defaults
		List<String>  defaultPropertyFiles = tool.getDefaultLegalPropertyFileNames();
		String firstpropFile = 	defaultPropertyFiles.get(0)	;
		
		List<String> files = tool.getFilesToMerge(firstpropFile);
		/*
		 * 
		 * for (String f : files){
		 
			System.out.println(f);
		}
		*/
		
		//TODO
		// This test is not fully implemented - need to create sample Property File
		// and check that the files have correct format SDV
		
		assertTrue(files.size() != 0);
	}
	
	@Test
	public void testGetMergedFileName() {
		
		MergeConfigure tool = new MergeConfigure();
		
		// Retrieve the defaults
		List<String>  defaultPropertyFiles = tool.getDefaultLegalPropertyFileNames();
		String firstpropFile = 	defaultPropertyFiles.get(0)	;
		
		
		String mergedFileName = tool.getMergedFileName(firstpropFile);
		
		// Reads the  names of the the n schematron files to merge
		
		//TODO
		// This test is not fully implemented - need to create sample Property File
		// and check that the files have correct format SDV
		assertTrue(mergedFileName != null);
		
	}

}
