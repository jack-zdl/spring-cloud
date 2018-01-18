<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.utils.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_BASE_WARNINGMESSAGE_SEARCH";
    String warningruleid = request.getParameter("warningruleid");
    String isannul = request.getParameter("isannul");
    String condition = "userid=" + userid + "&warningruleid=" + warningruleid;
    if("0".equals(isannul)){
        condition += "&isannul=0";
    }else if("1".equals(isannul)){
        condition += "&isannul=1";
    }

%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<%if("0".equals(isannul)){%>
<r:button text="撤销" iclass="fa-plus" visible="<%=userid+\"#warning/warningmessage/annul\"%>" onClick="annulFn" />
<%}%>
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>"/>
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    var annulFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认撤销！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/warning/warningmessage/annul.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.msg);
                }
            });
        });
    }
</script>