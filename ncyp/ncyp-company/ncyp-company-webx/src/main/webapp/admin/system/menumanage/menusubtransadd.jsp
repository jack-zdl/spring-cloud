<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%

    String urid = request.getParameter("sub_trans_code");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/sysmenu/subtransadd.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/sysmenu/subtransedit.do";
    }
    String menu_code = request.getParameter("menu_code");
    String kind_code = request.getParameter("kind_code");
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(UserConstant.USER_LOGIN_SESSION);
    String userid = currUser.getUserId();
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="menusubtransadd" name="menusubtransadd">
    <input id="trans_code" type="hidden" name="transCode" value="${param.menu_code}" />
    <input id="menu_code" type="hidden" name="menuCode" value="${param.menu_code}" />
    <input id="kind_code" type="hidden" name="kindCode" value="${param.kind_code}" />
    <input id="ctrl_flag" type="hidden" name="ctrlFlag" value="" />

    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <r:textField  id="sub_trans_code" name="subTransCode" title="子功能号" check="required:true,maxlength:32"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="sub_trans_name" name="subTransName" title="子功能名" check="required:true,maxlength:256"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="rel_serv" name="relServ" title="映射服务" check="maxlength:256"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="login_flag" title="是否登录" name="loginFlag" valueField="value" displayField="text" width="6" dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999032" check="required"></r:combo>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="remark" name="remark" title="备注" check="maxlength:256"></r:textArea>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    <%
        String transCode=request.getParameter("trans_code");
        String subTransCode=request.getParameter("sub_trans_code");
    %>
    if(<%=modFlag%>){
        $("#sub_trans_code").attr("readonly", "true");
        Ajax.req({
            url: '${pageContext.request.contextPath}/sysmenu/subtransDetail.do',
            type:"json",
            method:"post",
            params:{
                transCode:'<%=transCode%>',
                subTransCode:'<%=subTransCode%>'
            },
            ok: function(text) {
                $('#login_flag').attr('value',text.rows[0]["loginFlag"]);
                $('#login_flag').RCombo('setValue');
                $("#menusubtransadd").RForm({value:text});
                $("#sub_trans_code").attr("readonly", "true");
            },
            err: function(text) {
                $.RMessage.alert("消息", text.mes);
            }
        });
    };

    var saveFn = function(){
        $("#menusubtransadd").RValidate({
            'success': save
        });
        $("#menusubtransadd").RValidate('validate');
    }

    var save = function(){
        var queryParams = $("#menusubtransadd").AllSerialize();
        Ajax.req({
            url: "<%=dataUrl%>",
            params: queryParams,
            ok: function(text) {
                //$.RMessage.alert("消息",text.mes,parent.closeWinFn());
                if($.RMessage.confirm("消息",text.mes)){
                    parent.closeWinFn()
                }
            },
            err: function(text) {
                $.RMessage.alert("消息",text.mes);
            }
        });
    }
</script>					 