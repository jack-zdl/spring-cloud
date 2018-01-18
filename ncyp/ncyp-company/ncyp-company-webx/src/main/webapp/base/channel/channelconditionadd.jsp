<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/channel/channelcondition/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/channel/channelcondition/edit.do";
    }
    SysUserLogin currUser = (SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenant_id= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="channelconditionadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <input type="hidden" id="tenant_id" name="tenant_id" value="<%=tenant_id%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="code" name="code" title="代码" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="name" name="name" title="名称" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/outsystem.jsp">
                    <jsp:param name="id" value="corpaccesssystemrange"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="title" value="对接系统"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea id="description" name="description" title="描述"/>
            </r:panelItem>
        </r:tinyPanel>
    </form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_CHANNEL_CHANNELCONDITION_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#channelconditionadd").RForm({value:text});
                    $('#code').attr("readonly","true");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#channelconditionadd").RValidate({
            'success': function(){
                var params = $("#channelconditionadd").AllSerialize();
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
        $("#channelconditionadd").RValidate("validate");
    }
</script>