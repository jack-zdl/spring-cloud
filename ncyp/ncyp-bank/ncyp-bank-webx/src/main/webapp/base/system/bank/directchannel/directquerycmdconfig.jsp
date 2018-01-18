<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.util.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_BASE_BANK_DIRECTQUERYCMDCONFIG_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#sysbank/directquerycmdconfig/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#sysbank/directquerycmdconfig/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#sysbank/directquerycmdconfig/del\"%>" onClick="delFn" />
<r:win title="新增" id="addModal" width="800" height="500" />
<r:win title="修改" id="editModal" width="800" height="500"/>

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

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/base/system/bank/directchannel/directquerycmdconfigadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/system/bank/directchannel/directquerycmdconfigadd.jsp?type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        if(pksArray.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        $.RMessage.confirm("消息", "是否确认删除", function(){
        	Ajax.req({
                url: "${pageContext.request.contextPath}/sysbank/directquerycmdconfig/del.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                	clearCache(['UC_BASE_BANK_DIRECTQUERYCMDCONFIG_SEARCH']);
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        });
    }
</script>