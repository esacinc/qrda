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
	
	<%@ include file="includes/historyScripts.jsp" %>
	
	<style>
		table, td { border: none; vertical-align:top; padding-left:5px;} 
	</style>
	
	
</head>

<body style="height:100%">
<div class="container-fluid" style="height:95%">
  <%@ include file="includes/topNavBar.jsp" %>
  <div class="row content"  style="height:90%;overflow-y:scroll;">
    <div class="col-sm-4 sidenav"  style="height:100%;overflow-y:auto;">
      <h4><fmt:message key="global.title.inventory.history"/></h4>
      <fmt:message key="inventory.history.explanation"/><br/>
      <form:form commandName="filterForm" name="filterForm" method="POST" action="${filterURL}">
      	<form:input  path="filter" size="20"/> <button id="btnFilter" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
      </form:form>
      <hr/>
     <ul class="nav nav-pills nav-stacked">
         	<c:forEach items="${schematronCategories}" var="cat">
         	<c:if test="${cat.active }" >
		        <li class="nav nav-pills ">
		           <a data-toggle="collapse" href="#collapse${cat.name}"><b>${cat.displayName}</b> <span class="caret"></span></a>
			       <div id="collapse${cat.name}" class="panel-collapse collapse">
			        <div class="panel-body bg-info">
			        <div class="list-group">
				        <c:forEach items="${cat.files}" var="item">
						      <div style="text-align:right;padding-bottom:5px;" ><a  href="${removeFileURL}${item.filename}&${cat.name}" onClick="return confirm('<fmt:message key="global.filedelete.confirm"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></div>
						      <div style="overflow-x:auto">
							      <a href="${getTestResultsPath}?type=${cat.name}&file=${item.filename}&filter="+$('historyFilter').val() class="list-group-item" >
								      <span class="list-group-item-heading">${item.filename}</span>
								      <p class="list-group-item-text"><fmt:message key="inventory.history.performed"/> ${item.uploadDate}  </p>
							      </a>
							  </div>
				        </c:forEach>
					  </div>
			        </div>
			        <div class="panel-footer">
			        </div>
			      </div>
		   	    </li>
		   </c:if>
     </c:forEach>
  </ul>
 </div>     

	<div class="col-sm-8" style="height:100%">
	
		<%-- Right side of display; Shows results of a validation suite test run, with tabs that are present/hidden depending on whenter
		     the user has selected an individual test result item in the summary tab display --%>
		        
			 <ul class="nav nav-tabs">
			  <li id="tabSummary" class="bg-info"><a id="summaryTabIa" data-toggle="tab" href="#tabSummaryDiv" ><fmt:message key="global.nav.workbench.tab.summary"/></a></li>
			  <li id="tabLiErrors"        class="bg-danger"><a  id="errorsTaba" data-toggle="tab" href="#tabDivErrors"><fmt:message key="global.nav.workbench.tab.errors"/> (${testCase.errorCount })</a></li>
			  <li id="tabLiWarnings"      class="bg-warning"><a id="warningsTaba" data-toggle="tab" href="#tabDivWarnings"><fmt:message key="global.nav.workbench.tab.warnings"/> (${testCase.warningCount })</a></li>
			  <li id="tabLiTest"          class="bg-info"><a id="testTaba" data-toggle="tab" href="#tabDivTest"><fmt:message key="global.nav.workbench.tab.testFile"/></a></li>
			  <li id="tabLiSchematron"    class="bg-success"><a id="schematronTaba" data-toggle="tab" href="#tabDivSchematron"><fmt:message key="global.nav.workbench.tab.schematron"/></a></li>
			  <li id="tabLiReport"        class="bg-info"><a id="reportTaba" data-toggle="tab" href="#tabDivReport" ><fmt:message key="global.nav.workbench.tab.raw"/></a></li>
			 </ul>
					
			<div class="tab-content" style="height:100%">
			
			  <%-- Summary tab shows the summary results after running a validation suite.  Presents a list of each test run. Click on a test name to see detailed results --%>
			  
			  <div id="tabSummaryDiv" class="tab-pane fade in active ">
				  	<h4 id="xmlTitleSummary"><span><fmt:message key="workbench.title.summary"/></span> <span class="text-primary">${validationResults.name }</span> <fmt:message key="workbench.title.lastrun"/> ${validationResults.nameTimestamp }</span> 
					  	<%-- If validationResults has a null value for testFilename, then we know it is an older result prior to the implementation of the re-run capability... --%>
					  	<c:if test="${validationResults.testFilenames != null}"><button id="btnRerun" type="button" class="btn btn-primary"><fmt:message key="workbench.button.rerun"/> <span class="glyphicon glyphicon-refresh"></span></button></c:if>
					</h4>
				  	<h5 id="subtitleSummary"><span><fmt:message key="workbench.title.schematron"/></span> <span><b>${validationResults.schematronFilename }</b></span></h5>
				  	<div class="bg-info"><ul>
					  	<c:forEach items="${validationResults.statusText}" var="txt">
					  		<li>${txt }</li>
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
		    		                <li><div class="bg-danger"><fmt:message key="global.line"/> ${failure.lineNumber }: <a data-toggle="collapse" href="#errorIndex${loop.index}">  <span class="btn-danger">${failure.id }</span> <fmt:message key="global.in"/>  ${failure.rule } <span class="caret"></span></a></div>
					    			<div id="errorIndex${loop.index}" class="panel-collapse collapse">
					    			   <div class="panel-body">
					    			   		<%-- Display the data for this failure --%>
											<%@ include file="includes/assertErrorDisplay.jsp" %>
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
					    		<li><div class="bg-warning"><fmt:message key="global.line"/> ${failure.lineNumber }: <a data-toggle="collapse" href="#warningIndex${loop.index}">  <span class="btn-warning">${failure.id }</span> <fmt:message key="global.in"/>  ${failure.rule } <span class="caret"></span></a></div>
					    			<div id="warningIndex${loop.index}" class="panel-collapse collapse">
					    			   <div class="panel-body">
					    			   		<%-- Display the data for this failure --%>
											<%@ include file="includes/assertWarningDisplay.jsp" %>
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
