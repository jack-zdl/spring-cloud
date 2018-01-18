<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@page	import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@page	import="com.ceying.chx.biz.constants.ENPrivateFlag"%>
<%@page	import="com.ceying.chx.biz.constants.ENDealType"%>
<%@page	import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@page	import="com.ceying.chx.biz.constants.ENOppObjectType"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
	SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String userid = currUser.getUserId();
%>
<jsp:include page="/common/formhead.jsp" />
	<form action="" role="form" id="directsglbankpayadd" >
     	<r:tinyPanel title="基本信息" hasHeader="false" column="3">
     		<jsp:include page="/scs/settlement/smartpayment/generalinfodetail.jsp" />
   		</r:tinyPanel>
   		<r:tinyPanel title="付方信息" hasHeader="false" column="3">
   			<jsp:include page="/scs/settlement/smartpayment/ourinfodetail.jsp" />
   			<r:panelItem classes="isInternalOrg">
   				<r:textField id="opporgname" name="opporgname" title="收方组织" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isInternalOrg">
	        	<r:textField id="oppbankaccount" name="oppbankaccount" title="收方账户" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isInternalOrg">
	        	<r:textArea  id="oppaccountinfo" name="oppaccountinfo" title="收方账户信息" readonly="true" width="3" height="4"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
	        	<r:textField id="oppbankaccountnumber" name="oppbankaccountnumber" title="收方账户" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
   				<r:textField  id="oppbankaccountname" name="oppbankaccountname" title="收方户名"
            				readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
	        	<r:textField id="oppbanklocations" name="oppbanklocations" title="收方开户银行" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
	        	<r:textField id="oppprivateflag" name="oppprivateflag" title="公私标志" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
	        	<r:textField id="oppcardtype" name="oppcardtype" title="卡折类型" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:numberField id="ouramountValue" name="ouramountValue"  title="金额" readonly="true"/>
	        </r:panelItem>
        </r:tinyPanel>
   		<r:tinyPanel title="其他信息" hasHeader="false" column="3">
   			<r:panelItem>
   				<r:textField id="purpose" name="purpose" title="用途" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="purposename" name="purposename" title="代收付用途" readonly="true"/>
	        </r:panelItem>
            <r:panelItem>
	        	<r:checkbox title="加急" id="isurgent" name="isurgent" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="oppcellphone" name="oppcellphone" title="短信通知" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="oppemailaddress" name="oppemailaddress" title="邮件通知" readonly="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="memo" name="memo" title="备注" readonly="true"/>
	        </r:panelItem>
		</r:tinyPanel>
		<r:tinyPanel title="附件信息" hasHeader="false">
            <r:panelItem>
                <jsp:include page="/common/fileupload.jsp" >
                	<jsp:param name="id"  value="file_upload" />
					<jsp:param name="subkeyid"  value="<%=urid %>" />
					<jsp:param name="userid"  value="<%=userid %>" />
					<jsp:param name="width"  value="750" />
					<jsp:param name="disabled"  value="true" />
				</jsp:include>
            </r:panelItem> 
        </r:tinyPanel>
	</form>
</body>
</html>
<script type="text/javascript">
	$(function () {
		Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_SE_PAYMENT_SEARCH",
                urid: "${param.urid}"
            },
            ok: function (text) {
            	$("#directsglbankpayadd").RForm({value:text});
                setOurAccountInfo();
                setOppObject(text.rows[0]);
                if (text.rows[0]['isurgentvalue'] == "1") {
                    $("#isurgent").prop("checked", true);
                }
                $('#ouramountValue').val(text.rows[0]["ouramount"]);
                
            },
            err: function (text) {
                $.RMessage.alert("消息", "操作失败！" + text);
            }
        });
	})
	
	function setOurAccountInfo() {
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_BA_SUPPLYBANKACCOUNT_SEARCH",
                urid:  $("#ourbankaccountid").val()
            },
	        ok: function (text) {
	        	if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
                $('#ouraccountinfo').val(entity['banklocationid'] + "|" + entity['currencyname'] + "|" + entity['accounttypename']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", "操作失败！" + text);
	        }
	    });
	}
	
	function setOppObject(paytype) {
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_SE_PAYTYPES_SEARCH",
                urid: paytype['paytypeid']
            },
	        ok: function (text) {
	        	if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
	            if (entity['oppobjecttypevalue'] == <%=ENOppObjectType.INTERNAL_ORG.getValue()%>) {
	                changeOppObjectType("internal");
	                oppBankAccountSelFn();
	
	            } else if (entity['oppobjecttypevalue'] == <%=ENOppObjectType.EXTERNAL_COUNTERPARTY.getValue()%>) {
	                changeOppObjectType("external");
	                if (paytype['oppprivateflag'] == <%=ENPrivateFlag.PRIVATE.getValue()%>) {
	                    $("#oppprivateflag").prop("checked", true);
	                }
	                else if ((paytype['oppprivateflag'] == <%=ENPrivateFlag.PUBLIC.getValue()%> )) {
	                    $("#oppprivateflag").prop("checked", false);
	                }
	            }
	            //选择交易类型后保存交易类型的可选账户性质，用于过滤本方账户
	            $('#accounttyperange').val(entity['accounttyperange']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", "操作失败！" + text);
	        }
	    });
	}
	
	var oppBankAccountSelFn = function () {
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: $("#oppbankaccountid").val(),
                uc: 'UC_SCS_BA_PURCHASEBANKACCOUNT_SEARCH'
            },
	        ok: function (text) {
	        	if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
                $('#oppbankaccount').val(entity['bankaccountnumber']);
	            $('#oppaccountinfo').val(entity['banklocationid'] + "|" + entity['currencyname'] + "|" + entity['accounttypename']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", text || "操作失败！");
	        }
	    });
	};
	
	//切换交易对手
	function changeOppObjectType(objectType) {
	    if (objectType == "internal") {
	    	$(".isInternalOrg").show();
            $(".isExternalCounterparty").hide();
	    } else if (objectType == "external") {
	    	$(".isInternalOrg").hide();
            $(".isExternalCounterparty").show();
	    }
	}
	
</script>