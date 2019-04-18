<h2>Validate and Merge Application</h2>

The Validate and Merge application is an application utilized internally by ESAC to generate schematron files from 
a collection of smaller individual schematron files.

Each small schematron file validates constraints described in individual implementation guide (IG) templates. These files are 
combined into a single large schematron file using this application.  When test data files are available for each template schematron, 
they are validated against their corresponding schematron prior to the merge process.

Once the combined schematron file is created, a single comprehensive test data file (if provided) is validated against it.

A textual merge report file is generated containing a full step-by-step trace of the validation and merge process.

The process of validating and merging template schematrons into a single schematron file is managed by a "merge directions" xml file. 
This file provides all of the information needed to generate the schematron including the list of template schematrons to use, a 
description of the header comments to place at the beginning of the schematron, the location of the test file(s), etc.

This application is a Java application.
