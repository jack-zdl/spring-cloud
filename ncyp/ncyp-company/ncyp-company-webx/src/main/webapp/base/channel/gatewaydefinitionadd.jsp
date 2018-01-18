<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/channel/gatewaydefinition/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/channel/gatewaydefinition/edit.do";
    }
    SysUserLogin currUser = (SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenant_id= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="gatewayadd">
    <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <r:textField id="name" name="name" title="网关名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
           <jsp:include page="/common/wedget/ucsearch/directchannel.jsp">
                <jsp:param name="id" value="directchannelid"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="线路"/>
               <jsp:param name="SelFn" value="directchannelidSelFn"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/directchannelcmd.jsp">
                <jsp:param name="id" value="directchannelcmdid"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="指令"/>
                <jsp:param name="BFn" value="directchannelcmdidBFn"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/privateflag.jsp">
                <jsp:param name="id" value="privateflag"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="公私标识"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
           <jsp:include page="/common/wedget/ucsearch/tenant.jsp">
                <jsp:param name="id" value="tenantid"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="租户"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="startdate" name="startdate" title="开通日期" showOpts="yyyy-MM-dd" check="required"></r:calendar>
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="enddate" name="enddate" title="截止日期" showOpts="yyyy-MM-dd" check="required"></r:calendar>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="storepwd" name="storepwd" title="文件密码" ></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="keypwd" name="keypwd" title="私钥密码"></r:textField>
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

<script>
    $(function(){
        //赋初值
        $('#startdate').RCalendar('afterSelect',startdatetimeFn);
        $('#enddate').RCalendar('afterSelect',enddatetimeFn);
    })
    var saveFn = function(){
        $("#gatewayadd").RValidate({
            'success': function(){
                var params = $("#gatewayadd").AllSerialize();
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
        $("#gatewayadd").RValidate("validate");
    }
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_CHANNEL_GATEWAY_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#gatewayadd").RForm({value:text});
                    //$('#code').attr("readonly","true");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    function directchannelcmdidBFn(){
        var directchannelid = $("#directchannelid").val();
        var Json = [{"directchannelid":directchannelid,"isactive":"1"}];
        return Json;
    }
    function directchannelidSelFn() {
        $("#directchannelcmdid").attr('value',' ');
        $("#directchannelcmdid").RComboGrid('setValue');
    }

    var startdatetimeFn = function(){
        var startdatetime = $("#startdate").val();
        $('#enddate').RCalendar('setValidDates',{minDate:startdatetime});
    }

    var enddatetimeFn = function(){
        var enddatetime = $("#enddate").val();
        $('#startdate').RCalendar('setValidDates',{maxDate:enddatetime});
    }
</script>


