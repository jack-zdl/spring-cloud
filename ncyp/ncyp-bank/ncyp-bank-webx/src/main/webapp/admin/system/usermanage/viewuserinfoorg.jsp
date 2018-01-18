<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<body >
<%
	String queryuc = "UC_SYS_USER_ORGINFO";
    String userId = request.getParameter("userid");
	String condition = "{'userId':'" + userId + "','isallocate':'1'}";
%>

<div class="grid_wrap">
    <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/sysuser/queryOrgAllocate.do"
            baseParams="<%=condition%>"
            colModel="{name : 'orgId',index : 'orgId',sortable:false, hidden:true},
                        {name : 'is_Allocate',index : 'isAllocate',sortable:false},
                        {name : 'orgCode',index : 'orgCode',sortable:false},
                        {name : 'org_Level',index : 'orgLevel',sortable:false},
                        {name : 'orgName',index : 'orgName',sortable:false}"
            colNames="'组织ID','是否已分配','组织编码','组织级别','组织名称'" multiSelect="true"></r:grid>
</div>

</body>
</html>