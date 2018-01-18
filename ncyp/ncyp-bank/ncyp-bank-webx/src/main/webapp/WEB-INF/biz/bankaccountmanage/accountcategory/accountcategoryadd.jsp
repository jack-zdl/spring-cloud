<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/bankaccountmanage/bacategories/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/bankaccountmanage/bacategories/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="categoryadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="code" name="code" title="代码" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="name" name="name" title="名称" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否系统初始:" id="issysteminit" name="issysteminit"/>
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
                    uc: "UC_SCS_BA_BANKACCOUNTCATEGORY_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#categoryadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#categoryadd").RValidate({
            'success': function(){
                var params = $("#categoryadd").AllSerialize();
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
        $("#categoryadd").RValidate("validate");
    }
</script>