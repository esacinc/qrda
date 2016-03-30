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
	
   <%@ include file="includes/schematronInventoryScripts.jsp" %>
   
</head>
  
<body style="height:100%">
<div class="container-fluid" style="height:95%">
  <%@ include file="includes/topNavBar.jsp" %>
  <div class="row content" style="height:90%;overflow-y:scroll;">
    <div class="col-sm-4 sidenav"  style="height:100%;overflow-y:auto;">
      <h4><fmt:message key="global.title.inventory.schematron"/></h4>
     <ul class="nav nav-pills nav-stacked">
      <li class="nav nav-pills ">
           <a data-toggle="collapse" href="#collapse1"><b><fmt:message key="global.nav.hl7"/></b> <span class="caret"></span></a>
	       <div id="collapse1" class="panel-collapse collapse">
	        <div class="panel-body bg-info ">
	        <div class="list-group">
		        <c:forEach items="${hl7List}" var="item">
		        	<div class="list-group-item">
		        	    <div style="text-align:right;padding-bottom:5px;" ><a  href="${removeFileURL }${item.filename}&HL7" onClick="return confirm('<fmt:message key="global.filedelete.confirm"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></div>
		        		<div style="overflow-x:auto">
			        		<a href="javascript:void(0)" class="list-group-item" onclick="ajaxShowXMLFile(HL7Base,'${item.filename}','<c:url value="/${item.fileURL }"/>')">
					      		<span class="list-group-item-heading">${item.filename}</span>
					      		<p class="list-group-item-text"><fmt:message key="inventory.uploaded"/> ${item.uploadDate}</p>
					    	</a> 
					    </div>
				    </div>
		        </c:forEach>
			  </div>
	        </div>
	        <div class="panel-footer">
	        <h5><fmt:message key="global.placeholder.upload"/></h5>
			      <div class="input-group">
			      <form:form commandName="uploadHL7" method="POST" action="${uploadFileURL }" enctype="multipart/form-data">
			        <form:hidden path="subDir"/>
        			<form:input type="file" path="path" class="form-control"  /><br /> 
        			<fmt:message key="global.saveAs"/><form:input size='40' type="text" path="name" class="form-control" placeholder="${saveAsPlaceholder }" /> 
        		    <span class="input-group-btn">
			          <button class="btn btn-primary" type="submit">
			            <fmt:message key="global.button.upload"/><span class="glyphicon glyphicon-upload"></span>
			          </button>
			        </span>
   				 </form:form>
			      </div>
	        </div>
	      </div>
   	 </li>
   	 <li class="nav nav-pills  ">
           <a data-toggle="collapse" href="#collapse2"><b><fmt:message key="global.nav.cec"/></b> <span class="caret"></span></a>
	       <div id="collapse2" class="panel-collapse collapse">
	        <div class="panel-body bg-info">
	        <div class="list-group">
		        <c:forEach items="${cecList}" var="item">
		        	  <div style="text-align:right;padding-bottom:5px;" ><a  href="${removeFileURL }${item.filename}&CEC" onClick="return confirm('<fmt:message key="global.filedelete.confirm"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></div>
				      <div style="overflow-x:auto">
					      <a href="javascript:void(0)" class="list-group-item" onclick="ajaxShowXMLFile(CECBase,'${item.filename}','<c:url value="/${item.fileURL }"/>')">
						      <span class="list-group-item-heading">${item.filename}</span>
						      <p class="list-group-item-text"><fmt:message key="inventory.uploaded"/> ${item.uploadDate}</p>
					      </a>
					  </div>
		        </c:forEach>
			  </div>
	        </div>
	        <div class="panel-footer">
	        <h5><fmt:message key="global.placeholder.upload"/></h5>
			      <div class="input-group">
			      <form:form commandName="uploadCEC" method="POST" action="${uploadFileURL }" enctype="multipart/form-data">
			        <form:hidden path="subDir"/>
        			<form:input type="file" path="path" class="form-control"  /><br /> 
        			<form:input type="text" path="name" class="form-control" placeholder="${saveAsPlaceholder }" /> 
        		    <span class="input-group-btn">
			          <button class="btn btn-primary" type="submit">
			            <fmt:message key="global.button.upload"/><span class="glyphicon glyphicon-upload"></span>
			          </button>
			        </span>
   				 </form:form>
			      </div>
	        </div>
	      </div>
   	 </li>
   	 
   	 <li class="nav nav-pills  ">
           <a data-toggle="collapse" href="#collapse3"><b><fmt:message key="global.nav.hqr"/></b> <span class="caret"></span></a>
	       <div id="collapse3" class="panel-collapse collapse">
	        <div class="panel-body bg-info">
	        <div class="list-group">
		        <c:forEach items="${hqrList}" var="item">
				      <div style="text-align:right;padding-bottom:5px;" ><a  href="${removeFileURL }${item.filename}&HQR" onClick="return confirm('<fmt:message key="global.filedelete.confirm"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></div>
				      <div style="overflow-x:auto">
					      <a href="javascript:void(0)" class="list-group-item" onclick="ajaxShowXMLFile(HQRBase,'${item.filename}','<c:url value="/${item.fileURL }"/>')">
						      <span class="list-group-item-heading">${item.filename}</span>
						      <p class="list-group-item-text"><fmt:message key="inventory.uploaded"/> ${item.uploadDate}</p>
					      </a>
					  </div>
		        </c:forEach>
			</div>
	        </div>
	        <div class="panel-footer">
	        <h5><fmt:message key="global.placeholder.upload"/></h5>
			      <div class="input-group">
			      <form:form commandName="uploadHQR" method="POST" action="${uploadFileURL }" enctype="multipart/form-data">
			        <form:hidden path="subDir"/>
        			<form:input type="file" path="path" class="form-control"  /><br /> 
        			<form:input type="text" path="name" class="form-control" placeholder="${saveAsPlaceholder }" /> 
        		    <span class="input-group-btn">
			          <button class="btn btn-primary" type="submit">
			            <fmt:message key="global.button.upload"/><span class="glyphicon glyphicon-upload"></span>
			          </button>
			        </span>
   				 </form:form>
			      </div>
	        </div>
	      </div>
   	 </li>
   	 
   	 <li class="nav nav-pills  ">
           <a data-toggle="collapse" href="#collapse4"><b><fmt:message key="global.nav.pqrs"/></b> <span class="caret"></span></a>
	       <div id="collapse4" class="panel-collapse collapse">
	        <div class="panel-body bg-info">
	        <div class="list-group">
		        <c:forEach items="${pqrsList}" var="item">
				      <div style="text-align:right;padding-bottom:5px;" ><a  href="${removeFileURL }${item.filename}&PQRS" onClick="return confirm('<fmt:message key="global.filedelete.confirm"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></div>
				      <div style="overflow-x:auto">
					      <a href="javascript:void(0)" class="list-group-item" onclick="ajaxShowXMLFile(PQRSBase,'${item.filename}','<c:url value="/${item.fileURL }"/>')">
						      <span class="list-group-item-heading">${item.filename}</span>
						      <p class="list-group-item-text"><fmt:message key="inventory.uploaded"/> ${item.uploadDate}</p>
					      </a>
					  </div>
		        </c:forEach>
			  </div>
	        </div>
	        <div class="panel-footer">
	        <h5><fmt:message key="global.placeholder.upload"/></h5>
			      <div class="input-group">
			      <form:form commandName="uploadPQRS" method="POST" action="${uploadFileURL }" enctype="multipart/form-data">
			        <form:hidden path="subDir"/>
        			<form:input type="file" path="path" class="form-control"  /><br /> 
        			<form:input type="text" path="name" class="form-control" placeholder="${saveAsPlaceholder }" /> 
        		    <span class="input-group-btn">
			          <button class="btn btn-primary" type="submit">
			            <fmt:message key="global.button.upload"/><span class="glyphicon glyphicon-upload"></span>
			          </button>
			        </span>
   				 </form:form>
			      </div>
	        </div>
	      </div>
   	 </li>
   	 
  </ul>
 </div>     

    <div class="col-sm-8" style="height:90%">
        <h4 id="xmlTitle"><span>&nbsp;</span></h4>
    	<div id="xmlDisplayDiv" class="container-fluid"></div>
		<div id="xmlControlBar">
			<input type="text" id="txtID"  placeholder="<fmt:message key="global.placeholder.search"/>"/> <a href="javascript:void(0)" onclick='searchDiv("xmlDisplayDiv",$("#txtID").val(),"srchCnt")'><span class="glyphicon glyphicon-search"></span></a>
			<span width='10'>&nbsp;</span> 
 			<button id="btnPrint" type="button" class="btn btn-primary"><fmt:message key="global.button.print"/> <span class="glyphicon glyphicon-print"></span></button>
  			<button id="btnDelete" type="button" class="btn btn-danger"><fmt:message key="global.button.delete"/> <span class="glyphicon glyphicon-trash"></span></button>
			<br/>
			<div id="srchCnt"></div>
			
		</div>
    </div>
  </div>
</div>

<%@ include file="includes/footer.jsp" %>    
</body>
</html>
