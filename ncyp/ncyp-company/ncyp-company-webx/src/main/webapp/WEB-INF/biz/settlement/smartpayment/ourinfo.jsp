<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    /**
     * 我方账户
     */
    String linkageParam = (request.getParameter("linkageParam") == null) ? ("") : (request.getParameter("linkageParam"));
%>
	<r:panelItem>
	    <jsp:include page="/common/wedget/ucsearch/supplybankaccount.jsp">
	    	<jsp:param name="title" value="付方账户"/>
	        <jsp:param name="id" value="ourbankaccountid"/>
	        <jsp:param name="check" value="required"/>
	        <jsp:param name="BFn" value="ourBankAccountIdBFn"/>
            <jsp:param name="SelFn" value="ourBankAccountSelFn"/>
	    </jsp:include>
    </r:panelItem>

   <!--  <ul>
        <li class="f-panelitem-left"><a id='checkBalance' href='javascript:testBalance();'
                                        style="line-height: 23px;margin-left: 15px; ">查询余额</a>
        </li>
        <li class="f-panelitem-right">
            <span id="bankbalance" style="display:none;line-height: 23px; "></span>
        </li>
        <div class="clear"></div>
    </ul> -->
    <r:panelItem>
    	<r:textArea  id="ouraccountinfo" name="ouraccountinfo" title="付方账户信息" readonly="true" width="3" height='4'/>
	</r:panelItem>
	<!-- <li style="width: 100%;min-height: 15px;">
	    <hr style="height:1px;border:none;border-top:1px dashed #E9EEEF;"/>
	</li> -->

<script type="text/javascript">
	var ourBankAccountIdBFn = function(){
    	return <%= linkageParam%>;
	}
   	//选择付方账户，填充付方账户信息，过滤对方账户
    var ourBankAccountSelFn = function () {
    	setOurAccountInfo();//设置我方账户信息
    	//$("#bankbalance").text("");//账户余额查询结果清空
        //setOppAccountByOurAccountAndOppOrg();//直联支付时，过滤对方账户为同行账户
    };
    
  	//设置我方账户信息
	var setOurAccountInfo = function() {
		var ourbankaccountid = $("#ourbankaccountid").val();
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_BA_SUPPLYBANKACCOUNT_SEARCH",
                urid:  ourbankaccountid
            },
	        ok: function (text) {
	        	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
                $('#ouraccountinfo').val(entity['banklocationname'] + "|" + entity['currencyname'] + "|" + entity['accounttypename']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", "操作失败！" + text);
	        }
	    });
	    
	  	//$("#bankbalance").text("");//账户余额查询结果清空
        //setOppAccountByOurAccountAndOppOrg();//直联支付时，过滤对方账户为同行账户
	}

    //付方账户余额查询
    /* var testBalance = function () {
        $('body').doMask('正在处理,请稍候...');
        var accountid = $("#ourbankaccountid").val();
        if (accountid != "") {
            Ajax.req({
                url: '${pageContext.request.contextPath}/bankaccount/bankBalance!getCurrentBalance.do',
                params: {accountid: accountid},
                ok: function (text) {
                    $("#bankbalance").text(text);
                    $("#bankbalance").show();
                    $('body').doUnMask();
                },
                err: function (text) {
                    $.RMessage.alert("错误", text, $('body').doUnMask());
                }
            });
        }
        else {
            $.RMessage.alert("消息", "查询失败！请选择银行账户");
            $('body').doUnMask();
        }
    } */
</script>