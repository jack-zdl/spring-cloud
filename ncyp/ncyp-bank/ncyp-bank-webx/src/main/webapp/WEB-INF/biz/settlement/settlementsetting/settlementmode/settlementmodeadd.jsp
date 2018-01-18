<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.biz.constants.ENCurrencyScenarios"%>
<%@ page import="com.ceying.chx.biz.constants.ENSettlementScenarios"%>
<%@ page import="com.ceying.chx.biz.constants.ENDealType"%>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ page import="com.ceying.chx.base.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String formDataUrl = request.getContextPath() + "/settlementsetting/settlementmode/add.do";
    if(modFlag){
    	formDataUrl = request.getContextPath() + "/settlementsetting/settlementmode/edit.do";    	
    }
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
    //获取自定义直联配置属性的URL
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SCS_SE_SETTLEMENTMODEDIRECTCFG_SEARCH&settlementmodeid="+urid;

    //获取网银互联的直联跨行系统URID
    ComRowSet directInterBankSystem = commonQueryController.search("UC_SCS_SE_SETTLEMENTMODEDIRECTCFG_SEARCH",new String[]{"settlementmodeid"}, new String[]{request.getParameter("urid")});
    String directInterBankSystemid = directInterBankSystem.getValue(0,"urid");
    
    ComRowSet currency = commonQueryController.search("UC_BASE_SET_CURRENCY_SEARCH",new String[]{"name"},new String[]{"人民币"});
    String currencyid = currency.getValue(0,"urid");
	String currencycodename = currency.getValue(0,"codename");
%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="settlementmodeadd" >
    	<input type="hidden" id="urid" name="urid" value=""/>
    	<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
    	<r:tinyPanel title="基本信息" hasHeader="false" column='3'>
    		<r:panelItem>
    			<r:textField id="code" name="code" title="代码" check="required" />
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="name" name="name" title="名称" check="required"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/dictionary/moneyway.jsp">
		            <jsp:param name="id" value="moneyway"/>
		            <jsp:param name="title" value="交易方向"/>
		            <jsp:param name="check" value="required"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/dictionary/dealtype.jsp">
		            <jsp:param name="id" value="dealtype"/>
		            <jsp:param name="title" value="支付类型"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="SelFn" value="dealtypeSelFn"/>
	            </jsp:include>
	        </r:panelItem>  
	        <%-- <r:panelItem>
	        	<r:checkbox title="是否联动拨付" id="islinkallocation" name="islinkallocation"/>
	        </r:panelItem> 
	        <r:panelItem>
	        	<r:checkbox title="生成日记账" id="isgenjournal" name="isgenjournal"/>
	        </r:panelItem>  --%>
        	<r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
	        <r:panelItem> 
	        	<r:textArea  id="description" name="description" title="描述" width='3'/>
	        </r:panelItem>
        </r:tinyPanel>
        <r:editableGrid id="direct"  saveFn="" initialize="" dataUrl="<%=dataUrl%>" height="250" primaryKey="['urid']" hiddenCol="['urid']"
               colModel="{title:'直联银行',text:'bankname',id:'bankid',Htext:'codename',Hid:'urid',type:5,width:'150',check:'required',
               			afterSelect:banidAFS,url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_BANK_BANKS_SEARCH&isdirect=1&isactive=1'},
                       {title:'交易场景',text:'currencyscenariosname',id:'currencyscenarios',Htext:'text',Hid:'value',type:4,width:'100',check:'required',
                       afterSelect:currencyscenariosAFS,url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=1036'},
                       {title:'币种',text:'currencyname',id:'currencyid',Htext:'codename',Hid:'urid',type:5,width:'100',check:'required',
                       url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_SET_CURRENCY_SEARCH'},
                       {title:'结算场景',text:'settlementscenariosname',id:'settlementscenarios',type:4,width:'100',Htext:'text',Hid:'value',check:'required',
                       afterSelect:settlementscenariosAFS,url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=1037'},
                       {title:'直联渠道',text:'directchannelname',id:'directchannelid',Htext:'codename',Hid:'urid',type:5,width:'150',check:'required',
                       beforeSelect:directchannelidBFS,afterSelect:directchannelidAFS,url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_BANK_DIRECTCHANNEL_PUB_SEARCH'},
                       {title:'直联渠道指令',text:'directchannelcmdname',id:'directchannelcmdid',Htext:'codename',Hid:'urid',type:5,width:'140',
                       beforeSelect:directchannelcmdidBFS,url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_BANK_DIRECTCHANNELCMD_SEARCH&isactive=1'},
                       {title:'跨行支付系统',text:'directinterbanksystemname',id:'directinterbanksystemid',Htext:'codename',Hid:'urid',type:5,width:'100',
                       url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_BANK_DIRECTINTERBANKSYSTEMS_SEARCH'}" />
	</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">

	function banidAFS(){
		var ID = this.ID;
	    var arr = toGetNum(ID);
	    $('#directchannelid_5_'+arr[1]).RComboGrid('setAllValue', ['','']);
		$('#directchannelcmdid_6_'+arr[1]).RComboGrid('setAllValue', ['','']);
	}
	function currencyscenariosAFS(){
		var ID = this.ID;
	    var arr = toGetNum(ID);
	    $('#directchannelid_5_'+arr[1]).RComboGrid('setAllValue', ['','']);
		$('#directchannelcmdid_6_'+arr[1]).RComboGrid('setAllValue', ['','']);
	}
	function settlementscenariosAFS(){
		var ID = this.ID;
	    var arr = toGetNum(ID);
	    var settlementscenarios = $("#settlementscenarios_4_" + arr[1]).RCombo('getValue');
	    $('#directchannelid_5_'+arr[1]).RComboGrid('setAllValue', ['','']);
		$('#directchannelcmdid_6_'+arr[1]).RComboGrid('setAllValue', ['','']);
		$('#directinterbanksystemid_7_'+arr[1]).RComboGrid('setAllValue', ['','']);
		if(settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKINTERNALTRANSFER.getValue()%>" ||
			settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKTOPRIVATE.getValue()%>" ||
			settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKTOPUBLIC.getValue()%>"){
			$('#directinterbanksystemid_7_'+arr[1]).RComboGrid('setReadOnly', true);
		}else{
			$('#directinterbanksystemid_7_'+arr[1]).RComboGrid('setReadOnly', false);
		}
	}
	
	function directchannelidAFS(){
		var ID = this.ID;
	    var arr = toGetNum(ID);
	   	$('#directchannelcmdid_6_'+arr[1]).RComboGrid('setAllValue', ['','']);
	}
	
	var directchannelidBFS = function(parm){
		var ID = this.ID;
	    var arr = toGetNum(ID);
		var bankid = $("#bankid_1_" + arr[1]).RComboGrid('getValue');
		var currencyscenarios = $("#currencyscenarios_2_" + arr[1]).RCombo('getValue');
		var settlementscenarios = $("#settlementscenariosname_4_" + arr[1]).RCombo('getValue');
		return [getParams(bankid,currencyscenarios,settlementscenarios,'')];
	}
	var directchannelcmdidBFS = function(parm){
		var ID = this.ID;
	    var arr = toGetNum(ID);
		var bankid = $("#bankid_1_" + arr[1]).RComboGrid('getValue');
		var currencyscenarios = $("#currencyscenarios_2_" + arr[1]).RCombo('getValue');
		var settlementscenarios = $("#settlementscenariosname_4_" + arr[1]).RCombo('getValue');
		var directchannelid = $("#directchannelid_5_" + arr[1]).RComboGrid('getValue');
		return [getParams(bankid,currencyscenarios,settlementscenarios,directchannelid)];
	}

    $(function(){
    	$("#direct").hide();
        if(<%= modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_SE_SETTLEMENTMODES_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#settlementmodeadd").RForm({value:text});
                    if(text.rows[0]["dealtypevalue"] == "<%=ENDealType.DIRECT.getValue()%>"){
                    	dealtypeSelFn();
                    }
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    })
    var saveFn = function(){
    	$("#settlementmodeadd").RValidate({
			'success': save
  		});
		$("#settlementmodeadd").RValidate('validate');
    }
    
    var save = function(){
	    var action = $("#settlementmodeadd").attr("action");
	    var params = $("#settlementmodeadd").AllSerialize();
        $("#direct").EditableGrid('toValidate', function(){
            params += "&addData=" + JSON.stringify($('#direct').EditableGrid('getAddValue'));
            params += "&editData=" + JSON.stringify($('#direct').EditableGrid('getEditValue'));
            params += "&delIds=" + $('#direct').EditableGrid('getDelArray').join(",");
            params = decodeURIComponent(params);
            Ajax.req({
                url: '<%= formDataUrl%>',
                params: params,
                ok: function(text) {
                    clearCache(['UC_SCS_SE_SETTLEMENTMODES_SEARCH']);
                    $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        })
    }
    var getParams = function(bankid,currencyscenarios,settlementscenarios,directchannelid){
    	/*	根据本外币场景过滤
		境内本币 --过滤出支持境内、本币的渠道指令和对应的渠道
		境内外币 --过滤出支持境内、外币的渠道指令和对应的渠道
		境外本币 --过滤出支持境外、本币的渠道指令和对应的渠道
		境外外币 --过滤出支持境外、外币的渠道指令和对应的渠道
		*/
		var params = {};
		params.bankid = bankid;
		if(directchannelid != ''){
			params.directchannelid = directchannelid;
		}
		if(currencyscenarios == "<%=ENCurrencyScenarios.INBOUND_SAMECURRENCY.getValue()%>"){
			params.isinbound = "1";
			params.islocalcurrency = "1";
		}else if(currencyscenarios == "<%=ENCurrencyScenarios.INBOUND_DIFFCURRENCY.getValue()%>"){
			params.isinbound = "1";
			params.isforeigncurrency = "1";
		}else if(currencyscenarios == "<%=ENCurrencyScenarios.OUTBOUND_SAMECURRENCY.getValue()%>"){
			params.isoutbound = "1";
			params.islocalcurrency = "1";
		}else if(currencyscenarios == "<%=ENCurrencyScenarios.OUTBOUND_DIFFCURRENCY.getValue()%>"){
			params.isoutbound = "1";
			params.isforeigncurrency = "1";
		}	
    	
		/*	根据结算场景过滤
		默认--过滤出所有的渠道和指令
		同行对私--过滤出支持同行、对私的渠道指令和对应的渠道
		同行对公--过滤出支持同行、对公的渠道指令和对应的渠道
		同行内部调拨--过滤出支持同行内部调拨的渠道指令和对应的渠道
		跨行默认--过滤出支持跨行的渠道指令和对应的渠道
		跨行同城非加急--过滤出支持跨行的渠道指令和对应的渠道
		跨行加急--过滤出支持跨行的渠道指令和对应的渠道
		跨行且满足网银互联--过滤出支持跨行且跨行对接系统范围中包含网银互联的渠道指令和对应的渠道
		*/
		if(settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKTOPRIVATE.getValue()%>"){
			params.issamebank = "1";
			params.isprivate = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKTOPUBLIC.getValue()%>"){
			params.issamebank = "1";
			params.ispublic = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.SAMEBANKINTERNALTRANSFER.getValue()%>"){
			params.issamebankinternalallocate = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.AGENTPAYOFFTOPRIVATE.getValue()%>"){
			params.isprivate = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.AGENTPAYOFFTOPUBLIC.getValue()%>"){
			params.ispublic = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.INTERBANKDEFAULT.getValue()%>"){
			params.isotherbank = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.INTERBANKSAMECITYNONURGENT.getValue()%>"){
			params.isotherbank = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.INTERBANKURGENT.getValue()%>"){
			params.isotherbank = "1";
		}else if(settlementscenarios == "<%=ENSettlementScenarios.INTERBANKANDINTERNETBANKINGINTERNET.getValue()%>"){
			params.isotherbank = "1";
			params.directinterbanksysrange = ","+"<%=directInterBankSystemid%>"+",";
		}
		params.moneyway = $("#moneyway").val();
		return params;
    }
    
    var dealtypeSelFn = function(){
    	if($("#dealtype").val() == "<%=ENDealType.DIRECT.getValue()%>"){
    		$("#direct").show();
    	}else{
    		$("#direct").hide();
    	}
    }
</script>