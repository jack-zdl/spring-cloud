<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = "";
    if(modFlag){
        dataUrl = request.getContextPath() + "/generalset/currency/edit.do";
    } else{
        dataUrl = request.getContextPath() + "/generalset/currency/add.do";
    }
%>
<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="currencyadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    	<r:tinyPanel title="基本信息" hasHeader="false">
    		<r:panelItem>
	            <r:textField id="code" name="code" title="代码" check="required"/>
	        </r:panelItem> 
	        <r:panelItem>
	            <r:textField id="name" name="name" title="名称" check="required"/>
	        </r:panelItem> 
        	<r:panelItem>
	        	<r:combo id="directcurcode" name="directcurcode" valueField="value" displayField="text" 
	        	dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999033" 
	        	title="直联币种代码" check="required"/>
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
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_SET_CURRENCY_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#currencyadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#currencyadd").RValidate({
            'success': function(){
                var params = $("#currencyadd").AllSerialize();
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_SET_CURRENCY_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#currencyadd").RValidate("validate");
    }
</script>