<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant"  %>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    int tenantid = 0;
	String orgid = "";
	if(currUser!=null){
		tenantid = currUser.getTenantId();
		orgid = currUser.getOrgId();
	}
    String urid = request.getParameter("urid");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(urid)){
        editFlag = true;
    }else{
    	urid = "";
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sass平台</title>

    <jsp:include page="/common/include.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/RUI/themes/green/combo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/RUI/themes/green/combogrid.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/form.js"></script>
</head>
<body class="body_col_o">
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">账户管理</span>
        </div>
        <div class="operation_block">
            <form id="accountform" class="main_form">
                <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
                <input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
                <input type="hidden" id="rowversion" name="rowversion"/>
                <input type="hidden" id="accounttype" name="accounttype" value="1"/>
                <input type="hidden" id="orgid" name="orgid" value="<%=orgid%>"/>
                <r:tinyPanel title="账户信息" iconCls="none" column="2" hasHeader="false">
                    <r:panelItem>
                        <r:textField textAlign="left" id="bankaccountname" name="bankaccountname" title="户名" check="required:true" />
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="bankaccountnumber" name="bankaccountnumber" title="银行卡号 " check="required:true"/>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="bankid"/>
                            <jsp:param name="valueField" value="urid"/>
                            <jsp:param name="displayField" value="name"/>
                            <jsp:param name="title" value="银行"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/bank/page.do"/>
                            <jsp:param name="SelFn" value="bankidSelFn" />
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="banklocationid"/>
                            <jsp:param name="valueField" value="urid"/>
                            <jsp:param name="displayField" value="name"/>
                            <jsp:param name="title" value="开户行"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/banklocation/page.do"/>
                            <jsp:param name="BFn" value="banklocationBF" />
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
	                    <jsp:include page="/common/wedget/combo.jsp">
			                	<jsp:param name="id" value="isbankdirect"/>
			                	<jsp:param name="valueField" value="isbankdirect"/>
			                	<jsp:param name="title" value="是否直联"/>
			                    <jsp:param name="IsUseBFn" value="0"/>
			                    <jsp:param name="check" value="required"/>
			                    <jsp:param name="keyno" value="1001"/>
			           	</jsp:include>
		           	</r:panelItem>
                    <r:panelItem>
                        <r:textArea textAlign="left" id="description" name="description" title="描述"/>
                    </r:panelItem>
                </r:tinyPanel>
            </form>
        </div>
        <div class="operation_btn">
            <r:button text="保存" onClick="save"/>
            <r:button text="返回" onClick="close"/>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function(){
        if(<%=editFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/account/page.do",
                method: "post",
                params: {
                	urid: "<%=urid%>",
                	tenantid: '<%=tenantid%>'
                },
                ok: function(text){
                    $("#accountform").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
    	$("#accountform").RValidate();
    	if(!$("#accountform").RValidate('validate')){
    	    return;
    	}
        var params = $("#accountform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/account/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.closeWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function close(){
    	parent.closeWinFn();
    }
    
    var banklocationBF = function(){
        var bankid = $("#bankid").val();
        return [{"bankid":bankid}];
    }
    
    var bankidSelFn = function(){
        $('#banklocationid').RComboGrid('setAllValue',['','']); 
    }
</script>