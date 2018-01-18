<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_SCS_TA_SUPPLYSPLITRULES_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#supplytdaccountmanage/supplysplitrules/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#supplytdaccountmanage/supplysplitrules/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#supplytdaccountmanage/supplysplitrules/del\"%>" onClick="delFn" />
<r:button text="激活" iclass="fa-link" visible="<%=userid+\"#supplytdaccountmanage/supplysplitrules/active\"%>" onClick="activeFn" />
<r:button text="冻结" iclass="fa-chain-broken" visible="<%=userid+\"#supplytdaccountmanage/supplysplitrules/freeze\"%>" onClick="freezeFn" />
<r:win title="新增" id="addModal" width="800" height="500" />
<r:win title="修改" id="editModal" width="800" height="500" />

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
        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/supply/supplysplitrulesadd.jsp??type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/supply/supplysplitrulesadd.jsp?type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var freezeFn=function(){
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
             url: "${pageContext.request.contextPath}/supplytdaccountmanage/supplysplitrules/freeze.do",
             params: {
                 urids: pksArray.join(",")
             },
             ok: function(text) {
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
             url: "${pageContext.request.contextPath}/supplytdaccountmanage/supplysplitrules/active.do",
             params: {
                 urids: pksArray.join(",")
             },
             ok: function(text) {
                 $.RMessage.alert("消息", text.msg, refresh);
             },
             err: function(text) {
                 $.RMessage.alert("消息", text.msg);
             }
        });
    }

    var delFn=function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length == 0){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        if(rowData.length > 0){
            $.RMessage.confirm("消息", "是否确认删除！",function(){
                var pksArray = new Array();
                for(var i=0; i<rowData.length; i++){
                    pksArray.push(rowData[i].urid);
                }
                Ajax.req({
                     url: "${pageContext.request.contextPath}/supplytdaccountmanage/supplysplitrules/del.do",
                     params: {
                         urids: pksArray.join(",")
                     },
                     ok: function(text) {
                         $.RMessage.confirm("消息", text.msg, refresh);
                     },
                     err: function(text) {
                         $.RMessage.alert("消息", text.msg);
                     }
                });
            });
        }
    }
</script>