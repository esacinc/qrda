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

<html style="height:100%" >

<head>
  
    <%@ include file="includes/frameworks.jsp" %>
    
    <script type="text/javascript" src="<c:url value='/resources/scripts/displayXML.js'/>" ></script> 
	<script type="text/javascript" src="<c:url value='/resources/scripts/highlightSearchText.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/resources/scripts/printDiv.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/resources/scripts/cursors.js'/>" ></script>
	
	<%@ include file="includes/workbenchScripts.jsp" %>
    
    
</head>

<body style="height:100%">
<div class="container-fluid" style="height:95%">
  <%@ include file="includes/topNavBar.jsp" %>
  <div class="row content"  style="height:90%;overflow-y:scroll;">
    <div class="col-sm-4 sidenav"  style="height:100%;overflow-y:auto; ">
    
    <%-- LEFT side of display:  Controls allowing user to create and run a validation suite --%>
    
	    <form:form name="validationForm" action="${runValidationURL }" commandName="validationSubmissionForm" method="POST">
	    	<form:hidden path="schematronType"/> 
		     <h3><fmt:message key="global.title.inventory.workbench"/></h3>
		     <h4 class="bg-primary"><fmt:message key="workbench.step0"/> </h4>
		     	<form:input path="name" size="30" placeholder="<fmt:message key='global.testPlaceholder'/>" /> </h4>
		     <h4 class="bg-primary"><fmt:message key="workbench.step1"/></h4>
		     <ul class="nav nav-pills nav-stacked">
			     <li class="nav nav-pills ">
			           <a data-toggle="collapse" href="#collapse1"><b><fmt:message key="global.nav.hl7"/></b> <span class="caret"></span></a>
				       <div id="collapse1" class="panel-collapse collapse">
				        <div class="panel-body">
				        <div style="overflow-x:auto;white-space:nowrap;" class="list-group">
					        <c:forEach items="${hl7List}" var="item">
							      <span class="list-group-item-text" name="HL7"><form:radiobutton path="schematronFilename" value="${item.filename}"/> ${item.filename} </span><br/>
					        </c:forEach>
						  </div>
				        </div>
				      </div>
			   	 </li>
			   	 <li class="nav nav-pills">
			           <a data-toggle="collapse" href="#collapse2"><b><fmt:message key="global.nav.cec"/></b> <span class="caret"></span></a>
				       <div id="collapse2" class="panel-collapse collapse">
				        <div class="panel-body">
				        <div style="overflow-x:auto;white-space:nowrap;" class="list-group">
					        <c:forEach items="${cecList}" var="item">
							      <span class="list-group-item-text" name="CEC"><form:radiobutton path="schematronFilename" value="${item.filename}" /> ${item.filename}</span><br/>
					        </c:forEach>
						  </div>
				        </div>
				      </div>
			   	 </li>
			   	 <li class="nav nav-pills ">
			           <a data-toggle="collapse" href="#collapse3"><b><fmt:message key="global.nav.hqr"/></b> <span class="caret"></span></a>
				       <div id="collapse3" class="panel-collapse collapse">
				        <div class="panel-body">
				        <div style="overflow-x:auto;white-space:nowrap;" class="list-group">
					        <c:forEach items="${hqrList}" var="item">
							      <span class="list-group-item-heading" name="HQR"><form:radiobutton path="schematronFilename" value="${item.filename}" /> ${item.filename}</span><br/>
					        </c:forEach>
						  </div>
				        </div>
				        </div>
			   	 </li>
			   	 <li class="nav nav-pills ">
			           <a data-toggle="collapse" href="#collapse4"><b><fmt:message key="global.nav.pqrs"/></b> <span class="caret"></span></a>
				       <div id="collapse4" class="panel-collapse collapse">
				        <div class="panel-body">
				        <div style="overflow-x:auto;white-space:nowrap;" class="list-group">
					        <c:forEach items="${pqrsList}" var="item">
							      <span class="list-group-item-heading" name="PQRS"><form:radiobutton path="schematronFilename" value="${item.filename}" /> ${item.filename}</span><br/>
					        </c:forEach>
						  </div>
				        </div>
				      </div>
			   	 </li>
	  		</ul>
	  		<h4 class="bg-primary"><fmt:message key="workbench.step2"/></h4>
			   <ul class="nav nav-pills nav-stacked">
			   	 <li class="nav nav-pills ">
			           <a data-toggle="collapse" href="#collapse10"><b><fmt:message key="workbench.button.selectTest"/></b> <span class="caret"></span></a>
				       <div id="collapse10" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<div style="overflow-x:auto;white-space:nowrap;" class="list-group" id="testFileList" name='checkboxesHL7'>
				 				<c:forEach items="${hl7Tests}" var="item">
								     <span class="list-group-item-heading"  ><form:checkbox  path="testFilenames" value="${item }"/>&nbsp;${item}</span><br/>
						        </c:forEach>
						    </div>
						   <div style="overflow-x:auto;white-space:nowrap;" class="list-group" id="testFileList" name='checkboxesCEC'>
				 				<c:forEach items="${cecTests}" var="item">
								     <span class="list-group-item-heading"><form:checkbox  path="testFilenames" value="${item }"/>&nbsp;${item}</span><br/>
						        </c:forEach>
						    </div>
						   <div style="overflow-x:auto;white-space:nowrap;" class="list-group" id="testFileList" name='checkboxesHQR'>
				 				<c:forEach items="${hqrTests}" var="item">
								     <span class="list-group-item-heading"><form:checkbox  path="testFilenames" value="${item }"/>&nbsp;${item}</span><br/>
						        </c:forEach>
						    </div>
						    <div style="overflow-x:auto;white-space:nowrap;" class="list-group" id="testFileList" name='checkboxesPQRS'>
				 				<c:forEach items="${pqrsTests}" var="item">
								     <span class="list-group-item-heading"><form:checkbox  path="testFilenames" value="${item }"/>&nbsp;${item}</span><br/>
						        </c:forEach>
						    </div>
						    
						</div>
					  </div>
				  </li>
			  </ul>
	  	
	  		<h4 class="bg-primary"><fmt:message key="workbench.step3"/></h4>
	  			<div style="text-align:center;"> <button type="submit" class="btn btn-primary" onclick="waitOn();return true;" ><fmt:message key="global.button.validate"/> <span class="glyphicon glyphicon-check"></span></button></div>
		</form:form>
	</div>     
	
	<div class="col-sm-8" style="height:100%">
	
		<%-- Right side of display; Shows results of a validation suite test run, with tabs that are present/hidden depending on whenter
		     the user has selected an individual test result item in the summary tab display --%>
		        
			 <ul class="nav nav-tabs">
			  <li id="initTabLi"   class="bg-info"><a id="initTaba" data-toggle="tab" href="#initTab" ><fmt:message key="global.nav.workbench.tab.info"/></a></li>
			  <li id="tabSummary" class="bg-info"><a id="summaryTabIa" data-toggle="tab" href="#tabSummaryDiv" ><fmt:message key="global.nav.workbench.tab.summary"/></a></li>
			  <li id="tabLiErrors"        class="bg-danger"><a  id="errorsTaba" data-toggle="tab" href="#tabDivErrors"><fmt:message key="global.nav.workbench.tab.errors"/> (${testCase.errorCount })</a></li>
			  <li id="tabLiWarnings"      class="bg-warning"><a id="warningsTaba" data-toggle="tab" href="#tabDivWarnings"><fmt:message key="global.nav.workbench.tab.warnings"/> (${testCase.warningCount })</a></li>
			  <li id="tabLiTest"          class="bg-info"><a id="testTaba" data-toggle="tab" href="#tabDivTest"><fmt:message key="global.nav.workbench.tab.testFile"/></a></li>
			  <li id="tabLiSchematron"    class="bg-success"><a id="schematronTaba" data-toggle="tab" href="#tabDivSchematron"><fmt:message key="global.nav.workbench.tab.schematron"/></a></li>
			  <li id="tabLiReport"        class="bg-info"><a id="reportTaba" data-toggle="tab" href="#tabDivReport" ><fmt:message key="global.nav.workbench.tab.raw"/></a></li>
			 </ul>
					
			<div class="tab-content" style="height:100%">
			
			  <%-- Init tab simply displays instructions on how to create and run a validation suite --%>
			  
			  <div id="initTab" class="tab-pane fade in active">
				  	<h4 id="xmlTitleInfo"><span><fmt:message key="workbench.title.info"/></span> </h4>
				  	<h3 id="subtitleSummary"><span></span></h3>
				  	<p><fmt:message key="workbench.text.howTo"/></p>
			  </div>
			
			  <%-- Summary tab shows the summary results after running a validation suite.  Presents a list of each test run. Click on a test name to see detailed results --%>
			  
			  <div id="tabSummaryDiv" class="tab-pane fade in active ">
				  	<h4 id="xmlTitleSummary"><span><fmt:message key="workbench.title.summary"/></span> <span>${validationResults.name }</span></h4>
				  	<h3 id="subtitleSummary"><span></span></h3>
				  	<div class="bg-info"><ul>
					  	<c:forEach items="${validationResults.statusText}" var="txt">
					  		<li>${txt }</li>
					  		<%-- Remove until we figure out why indexOf not working in Tomcat7 on linux
					  		<c:choose>
						  			<c:when test='${txt.indexOf("${ERROR_PREFIX}")==0 }'>
					  				<li class="bg-danger">${txt }</li>
					  			</c:when>
					  			<c:otherwise>
					  				<li>${txt }</li>
					  			</c:otherwise>
					  		</c:choose>
					  		--%>
					  	</c:forEach>
				  	</ul>
				  	</div>
					<c:forEach items="${validationResults.testCases }" var="thisCase" varStatus="loop">
					  		<a href="${changeTestCaseURL }${loop.index}">
					  			<c:choose><c:when test="${thisCase.filename == testCase.filename }"><h4 class="bg-info"></c:when><c:otherwise><h4></c:otherwise></c:choose>${thisCase.filename }<span class="glyphicon glyphicon-triangle-right"></span></h4></a>
						  		<ul style="list-style-type:none;">
						  			<c:forEach items="${thisCase.statusText }" var="txt">
						  				<li>${txt }</li>
						  			</c:forEach>
						  		</ul>
					 </c:forEach>
					 <div class="inline"><button id="btnPrintSummary" type="button" class="btn btn-primary"><fmt:message key="global.button.print"/> <span class="glyphicon glyphicon-print"></span></button></div>
					 
			  </div>
			  
			  <%-- Test Case Errors tab shown only when user clicks on a test case in the summary tab.  Displays the critical (error) failures from the test case results object stored in the model --%>
			  
			  <div id="tabDivErrors" class="tab-pane fade" style="height:100%">
			    	<h4 id="xmlTitleErrors"><span><fmt:message key="workbench.title.errors"/> - ${testCase.filename }</span> <button id="error-expand-btn" type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-down"></span></button> <button id="error-collapse-btn" type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-up"></span></button></h4>
			    	<div id="errorsDisplayDiv" class="fileDisplayDiv" style="height:85%">
				    	<ul style="list-style-type:none;">
					    	<c:forEach items="${testCase.errors }" var="failure" varStatus="loop">
					    	    <c:if test="${failure.critical}">
					    		<li><div class="bg-danger">${loop.index }: <span class="btn-danger"><fmt:message key="workbench.failure.critical"/></span> <a data-toggle="collapse" href="#errorIndex${loop.index}"><fmt:message key="workbench.failure"/> ${failure.id } <span class="caret"></span></a></div>
					    			<div id="errorIndex${loop.index}" class="panel-collapse collapse">
					    			   <div class="panel-body">
					    			     <span class='btn-info'><fmt:message key="workbench.failure.location"/> </span> ${failure.location }<br/>
										 <span class='btn-danger'><fmt:message key="workbench.failure.test"/> ${failure.test }</span><br/>
						                 <span class='btn-info'><fmt:message key="workbench.failure.statement"/> ${failure.statement }</span><br/>
						    			 <fmt:message key="workbench.failure.isCritical"/> ${failure.critical }
						    			</div>		   		    			
					    			</div>
					    		</li>
					    		</c:if>
					    	</c:forEach>
				    	</ul>
			    	</div>
			    	<div class="inline"><input type="text" id="txtSearchErrors"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a id="errorSearch" href="javascript:void(0)" ><span class="glyphicon glyphicon-search"></span></a>
			    				 		<button id="btnPrintErrors" type="button" class="btn btn-primary"><fmt:message key="global.button.print"/> <span class="glyphicon glyphicon-print"></span></button>
						<span style="width:10px;">&nbsp;</span>
						<div id="srchCntErrors" ></div> 
					</div>
			  </div>

  			  <%-- Test Case Warnings tab shown only when user clicks on a test case in the summary tab.  Displays the non-critical (warning) failures from the test case results object stored in the model --%>
			  
			  <div id="tabDivWarnings" class="tab-pane fade" style="height:100%">
			    	<h4 id="xmlTitleWarnings"><span><fmt:message key="workbench.title.warnings"/> - ${testCase.filename }</span> <button id="warning-expand-btn" type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-down"></span></button> <button id="warning-collapse-btn" type="button" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-up"></span></button></h4>
			    	<div id="warningsDisplayDiv" class="container-fluid fileDisplayDiv" style="height:85%">
			    		<ul style="list-style-type:none;">
					    	<c:forEach items="${testCase.errors }" var="failure" varStatus="loop">
					    	    <c:if test="${failure.critical == false}">
					    		<li><div class="bg-warning">${loop.index }: <span class="btn-warning"><fmt:message key="workbench.failure.warning"/></span> <a data-toggle="collapse" href="#warningIndex${loop.index}"><fmt:message key="workbench.failure"/> ${failure.id } <span class="caret"></span></a></div>
					    			<div id="warningIndex${loop.index}" class="panel-collapse collapse">
					    			   <div class="panel-body">
					    			     <span class='btn-info'><fmt:message key="workbench.failure.location"/></span>  ${failure.location }<br/>
										 <span class='btn-warning'><fmt:message key="workbench.failure.test"/> ${failure.test }</span><br/>
						                 <span class='btn-info'><fmt:message key="workbench.failure.statement"/> ${failure.statement }</span><br/>
						    			 <fmt:message key="workbench.failure.isCritical"/> ${failure.critical }
						    			</div>		   		    			
					    			</div>
					    		</li>
					    		</c:if>
					    	</c:forEach>
				    	</ul>
			    	</div>
			    	<div class="inline"><input type="text" id="txtSearchWarnings"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a id="warningSearch" href="javascript:void(0)" ><span class="glyphicon glyphicon-search"></span></a> 
			    				 		<button id="btnPrintWarnings" type="button" class="btn btn-primary"><fmt:message key="global.button.print"/> <span class="glyphicon glyphicon-print"></span></button>
			    	
						<span style="width:10px;">&nbsp;</span>
						<div id="srchCntWarnings" ></div> 
					</div>
			  </div>
			  
			  <%-- Schematron display tab shown only when user clicks on a test case in the summary tab.  Displays the contents of the schematron file used in validating the selected test case --%>
			  
			  <div id="tabDivSchematron" class="tab-pane fade" style="height:100%">
				    <h4 id="xmlTitleSchematron"><span></span></h4>
					<div id="xmlSchematronDisplayDiv" class="container-fluid fileDisplayDiv" style="height:85%"></div>
					<div id="xmlSchematronControlBar">
						<input type="text" id="txtIDSchematron"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a id="schematronSearch" href="javascript:void(0)" ><span class="glyphicon glyphicon-search"></span></a>
						<span style="width:10px;">&nbsp;</span> 
						<br/>
						<div id="srchCntSchematron"></div>
						
					</div>
			  </div>

			  <%--TestFile display tab shown only when user clicks on a test case in the summary tab.  Displays the contents of the test file validated in the selected test case --%>
			  
			  <div id="tabDivTest" class="tab-pane fade" style="height:100%">
				    <h4 id="xmlTitleTestFile"><span></span></h4>
					<div id="xmlTestFileDisplayDiv" class="container-fluid fileDisplayDiv" style="height:85%"></div>
					<div id="xmlTestFileControlBar">
						<input type="text" id="txtIDTest"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a id="testSearch" href="javascript:void(0)" ><span class="glyphicon glyphicon-search"></span></a>
						<span style="width:10px;">&nbsp;</span> 
						<br/>
						<div id="srchCntTest"></div>
					</div>
			  </div>
			  
			  <%-- Test Report display tab shown only when user clicks on a test case in the summary tab.  Displays the contents of the full validation report file generated when validating the selected test case --%>
			  
			  <div id="tabDivReport" class="tab-pane fade" style="height:100%">
				    <h4 id="xmlTitleReport"><span><fmt:message key="workbench.title.rawreport"/></span></h4>
				    <h3 id="subtitleSummary"><span></span></h3>
					<div id="xmlReportDisplayDiv" class="container-fluid fileDisplayDiv" style="height:85%"></div>
					<div id="xmlReportControlBar">
						<input type="text" id="txtIDReport"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a id="reportSearch" href="javascript:void(0)" ><span class="glyphicon glyphicon-search"></span></a>
						<span style="width:10px;">&nbsp;</span> 
			 			<button id="btnPrintReport" type="button" class="btn btn-primary"><fmt:message key="global.button.print"/> <span class="glyphicon glyphicon-print"></span></button>
						<br/>
						<div id="srchCntReport"></div>
					</div>
			  </div>
			  
			</div>   
			 	
		 </div>
	</div>
  </div>

<%@ include file="includes/footer.jsp" %>    
</body>
</html>
