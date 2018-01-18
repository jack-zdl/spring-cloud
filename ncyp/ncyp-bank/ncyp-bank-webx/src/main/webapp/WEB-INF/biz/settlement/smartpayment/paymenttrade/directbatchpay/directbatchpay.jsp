<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@	page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@	page import="com.ceying.chx.biz.constants.ENApproveState"%>
<%@	page import="com.ceying.chx.biz.constants.ENCancelState"%>
<%@	page import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_SCS_SE_DIRECTBATCHPAY_SEARCH";
    String tenantid = currUser.getTenant_id().toString();
    String condition = "";
    if(!tenantid.equals(CommonConstants.SUPERTENANT)) {
        condition = "tenantid="+tenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:buttonList>
	<r:button text="送审" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpaysendappover\"%>" onClick="sendappover" />
	<r:button text="查询状态" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpayquerypaystate\"%>" onClick="querypaystateFn" />
	<r:button text="付款" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpaypay\"%>" onClick="payFn" />
	<r:button text="下载直联批量付款单模板" iclass="fa-download" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpaydownloadtemplate\"%>" onClick="downloadtemplateFn" />
	<r:button text="直联批量付款单导入" iclass="fa-upload" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpayimportdata\"%>" onClick="importdataFn" />
</r:buttonList>
<r:win title="交易单列表" id="detailModal" maxable="true" />
<r:win title="直联批量付款单导入" id="importModal" maxable="true" />
<r:win title="直联批量付款确认" id="isbatchpayModal" maxable="true" />
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="onRowDbClick" value="onRowDbClick" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#importModal").modal("hide");
        $("#isbatchpayModal").modal("hide");
        exeComQuery();
    }
    var refresh = function(){
        exeComQuery();
    }

    var sendappover = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].passelno);
        }
       	Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directbatchpaysendappover.do",
            params: {
                passelno: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var querypaystateFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].passelno);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directbatchpayquerypaystate.do",
            params: {
                passelno: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var payFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].passelno);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directbatchpaypay.do",
            params: {
                passelno: pksArray.join(","),
                isconfirmpay:"false"
            },
            ok: function(text) {
                var fladmsg = text.flagmsg;
                var str = JSON.stringify(fladmsg)
                var cfzfmsg = text.cfzfmsg;
                if (text.flag == "true") {
                    var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directbatchpay/batchpayconfirmpay.jsp?flagmsg="+str+"&cfzfmsg="+cfzfmsg+"&passelno="+pksArray.join(",");
                    $("#isbatchpayModal").RWin("createWin", url);
                } else{
                    $.RMessage.alert("消息", text.msg, refresh);
                }
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var onRowDbClick = function(id, data){
    	var passelno = data['passelno'];
    	var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directbatchpay/directbatchpaydetail.jsp?passelno=" + passelno;
        $("#detailModal").RWin("createWin", url);
    }
    
    var downloadtemplateFn = function () {
        window.open("${pageContext.request.contextPath}/fileDownload?filePath=/template/directbatchpay.xls");
    }

    var importdataFn = function () {
        var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directbatchpay/directbatchpayimport.jsp?code=directbatchpayimportdata";
        $("#importModal").RWin("createWin", url);
    }
    
</script>