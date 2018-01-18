<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.biz.constants.ENSource"%>
<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants" %>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = String.valueOf(currUser.getTenant_id());
    String queryuc = "UC_SCS_BA_SUPPLYBANKACCOUNTDETAIL_SEARCH";
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
<r:buttonList>
	<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/add\"%>" onClick="addFn" />
	<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/edit\"%>" onClick="editFn" />
	<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/del\"%>" onClick="delFn" />
    <r:button text="获取历史明细" iclass="fa-paper-plane" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/getdetail\"%>" onClick="getTransactionFn" />
    <r:button text="获取当天明细" iclass="fa-paper-plane-o" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/getflow\"%>" onClick="getDaybookFn" />
    <r:button text="下载明细模板" iclass="fa-download" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/downloadtemplate\"%>" onClick="downloadtemplateFn" />
    <r:button text="明细导入" iclass="fa-upload" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/importdetail\"%>" onClick="importdetailFn" />
    <r:button text="手工核对" iclass="fa-check" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/importdetail\"%>" onClick="manualcheckFn" />
    <r:button text="取消核对" iclass="fa-times" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/importdetail\"%>" onClick="cancelcheckFn" />
    <r:button text="发布认领公告" iclass="fa-share-alt" visible="<%=userid+\"#supplybkaccountmanage/bankaccountdetail/importdetail\"%>" onClick="publishbulletinFn" />
</r:buttonList>

<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="明细导入" id="importModal" maxable="true" />
<r:win title="获取历史明细" id="getdetailModal" maxable="true" />
<r:win title="获取当天明细" id="getflowModal" maxable="true" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#importModal").modal("hide");
        $("#getdetailModal").modal("hide");
        $("#getflowModal").modal("hide");
        exeComQuery();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/transactiondetail/banktransactiondetailadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var source = rowData[0].sourcevalue;
        if(source != <%=ENSource.HAND.getValue()%>){
            $.RMessage.alert("消息", "只有手工导入的明细才允许修改！");
            return;
        }
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/transactiondetail/banktransactiondetailadd.jsp?type=mod&urid=" + rowData[0].urid;
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
                url: "${pageContext.request.contextPath}/supplybkaccountmanage/bankaccountdetail/del.do",
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

    var getTransactionFn = function () {
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/transactiondetail/bankaccounttransactionquery.jsp";
        $("#getdetailModal").RWin("createWin", url);
    }

    var getDaybookFn = function () {
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/transactiondetail/bankaccountdaybooksquery.jsp";
        $("#getflowModal").RWin("createWin", url);
    }

    var downloadtemplateFn = function () {
        window.open("${pageContext.request.contextPath}/fileDownload?filePath=/template/banktransaction.xls");
    }

    var importdetailFn = function () {
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/supplymanage/transactiondetail/bankaccounttransactionimport.jsp";
        $("#importModal").RWin("createWin", url);
    }

    var manualcheckFn = function () {

    }

    var cancelcheckFn = function () {

    }

    var publishbulletinFn = function () {

    }
</script>