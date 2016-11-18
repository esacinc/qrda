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
 
 	<%-- Styles and Script to be included in the Vocabulary Files page --%>   
 
 	<style> 
		 #xmlDisplayDiv { color: #000000; background-color: #dddddd;overflow-y:scroll;overflow-x:scroll; width:100%;
   						  height:100%; }
		.searchtext {    background-color:#FF9;    color:#555;	}
	</style>
   
   <c:set var="getXMLFilePath"><c:url value='/vocabularyFiles/getXML'/></c:set>
    <c:set var="uploadFileURL"><c:url value='/vocabularyFiles/upload/'/></c:set>
    <c:set var="removeFileURL"><c:url value='/vocabularyFiles/remove/'/></c:set>
   <c:set var="saveAsPlaceholder"><fmt:message key="global.placeholder.saveAs"/></c:set>
   
   <c:set var="downloadIcon">onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="inventory.vocFile.button.downloadTitle"/>' data-content='<fmt:message key="inventory.vocFile.button.downloadInstr"/>' ><span class='glyphicon glyphicon-download'></span></a></c:set>
   <script>
   
	   $(document).ready(function(){
	    	 $("#navVoc").addClass("active"); 
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
	    	 
	    });
	   
	   // Called when user clicks on a test file filename - displays the xml contents of the selected file in the xmlDisplayDiv
	   function ajaxShowXMLFile(type, typeTitle, filename, fullPath) {
		   waitOn();
		   //alert(type + ", " + filename + ", " + fullPath);
	 	    $.ajax({  
    	     type : "Get", 
    	     dataType: "text",
     	     url : '${getXMLFilePath}?type=' + type + '&file=' + filename,   
    	     success : function(response) { 
    	    	displayXMLString(response,'xmlDisplayDiv');
    	    	$("#xmlControlBar").show();
    	    	// Download icon must be enabled as a popover in order to override the left click properly
    			$('#xmlTitle span').html("<span class='text-primary'>"+ typeTitle + ":</span> " + filename + "</span> <a href='" + fullPath +"' ${downloadIcon}");
     			$('[data-toggle="popover"]').popover();
   				shownFile = filename;
    			shownFileDir = type;
    			waitOff();
      	     },  
    	     error : function(err) {  
    	    	 alert(err.message);
    	    	waitOff();
    	     }  
    	    }); 
   

  }

   </script>
    
