<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ page import="com.ceying.chx.biz.constants.ENSource"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	String counterpartyid = request.getParameter("counterpartyid");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/settlementsetting/counterparty/counterpartyaccountadd.do";
    if(modFlag){
    	dataUrl = request.getContextPath() + "/settlementsetting/counterparty/counterpartyaccountedit.do";    	
    }
%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="counterpartyaccountadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
     	<r:tinyPanel title="基本信息" hasHeader="false" column="3">
    		<r:panelItem>
	     		<jsp:include page="/common/wedget/ucsearch/counterparty.jsp">
		            <jsp:param name="id" value="counterpartyid"/>
		            <jsp:param name="title" value="交易对手"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="readonly" value="true"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
    			<r:textField id="cellphone" name="cellphone" title="手机号码" check="cellphone"/>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/cardtype.jsp">
		            <jsp:param name="id" value="cardtype"/>
		            <jsp:param name="title" value="卡折类型"/>
		            <jsp:param name="check" value=""/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/privateflag.jsp">
		            <jsp:param name="id" value="privateflag"/>
		            <jsp:param name="title" value="公私标志"/>
		            <jsp:param name="check" value="required"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="accountnumber" name="accountnumber" title="银行账号" check="required"/>
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="accountname" name="accountname" title="账户名称" check="required"/>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/bank.jsp">
		            <jsp:param name="id" value="bankid"/>
		            <jsp:param name="title" value="银行"/>
		            <jsp:param name="SelFn" value="bankidSelFn"/>
		            <jsp:param name="listWidth" value="250"/>
	            </jsp:include>
	        </r:panelItem>
            <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/area.jsp">
		            <jsp:param name="id" value="areaid"/>
		            <jsp:param name="title" value="区域"/>
		            <jsp:param name="SelFn" value="areaidSelFn"/>
		            <jsp:param name="listWidth" value="250"/>
	            </jsp:include>
	        </r:panelItem>
            <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/pubcnaps.jsp">
		            <jsp:param name="title" value="开户银行"/>
		            <jsp:param name="id" value="cnaps"/>
		            <jsp:param name="BFn" value="cnapsBF"/>
		            <jsp:param name="SelFn" value="cnapsSelFn"/>
		            <jsp:param name="listWidth" value="250"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/currency.jsp">
		            <jsp:param name="id" value="currencyid"/>
		            <jsp:param name="title" value="币种"/>
	                <jsp:param name="linkageParam" value="{'isactive':'1'}"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="banklocations" name="banklocations" title="开户行名称" />
	        </r:panelItem>
            <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/certtype.jsp">
		            <jsp:param name="id" value="certtype"/>
		            <jsp:param name="title" value="证件类型"/>
		            <jsp:param name="check" value=""/>
	            </jsp:include>
	        </r:panelItem>
            <r:panelItem>
    			<r:textField id="certnumber" name="certnumber" title="证件号码" />
	        </r:panelItem>
            <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/source.jsp">
		            <jsp:param name="id" value="source"/>
		            <jsp:param name="title" value="数据来源"/>
		            <jsp:param name="readonly" value="true"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否已核验" id="isverified" name="isverified"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="默认结算账户" id="isdefaultsettlementaccount" name="isdefaultsettlementaccount"/>
	        </r:panelItem>
        	<r:panelItem>
	        	<r:textArea  id="description" name="description" title="描述" width="3"/>
	        </r:panelItem> 
    	</r:tinyPanel>
	</form>
<div class="btn_block">
    <r:button text="保存" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="saveFn"/>
    <r:button text="取消" id="cancelid" iclass="bigger-110" bclass="btn btn-primary" onClick="closeCounterpartyaccounteWinFn"/>
</div>
</body>
</html>
<script type="text/javascript">
    $(function(){
        if(<%= modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#counterpartyaccountadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }else{
        	//设置初始值
        	$("#counterpartyid").attr('value',"<%=counterpartyid%>");
        	$("#counterpartyid").RComboGrid('setValue');
        	$("#source").attr('value','<%= ENSource.HAND.getValue()%>');
        	$("#source").RCombo('setValue');
        }
    })
    
    var saveFn = function(){
    	$("#counterpartyaccountadd").RValidate({
			'success': save
  		});
		$("#counterpartyaccountadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#counterpartyaccountadd").AllSerialize();
	    params = decodeURIComponent(params);
	    Ajax.req({
	        url: '<%= dataUrl%>',
	        params: params,
	        ok: function(text) {
	        	clearCache(['UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH']);
	        	$.RMessage.alert("消息", text.msg, closeCounterpartyaccounteWinFn);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
    
    var closeCounterpartyaccounteWinFn = function(){
    	parent.$("#counterpartyaccountaddModal").modal("hide");
    	parent.$("#counterpartyaccounteditModal").modal("hide");
    	var qparams = {"uc":"UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH","counterpartyid":"<%=counterpartyid%>"};
    	parent.$("#grid-table").RGrid("setGridParam",qparams); 
    }
    
    var counterpartyidBFn = function(){
    	$("#counterpartyid").RComboGrid('setReadOnly',true);
    	var Json = [{"counterpartyid":"<%=counterpartyid%>"}];
    	return Json;
    }
    
    var bankidSelFn = function(){
    	$('#cnaps').RComboGrid("setAllValue",["",""]);
    }
    
    var areaidSelFn = function(){
    	$('#cnaps').RComboGrid("setAllValue",["",""]);
    }
    
    var cnapsBF = function(){
    	var bankid = $("#bankid").RComboGrid("getValue");
    	var areaid = $("#areaid").RComboGrid("getValue");
    	var Json = [{"bankid":bankid,"areaid":areaid}];
    	return Json;
    }
    
    var cnapsSelFn = function(){
    	areanameFn($("#cnaps").RComboGrid("getValue"));
    }
    
    var areanameFn = function(code) {
        Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	code: code,
                uc: 'UC_BASE_BANK_BANKLOCATIONS_SEARCH'
            },
            ok: function (text) {
            	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
                setBankid(entity["bankid"]);
                setAreaid(entity["areaid"]);
                $('#banklocations').val(entity["name"]);
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    function setBankid(urid) {
        Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: urid,
                uc: 'UC_BASE_BANK_BANKS_SEARCH'
            },
            ok: function (text) {
            	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
                $('#bankid').attr('value',entity["urid"]);
            	$('#bankid').RComboGrid('setValue');
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    function setAreaid(urid) {
        Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: urid,
                uc: 'UC_BASE_BANK_AREA_SEARCH'
            },
            ok: function (text) {
            	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
                $('#areaid').attr('value',entity["urid"]);
            	$('#areaid').RComboGrid('setValue');
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
</script>