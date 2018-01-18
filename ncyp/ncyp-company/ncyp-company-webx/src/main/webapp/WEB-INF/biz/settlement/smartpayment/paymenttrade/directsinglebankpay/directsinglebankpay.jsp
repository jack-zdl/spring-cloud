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
    String queryuc = "UC_SCS_SE_DIRECTSGLBANKPAY_SEARCH";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:buttonList>
	<r:button text="新增" iclass="fa-plus" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpayadd\"%>" onClick="addFn" />
	<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpayedit\"%>" onClick="editFn" />
	<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpaydel\"%>" onClick="delFn" />
	<r:button text="送审" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpaysendappover\"%>" onClick="sendappover" />
	<r:button text="查询状态" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpayquerypaystate\"%>" onClick="querypaystateFn" />
	<r:button text="作废" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpaycancel\"%>" onClick="cancelFn" />
	<r:button text="付款" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpaypay\"%>" onClick="payFn" />
	<r:button text="下载直联单笔付款单模板" iclass="fa-download" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpaydownloadtemplate\"%>" onClick="downloadtemplateFn" />
	<r:button text="直联单笔付款单导入" iclass="fa-upload" visible="<%=userid+\"#smartpayment/paymenttrade/directsglbankpayimportdata\"%>" onClick="importdataFn" />
</r:buttonList>
<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="详情页面" id="detailModal" maxable="true" />
<r:win title="确认支付" id="ispayModal" maxable="true"  />
<r:win title="直联单笔付款单导入" id="importModal" maxable="true" />
<r:win id="flowwin" title="流程图" modal="true" dragable="true" maxable="false" maximized="true" isIframe="true"/>
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="onRowDbClick" value="onRowDbClick" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#importModal").modal("hide");
        $("#ispayModal").modal("hide");
        $("#flowwin").modal("hide");
        exeComQuery();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpayadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaycheck.do",
            params: {
                urid: rowData[0].urid
            },
            ok: function(text) {
            	var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpayadd.jsp?type=mod&urid=" + rowData[0].urid;
                $("#editModal").RWin("createWin", url);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var delFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除", function(){
        	Ajax.req({
                url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaydel.do",
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
    
    var sendappover = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
       	Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaysendappover.do",
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
    }
    
    var querypaystateFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
      Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpayquerypaystate.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            }
        });

    }
    
    var cancelFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaycancel.do",
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
    }
    
    var payFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        var switchorgid = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
            switchorgid.push(rowData[i].orgid);
        }
      Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaypay.do",
            params: {ids: pksArray.join(","),
                    orgid: switchorgid.join(","),
                    isconfirmpay:"false"},
            ok: function (text) {
                var fladmsg = text.flagmsg;
                var str = JSON.stringify(fladmsg)
                var cfzfmsg = text.cfzfmsg;
                if (text.flag == "true") {
                    var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/confirmpay.jsp?flagmsg="+str+"&ids="+pksArray.join(",")+"&orgid="+switchorgid.join(",")+"&cfzfmsg="+cfzfmsg;
                    $("#ispayModal").RWin("createWin", url);
                } else{
                   $.RMessage.alert("消息", text.msg, refresh);
                }
            },
            err: function (text) {
               $.RMessage.alert("消息", text.msg, refresh);
            }
        });
    }

    var onRowDbClick = function(id, data){
        if ((data["approvestate"] == <%=ENApproveState.NOTAPPROVE.getValue()%>) && data["cancelstate"] == <%=ENCancelState.NOCANCEL.getValue()%>) {
            var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpaydetail.jsp?urid=" + data["urid"];
            $("#detailModal").RWin("createWin", url);
        } else {
            var viewjsp = '${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglediffbankpayinfo.jsp?urid=' + data['urid'];
            taskindexopen(data['urid'], viewjsp);
        }
    }

    /**
     *打开任务处理页面
     * @param params 请求参数，一般为urid
     * @param viewjsp
     */
    function taskindexopen(params, viewjsp) {
        Ajax.req({
            url: '${pageContext.request.contextPath}/common/applytask.jsp?urid=' + params,
            type: "json",
            ok: function (text) {
                var entity = jQuery.parseJSON(text);
                if (entity.data[0]['taskId'] != null && entity.data[0]['taskId'] != "") {
                    var paras = {};
                    paras.taskId = entity.data[0]['taskId'];
                    paras.userId = entity.data[0]['userId'];
                    workflow.taskwindow.callBack = callBackGrid;
                    workflow.taskwindow.open(paras);
                } else {
                    $("#flowwin").RWin("createWin", viewjsp);
                }
            },
            err: function (text) {
                $.RMessage.alert("消息",text || "操作失败！", refresh);
            }
        });
    }

    var callBackGrid = function () {
    };
    
    var downloadtemplateFn = function () {
        window.open("${pageContext.request.contextPath}/fileDownload?filePath=/template/directsinglediffbankpay.xls");
    }

    var importdataFn = function () {
        var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpayimport.jsp?code=directsglbankpayimportdata";
        $("#importModal").RWin("createWin", url);
    }
</script>