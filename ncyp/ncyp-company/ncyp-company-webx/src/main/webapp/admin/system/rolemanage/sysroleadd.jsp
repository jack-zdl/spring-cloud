<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
    String roleCode = request.getParameter("roleCode");
    boolean modFlag = false;
    if(StringUtils.isNotBlank(roleCode)){
        modFlag = true;
    }else{
        roleCode = "";
    }
    String dataUrl = request.getContextPath() + "/sysrole/addorupdate.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/sysrole/addorupdate.do";
    }
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="sysroleadd" name="sysroleadd">
    <input id="creator" type="hidden" name="creator" />
    <r:tinyPanel title="基本信息" hasHeader="false">
        <r:panelItem>
            <%if(gridtenantid.equals(CommonConstants.SUPERTENANT)){ %>
                <jsp:include page="/common/wedget/combogrid.jsp">
                    <jsp:param name="id" value="tenantId"/>
                    <jsp:param name="valueField" value="tenantId"/>
                    <jsp:param name="displayField" value="codename"/>
                    <jsp:param name="title" value="企业"/>
                    <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/tenant/page.do"/>
                    <jsp:param name="check" value="required"/>
                </jsp:include>
            <%}else{ %>
                <input id="tenantId" type="hidden" name="tenantId" value="<%=gridtenantid %>"/>
            <%} %>
        </r:panelItem>
        <%if(modFlag){%>
            <r:panelItem>
                <r:textField  id="roleCode" name="roleCode" title="角色编号" check="required"/>
            </r:panelItem>
        <%}else{%>
            <r:panelItem>
                <r:DvTextField  id="roleCode" name="roleCode" title="角色编号" check="required" defaultText="<%=gridtenantid%>"/>
            </r:panelItem>
        <%}%>
        <r:panelItem>
            <r:textField  id="roleName" name="roleName" title="角色名称" check="required"/>
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
            <r:numberField id="roleOrder" name="roleOrder" title="排序" check="required" moneyFormat="int"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">
    window.onload = function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: '${pageContext.request.contextPath}/sysrole/selectByPrimaryKey.do',
                type:"json",
                method:"post",
                params: {
                    roleCode:'${param.roleCode}'
                },
                ok: function(text) {
                    console.log('参数:'+text);
                    $("#sysroleadd").RForm({value: text});
                    var data = text.rows[0];
                    $("#tenantId").RComboGrid('setValue',data['tenantId']);
                    $("#orgId").RComboGrid('setValue',data['orgId']);
                    //$("#tenantId").RComboGrid('setReadOnly',true);
                    $('#roleCode').attr("readonly","true");
                },
                err: function(text) {
                    alert("消息："+text);
                }
            });
        };
    }

    var saveFn = function(){
        $("#sysroleadd").RValidate({
            'success': save
        });
        $("#sysroleadd").RValidate('validate');
    }

    var save = function(){
        var queryParams = $("#sysroleadd").AllSerialize();
        console.log('参数:'+queryParams);

        Ajax.req({
            url: "${pageContext.request.contextPath}/sysrole/addorupdate.do",
            params: queryParams,
            type: "json",
            method: "post",
            ok: function(text) {
                console.log(text);
                $.RMessage.alert("消息",text.mes,parent.closeWinFn);
            },
            err: function(text) {
                $.RMessage.alert("消息",text.mes);
            }
        });
    }

    var orgidBFn = function(){
        var treetenantid = "<%=treetenantid%>";
        var Json = [{"treetenantid":treetenantid}];
        return Json;
    }

    var tenantSelFn = function(){
        if(!<%=modFlag%>){
            $("#roleCode").DvTextField('setDefaultValue',$("#tenantId").val());
        }
    }

</script>