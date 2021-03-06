<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@page import="com.ceying.chx.common.system.constants.ErrorCodeConstants"%>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = String.valueOf(currUser.getTenant_id());
    String queryuc = "UC_BASE_CHANNEL_GATEWAY_SEARCH";
    String condition;
    if(tenantid.equals(CommonConstants.SUPERTENANT)){
        condition="&gridtenantid=";
    }else{
        condition="&gridtenantid="+tenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#channel/gatewaydefinition/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#channel/gatewaydefinition/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#channel/gatewaydefinition/del\"%>" onClick="delFn" />
<r:button text="生效" iclass="fa-link" visible="<%=userid+\"#channel/gatewaydefinition/valid\"%>" onClick="validFn" />
<r:button text="失效" iclass="fa-chain-broken" visible="<%=userid+\"#channel/gatewaydefinition/invalid\"%>" onClick="invalidFn" />
<r:win title="新增" id="addModal" maxable="true"/>
<r:win title="修改" id="editModal" maxable="true" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/base/channel/gatewaydefinitionadd.jsp?" +
            "type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/channel/gatewaydefinitionadd.jsp?" +
            "type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/channel/gatewaydefinition/del.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        });
    }

    var validFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/channel/gatewaydefinition/valid.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var invalidFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/channel/gatewaydefinition/invalid.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
</script>
