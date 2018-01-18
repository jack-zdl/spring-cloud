<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
    String packageId = request.getParameter("packageId");
    boolean modFlag = false;
    if(StringUtils.isNotBlank(packageId)){
        modFlag= true;

    }else{
        packageId = "";
    }
    String dataUrl = request.getContextPath() + "/tenant/addorupdate.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/tenant/addorupdate.do";
    }
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
%>

<jsp:include page="/common/formhead.jsp"/>
<form id="packageAdd" class="main_form">
    <input type="hidden" id="packageId" name="packageId" value="<%=packageId%>"/>
    <r:tinyPanel title="套餐信息" iconCls="none" column="2" hasHeader="false">
        <r:panelItem>
            <%if(modFlag){%>

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
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/syspackage/page.do",
                method: "post",
                params: {
                    packageId: "<%=packageId%>"
                },
                ok: function(text){
                    var data = text.rows[0];
                    console.log(text);
                    $("#packageAdd").RForm({value:text});
                    $("#isactive").RCombo("setAllValue",[data['isactive'],data['isactive_show']]);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    var saveFn = function(){
        $("#packageAdd").RValidate({
            'success': save
        });
        $("#packageAdd").RValidate('validate');
    }
    var save=function save(){
        var params = $("#packageAdd").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/syspackage/addorupdate.do",
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
        parent.packetCloseWinFn();
    }

</script>