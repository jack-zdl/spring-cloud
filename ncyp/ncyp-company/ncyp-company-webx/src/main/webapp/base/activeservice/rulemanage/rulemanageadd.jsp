<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.utils.stringtools.FString"%>
<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenantid= currUser.getTenant_id().toString();
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/activeservice/rulemanage/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/activeservice/rulemanage/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="rulemanageadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="code" name="code" title="代码" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="name" name="name" title="名称" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:comboGrid id="objectsid" name="objectsid" valueField="urid" width="6" listWidth="400" displayField="codename" colModel="[{title:'代码-名称',field:'codename',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_MAIL_OBJECTS_SEARCH" title="对象" check="required"/>
            </r:panelItem>
            <%
                if(tenantid==("10000")){
            %>
            <r:panelItem>
                <r:comboGrid id="tenantid" name="tenantid" valueField="urid" width="6" displayField="codename" colModel="[{title:'代码-名称',field:'codename',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_SYS_SYSCOMPANY_SEARCH" title="企业" check="required"/>
            </r:panelItem>
            <%
                }
            %>
            <r:panelItem>
                <r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea  id="description" name="description" title="描述"/>
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
                    uc: "UC_BASE_MAIL_RULES_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#rulemanageadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#rulemanageadd").RValidate({
            'success': function(){
                var params = $("#rulemanageadd").AllSerialize();
                Ajax.req({
                    url: '<%=dataUrl%>',
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_MAIL_RULES_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#rulemanageadd").RValidate("validate");
    }
</script>