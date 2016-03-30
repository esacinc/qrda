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

<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ include file="includes/taglib.jsp" %>

<html style="height:100%">

<head>
  
    <%@ include file="includes/frameworks.jsp" %>
    
     <%@ include file="includes/homePageScripts.jsp" %> 
</head>

<body  style="height:100%">
	<div class="container-fluid" style="height:85%" >
		<%@ include file="includes/topNavBar.jsp" %>
		<div class="row content" style="height:100%">
		    <div class="col-sm-3 sidenav" style="height:100%">
		    	<ul style="list-style-type:none;">
		    		<li><a href="javascript:handleIntroClick('introIntro')"><h4><fmt:message key="introMenuIntro"/><small><span class="glyphicon glyphicon-triangle-right"></span></small></h4></a></li>
		    		<li><a href="javascript:handleIntroClick('introSchematrons')"><h4><fmt:message key="introMenuSchematrons"/><small><span class="glyphicon glyphicon-triangle-right"></span></small></h4></a></li>
		    		<li><a href="javascript:handleIntroClick('introTestFiles')" ><h4><fmt:message key="introMenuTestFiles"/><small><span class="glyphicon glyphicon-triangle-right"></span></small></h4></a></li>
		    		<li><a href="javascript:handleIntroClick('introWorkbench')" ><h4><fmt:message key="introMenuWorkbench"/><small><span class="glyphicon glyphicon-triangle-right"></span></small></h4></a></li>
		    		<li><a href="javascript:handleIntroClick('introTechNotes')" ><h4><fmt:message key="introMenuTechNotes"/><small><span class="glyphicon glyphicon-triangle-right"></span></small></h4></a></li>
		    		
		    	</ul>
		    </div>
		    <div class="col-sm-9" style="height:100%;;overflow-vertical:auto;">
		         <div id="displayDiv" class="container-fluid" >
		         
		         <div id="introIntro" ><h4><fmt:message key="intro.title.intro"/></h4><fmt:message key="intro.text" /><p><fmt:message key="intro.descriptions.intro"/></p></div>
		         <div id="introSchematrons"><h4><fmt:message key="intro.title.schematrons"/></h4><fmt:message key="intro.descriptions.schematrons"/></div>
		         <div id="introTestFiles" ><h4><fmt:message key="intro.title.testfiles"/></h4><fmt:message key="intro.descriptions.testfiles"/></div>
		         <div id="introWorkbench"><h4><fmt:message key="intro.title.workbench"/></h4><fmt:message key="intro.descriptions.workbench"/></div>
		         <div id="introTechNotes" ><h4><fmt:message key="intro.title.technotes"/></h4><fmt:message key="intro.descriptions.technotes"/></div>
		         </div>
		    </div>
		</div>
	</div>
	<%@ include file="includes/footer.jsp" %>    
</body>
</html>
