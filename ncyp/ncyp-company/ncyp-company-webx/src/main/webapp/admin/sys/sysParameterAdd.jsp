<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String userId = request.getParameter("userId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(userId)){
        editFlag = true;
    }else{
        userId = "";
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sass平台</title>


    <jsp:include page="/common/include.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/form.js"></script>
</head>
<body class="body_col_o">
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">系统参数管理</span>
        </div>
        <div class="operation_block">
            <form id="userform" class="main_form">
                <input type="hidden" id="userId" name="userId" value="<%=userId%>"/>
                <r:tinyPanel title="系统参数" iconCls="none" column="2" hasHeader="false">
                    <r:panelItem>
                        <r:textField textAlign="left" id="mobile" name="mobile" title="手机号" check="required,cellphone"/>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="userName" name="userName" title="用户姓名" check="required"/>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combogrid.jsp">
                            <jsp:param name="id" value="orgId"/>
                            <jsp:param name="valueField" value="orgId"/>
                            <jsp:param name="displayField" value="orgName"/>
                            <jsp:param name="title" value="所属组织"/>
                            <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
                    </r:panelItem>
                    <r:panelItem>
                        <jsp:include page="/common/wedget/combo.jsp">
                            <jsp:param name="id" value="userStatus"/>
                            <jsp:param name="title" value="用户状态"/>
                            <jsp:param name="keyno" value="9999002"/>
                            <jsp:param name="check" value="required"/>
                        </jsp:include>
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
                url: "${pageContext.request.contextPath}/sysuser/selectByPrimaryKey.do",
                method: "post",
                params: {
                    userId: "<%=userId%>"
                },
                ok: function(text){
                    $("#userform").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
        $("#userform").RValidate();
        if(!$("#userform").RValidate('validate')){
            return;
        }
        var params = $("#userform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.userCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function close(){
        parent.userCloseWinFn();
    }
</script>