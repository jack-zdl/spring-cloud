<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.common.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_BASE_BANK_BANKS_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="直联" iclass="fa-gears" visible="<%=userid+\"#sysbank/bank/direct\"%>" onClick="directFn" />
<r:button text="非直联" iclass="fa-gears" visible="<%=userid+\"#sysbank/bank/nodirect\"%>" onClick="nodirectFn" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<script>
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    function directFn(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
             url: "${pageContext.request.contextPath}/sysbank/bank/direct.do",
             params: {
                 ids: pksArray.join(",")
             },
             ok: function(text) {
                 $.RMessage.alert("消息", text.msg, refresh);
             },
             err: function(text) {
                 $.RMessage.alert("消息", text.msg);
             }
        });
    }

    function nodirectFn(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
             url: "${pageContext.request.contextPath}/sysbank/bank/nodirect.do",
             params: {
                 ids: pksArray.join(",")
             },
             ok: function(text) {
                 $.RMessage.alert("消息", text.msg, refresh);
             },
             err: function(text) {
                 $.RMessage.alert("消息", text.msg);
             }
        });
    }

</script>