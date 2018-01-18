<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplytdaccountmanage/supplysplitrules/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplytdaccountmanage/supplysplitrules/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="splitrulesadd">
	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
	<r:tinyPanel hasHeader="false"> 								
		<r:panelItem>
      		<jsp:include page="/common/wedget/ucsearch/purchasetradeaccount.jsp">
	        	<jsp:param name="id" value="tradeaccountid"/>
	         	<jsp:param name="title" value="采购方交易账户"/>
	         	<jsp:param name="check" value="required"/>
         	</jsp:include>
     	</r:panelItem>
     	<r:panelItem>
       		<jsp:include page="/common/wedget/dictionary/splitrules.jsp">
            	<jsp:param name="id" value="splitscheme"/>
             	<jsp:param name="title" value="供应方分账规则"/>
             	<jsp:param name="check" value="required"/>
         	</jsp:include>
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
                    uc: "UC_SCS_TA_SUPPLYSPLITRULES_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#splitrulesadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#splitrulesadd").RValidate({
            'success': function(){
                var params = $("#splitrulesadd").serialize();
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
        $("#splitrulesadd").RValidate("validate");
    }

</script>