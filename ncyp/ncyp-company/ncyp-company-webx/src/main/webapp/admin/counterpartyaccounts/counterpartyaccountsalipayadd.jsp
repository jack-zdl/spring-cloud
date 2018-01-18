<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%

    String accounttype="";
    String urid = request.getParameter("urid");

    boolean editFlag = false;
    boolean flag = false;
    if(StringUtils.isNotBlank(urid)){

        editFlag = true;
    }else{
        accounttype =request.getParameter("accounttype");
        flag=true;
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
            <span class="block_title">常用收方账户管理</span>
        </div>
        <div class="operation_block">
            <form id="alipayform" class="main_form">
                <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
                <input type="hidden" id="source" name="source" value="1"/>

                <input type="hidden" id="rowversion" name="rowversion"/>

                <% if (flag){%>
                <input type="hidden" id="accounttype" name="accounttype" value="<%=accounttype%>"/>
                <%}%>
                <r:tinyPanel title="账户信息" iconCls="none" column="2" hasHeader="false">

                    <r:panelItem>
                        <r:textField textAlign="left" id="accountname" name="accountname" title="账户名称" check="required"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="accountnumber" name="accountnumber" title="账户" check="required"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="cellphone" name="cellphone" title="手机号" check="cellphone" />
                    </r:panelItem>
                    <r:panelItem>
                        <div class="each_input_wrap col-xs-6" style="height:33px"></div>
                    </r:panelItem>
                    <r:panelItem>
                        <r:radio textAlign="left" title="对私" id="privateflag1" name="privateflag" checked="true" value="1" groupFor="privateflag"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:radio textAlign="left" title="对公" id="privateflag2" name="privateflag" value="2" groupFor="privateflag" />
                    </r:panelItem>
                </r:tinyPanel>
            </form>
        </div>
        <div class="operation_btn">
            <r:button text="保存" onClick="alipaySave"/>
            <r:button text="返回" onClick="alipayClose"/>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function(){
        if(<%=editFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/counterpartyaccounts/selectByPrimaryKey.do",
                method: "post",
                params: {
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#alipayform").RForm({value:text});
                    var data = text.rows[0];
                    $("#currencyid").RComboGrid('setValue',data['currencyid']);
                    if(data["privateflag"]=="1") {
                        $("input[id=privateflag1]").prop("checked", true);
                    }
                    else {
                        $("input[id=privateflag2]").prop("checked", true);
                    }
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    function alipaySave(){
        $("#alipayform").RValidate();
        if(!$("#alipayform").RValidate('validate')){
            return;
        }

        var params = $("#alipayform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/counterpartyaccounts/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                if(<%=editFlag%>) {
                    $.RMessage.alert("消息", text.mes, parent.accountsCloseWinFn);

                }
                else {
                    $.RMessage.alert("消息", text.mes, parent.transferCloseWinFn);
                }
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function alipayClose(){
        if(<%=editFlag%>) {
            parent.accountsCloseWinFn();
        }
        else {
            parent.transferCloseWinFn();
        }

    }
</script>