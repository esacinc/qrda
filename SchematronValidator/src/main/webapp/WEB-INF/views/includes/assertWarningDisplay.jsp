	<%-- This snippet of code displays the data from a critical assert.  --%>				    			   	 
	<table  >
     <c:if test="${failure.lineNumber > -1 }"> <%-- If there is no valid line number, then there is no data from the test file. So don't show it... --%>
   	 	<tr><td class='btn-warning'colspan='2' style="white-space:nowrap;"><fmt:message key="workbench.failure.source"/> <fmt:message key="workbench.failure.atLine"/> ${failure.lineNumber } <fmt:message key="workbench.failure.toLine"/> ${failure.endLineNumber }</td></tr>
   	 	<tr><td >&nbsp;</td><td><textarea style="width:100%;height:100px;border:none;">${failure.sourceNode}</textarea></td></tr>
   	 </c:if>
 	<tr><td class='btn-warning' style="white-space:nowrap;"><fmt:message key="workbench.failure.statement"/> </td><td>${failure.statement }</td></tr>
 	<tr><td class='btn-warning' style="white-space:nowrap;"><fmt:message key="workbench.failure.test"/> </td><td>${failure.test }</td></tr>
 	<tr><td class='btn-info' style="white-space:nowrap;"><fmt:message key="workbench.failure.rule"/> </td><td>${failure.rule }</td></tr>
    <tr><td class='btn-info' style="white-space:nowrap;"><fmt:message key="workbench.failure.assert"/> </td><td>${failure.id }</td></tr>
 	<tr><td class='btn-info' style="white-space:nowrap;"><fmt:message key="workbench.failure.context"/> </td><td>${failure.context }</td></tr>
 	<tr><td class='btn-info' style="white-space:nowrap;"><fmt:message key="workbench.failure.location"/></td><td>${failure.location }</td></tr>
   	 </table>
