<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.util.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/sysbank/directchannelpurposesmap/add.do";
    if(modFlag){
    	dataUrl = request.getContextPath() + "/sysbank/directchannelpurposesmap/edit.do";    	
    }
%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="directchannelpurposesmapadd">
    	<input type="hidden" id="urid" name="urid" value=""/>
    	<r:tinyPanel title="基本信息" hasHeader="false">
    		<r:panelItem>
	            <jsp:include page="/common/wedget/ucsearch/directchannelpurpose.jsp">
		            <jsp:param name="id" value="directchannelpurposeid"/>
		            <jsp:param name="title" value="直联渠道代收付用途"/>
		            <jsp:param name="check" value="required"/>
	            </jsp:include>
	        </r:panelItem> 
	        <r:panelItem>
	            <jsp:include page="/common/wedget/ucsearch/purpose.jsp">
		            <jsp:param name="id" value="purposeid"/>
		            <jsp:param name="title" value="代收付用途"/>
		            <jsp:param name="check" value="required"/>
	            </jsp:include>
	        </r:panelItem> 
        	<r:panelItem>
	        	<r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
    		<r:panelItem>
	        	<r:textArea  id="description" name="description" title="描述"/>
	        </r:panelItem>
        </r:tinyPanel>
	</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">
    $(function(){
        if(<%= modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_BANK_DIRECTCHANNELPURPOSESMAP_SEARCH",
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
                    $("#directchannelpurposeid").RComboGrid("setValue");
                    $("#purposeid").RComboGrid("setValue");
                    $("#description").val(entity["description"]);
                    $("#isactive").attr("checked", entity["isactive"] == "√" ? true : false);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    
    var saveFn = function(){
    	$("#directchannelpurposesmapadd").RValidate({
			'success': save
  		});
		$("#directchannelpurposesmapadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#directchannelpurposesmapadd").AllSerialize();
	    params = decodeURIComponent(params);
	    Ajax.req({
	        url: '<%= dataUrl%>',
	        params: params,
	        ok: function(text) {
	            $.RMessage.alert("消息", text.msg, parent.closeWinFn);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
</script>