<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
    String queryuc = "UC_BASE_CHANNEL_CHANNELCONDITION_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#channel/channelcondition/add\"%>" onClick="addFn"/>
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#channel/channelcondition/edit\"%>" onClick="editFn"/>
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#channel/channelcondition/del\"%>" onClick="delFn"/>
<r:button text="条件设置" iclass="fa-remove" visible="<%=userid+\"#channel/channelcondition/set\"%>" onClick="setFn"/>
<r:win title="新增渠道条件" id="addModal"  width="800" height="500"/> 
<r:win title="修改渠道条件" id="editModal" width="800" height="500"/>
<r:win title="渠道条件设置" id="setModal" width="800" height="500"/>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<script type="text/javascript">

    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#setModal").modal("hide");
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }
    
    var addFn = function(){
        var url = "${pageContext.request.contextPath}/base/channel/channelconditionadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/channel/channelconditionadd.jsp?type=mod&urid="+rowData[0].urid;
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
        $.RMessage.confirm("消息", "是否确认删除？", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/channel/channelcondition/del.do",
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
    
    var setFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/channel/channelconditionset.jsp?urid="+rowData[0].urid;
	   	$("#setModal").RWin("createWin", url);
    };

</script>