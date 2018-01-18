<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String addformUrl = request.getContextPath() + "/rule/dtsrulemanage/add.do";
    String editformUrl = request.getContextPath() + "/rule/dtsrulemanage/edit.do";
    String typename = request.getParameter("typename");
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=addformUrl%>" role="form" id="dtsruleadd" isShow = "true">
    <input type="hidden" id="urid" name="urid" value=""/>
    <input type = "hidden" id = "systemflag" name = "systemflag" value = "1"/>
    <r:tinyPanel title="基本信息" hasHeader="false" >
        <r:panelItem>
            <r:textField id="code" name="code" title="代码" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="name" name="name" title="名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
        	<jsp:include page="/common/wedget/ucsearch/dtsobjdefinition.jsp">
               	<jsp:param name="id" value="dtsobjdefinitionid"/>
               	<jsp:param name="title" value="处理对象"/>
                <jsp:param name="BFn" value="dtsobjdefBFn"/>
                <jsp:param name="check" value="required"/>
         	</jsp:include>
        </r:panelItem>
		<r:panelItem>
	       	<jsp:include page="/common/wedget/dictionary/dealway.jsp">
	       		<jsp:param name="id" value="dealway"/>
	            <jsp:param name="name" value="dealway"/>
	            <jsp:param name="title" value="规则用途"/>
	            <jsp:param name="check" value="required"/>
	            <jsp:param name="width" value="6"/>
	        </jsp:include>
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
                    uc: "UC_BASE_IO_OBJRULE_SEARCH",
                    urid:  "<%=urid%>"
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
                    $("#dtsruleadd").RForm({value:text});
                    $("#dealway").RCombo("setValue");
                    $("#dtsruleadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
	
    var dtsobjdefBFn = function(){
    	 var typename = "<%=typename%>";
         var Json = [{"typename":typename}];
         return Json;
    }
    
    var saveFn = function(){
        $("#dtsruleadd").RValidate({
            'success': function(){
                var action = $("#dtsruleadd").attr("action");
                var params = $("#dtsruleadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_IO_OBJRULE_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#dtsruleadd").RValidate("validate");
    }
</script>