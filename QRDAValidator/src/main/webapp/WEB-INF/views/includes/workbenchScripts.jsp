<%--
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

 --%>
 
	 <%-- Styles and Script to be included in the Validation Workbench page --%>
 	<style> 
		.searchtext {    background-color:#FF9;    color:#555;	}
		.fileDisplayDiv { color: #000000; background-color: #dddddd;overflow-y:scroll;overflow-x:scroll; width:100%; height:100%; }
		
	</style>
	
   <c:set var="getXMLStringURL"><c:url value='/workbench/getXML/'/></c:set>
   <c:set var="runValidationURL"><c:url value='/workbench/'/></c:set>
   <c:set var="changeTestCaseURL"><c:url value='/workbench/change/'/></c:set>
   <c:set var="rerunURL"><c:url value='/workbench/rerun/'/></c:set>
   <c:set var="reportURL"><c:url value='${testCase.validationReportURL }'/></c:set>
   <c:set var="downloadIcon"><a href='${reportURL}' onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="workbench.button.downloadTitle"/>' data-content='<fmt:message key="workbench.button.downloadInstr"/>' ><span class='glyphicon glyphicon-download'></span></a></c:set>
  
   <c:set var="ERROR_PREFIX">ERROR:</c:set> 
   <c:set var="EXPECTED_ERROR_EQ_PREFIX">EXPECTED ERRORS =</c:set>
   <c:set var="EXPECTED_WARNING_EQ_PREFIX">EXPECTED ERRORS =</c:set>
   <c:set var="EXPECTED_ERROR_NE_PREFIX">EXPECTED ERRORS <></c:set>
   <c:set var="EXPECTED_WARNING_NE_PREFIX">EXPECTED ERRORS <></c:set>
   
   <script>
   
   	   // Semaphores to control whether to repopulate xml file display divs...
       var reportFileShown = 0;
   	   var testFileShown = 0;
   	   var schematronFileShown = 0;
   	   
   	   var testPresent = "${testPresent}";     // Has a test been created and run?
   	   var caseSelected = "${caseSelected}";   // Has user chosen a test case to view?
   	   
	   $(document).ready(function(){
	    	 $("#navWorkbench").addClass("active"); 
	    	 
	    	 // Set up all the onClick events for the various buttons, etc. on the UI...
	    	 
	    	 $("#errorSearch").click( function () {
	    		 searchDiv("errorsDisplayDiv",$("#txtSearchErrors").val(),"srchCntErrors");
	    		 });
	    	 $("#warningSearch").click( function () {
	    		 searchDiv("warningsDisplayDiv",$("#txtSearchWarnings").val(),"srchCntWarnings");
	    		 });
	    	 $("#xmlControlBar").hide();
	    	 $("#reportTaba").click( function () {
	    		 maybeShowReportFile();
	    		 });
	    	 $("#reportSearch").click( function () {
	    		 searchDiv("xmlReportDisplayDiv",$("#txtIDReport").val(),"srchCntReport");
	    		 });
	    	 $("#schematronTaba").click( function () {
	    		 maybeShowSchematronFile();
	    		 });
	    	 $("#schematronSearch").click( function () {
	    		 searchDiv("xmlSchematronDisplayDiv",$("#txtIDSchematron").val(),"srchCntSchematron");
	    		 });
	    	 $("#testTaba").click( function () {
	    		 maybeShowTestFile();
	    		 });
	    	 $("#testSearch").click( function () {
	    		 searchDiv("xmlTestFileDisplayDiv",$("#txtIDTest").val(),"srchCntTest");
	    		 });
	    	 $('#error-collapse-btn').click(function() {
	    		    var state = 'hide';
	    		    $("[id^=errorIndex]").collapse(state);
	    		  });
	    	 $('#error-expand-btn').click(function() {
	    		    var state = 'show';
	    		    $("[id^=errorIndex]").collapse(state);
	    		  });
	    	 $('#warning-collapse-btn').click(function() {
	    		    var state = 'hide';
	    		    $("[id^=warningIndex]").collapse(state);
	    		  });
	    	 $('#warning-expand-btn').click(function() {
	    		    var state = 'show';
	    		    $("[id^=warningIndex]").collapse(state);
	    		  });
	    	 $("#btnPrintSummary").click( function () {
		 		    printDiv('tabSummaryDiv');
		    		 });
	    	 $("#btnPrintErrors").click( function () {
		 		    printDiv('errorsDisplayDiv');
		    		 });
	    	 $("#btnPrintReport").click( function () {
		 		    printDiv('xmlReportDisplayDiv');
		    		 });
	    	 $("#btnPrintWarnings").click( function () {
		 		    printDiv('warningsDisplayDiv');
		    		 });
	    	 $("#btnRerun").click( function () {
    			 href="${rerunURL }";
	    		 window.location = href; 
    		 });
	    	 // Hide all of the test file items (Their ui element names all contain the 'checkboxes' string.)
	    	 $("[name^='checkboxes']").hide();
	    	 // Then set a click event on all of the schematron names that will show the appropriate test files based on the schematron type
	    	 $("input:radio[name='schematronFilename']").click(function(){
		    		 var testType = $(this).parent().attr('name');
		    		 var divName = "checkboxes"+testType;
		    		 $("[name^='testFilenames']").prop('checked', false);
		    		 $("[name^='checkboxes']").hide();
		    		 $("[name="+divName+"]").show();
		    		 validationSubmissionForm.schematronType.value = testType;
					 // Make the test name be the schematron file name, 
					 var testName = validationSubmissionForm.name.value;
					 //if (testName == 'TestRun' || testName == '') {
						 var newName = $("input:radio[name='schematronFilename']:checked").val();
						 validationSubmissionForm.name.value = newName.replace(".sch"," Test");
					 //}

	    		});
	    	 
	    	 // If any elements have bootstrap popovers, enable them as such.
	    	 $('[data-toggle="popover"]').popover(); 
	    	 
	    	 // Hide/show elements depending on whether a validation test has been run, and whether the user has selected one of the test results.
	    	 if (testPresent == "true") {
	    		showHowTo(false);
	    		showSummary(true);
	    		showTestTabs((caseSelected == "true"));
	    	 }
	    	 else {
	    		showHowTo(true);
	    		showSummary(false);
	    		showTestTabs(false);
	    	 }
	    	 waitOff();
	   });
	   
   	   // Hide/Show the introduction (how-to-create-a-test) tab.
	   function showHowTo(doShow) {
		   if (doShow) {
			   $("#initTabLi").show();
	    	   $("#initTab").show(); 
		   }
		   else {
			   $("#initTabLi").hide();
	    	   $("#initTab").hide();
		   }
	   }
	   
   	   // Hide/show the validation test run results tab
	   function showSummary(doShow) {
		   if (doShow) {
			   $("#tabSummary").show();
	    	   $("#tabSummaryDiv").show();
		   }
		   else {
			   $("#tabSummary").hide();
	    	   $("#tabSummaryDiv").hide();
		   }
		   
	   }
	   
   	   // Hide/show the test details tabs
	   function showTestTabs(doShow) {
		   if (doShow) {
			   $("[id^='tabLi']").show();
 		   }
		   else {
			   $("[id^='tabLi']").hide();
 		   }
		   
	   }
	   
   	   // Called when user selects a test case result. Populates the xml display div under result report tab with the contents of the test report. 
	   function doAjaxGetReportXMLString() {
		   waitOn();
     	    $.ajax({  
     	     type : "Get", 
     	     dataType: "text",
      	     url : '${getXMLStringURL}RESULT&${testCase.validationReportFilename}&${validationResults.resultsFolder}',   
     	     success : function(response) { 
     			   displayXMLString(response,'xmlReportDisplayDiv');
     			   $("#xmlReportControlBar").show();
     			   // The download icon has a bootstrap popover, and must be enabled as such...
     			   $('#xmlTitleReport span').html("${testCase.validationReportFilename} ${downloadIcon}");
     			   $('[data-toggle="popover"]').popover();
     			   $("#txtID2").val("");
     			   reportFileShown = 1;
      			   waitOff();
       	     },  
     	     error : function(err) {  
     	    	$("#subtitleReport span").text("Error: " + err.message);
     	    	waitOff();
     	     }  
     	    }); 
   		}

   	   // Called when user selects a test case result. Populates the xml display div under result report tab with the contents of the test report. 
	   function doAjaxGetSchematronXMLString() {
		   waitOn();
    	    $.ajax({  
    	     type : "Get", 
    	     dataType: "text",
     	     url : '${getXMLStringURL}SCHEMATRON&${validationResults.schematronFilename}&${validationResults.schematronType}',   
    	     success : function(response) { 
    			   displayXMLString(response,'xmlSchematronDisplayDiv');
    			   $("#xmlSschematronControlBar").show();
    			   $('#xmlTitleSchematron span').text("${validationResults.schematronFilename}");
    			   schematronFileShown = 1;
    			   waitOff();
      	     },  
    	     error : function(err) {  
    	    	$("#subtitleReport span").text("Error: " + err.message);
    	    	waitOff();
    	     }  
    	    }); 
  		}

   	   // Called when user selects a test case result. Populates the xml display div under the Schematron tab with the contents of the original schematron file used in the test. 
	   function doAjaxGetTestXMLString() {
		   waitOn();
	   	    $.ajax({  
	   	     type : "Get", 
	   	     dataType: "text",
	    	     url : '${getXMLStringURL}TEST&${testCase.filename}&${validationResults.schematronType}',   
	   	     success : function(response) { 
			  		   displayXMLString(response,'xmlTestFileDisplayDiv');
					   $("#xmlTestFileControlBar").show();
					   $('#xmlTitleTestFile span').text("${testCase.filename}");
					   testFileShown = 1;
					   waitOff();
	     	     },  
	   	     error : function(err) {  
	   	    	$("#subtitleReport span").text("Error: " + err.message);
	   	    	waitOff();
	   	     }  
   	    }); 
 		}

	   
	   function maybeShowReportFile() {
		   if (reportFileShown == 0) {
			   $('#xmlDisplayDiv').text("Please Wait...loading report file...");
			   doAjaxGetReportXMLString()
			   reportFileShown = 1;
		   }
	   }
	   
	   function maybeShowSchematronFile() {
		   if (schematronFileShown == 0) {
			   $('#xmlSchematronDisplayDiv').text("Please Wait...loading  schematron file...");
			   doAjaxGetSchematronXMLString()
			   schematronFileShown = 1;
		   }
		   
	   }
	   
	   function maybeShowTestFile() {
		   if (testFileShown == 0) {
			   $('#xmlTestFileDisplayDiv').text("Please Wait...loading test file...");
			   doAjaxGetTestXMLString()
			   testFileShown = 1;
		   }
		   
	   }
   </script>
 