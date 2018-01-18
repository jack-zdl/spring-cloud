<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.util.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = "";
    if(modFlag){
        dataUrl = request.getContextPath() + "/sysparam/parammanage/edit.do";
    } else{
        dataUrl = request.getContextPath() + "/sysparam/parammanage/add.do";
    }
%>
<jsp:include page="/common/formhead.jsp" />
<form role="form" id="sysparamadd" name="sysparamadd" >
    <input id="urid" name="urid" type="hidden" value="<%=urid%>"/>
    <r:tinyPanel title="基本信息" hasHeader="false">
   		<r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/tenant.jsp">
                <jsp:param name="id" value="tenantid"/>
                <jsp:param name="title" value="企业名称"/>
            </jsp:include>
        </r:panelItem> 
        <r:panelItem>
            <r:textField  id="paramdefname" name="paramdefname" title="参数名称"/>
        </r:panelItem> 
        <r:panelItem>
            <r:textField  id="value" name="value" title="参数值" check="required"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            $("#paramdefname").attr("readonly", true);
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_PARAM_PARAMVAL_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	 $("#sysparamadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#sysparamadd").RValidate({
            'success': function(){
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: {
                        value: $("#value").val(),
                        urid: '<%=urid%>'
                    },
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#sysparamadd").RValidate("validate");
    }
</script>