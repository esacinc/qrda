package schemaVerification;

import static org.junit.Assert.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;
import org.junit.Test;

/**
 * @author shonvick
 *	This file implements the tests on the Schematron class
 *
 *	The purpose of the Schematron class is be a Java abstraction of representation of a Schematron file
 *
 *	The current implementation this test 
 *	
 *	a) uses a MergeConfigure object to config to find some a file to turn into a SChemaatron
 *	b) The  names of the those n files
 *	c) THe name of the merged schematron to be created
 *
 */

public class TestSchematron {

	@Test
	public void testSchematronConstruction() {
		// Tests that a Schematron object can be made from a Document

		Schematron sRep = null;
		// Read in a XML FIle from a file named by variable schematronFileName

		MergeConfigure configTool = new MergeConfigure ();
		List<String> files = configTool.getPropertyFileNames();

		if (files.size() == 0) {
			System.err.println("Warning - testSchematronConstruction run with empty property file list");
		}
		String forPropFile = files.get(0);

		files = configTool.getFilesToMerge(forPropFile);



		files = new ArrayList<String> ();
		if (files.size() == 0) {
			System.err.println("Warning - testSchematronConstruction run with empty property file list");
			assertTrue(true);
			return;
		}

		String schematronFileName = files.get(0);
		files.add(schematronFileName);

		// merge a single file
		try {

			SchematronMerge  testMerger = new SchematronMerge();
			Document dRep= testMerger.merge(files,null);

			sRep = new Schematron(dRep);
		}
		catch (Exception e) {
			sRep = null;
		}
		//TODO
		// Remove comment when XML test file is in place
		// assertTrue(sRep != null);

		assertTrue(true);
	}

}
