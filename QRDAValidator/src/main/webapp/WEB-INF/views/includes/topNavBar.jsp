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

<%-- Displays the top-most navigation bar on all pages --%>

<c:set var="homeURL"><c:url value='/info'/></c:set>
<c:set var="schematronsURL"><c:url value='/schematrons'/></c:set>
<c:set var="workbenchURL"><c:url value='/workbench'/></c:set>
<c:set var="testFilesURL"><c:url value='/testFiles'/></c:set>
<c:set var="vocFilesURL"><c:url value='/vocabularyFiles'/></c:set>
<c:set var="historyURL"><c:url value='/history'/></c:set>
<c:set var="adminURL"><c:url value='/admin'/></c:set>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	   <div class="navbar-header">
	     <a class="navbar-brand" href="#"><fmt:message key="global.nav.title"/></a>
	   </div>
	   <ul class="nav navbar-nav">
	     <li id="navInfo"><a href="${homeURL }"><fmt:message key="global.nav.info"/></a></li>
	     <li id="navSchematrons"><a href="${schematronsURL }"><fmt:message key="global.nav.schematrons"/></a></li>
	     <li id="navTests"><a href="${testFilesURL }"><fmt:message key="global.nav.tests"/></a></li>
	     <li id="navVoc"><a href="${vocFilesURL }"><fmt:message key="global.nav.voc"/></a></li>
	     <li id="navWorkbench"><a href="${workbenchURL }"><fmt:message key="global.nav.workbench"/></a></li> 
	     <li id="navHistory"><a href="${historyURL }"><fmt:message key="global.nav.history"/></a></li>
	   </ul>
	  </div>
</nav>