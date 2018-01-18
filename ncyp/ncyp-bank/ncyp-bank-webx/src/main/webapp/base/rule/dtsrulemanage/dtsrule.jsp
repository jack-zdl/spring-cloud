<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.util.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String typename = "typename="+ request.getParameter("typename");
    String queryuc = "UC_BASE_IO_OBJRULE_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=typename %>"/>
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#rule/dtsrulemanage/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#rule/dtsrulemanage/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#rule/dtsrulemanage/del\"%>" onClick="delFn" />
<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=typename %>"/>
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
        var url = "${pageContext.request.contextPath}/base/rule/dtsrulemanage/dtsruleadd.jsp?type=add&<%=typename%>";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/rule/dtsrulemanage/dtsruleadd.jsp?type=mod&<%=typename%>&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/rule/dtsrulemanage/del.do",
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