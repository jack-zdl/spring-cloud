<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/sysbank/directquerycmdconfig/add.do";
    if(modFlag){
    	dataUrl = request.getContextPath() + "/sysbank/directquerycmdconfig/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp" />
     <form role="form" id="directquerycmdconfigadd">
         <input type="hidden" id="urid" name="urid" value=""/>
         <r:tinyPanel title="基本信息" hasHeader="false">   
	         <r:panelItem>
	            <jsp:include page="/common/wedget/ucsearch/bank.jsp">
		            <jsp:param name="id" value="bankid"/>
		            <jsp:param name="name" value="bankid"/>
		            <jsp:param name="title" value="银行"/>
		            <jsp:param name="check" value="required"/>
		        </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/dictionary/commandtype.jsp">
	        		<jsp:param name="id" value="commandtype"/>
		            <jsp:param name="name" value="commandtype"/>
		            <jsp:param name="title" value="指令类型"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="width" value="6"/>
	           	</jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/ucsearch/directchannel.jsp">
	        		<jsp:param name="id" value="directchannelid"/>
		            <jsp:param name="name" value="directchannelid"/>
		            <jsp:param name="title" value="直联渠道"/>
		            <jsp:param name="check" value="required"/>
	           	</jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/ucsearch/directchannelcmd.jsp">
	        		<jsp:param name="id" value="directchannelcmdid"/>
		            <jsp:param name="name" value="directchannelcmdid"/>
		            <jsp:param name="title" value="直联渠道指令"/>
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
                    uc: "UC_BASE_BANK_DIRECTQUERYCMDCONFIG_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#directquerycmdconfigadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#directquerycmdconfigadd").RValidate({
            'success': function(){
                var params = $("#directquerycmdconfigadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: '<%= dataUrl%>',
                    params: params,
                    ok: function(text) {
                    	clearCache(['UC_BASE_BANK_DIRECTQUERYCMDCONFIG_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#directquerycmdconfigadd").RValidate("validate");
    }
</script>