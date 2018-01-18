<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/sysbank/purpose/add.do";
	if(modFlag){
		dataUrl = request.getContextPath() + "/sysbank/purpose/edit.do";
	}
%>
<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="purposeadd">
    	<input type="hidden" id="urid" name="urid" value=""/>
    	<r:tinyPanel title="基本信息" hasHeader="false">
    		<r:panelItem>
	            <r:textField id="code" name="code" title="代码" check="required"/>
	        </r:panelItem> 
	        <r:panelItem>
	            <r:textField id="name" name="name" title="名称" check="required"/>
	        </r:panelItem> 
        	<r:panelItem>
	        	<r:combo id="moneyway" name="moneyway" valueField="value" displayField="text" width="6"
                     dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=1010"
                     title="交易方向" check="required"/>
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
                    uc: "UC_BASE_BANK_PURPOSE_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#purposeadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#purposeadd").RValidate({
            'success': function(){
                var action = $("#purposeadd").attr("action");
                var params = $("#purposeadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: '<%= dataUrl%>',
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_BANK_PURPOSE_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#purposeadd").RValidate("validate");
    }
</script>