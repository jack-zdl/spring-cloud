<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />
<body >
<%
	String queryuc = "UC_SYS_USER_ALLOCATESEARCHROLE";
    String userId = request.getParameter("userid");
    String condition = "{'userId':'" + userId + "','isallocate':'1'}";
%>

    <div class="grid_wrap">
        <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/sysuser/queryRoleAllocate.do"
                baseParams="<%=condition%>"
                colModel="{name : 'is_Allocate',index : 'isAllocate',sortable:false},
                            {name : 'roleCode',index : 'orgCode',sortable:false},
                            {name : 'roleName',index : 'orgName',sortable:false}"
                colNames="'是否已分配','角色编码','角色名称'" multiSelect="true" ></r:grid>
    </div>

</body>
</html>