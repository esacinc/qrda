ESAC-Schematron-Validator has been developed for and tested with Apache Tomcat v 8.0.30
on MS Windows 10 and Ubuntu 14.04.4 (Linux 4.2.0-27)

Determine where the data files uploaded into the Schematron Validator will be stored on disk.
Copy the validator the folder and its contents to that location
Ensure the folders have read, write, delete privileges for the Schematron Validator web application system user. (tomcat, for instance)
Set a system environment variable SCHEMATRON_VALIDATOR_HOME to point to the copied schematronValidator folder

If you want to set a password for admin access, edit the validator.properties file in the schematronValidator/properties folder.
Add a line adminPassword=<your password here> to the file.  
(If you do not set  a password, the system default password is used. 
The default password is not surfaced to the general user, but may be found by examining the source code.)

Deploy the ESAC-Schematron-Validator.war file to the Tomcat web server.

Verify the ESAC-Schematron-Validator deployed successfully by navigating to localhost:8080/ESAC-Schematron-Validator in a web browser.
(Port number may vary depending on how you set up your web server.)

Create categories in the ESAC-Schematron-Validator. Click on the "admin" link in the lower-right corner of the application.
Login as u:admin, p:<your password as set in validator.properties> 
Create the categories. You will load schematron and test files into these categories.

Read the info/landing page of the Schematron validator for instructions on how to use the ESAC-Schematron-Validator application.