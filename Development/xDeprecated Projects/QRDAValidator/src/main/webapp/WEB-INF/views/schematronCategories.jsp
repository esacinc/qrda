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

	<%@ include file="includes/schematronCategoriesScripts.jsp" %>
    
</head>

<body style="height:100%">
<div class="container-fluid" style="height:95%">
  <%@ include file="includes/topNavBar.jsp" %>
  <div class="row content"  style="height:90%;overflow-y:scroll;">
    <div class="col-sm-4 sidenav"  style="height:100%;overflow-y:auto;">
      <h4><fmt:message key="category.manage.title"/></h4>
      <br/>
       <hr/>
     <ul class="nav nav-pills nav-stacked">
   </ul>
 </div>     

	<div class="col-sm-8" style="height:100%">
	    <div class="panel-body bg-info"><h4><fmt:message key="category.manage.current"/></h4></div>
		<br/>
		<form:form method="post" action="${saveURL}" modelAttribute="categoryForm">
			<table>
			<tr>
				<th><span style="margin-right:5px;"><fmt:message key="global.delete"/> <a href="" onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="category.manage.info.title.delete"/>' data-content='<fmt:message key="category.manage.info.instr.delete"/>' ><span class='glyphicon glyphicon-info-sign'></span></a></span></th>
				<th><fmt:message key="category.manage.name"/> <a href="" onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="category.manage.info.title.name"/>' data-content='<fmt:message key="category.manage.info.instr.name"/>' ><span class='glyphicon glyphicon-info-sign'></span></a></th>
				<th><fmt:message key="category.manage.displayName"/> <a href="" onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="category.manage.info.title.displayName"/>' data-content='<fmt:message key="category.manage.info.instr.displayName"/>' ><span class='glyphicon glyphicon-info-sign'></span></a></th>
				<th><fmt:message key="global.active"/> <a href="" onClick='javascript:return false;' data-toggle='popover' title='<fmt:message key="category.manage.info.title.active"/>' data-content='<fmt:message key="category.manage.info.instr.active"/>' ><span class='glyphicon glyphicon-info-sign'></span></a></th>
				
			</tr>
			<c:forEach items="${categoryForm.categoryList}" var="category" varStatus="status">
			     <input type='hidden' name="categoryList[${status.index}].origName" value="${category.origName}"/>
				<tr>    
					<td><span style="margin-right:10px"><a  href="${removeURL }${category.name}" onClick="return confirm('<fmt:message key="category.manage.deleteWarn"/>');" ><span class="glyphicon glyphicon-remove text-danger" ></span></a></span></td>
					<td><input name="categoryList[${status.index}].name" value="${category.name}"/></td>
					<td><input name="categoryList[${status.index}].displayName" value="${category.displayName}"/></td>
					<td><span style="margin-left:10px"><input type='radio' name="categoryList[${status.index}].active" value='true' <c:if test='${category.active}'>checked</c:if>/> <fmt:message key="global.yes"/>  <input type='radio' name="categoryList[${status.index}].active" value='false' <c:if test='${!category.active}'>checked</c:if>/> <fmt:message key="global.no"/> </span></td>
				</tr>
			</c:forEach>
			</table>	
			<br/>
			<input type="submit" class="btn btn-primary" value="<fmt:message key="global.button.save"/>" />
		</form:form>
		<br/>
		<div class="panel-body bg-info">
		<h4><fmt:message key="category.manage.add"/></h4>
		<form:form method="post" action="${addURL }" modelAttribute="addCategoryForm">
			<fmt:message key="category.manage.name"/>: <form:input path="name"/> <fmt:message key="category.manage.displayName"/>: <form:input path="displayName" /> <fmt:message key="global.active"/>: <form:radiobutton path="active" value='true'/> <fmt:message key="global.yes"/>  <form:radiobutton path="active" value='false'/> <fmt:message key="global.no"/>  <input type="submit" class="btn btn-primary" value="<fmt:message key="global.button.add"/>" />
		</form:form>
		</div>	
	</div>

</div>

<%@ include file="includes/footer.jsp" %>  
</div>  
</body>
</html>
