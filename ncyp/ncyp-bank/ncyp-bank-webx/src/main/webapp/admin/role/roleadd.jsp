<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String roleCode = request.getParameter("roleCode");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(roleCode)){
        editFlag = true;
    }else{
        roleCode = "";
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sass平台</title>

    <jsp:include page="/common/include.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CYUI/themes/green/combo.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CYUI/themes/green/combogrid.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/CYUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/form.js"></script>
</head>
<body class="body_col_o">
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">角色管理</span>
        </div>
        <div class="operation_block">
            <form id="rolefrom" class="main_form">
                <input type="hidden" id="roleCode" name="roleCode" value="<%=roleCode%>"/>
                <r:tinyPanel title="角色信息" iconCls="none" column="2" hasHeader="false">

                    <r:panelItem>
                        <%--<r:textField textAlign="left" id="tenantId" name="tenantId" title="租户"/>--%>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="tenantId"/>
                            <jsp:param name="valueField" value="tenantId"/>
                            <jsp:param name="displayField" value="tenantName"/>
                            <jsp:param name="title" value="租户"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/tenant/page.do"/>
                            <jsp:param name="check" value="required"/>
                            <jsp:param name="BFn" value="tenantIdBFn"/>
                        </jsp:include>
                    </r:panelItem>

                    <r:panelItem>
                        <r:textField textAlign="left" id="roleName" name="roleName" title="角色名称" check="required"/>
                    </r:panelItem>
                    <r:panelItem>
                        <%--<r:textField textAlign="left" id="orgId" name="orgId" title="组织"/>--%>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="orgId"/>
                            <jsp:param name="valueField" value="orgId"/>
                            <jsp:param name="displayField" value="orgName"/>
                            <jsp:param name="title" value="组织"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                            <jsp:param name="check" value="required"/>
                            <jsp:param name="BFn" value="orgIdBFn"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="roleOrder" name="roleOrder" title="排序" check="required"/>
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
                url: "${pageContext.request.contextPath}/sysrole/selectByPrimaryKey.do",
                method: "post",
                params: {
                    roleCode: "<%=roleCode%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    $("#rolefrom").RForm({value:text});

                    $("#tenantId").RComboGrid('setValue',data['tenantId']);
                    $("#orgId").RComboGrid('setValue',data['orgId']);
                    $("#tenantId").RComboGrid('setReadOnly',true);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
        $("#rolefrom").RValidate();
        if(!$("#rolefrom").RValidate('validate')){
            return;
        }
        var params = $("#rolefrom").AllSerialize();
        console.log(params);
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysrole/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.roleCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }
    function orgIdBFn(){
        var orgId = $("#orgId").val();
        return [{"orgId":orgId}];
    }

    function tenantIdBFn(){
        var tenantId = $("#tenantId").val();
        return [{"tenantId":tenantId}];
    }
    function close(){
        parent.roleCloseWinFn();
    }
</script>