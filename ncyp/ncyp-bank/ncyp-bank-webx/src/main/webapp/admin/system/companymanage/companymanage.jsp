<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    String queryuc = "UC_SYS_ENTERPRISE_SEARCH";
    SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = currUser.getTenantId().toString();
    String condition = "tenant_id="+tenantid;
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#tenantmanage/tenant/edit\"%>" onClick="edit"/>
<r:win title="修改" id="editModal" maxable="true"/>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        exeComQuery();
    };

    var edit = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length != 1){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/companymanage/companyadd.jsp?type=mod&urid="+rowDatas[0].tenant_id;
        $("#editModal").RWin('createWin',url);
    };
</script>