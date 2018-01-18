<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
    String tenantId = request.getParameter("tenantId");
    boolean modFlag = false;
    if(StringUtils.isNotBlank(tenantId)){
        modFlag = true;

    }else{
        tenantId = "";
    }
    String dataUrl = request.getContextPath() + "/tenant/addorupdate.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/usermanage/role/edit.do";
    }
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
%>

<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="syscompanyadd" >
    <input id="tenantId" type="hidden" name="tenantId" />
    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <r:textField  id="tenantName" name="tenantName" title="企业名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="tenantShortname" name="tenantShortname" title="企业英文简称"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="tenantCnshortname" name="tenantCnshortname" title="企业中文简称"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="telno" name="telno" title="固定电话" check="telephone"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="mobile" name="mobile" title="法人手机号" check="required,cellphone"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="email" name="email" title="法人邮箱" check="required,email"/>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="tenantType" name="tenantType" valueField="value" displayField="text" width="6" dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999017" title="企业类型" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="tenantStatus" name="tenantStatus" valueField="value" displayField="text" width="6" dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999018" title="企业状态" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="tenantOrder" name="tenantOrder" title="排序"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="remark" name="remark" title="备注"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">
    window.onload = function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: '${pageContext.request.contextPath}/tenant/page.do',
                type:"json",
                method:"post",
                params: {
                    tenantId:'${param.tenantId}'
                },
                ok: function(text) {
                    $("#syscompanyadd").RForm({value:text});
                    var data = text.rows[0]
                    var arr = [data['tenantStatus'],data["tenantStatus_show"]];
                    if(arr[0]){
                        $('#tenantStatus').RCombo('setAllValue',arr);
                    }
                    arr = [data['tenantType'],data["tenantType_show"]];
                    if(arr[0]) {
                        $('#tenantType').RCombo('setAllValue', arr);
                    }
                },
                err: function(text) {
                    alert("消息："+text);
                }
            });
        };
    }

    var saveFn = function(){
        $("#syscompanyadd").RValidate({
            'success': save
        });
        $("#syscompanyadd").RValidate('validate');
    }

    var save = function(){
//        var textLength = $("#sysroleadd").serializeObject()["role_code"].length;

//        if(textLength > 10){
//            $.RMessage.alert("消息","你輸入的角色代码过长，请重新输入");
//        }else {
            var queryParams = $("#syscompanyadd").AllSerialize();

            Ajax.req({
                url: "${pageContext.request.contextPath}/tenant/addorupdate.do",
                params: queryParams,
                type: "json",
                method: "post",
                ok: function(text) {
//                    clearCache(['UC_SYS_ROLE_SEARCH']);
                    $.RMessage.alert("消息",text.msg,parent.closeWinFn);
                },
                err: function(text) {
                    $.RMessage.alert("消息",text.msg);
                }
            });
//        }
    }

    var orgidBFn = function(){
        var treetenantid = "<%=treetenantid%>";
        var Json = [{"treetenantid":treetenantid}];
        return Json;
    }

    var tenantSelFn = function(){
        if(!<%=modFlag%>){
            $("#role_code").DvTextField('setDefaultValue',$("#tenant_id").val());
        }
    }

</script>