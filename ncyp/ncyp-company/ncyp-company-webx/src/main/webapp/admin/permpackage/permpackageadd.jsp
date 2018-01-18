<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String packageId = request.getParameter("packageId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(packageId)){
        editFlag = true;
    }else{
        packageId = "";
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
            <span class="block_title">套餐管理</span>
        </div>
        <div class="operation_block">
            <form id="packageform" class="main_form">
                <input type="hidden" id="packageId" name="packageId" value="<%=packageId%>"/>
                <r:tinyPanel title="套餐信息" iconCls="none" column="2" hasHeader="false">
                    <r:panelItem>
                        <%if(editFlag){%>

                            <r:textField textAlign="left" id="packageCode" name="packageCode" title="套餐编号" readonly="true"/>
                        <%}
                        else
                        {%>
                            <r:textField textAlign="left" id="packageCode" name="packageCode" title="套餐编号"/>
                        <%}%>
                    </r:panelItem>
                    <r:panelItem>
                        <r:textField textAlign="left" id="packageName" name="packageName" title="套餐名"/>
                    </r:panelItem>
                    <r:panelItem>
                            <jsp:include page="/common/wedget/combo.jsp">
                                <jsp:param name="id" value="isactive"/>
                                <jsp:param name="title" value="是否有效"/>
                                <jsp:param name="keyno" value="1001"/>
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
                url: "${pageContext.request.contextPath}/syspackage/page.do",
                method: "post",
                params: {
                    packageId: "<%=packageId%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    $("#packageform").RForm({value:text});
                    $("#isactive").RCombo("setAllValue",[data['isactive'],data['isactive_show']]);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function save(){
        var params = $("#packageform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/syspackage/addorupdate.do",
            type: "json",
            method: "post",
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, parent.packetCloseWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.mes);
            }
        })
    }

    function close(){
        parent.packetCloseWinFn();
    }
</script>