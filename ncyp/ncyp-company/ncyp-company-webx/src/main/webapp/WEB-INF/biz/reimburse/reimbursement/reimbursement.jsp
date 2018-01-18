<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_SCS_RB_REIMBURSEMENT_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:win title="明细" id="detailModal" maxable="true" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="onRowDbClick" value="dbClick" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#detailModal").modal("hide");
        exeComQuery();
    }
    var refresh = function(){
        exeComQuery();
    }
    
    var dbClick = function(id, data){
    	var url = "${pageContext.request.contextPath}/scs/reimburse/reimbursement/reimbursementdetail.jsp?urid="+data["urid"];
        $("#detailModal").RWin("createWin", url);
    }


</script>