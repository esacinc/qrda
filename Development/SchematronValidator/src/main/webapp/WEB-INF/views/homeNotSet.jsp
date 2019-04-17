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
    <c:set var="loginURL"><c:url value='/authenticate/authenticate/'/></c:set>
</head>

<body  style="height:100%">
	<div class="container-fluid" style="height:85%" >
		<%@ include file="includes/topNavBar.jsp" %>
		<div class="row content" style="height:100%">
		    <div class="col-sm-12" style="height:100%;;overflow-vertical:auto;">
		         <div id="displayDiv" class="container-fluid" >
		         
		         <h3 class="btn-danger"><fmt:message key="homeNotSet.fatal"/></h3>
			         <p class="bg-danger" style="text-align:center;">
			             <fmt:message key="homeNotSet.msg"/>
			         </p>
			         <p class="btn-danger" style="text-align:center;">
			             <fmt:message key="homeNotSet.status"/> ${schematronHome}			         
			         </p>
			         <p>The application was unable to access or locate the following directories, which use SCHEMATRON_VALIDATOR_HOME as a top-level directory:
			         <ul>
				         <c:forEach items="${dirs}" var="dir">
				         	<li>${dir}</li>
				         </c:forEach>
			         </ul>
			        </p>
			     </div>
		         </div>
		    </div>
		</div>
	<%@ include file="includes/footer.jsp" %>   
    </div> 
</body>
</html>
