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
 
 	<%-- Styles and Script to be included in the Test Results History Files page --%>   
 
 	<style> 
		 #xmlDisplayDiv { color: #000000; background-color: #dddddd;overflow-y:scroll;overflow-x:scroll; width:100%;
   						  height:100%; }
		.searchtext {    background-color:#FF9;    color:#555;	}
		.fileDisplayDiv { color: #000000; background-color: #dddddd;overflow-y:scroll;overflow-x:scroll; width:100%; height:100%; }
	</style>
   
   <c:set var="getTestResultsPath"><c:url value='/history/getTestResults'/></c:set>
   <c:set var="removeFileURL"><c:url value='/history/remove/'/></c:set>
   <c:set var="changeTestCaseURL"><c:url value='/history/change/'/></c:set>
   <c:set var="rerunURL"><c:url value='/history/rerun/'/></c:set>
   <c:set var="filterURL"><c:url value='/history/filter/'/></c:set>
   
   <c:set var="HL7Name"><fmt:message key="global.nav.hl7"/></c:set>
   <c:set var="CECName"><fmt:message key="global.nav.cec"/></c:set>
   <c:set var="HQRName"><fmt:message key="global.nav.hqr"/></c:set>
   <c:set var="PQRSName"><fmt:message key="global.nav.pqrs"/></c:set>
   
   <c:set var="downloadIcon">onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="inventory.vocFile.button.downloadTitle"/>' data-content='<fmt:message key="inventory.vocFile.button.downloadInstr"/>' ><span class='glyphicon glyphicon-download'></span></a></c:set>
   <script>
   
	   var HL7Base = "HL7"; 
   	   var CECBase = "CEC"; 
   	   var HQRBase = "HQR"; 
   	   var PQRSBase = "PQRS"; 
   	   var shownFile = "";
   	   var shownFileDir = "";
 
   	   // Semaphores to control whether to repopulate xml file display divs...
       var reportFileShown = 0;
   	   var testFileShown = 0;
   	   var schematronFileShown = 0;
   	   
   	   var testPresent = "${testPresent}";     // Has a test been created and run?
   	   var caseSelected = "${caseSelected}";   // Has user chosen a test case to view?

	   $(document).ready(function(){
	    	 $("#navHistory").addClass("active"); 
	    	 
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
	    	 $("#xmlControlBar").hide();
	    	 $("#btnDelete").click( function () {
	    		 if (confirm("Are you sure you want to remove " + shownFile + " from the system?")) {
	    			 href="${removeFileURL }"+shownFile+"&"+shownFileDir;
		    		 window.location = href; 
	    		 }
	    		 });
	    	 
	    	 
	    	 $("#btnPrint").click( function () {
	 		    printDiv('xmlDisplayDiv');
	    		 });

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

	    });
   </script>
    
