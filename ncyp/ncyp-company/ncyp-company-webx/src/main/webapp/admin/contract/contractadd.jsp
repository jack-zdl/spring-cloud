<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String contractId = request.getParameter("contractId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(contractId)){
        editFlag = true;
    }else{
        contractId = "";
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
            <span class="block_title">协议管理</span>
        </div>
        <div class="operation_block">
            <form id="contractform" class="main_form">
                <input type="hidden" id="contractId" name="contractId" value="<%=contractId%>"/>
                <r:tinyPanel title="协议信息" iconCls="none" column="2" hasHeader="false">

                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="tenantId"/>
                            <jsp:param name="valueField" value="tenantId"/>
                            <jsp:param name="displayField" value="tenantName"/>
                            <jsp:param name="title" value="企业"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/tenant/page.do"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">

                            <jsp:param name="id" value="packageId"/>
                            <jsp:param name="valueField" value="packageId"/>
                            <jsp:param name="displayField" value="packageName"/>
                            <jsp:param name="title" value="套餐名"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/syspackage/page.do"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <r:calendar id="effectiveDate" width="6" textAlign="left" name="effectiveDate" title="生效日期" showOpts="yyyy-MM-dd H:mm:ss" check="required" ></r:calendar>
                    </r:panelItem>
                    <r:panelItem>
                        <r:calendar id="expiryDate" width="6" textAlign="left" name="expiryDate" title="失效日期" showOpts="yyyy-MM-dd H:mm:ss" check="required"></r:calendar>
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
                url: "${pageContext.request.contextPath}/syscontract/selectByPrimaryKey.do",
                method: "post",
                params: {
                    contractId: "<%=contractId%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    $("#contractform").RForm({value:text});
                    $("#tenantId").RComboGrid('setValue',data['tenantId']);
                    $("#packageId").RComboGrid('setValue',data['packageId']);
                    $("#tenantId").RComboGrid('setReadOnly',true);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){

        $("#contractform").RValidate();
        if(!$("#contractform").RValidate('validate')){
            return;
        }
        var reg = /^\s*|\s*$/g;
        var t1 = document.getElementById("effectiveDate").value.replace(reg, "");
        var t2 = document.getElementById("expiryDate").value.replace(reg, "");
        reg = /^(\d+)\-(\d+)\-(\d+)\s+(\d+)\:(\d+)\:(\d*)$/;
        if (!reg.test(t1) || !reg.test(t2)) {
            throw new Error("Date Format is Error !");
            return;
        }
        var d1 = new Date(t1.replace(reg, "$1"), parseInt(t1.replace(reg, "$2")) - 1, t1.replace(reg, "$3"));
        d1.setHours(t1.replace(reg, "$4"), t1.replace(reg, "$5"), t1.replace(reg, "$6"));
        var d2 = new Date(t2.replace(reg, "$1"), parseInt(t2.replace(reg, "$2")) - 1, t2.replace(reg, "$3"));
        d2.setHours(t2.replace(reg, "$4"), t2.replace(reg, "$5"), t2.replace(reg, "$6"));
        if (d1 > d2) {
            $.RMessage.alert("消息","开始时间不得大于结束时间");
            return;
        }
        var params = $("#contractform").serializeArray();
        Ajax.req({
            url: "${pageContext.request.contextPath}/syscontract/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.contractCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function close(){
        parent.contractCloseWinFn();
    }
</script>