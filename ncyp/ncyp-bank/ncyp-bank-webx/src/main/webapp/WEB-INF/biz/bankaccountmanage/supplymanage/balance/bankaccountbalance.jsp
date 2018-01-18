<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants" %>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = String.valueOf(currUser.getTenant_id());
    String queryuc = "UC_SCS_BA_SUPPLYBANKACCOUNTBALANCE_SEARCH";
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

<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/del\"%>" onClick="delFn" />
<r:button text="余额获取" iclass="fa-paper-plane" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/getbalance\"%>" onClick="getbalanceFn" />
<r:button text="下载余额模板" iclass="fa-download" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/downloadtemplate\"%>" onClick="downloadtemplateFn" />
<r:button text="余额导入" iclass="fa-upload" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/importbalance\"%>" onClick="importbalanceFn" />

<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="导入" id="importModal" maxable="true" />
<r:win title="余额获取" id="getBalanceModal" maxable="true"/>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#importModal").modal("hide");
        $("#getBalanceModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/balance/bankaccountbalanceadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/balance/bankaccountbalanceadd.jsp?type=mod&urid=" + rowData[0].urid;
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
                url: "${pageContext.request.contextPath}/supplybkaccountmanage/bankaccountbalance/del.do",
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
        });
    }

    var getbalanceFn = function () {
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/balance/bankaccountbalancequery.jsp";
        $("#getBalanceModal").RWin("createWin", url);
    }

    var downloadtemplateFn = function () {
        window.open("${pageContext.request.contextPath}/fileDownload?filePath=/template/bankbalance.xls");
    }

    var importbalanceFn = function () {
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/balance/bankaccountbalanceimport.jsp";
        $("#importModal").RWin("createWin", url);
    }
</script>