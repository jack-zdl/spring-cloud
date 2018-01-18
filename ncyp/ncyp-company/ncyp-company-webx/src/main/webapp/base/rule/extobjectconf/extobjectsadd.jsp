<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String addformUrl = request.getContextPath() + "/rule/extobjects/add.do";
    String editformUrl = request.getContextPath() + "/rule/extobjects/edit.do";
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=addformUrl%>" role="form" id="extobjectsadd">
    <input type="hidden" id="urid" name="urid" value=""/>
    <r:tinyPanel title="基本信息" hasHeader="false" isShow="true">
        <r:panelItem>
            <r:textField id="code" name="code" title="代码" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="name" name="name" title="名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效:" id="isactive" name="isactive"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    $(function(){
        if("<%=urid%>" != "" && "${param.type}" == "mod"){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_IO_EXTOBJECTS_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	if(text.rows.length < 1){
                        $.RMessage.alert("消息", text.msg);
                        return;
                    }
                    var entity = text.rows[0];
                    for(var key in entity){
                        var $ele=$(document.getElementsByName(key)[0]);
                        $ele.attr("Value", entity[key]);
                    }
                    $("#extobjectsadd").RForm({value:text});
                    $("#extobjectsadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#extobjectsadd").RValidate({
            'success': function(){
                var action = $("#extobjectsadd").attr("action");
                var params = $("#extobjectsadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_IO_EXTOBJECTS_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息",  text.msg);
                    }
                })
            }
        });
        $("#extobjectsadd").RValidate("validate");
    }
</script>