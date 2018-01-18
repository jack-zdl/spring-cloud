<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_SCS_TA_PURCHASETRADETRANSACTIONS_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#purchasetdaccountmanage/tradetransactions/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#purchasetdaccountmanage/tradetransactions/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-gears" visible="<%=userid+\"#purchasetdaccountmanage/tradetransactions/del\"%>" onClick="delFn" />
<r:win title="新增" id="addModal" width="850" height="350" />
<r:win title="修改" id="editModal" width="850" height="350" />

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
        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetradetransactionsadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetradetransactionsadd.jsp?type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn=function(){
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
                 url: "${pageContext.request.contextPath}/purchasetdaccountmanage/tradetransactions/del.do",
                 params: {
                     urids: pksArray.join(",")
                 },
                 ok: function(text) {
                     clearCache(['UC_SCS_TA_SUPPLYTRADEBALANCES_SEARCH']);
                     $.RMessage.alert("消息", text.msg, refresh);
                 },
                 err: function(text) {
                     $.RMessage.alert("消息", text.msg);
                 }
             });
        });
    }
</script>