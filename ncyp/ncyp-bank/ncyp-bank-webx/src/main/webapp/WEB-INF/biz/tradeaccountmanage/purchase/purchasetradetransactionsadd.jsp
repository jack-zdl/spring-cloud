<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/purchasetdaccountmanage/tradetransactions/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/purchasetdaccountmanage/tradetransactions/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
	<form role="form" id="tradetransactionsadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    	<r:tinyPanel hasHeader="false"> 								
			<r:panelItem>
             	<jsp:include page="/common/wedget/ucsearch/purchasetradesubaccount.jsp">
                 	<jsp:param name="id" value="tradesubaccountsid"/>
                  	<jsp:param name="title" value="采购方交易子账户"/>
                  	<jsp:param name="check" value="required"/>
             	</jsp:include>
	   		</r:panelItem>
	   		<r:panelItem>
				<r:numberField id="ledgeramount" name="ledgeramount" moneyFormat="money" title="交易金额" check="required"/>
	   		</r:panelItem>
	   		<r:panelItem>
             	<r:numberField id="balance" name="balance" moneyFormat="money" title="余额" check="required"/>
	   		</r:panelItem>
	   		<r:panelItem>
           		<r:calendar id="postdatetime" name="postdatetime" title="交易时间" showOpts="yyyy-MM-dd" check="required"/>
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
                     uc: "UC_SCS_TA_PURCHASETRADETRANSACTIONS_SEARCH",
                     urid: "<%=urid%>"
                 },
                 ok: function(text){
                     $("#tradetransactionsadd").RForm({value:text});
                 },
                 err: function(text){
                     $.RMessage.alert("消息", text);
                 }
             });
        }
    })

    var saveFn = function(){
        $("#tradetransactionsadd").RValidate({
              'success': function(){
                  var balance=$("#balance").val().replace(/\,/g,"");
                  var ledgeramount=$("#ledgeramount").val().replace(/\,/g,"");;
                  $("#balance").val(balance);
                  $("#ledgeramount").val(ledgeramount);
                  var params = $("#tradetransactionsadd").serialize();
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
        $("#tradetransactionsadd").RValidate("validate");
    }

</script>