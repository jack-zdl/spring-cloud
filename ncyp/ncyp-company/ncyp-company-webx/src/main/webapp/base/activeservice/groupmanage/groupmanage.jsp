<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.common.system.constants.ErrorCodeConstants"%>
<%@page import="com.ceying.chx.common.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_BASE_MAIL_GROUPS_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#activeservice/groupmanage/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#activeservice/groupmanage/edit\"%>" onClick="editFn" />
<r:button text="配置" iclass="fa-gears" visible="<%=userid+\"#activeservice/groupmanage/set\"%>" onClick="setFn" />
<r:button text="激活" iclass="fa-link" visible="<%=userid+\"#activeservice/groupmanage/active\"%>" onClick="activeFn" />
<r:button text="冻结" iclass="fa-chain-broken" visible="<%=userid+\"#activeservice/groupmanage/close\"%>" onClick="closeFn" />
<r:win title="新增" id="addModal" width="800" height="400"/>
<r:win title="修改" id="editModal" width="800" height="400" />
<r:win title="配置" id="setModal" maxable="true" />

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
        var url = "${pageContext.request.contextPath}/base/activeservice/groupmanage/groupmanageadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/activeservice/groupmanage/groupmanageadd.jsp?type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var closeFn=function(){
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
             url: "${pageContext.request.contextPath}/activeservice/groupmanage/close.do",
             params: {
                 ids: pksArray.join(",")
             },
             ok: function(text) {
                 clearCache(['UC_BASE_MAIL_GROUPS_SEARCH']);
                 $.RMessage.alert("消息", text.msg, refresh);
             },
             err: function(text) {
                 $.RMessage.alert("消息", text.msg);
             }
        });
    }

    var activeFn=function(){
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
             url: "${pageContext.request.contextPath}/activeservice/groupmanage/active.do",
             params: {
                 ids: pksArray.join(",")
             },
             ok: function(text) {
                 clearCache(['UC_BASE_MAIL_GROUPS_SEARCH']);
                 $.RMessage.alert("消息", text.msg, refresh);
             },
             err: function(text) {
                 $.RMessage.alert("消息", text.msg);
             }
        });
    }

    var setFn=function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/activeservice/groupmanage/groupmanageset.jsp?type=set&urid=" + rowData[0].urid;
        $("#setModal").RWin("createWin", url);
    }
</script>