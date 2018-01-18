<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.utils.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_BASE_BANK_BANKLOCATIONS_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="修改联行号类型" iclass="fa-pencil-square-o" visible="<%=userid+\"#smartcenter/cnapssmartmatch/edit\"%>" onClick="editFn" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:win title="修改联行号类型" id="editModal"  width="400" height="230"/>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/smartcenter/cnapssmartmatch/cnapssmartmatchadd.jsp?urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

</script>
