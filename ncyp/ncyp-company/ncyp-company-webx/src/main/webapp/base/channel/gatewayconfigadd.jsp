<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/channel/gatewayconfig/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/channel/gatewayconfig/edit.do";
    }
    SysUserLogin currUser = (SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenant_id= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="gatewayconfigadd">
    <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/gateway.jsp">
                <jsp:param name="id" value="gatewayid"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="支付网关"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="code" name="code" title="对接银行代码" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/bank.jsp">
                <jsp:param name="id" value="bankid"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="银行"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/cardtype.jsp">
                <jsp:param name="id" value="cardtype"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="卡折类型"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="privateflag"  name="privateflag" title="限额" check="required" moneyFormat="float"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="priority" name="priority"    title="优先级" check="required" moneyFormat="int"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="description" name="description" title="描述"/>
        </r:panelItem>
    </r:tinyPanel>


</form>

<jsp:include page="/common/formbottom.jsp"/>

<script>
    $(function(){
        $("#priority").RNumberField({numFmt:'int'});
    })
    var saveFn = function(){
        $("#gatewayconfigadd").RValidate({
            'success': function(){
                var params = $("#gatewayconfigadd").AllSerialize();
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#gatewayconfigadd").RValidate("validate");
    }
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_CHANNEL_GATEWAYCONFIG_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#gatewayconfigadd").RForm({value:text});
                    //$('#code').attr("readonly","true");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

</script>


