<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.util.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_BASE_BANK_DIRECTCHANNEL_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="生效" iclass="fa-link" visible="<%=userid+\"#sysbank/directchannel/validate\"%>" onClick="validateFn" />
<r:button text="失效" iclass="fa-chain-broken" visible="<%=userid+\"#sysbank/directchannel/invalidate\"%>" onClick="invalidateFn" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    var validateFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        if(pksArray.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysbank/directchannel/validate.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
            	clearCache(['UC_BASE_BANK_DIRECTCHANNEL_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var invalidateFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        if(pksArray.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysbank/directchannel/invalidate.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
            	clearCache(['UC_BASE_BANK_DIRECTCHANNEL_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

</script>