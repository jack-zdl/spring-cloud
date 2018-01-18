<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String tenantId = request.getParameter("tenantId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(tenantId)){
        editFlag = true;
    }else{
    	tenantId = "";
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
            <span class="block_title">租户管理</span>
        </div>
        <div class="operation_block">
            <form id="tenantform" class="main_form">
                <input type="hidden" id="tenantId" name="tenantId" value="<%=tenantId%>"/>
                <r:tinyPanel title="租户信息" iconCls="none" column="2" hasHeader="false">
                    <r:panelItem>
                        <r:textField textAlign="left" id="tenantName" name="tenantName" title="租户名称" check="required:true" />
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="tenantCode" name="tenantCode" title="租户编号" check="required:true"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="address" name="address" title="地址" check="required:true"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="contact" name="contact" title="法人" check="required:true"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="mobile" name="mobile" title="法人手机号" check="required:true,cellphone"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="tenantShortname" name="tenantShortname" title="租户英文简称"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="tenantCnshortname" name="tenantCnshortname" title="租户中文简称"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="telno" name="telno" title="固定电话" check="telephone"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="email" name="email" title="法人邮箱" check="email"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="tenantOrder" name="tenantOrder" title="排序"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textArea textAlign="left" id="remark" name="remark" title="备注"/>
                    </r:panelItem>
                    <%-- <jsp:include page="/common/wedget/combo.jsp">
		                	<jsp:param name="id" value="tenantStatus"/>
		                	<jsp:param name="valueField" value="tenantStatus"/>
		                	<jsp:param name="title" value="租户状态"/>
		                    <jsp:param name="IsUseBFn" value="0"/>
		                    <jsp:param name="check" value="required"/>
		                    <jsp:param name="keyno" value="1001"/>
		           	 	</jsp:include> --%>
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
                url: "${pageContext.request.contextPath}/tenant/page.do",
                method: "post",
                params: {
                	tenantId: "<%=tenantId%>"
                },
                ok: function(text){
                    $("#tenantform").RForm({value:text});
                    $('#tenantCode').RTextField('setReadOnly',true);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
        $("#tenantform").RValidate();
        if(!$("#tenantform").RValidate('validate')){
            return;
        }
        var params = $("#tenantform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/tenant/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.tenantCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function close(){
    	parent.tenantCloseWinFn();
    }
</script>