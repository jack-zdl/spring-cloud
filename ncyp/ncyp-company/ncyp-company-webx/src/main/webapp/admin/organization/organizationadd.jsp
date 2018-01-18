<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String orgId = request.getParameter("orgId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(orgId)){
        editFlag = true;
    }else{
        orgId = "";
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
            <span class="block_title">组织管理</span>
        </div>
        <div class="operation_block">
            <form id="organizationfrom" class="main_form">
                <input type="hidden" id="orgId" name="orgId" value="<%=orgId%>"/>
                <r:tinyPanel title="组织信息" iconCls="none" column="2" hasHeader="false">
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="tenantId"/>
                            <jsp:param name="valueField" value="tenantId"/>
                            <jsp:param name="displayField" value="tenantName"/>
                            <jsp:param name="title" value="租户"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/tenant/page.do"/>
                            <jsp:param name="check" value="required"/>
                            <jsp:param name="BFn" value="orgIdBFn"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="orgCode" name="orgCode" title="组织编码"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="orgName" name="orgName" title="组织名称"/>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combo.jsp">
                            <jsp:param name="id" value="orgCate"/>
                            <jsp:param name="title" value="组织分类"/>
                            <jsp:param name="keyno" value="9999004"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                        <%--<r:textField textAlign="left" id="orgCate" name="orgCate" title="组织分类"/>--%>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combo.jsp">
                            <jsp:param name="id" value="orgLevel"/>
                            <jsp:param name="title" value="组织级别"/>
                            <jsp:param name="keyno" value="9999005"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                        <%--<r:textField textAlign="left" id="orgLevel" name="orgLevel" title="组织级别"/>--%>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="parentId"/>
                            <jsp:param name="valueField" value="orgId"/>
                            <jsp:param name="displayField" value="orgName"/>
                            <jsp:param name="title" value="上级组织"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                            <jsp:param name="check" value="required"/>
                            <jsp:param name="BFn" value="parentIdBFn"/>
                        </jsp:include>
                        <%--<r:textField textAlign="left" id="parentId" name="parentId" title="上级组织"/>--%>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="manageId"/>
                            <jsp:param name="valueField" value="orgId"/>
                            <jsp:param name="displayField" value="orgName"/>
                            <jsp:param name="title" value="主管组织"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                            <jsp:param name="check" value="required"/>
                            <jsp:param name="BFn" value="manageIdBFn"/>
                        </jsp:include>
                        <%--<r:textField textAlign="left" id="manageId" name="manageId" title="主管组织"/>--%>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textArea textAlign="left" id="remark" name="remark" title="备注"/>
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
                url: "${pageContext.request.contextPath}/organization/selectByPrimaryKey.do",
                method: "post",
                params: {
                    orgId: "<%=orgId%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    $("#organizationfrom").RForm({value:text});

                    $("#tenantId").RComboGrid('setValue',data['tenantId']);
                    $("#manageId").RComboGrid('setValue',data['manageId']);
                    $("#parentId").RComboGrid('setValue',data['parentId']);
                    $("#orgLevel").RCombo('setAllValue',[data['orgLevel'],data['orgLevel_show']]);
                    $("#orgCate").RCombo('setAllValue',[data['orgCate'],data['orgCate_show']]);
                    $("#tenantId").RComboGrid('setReadOnly',true);

                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
        $("#organizationfrom").RValidate();
        if(!$("#organizationfrom").RValidate('validate')){
            return;
        }
        var params = $("#organizationfrom").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/organization/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.orgCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function orgIdBFn(){
        var tenantId = $("#tenantId").val();
        return [{"tenantId":tenantId}];
    }
    function parentIdBFn(){
        var parentId = $("#parentId").val();
        return [{"parentId":parentId}];
    }
    function manageIdBFn(){
        var manageId = $("#manageId").val();
        return [{"manageId":manageId}];
    }

    function close(){
        parent.orgCloseWinFn();
    }
</script>