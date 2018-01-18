<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>

<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
    String userId = request.getParameter("userId");
    boolean editFlag = false;
    if(StringUtils.isNotBlank(userId)){
        editFlag = true;
    }else{
        userId = "";
    }
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
%>
<jsp:include page="/common/formhead.jsp" />
<form id="userform" name="userform">
    <input id="lockStatus" type="hidden" name="lockStatus" value="0"/>
    <input id="userPwd" type="hidden" name="userPwd" value="666666"/>
    <input id="userType" name = "userType" type = "hidden" value = "1"/>
    <r:tinyPanel title="用户信息" hasHeader="false">
        <r:panelItem>
            <jsp:include page="/common/wedget/combogrid.jsp">
                <jsp:param name="id" value="tenantId"/>
                <jsp:param name="valueField" value="tenantId"/>
                <jsp:param name="displayField" value="codename"/>
                <jsp:param name="title" value="企业"/>
                <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/tenant/page.do"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:DvTextField textAlign="left" id="userId" name="userId" title="用户编号" check="required" defaultText="<%=gridtenantid%>"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField textAlign="left" id="userName" name="userName" title="用户姓名" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/combogrid.jsp">
                <jsp:param name="id" value="orgId"/>
                <jsp:param name="valueField" value="orgId"/>
                <jsp:param name="displayField" value="codename"/>
                <jsp:param name="title" value="组织"/>
                <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="userStatus" name="userStatus" valueField="value" displayField="text" width="6" dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999018" title="用户状态" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="cCredentials" name="cCredentials" title="KEY证书编号" />
        </r:panelItem>
        <r:panelItem>
            <r:textArea textAlign="left" id="remark" name="remark" title="备注"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script>
    $(function(){
        if(<%=editFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/sysuser/page.do",
                method: "post",
                params: {
                    userId: "<%=userId%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    $("#userform").RForm({value:text});
                    $("#tenantId").RComboGrid('setValue',data['tenantId']);
                    $("#orgId").RComboGrid('setValue',data['orgId']);
                    $("#userStatus").RCombo('setAllValue',[data['userStatus'],data['userStatus_show']]);
                    $("#tenantId").RComboGrid('setReadOnly',true);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    });


    var saveFn = function(){
        $("#userform").RValidate({
            'success': save
        });
        $("#userform").RValidate('validate');
    }



    var save =  function(){

        var params = $("#userform").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/addorupdate.do",
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

    var orgidBFn = function(){
        var treetenantid = "<%=treetenantid%>";
        var Json = [{"treetenantid":treetenantid}];
        return Json;
    }

    var tenantSelFn = function(){
        if(!<%=editFlag%>){
            $("#userId").DvTextField('setDefaultValue',$("#tenantId").val());
        }
    }
</script>