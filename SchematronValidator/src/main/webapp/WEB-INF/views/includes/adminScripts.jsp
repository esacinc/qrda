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
 
 	<%-- Styles and Script to be included in the Schematron Management page --%>   
 
 	<style> 
		 #xmlDisplayDiv { color: #000000; background-color: #dddddd;overflow-y:scroll;overflow-x:scroll; width:100%;
   						  height:100%; }
		.searchtext {    background-color:#FF9;    color:#555;	}
	</style>
   
    <c:set var="saveURL"><c:url value='/admin/saveCat/'/></c:set>
    <c:set var="addURL"><c:url value='/admin/addCat/'/></c:set>
    <c:set var="removeURL"><c:url value='/admin/removeCat/'/></c:set>	

    <c:set var="saveXsdURL"><c:url value='/admin/saveXsd/'/></c:set>
    <c:set var="addXsdURL"><c:url value='/admin/addXsd/'/></c:set>
    <c:set var="removeXsdURL"><c:url value='/admin/removeXsd/'/></c:set>	
    <c:set var="uploadXsdURL"><c:url value='/admin/uploadXsd/'/></c:set>
   
   <script>
   
       var currView = "${currView}";
 	   $(document).ready(function(){
	    	 $("#xmlControlBar").hide();
	    	 $('[data-toggle="popover"]').popover();
	    	 toggleAdminSpace(currView);
	    });

 	   	function toggleAdminSpace(showWhich) {
 	   		if (showWhich == 'cats' || showWhich == '') {
 	   		 	$("#manageXSDFiles").hide();
 	   		 	$("#manageCategories").show();
 	   		} else {
 	   			$("#manageXSDFiles").show();
	   		 	$("#manageCategories").hide();
 	   		}
 	   		currView = showWhich;
 	   	};
   </script>
    
