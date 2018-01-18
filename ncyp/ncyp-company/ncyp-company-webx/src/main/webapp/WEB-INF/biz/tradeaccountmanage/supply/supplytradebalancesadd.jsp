<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplytdaccountmanage/tradebalances/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplytdaccountmanage/tradebalances/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
	<form role="form" id="tradebalancesadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false"> 								
			<r:panelItem>
            	<jsp:include page="/common/wedget/ucsearch/supplytradesubaccount.jsp">
             		<jsp:param name="id" value="tradesubaccountsid"/>
              		<jsp:param name="title" value="供应方交易子账户"/>
               	 	<jsp:param name="check" value="required"/>
             	</jsp:include>
	     	</r:panelItem>
	     	<r:panelItem>
            	<r:numberField id="closingbalance" name="closingbalance" moneyFormat="money" title="当前余额" check="required"/>
	     	</r:panelItem>  
	     	<r:panelItem>
            	<r:numberField id="netadjustment" name="netadjustment" moneyFormat="money" title="冻结余额" check="required"/>
	     	</r:panelItem>
	     	<r:panelItem>
            	<r:calendar id="reportdate" name="reportdate" title="余额日期" showOpts="yyyy-MM-dd" check="required"/>
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
                 	uc: "UC_SCS_TA_SUPPLYTRADEBALANCES_SEARCH",
                	urid: "<%=urid%>"
              	},
               	ok: function(text){
                    $("#tradebalancesadd").RForm({value:text});
               	},
               	err: function(text){
                  	$.RMessage.alert("消息", text);
            	}
       		});
        }
    })

    var saveFn = function(){
        $("#tradebalancesadd").RValidate({
             'success': function(){
                 var closingbalance=$("#closingbalance").val().replace(/\,/g,"");
                 var netadjustment=$("#netadjustment").val().replace(/\,/g,"");;
                 $("#closingbalance").val(closingbalance);
                 $("#netadjustment").val(netadjustment);
                 var params = $("#tradebalancesadd").serialize();
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
        $("#tradebalancesadd").RValidate("validate");
    }

</script>