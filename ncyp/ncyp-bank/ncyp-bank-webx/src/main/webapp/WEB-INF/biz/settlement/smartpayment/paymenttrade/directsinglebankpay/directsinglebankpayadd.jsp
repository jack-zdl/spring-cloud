<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.biz.constants.ENPrivateFlag"%>
<%@ page import="com.ceying.chx.biz.constants.ENDealType"%>
<%@ page import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@ page import="com.ceying.chx.biz.constants.ENOppObjectType"%>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid")==null?"":request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/smartpayment/paymenttrade/directsglbankpayadd.do";
    if(modFlag){
    	dataUrl = request.getContextPath() + "/smartpayment/paymenttrade/directsglbankpayedit.do";
    }
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String orgid = currUser.getOrg_id();
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
   	
    
    //附件信息
    String deleteUrl = request.getContextPath() + "/upload?actiontype=DEL&userid=" + userid +"&ids=";
    String addUrl = request.getContextPath() + "/upload?actiontype=PREADD&userid=" + userid;
%>
<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="directsglbankpayadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    	<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
     	<r:tinyPanel title="基本信息" hasHeader="false" column="3">
     		<jsp:include page="/scs/settlement/smartpayment/generalinfo.jsp">
     			<jsp:param name="linkageParam"
                       value="[{'dealtype':'1','isactive':'1','iscanmanualentry':'1','moneyway':'1','paytypecategorynotin':'1,2','directpaywaynotin':'2,4'}]"/>
	            <jsp:param name="applyorgid" value="<%=orgid%>"/>
	            <jsp:param name="defaultdealtype" value="1"/>
	            <jsp:param name="modFlag" value="<%=modFlag%>"/>
     		</jsp:include>
   		</r:tinyPanel>
   		<r:tinyPanel title="付方信息" hasHeader="false" column="3">
   			<jsp:include page="/scs/settlement/smartpayment/ourinfo.jsp">
	   			<jsp:param name="linkageParam"
	                         value="[{'orgid':$(\"#applyorgid\").val(),'isbankdirect':'1','accountstate':'2','accounttypeid':$('#accounttyperange').val()}]"/>
	   		</jsp:include>
   			<r:panelItem classes="isInternalOrg">
	        	<jsp:include page="/common/wedget/ucsearch/organizationoption.jsp">
				     <jsp:param name="id" value="opporgid"/>
				     <jsp:param name="title" value="收方组织"/>
				     <jsp:param name="check" value="required"/>
				     <jsp:param name="SelFn" value="oppOrgSelFn"/>
			    </jsp:include>	
	        </r:panelItem>
	        <r:panelItem classes="isInternalOrg">
	        	<jsp:include page="/common/wedget/ucsearch/supplybankaccount.jsp">
			    	 <jsp:param name="title" value="收方账户"/>
	                 <jsp:param name="id" value="oppbankaccountid"/>
	                 <jsp:param name="check" value="required"/>
	                 <jsp:param name="readonly" value="true"/>
	                 <jsp:param name="BFn" value="oppBankAccountBFn"/>
            		 <jsp:param name="SelFn" value="oppBankAccountSelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem classes="isInternalOrg">
	        	<r:textArea  id="oppaccountinfo" name="oppaccountinfo" title="收方账户信息" readonly="true" width="3" height='4'/>
	        </r:panelItem>
   			<r:panelItem classes="isExternalCounterparty">
   				<jsp:include page="/common/wedget/ucsearch/counterparty.jsp">
	     			<jsp:param name="title" value="收方名称"/>
	                <jsp:param name="id" value="oppcounterpartyid"/>
	                <jsp:param name="check" value="required"/>
	                <jsp:param name="isWrite" value="true"/>
	                <jsp:param name="BFn" value="oppCounterPartyBFn"/>
            		<jsp:param name="SelFn" value="oppCounterPartySelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
   				<jsp:include page="/common/wedget/ucsearch/pubcounterpartyaccount.jsp">
			    	 <jsp:param name="title" value="收方账户"/>
	                 <jsp:param name="id" value="oppcounterpartyaccountid"/>
	                 <jsp:param name="check" value="required"/>
	                 <jsp:param name="isWrite" value="true"/>
	                 <jsp:param name="selectable" value=""/>
	                 <jsp:param name="BFn" value="oppCounterPartyAccountBFn"/>
            		 <jsp:param name="SelFn" value="oppCounterPartyAccountSelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
   				<r:textField  id="oppbankaccountname" name="oppbankaccountname" title="收方户名"
            				check="required"/>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
   				<jsp:include page="/common/wedget/ucsearch/banklocation.jsp">
		    		<jsp:param name="title" value="收方开户银行"/>
	                <jsp:param name="id" value="oppbanklocationid"/>
	                <jsp:param name="check" value="required"/>
	                <jsp:param name="listWidth" value="300"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
    			<jsp:include page="/common/wedget/dictionary/privateflag.jsp">
		            <jsp:param name="id" value="oppprivateflag"/>
		            <jsp:param name="title" value="公私标志"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="SelFn" value="oppprivateflagSelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem classes="isExternalCounterparty">
	        	<jsp:include page="/common/wedget/dictionary/cardtype.jsp">
	 				<jsp:param name="title" value="卡折类型"/>
	                <jsp:param name="id" value="oppcardtype"/>
	                <jsp:param name="selectable" value="false"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:numberField id="ouramount" name="ouramount" check="required" title="金额" moneyFormat="float"/>
	        </r:panelItem>
        </r:tinyPanel>
   		<r:tinyPanel title="其他信息" hasHeader="false" column="3">
   			<r:panelItem>
   				<r:textField id="purpose" name="purpose" title="用途"/>
	        </r:panelItem>
	        <r:panelItem>
   				<jsp:include page="/common/wedget/ucsearch/purpose.jsp">
	           	 	<jsp:param name="title" value="代收付用途"/>
	                <jsp:param name="id" value="purposeid"/>
	             </jsp:include>
	        </r:panelItem>
            <r:panelItem>
	        	<r:checkbox title="加急" id="isurgent" name="isurgent"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="oppcellphone" name="oppcellphone" title="短信通知" check="cellphone"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="oppemailaddress" name="oppemailaddress" title="邮件通知" check="email"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="memo" name="memo" title="备注"/>
	        </r:panelItem>
		</r:tinyPanel>
		<r:tinyPanel title="附件信息" hasHeader="false" column="1">
            <r:panelItem>
               <jsp:include page="/common/fileupload.jsp" >
                    <jsp:param name="id"  value="file_upload" />
                    <jsp:param name="subkeyid"  value="<%=urid %>" />
                    <jsp:param name="userid"  value="<%=userid %>" />
                    <jsp:param name="uploadSuccess"  value="uploadSuccess" />
                    <jsp:param name="uploadError"  value="uploadError" />
                </jsp:include>
            </r:panelItem> 
        </r:tinyPanel>
	</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">
	$(function () {
    	$("#oppcounterpartyid").RComboGrid('toCompare',oppCounterPartyInlist);
    	$("#oppcounterpartyaccountid").RComboGrid('toCompare',oppCounterPartyAccountInlist);
    	//收方默认显示内部组织
	    changeOppObjectType("internal");
		
	    if (<%= modFlag%>) {
	        //获取表单的初始值
	        Ajax.req({
	        	url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_SE_DIRECTSGLBANKPAY_SEARCH",
                    urid: "<%=urid%>"
                },
	            ok: function (text) {
                    $("#directsglbankpayadd").RForm({value:text});
                    $("#ourbankaccountid").RComboGrid("setAllValue",[text.rows[0]["ourbankaccountid"],text.rows[0]["ourbankaccountnumber"]]);
                    //付方信息
	                setOurAccountInfo();
	                //收方信息
	                setOppObject(text.rows[0]);
	            },
	            err: function (text) {
	                $.RMessage.alert("消息", text);
	            }
	        });
	    }else{
	    	//公私标志,默认对公
	    	$('#oppprivateflag').RCombo('setAllValue',['<%= ENPrivateFlag.PUBLIC.getValue()%>','<%= ENPrivateFlag.PUBLIC.getLabel()%>']);
	    	$("#oppcardtype").RCombo('setReadOnly',true);
	    }
	});
	
	var saveFn = function(){
    	if(!<%=modFlag%>){
	    	Ajax.req({
	            url: "${pageContext.request.contextPath}/common/getUUID.do",
	            type: "json",
	            method: "post",
	            async: false,
	            ok: function(text){
	            	if(text.rows.length < 1){
		                $.RMessage.alert("消息", text.msg);
		                return;
		            }
	                var entity = text.rows[0];
	                $("#urid").val(entity["urid"]);
	                upload(entity["urid"]);
	            },
	            err: function(text){
	                $.RMessage.alert("消息", text);
	            }
	        });
    	}else{
    		 upload("<%=urid%>");
    	}
    }
	
	//附件上传之后，保存表单
    var uploadSuccess = function(){
    	var urid = $("#urid").val();
    	//当表单保存失败之后，需要删除相关的附件
    	var addFileName =  $('#file_upload').RUploadfile('getAddFileName').join(",");//获得已经上传的附件文件名
    	//当表单保存成功之后，删除选中的附件
    	var delDataKeys =  $('#file_upload').RUploadfile('getDelData').join(",");//获得需要删除的文件的主键数组
        $("#directsglbankpayadd").RValidate({
            'success': function(){
            	var oppbankaccountnumber = $('#oppcounterpartyaccountid').val();
            	var oppname = $('#oppcounterpartyid').val();
			    var params = $("#directsglbankpayadd").AllSerialize();
			    params += "&oppbankaccountnumber=" + oppbankaccountnumber;
			    params += "&oppname=" + oppname;
			    params += "&addFileName=" + addFileName;
			    params += "&delDataKeys=" + delDataKeys;
			    params = decodeURIComponent(params);
                Ajax.req({
                    url: '<%= dataUrl%>',
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
        $("#directsglbankpayadd").RValidate("validate");
    }
	
  	//附件上传失败，弹出提示信息
    var uploadError = function(text){
    	$.RMessage.alert("消息", "附件上传失败！"+ text);
    }
	
	//作为修改页面时，根据交易对手显示收方账户框并赋初始值
	var setOppObject = function(paytype) {
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_SE_PAYTYPES_SEARCH",
                urid: paytype['paytypeid']
            },
	        ok: function (text) {
	        	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
                var settlementmoderange = entity['settlementmoderange'] == null ? "" : entity['settlementmoderange'];
                settlementmoderange = settlementmoderange.substring(1, settlementmoderange.length - 1);
                //设置结算方式范围
                setSettlementmoderange(settlementmoderange);
	            //交易对手对内对外
	            var oppobjecttype = entity['oppobjecttypevalue'];
	            if (oppobjecttype == <%=ENOppObjectType.INTERNAL_ORG.getValue()%> ) {
	                changeOppObjectType("internal");
	                //设置组织范围
	                setOppOrgRange(entity['opporgoption']);
	                //设置初始值
	                $("#oppbankaccountid").RComboGrid("setAllValue",[paytype["oppbankaccountid"],paytype["oppbankaccountnumber"]]);
	                $('#oppbankaccountid').RComboGrid('setReadOnly', false);
	                oppBankAccountSelFn();
	                //选择交易类型后保存交易类型的对方可选账户性质和对方可选账户类别用于过滤对方账户
	                $('#oppaccounttyperange').val(entity['oppaccounttyperange']);
	                $('#oppaccountcategoryrange').val(entity['oppaccountcategoryrange']);
	
	            }  else if (oppobjecttype == <%=ENOppObjectType.EXTERNAL_COUNTERPARTY.getValue()%>) {
	                changeOppObjectType("external");
	                //设置初始值
	                $("#oppcounterpartyaccountid").RComboGrid("setAllValue",[paytype["oppbankaccountid"],paytype["oppbankaccountnumber"]]);
	                $('#oppbanklocationid').attr('value',paytype["oppbanklocationid"]);
	                $('#oppbanklocationid').RComboGrid('setValue');
	                //setCounterPartyAccountInfoReadOnly();//设置交易对手账户信息只读
	                var oppprivateflag = $("#oppprivateflag").val();
	        		if(oppprivateflag == "<%= ENPrivateFlag.PRIVATE.getValue()%>"){
	        	    	$('#oppcardtype').RCombo('setReadOnly', false);
	        		}else{
	        	    	$('#oppcardtype').RCombo('setReadOnly', true);
	        		}
	                
	            } 
	            //选择交易类型后保存交易类型的可选账户性质，用于过滤本方账户
	            $('#accounttyperange').val(entity['accounttyperange']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", text);
	        }
	    });
	}
	
	//切换交易对手时清除交易对手数据
	var cleanData = function() {
	    //清除对方账户信息 对内
	    cleanInternal();
	    //清除对方账户信息 对外
	    cleanExternal();
	}
	
	var cleanInternal = function(){
		$('#opporgid').RComboGrid("setAllValue",["",""]);
    	$('#oppbankaccountid').RComboGrid("setAllValue",["",""]);
	    $('#oppbankaccountid').RComboGrid('setReadOnly', true);
	    $('#oppaccountinfo').val("");
	}
	
	var cleanExternal = function(){
    	$('#oppcounterpartyid').RComboGrid("setAllValue",["",""]);
    	$('#oppcounterpartyaccountid').RComboGrid("setAllValue",["",""]);
	    $('#oppbankaccountname').val("");
	    //$('#oppbankaccountname').RTextField('setReadOnly', false);
    	$('#oppbanklocationid').RComboGrid("setAllValue",["",""]);
	    $('#oppbanklocationid').RComboGrid('setReadOnly', false);
	    //$("#cnaps").FButton("setDisabled", false);//只能匹配
	    $("#oppprivateflag").attr("checked", false);
	    $("#oppprivateflag").removeAttr("disabled");
    	$('#oppcardtype').RCombo("setAllValue",["",""]);
	}
	
	//设置结算方式范围
	var setSettlementmoderange = function(settlementmoderangevalue) {
	    var dealtype = '<%=ENDealType.DIRECT.getValue()%>';
	    var moneyway = '<%=ENMoneyWay.PAY.getValue()%>';
	    var json = {"urids":settlementmoderangevalue,"dealtype":dealtype,"moneyway":moneyway,"isactive":"1"};
	    $("#settlementmodeid").RComboGrid("setParam",json);
	}
	
	//切换交易对手
	var changeOppObjectType = function(objectType) {
	    if (objectType == "internal") {
	    	$(".isInternalOrg").show();
            $(".isExternalCounterparty").hide();
			$("#opporgid").RComboGrid('setCheck','required:true');
			$("#oppbankaccountid").RComboGrid('setCheck','required:true');
			$("#oppcounterpartyid").RComboGrid('setCheck','');
			$("#oppcounterpartyaccountid").RComboGrid('setCheck','');
			$("#oppbankaccountname").removeAttr("check");
			$("#oppbankaccountname").find('span.tips').remove();
			$("#oppbanklocationid").RComboGrid('setCheck','');
	    } else if (objectType == "external") {
	    	$(".isInternalOrg").hide();
            $(".isExternalCounterparty").show();
			$("#oppcounterpartyid").RComboGrid('setCheck','required:true');
			$("#oppcounterpartyaccountid").RComboGrid('setCheck','required:true');
			$("#oppbankaccountname").attr("check","required:true");
			$("#oppbankaccountname").prepend('<span class="tips">*</span>');
			$("#oppbanklocationid").RComboGrid('setCheck','required:true');
	        $("#opporgid").RComboGrid('setCheck','');
			$("#oppbankaccountid").RComboGrid('setCheck','');
	    }
	}
	/* 
	//设置交易对手账户相关信息只读
	function setCounterPartyAccountInfoReadOnly() {
	    $I('oppbankaccountname').FTextField('readonly', true);
	    $("#oppprivateflag").attr("disabled", "disabled");
	    $I("oppcardtype").FCombo("setSelectable", false);
	} */
	
	//是否对私
	var oppprivateflagSelFn = function(){
		var oppprivateflag = $("#oppprivateflag").RCombo("getValue");
		if(oppprivateflag == "<%= ENPrivateFlag.PRIVATE.getValue()%>"){
	       	$('#oppcardtype').RCombo("setAllValue",["",""]);
	    	$('#oppcardtype').RCombo('setReadOnly', false);
		}else{
	       	$('#oppcardtype').RCombo("setAllValue",["",""]);
	    	$('#oppcardtype').RCombo('setReadOnly', true);
		}
	}
	
	//选择收方组织，清空收方账户和收方账户信息
	var oppOrgSelFn = function () {
    	$('#oppbankaccountid').RComboGrid("setAllValue",["",""]);
		$('#oppbankaccountid').RComboGrid('setReadOnly',false);
		$('#oppaccountinfo').val("");
	    //setOppAccountByOurAccountAndOppOrg();//过滤对方组织
	};
	
	//选择对方账户前执行的方法，设置过滤条件
	var oppBankAccountBFn = function () {
	    var accounttyperange = $('#oppaccounttyperange').val();
	    if(accountcategoryrange == null && accountcategoryrange == ""){
	    	accounttyperange = "";
	    }
	    var accountcategoryrange = $('#oppaccountcategoryrange').val();
	    //设置账户类别的的查询条件
	    var isbankdirect = "1";
	    var iscashvirtual = "1";
	    var isbillvirtual = "1";
	    var chooseaccount = "000";
	  	//"账户类别范围
    	//1-银企直联户
    	//2-现金虚拟户
    	//3-票据虚拟户
    	//99-其它非直联户"
	    if (accountcategoryrange != null && accountcategoryrange != "") {
	    	if (accountcategoryrange.indexOf("99") < 0) {
	        	chooseaccount = "";
	        }
	        if (accountcategoryrange.indexOf("1") < 0) {
	            isbankdirect = "";
	        }
	        if (accountcategoryrange.indexOf("2") < 0) {
	            iscashvirtual = "";
	        }
	        if (accountcategoryrange.indexOf("3") < 0) {
	            isbillvirtual = "";
	        }
	    }
	  	if(chooseaccount == ""){
	  		chooseaccount = isbankdirect + isbillvirtual + isbillvirtual;
	  	}
	    accounttyperange = dealwithParam(accounttyperange);//去掉字段前后的逗号
	    return [{"accountstate":2,"accounttypeid":accounttyperange,"isbankdirect_value":isbankdirect,"orgid":$("#opporgid").val(),"iscashvirtual_value":iscashvirtual,"isbillvirtual_value":isbillvirtual,"chooseaccount":chooseaccount}];
	};

	//选择收方账户，填充收方账户信息（对内：供应方账户，对外：有两种，一个是交易对手，一个是采购方账户）
	var oppBankAccountSelFn = function () {
		var oppbankaccountid = $("#oppbankaccountid").RComboGrid("getValue");
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: oppbankaccountid,
                uc: 'UC_SCS_BA_SUPPLYBANKACCOUNT_SEARCH'
            },
	        ok: function (text) {
	        	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
	            $('#oppaccountinfo').val(entity['banklocationname'] + "|" + entity['currencyname'] + "|" + entity['accounttypename']);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", text);
	        }
	    });
	};
	
	
	//选择收方账户（交易对手账户）前下拉数据初始化
	var oppCounterPartyAccountBFn = function () {
	    var categoryid = $("#oppcounterpartycategoryrange").val();
	    var counterpartyid = $("#oppcounterpartyid").RComboGrid("getValue");
	    return [{"orgid":$("#applyorgid").val(),"isactive":"1","cp_isactive":"1","categoryid":categoryid,"counterpartyid":counterpartyid}];
	};
	
	var oppCounterPartySelFn = function () {
	    //为选择时，要清空掉交易对手账户的信息
       	$('#oppcounterpartyaccountid').RComboGrid("setAllValue",["",""]);
        $('#oppbankaccountname').val("");
        $('#oppbankaccountname').RTextField('readonly', false);
       	$('#oppbanklocationid').RComboGrid("setAllValue",["",""]);
        $('#oppbanklocationid').RComboGrid('setReadOnly', false);
        $('#oppprivateflag').RCombo("setAllValue",["",""]);
        $('#oppprivateflag').attr("checked", false);
        $('#oppprivateflag').removeAttr("disabled");
    	$('#oppcardtype').RCombo("setAllValue",["",""]);
    	//如果交易对手只存在一个交易账户，则默认选择该账户
    	setOnlyOneVal($('#oppcounterpartyid').RComboGrid("getValue"));
	};
	
	//选择收方账户（交易对手账户）
	var oppCounterPartyAccountSelFn = function () {
	    var oppcounterpartyaccountid = $('#oppcounterpartyaccountid').RComboGrid("getValue");
	    //变更收方账户时清除对方开户银行和联行号只能匹配的按钮的状态
       	$('#oppbanklocationid').RComboGrid("setAllValue",["",""]);
	    //$("#cnaps").FButton("setDisabled", false);
        //下拉选额或输入的账户已存在，补充交易对手账户相关资料
        setCounterPartyAccountInfo(oppcounterpartyaccountid);
	};
	
	var setCounterPartyAccountInfo = function(oppcounterpartyaccountid) {
	    Ajax.req({
	    	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: oppcounterpartyaccountid,
                uc: 'UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH'
            },
	        ok: function (text) {
	        	if(text.rows.length < 1){
	                $.RMessage.alert("消息", text.msg);
	                return;
	            }
                var entity = text.rows[0];
               	$('#oppbankaccountname').val(entity['accountname']);
               	$('#oppprivateflag').RCombo('setAllValue',[entity['privateflagvalue'],entity['privateflag']]);
   	        	$('#oppcardtype').RCombo('setAllValue',[entity['cardtypevalue'],entity['cardtype']]);
   	        	var oppprivateflag = $("#oppprivateflag").val();
        		if(oppprivateflag == "<%= ENPrivateFlag.PRIVATE.getValue()%>"){
        	    	$('#oppcardtype').RCombo('setReadOnly', false);
        		}else{
        	    	$('#oppcardtype').RCombo('setReadOnly', true);
        		}
   	            if (entity['isverifiedvalue'] == "1") {
   	                //setCounterPartyAccountInfoReadOnly();//设置交易对手账户信息只读
   	            }
   	           	if (entity['cnaps'] != null && entity['cnaps'] != "") {
   	                //交易对手账户存在联行号时，设置开户银行并设为只读
   	                setBanklocation(entity['cnaps']);
   	            }
   	            $('#oppcounterpartyid').attr('value', entity['counterpartyid']);
   	        	$('#oppcounterpartyid').RComboGrid('setValue');
   	            //特殊处理，把交易对手账户id赋给账户id，以便于传值
   	            $('#oppbankaccountid').attr('value', $("#oppcounterpartyaccountid").val());
   	        	$('#oppbankaccountid').RComboGrid('setValue');
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", text);
	        }
	    });
	}
	
	//设置开户银行
	var setBanklocation = function(code) {
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
	            //设置开户银行
        		$('#oppbanklocationid').RComboGrid('setAllValue',[entity['urid'],entity['codename']]);
	        },
	        err: function (text) {
	            $.RMessage.alert("消息", "操作失败！" + text);
	        }
	    });
	}
	
	//根据我方账户和组织
	var setOppAccountByOurAccountAndOppOrg = function() {
	     //清空对方账户信息
    	$('#oppbankaccountid').RComboGrid("setAllValue",["",""]);
    	$('#oppcounterpartyaccountid').RComboGrid("setAllValue",["",""]);
	    $('#oppaccountinfo').val("");
	   	cleanExternal();
	
	}
	/* 
	//金额转换大写中文
	function transAmount() {
	    var amount = $("#ouramount").val();
	    $I("amountCHN").html($Utils.chineseNumber(amount));
	}
	
	//联行号智能匹配弹窗
	function cnaps() {
	    var inlist = $I('oppcounterpartyaccountid').attr("inlist");
	    var accountnumber = "";
	    if (inlist == "true") {
	        accountnumber = $('#combobox-input-oppcounterpartyaccountid').val();
	    }
	    else {
	        accountnumber = $I('oppcounterpartyaccountid').FComboGrid('getValue');
	    }
	    $I('cnapsWin').FWin('show');
	    $I('cnapsWin').FWin('setPageUrl', '${pageContext.request.contextPath}/modules/settlement/cnaps.jsp?accountnumber=' + accountnumber);
	}
	 */
	 
	var oppCounterPartyBFn = function() {
	    var categoryids = $("#oppcounterpartycategoryrange").val();
	    return [{'isactive': '1','categoryids': categoryids,'orgid': $('applyorgid').val()}];
	}
	//去除字段前后的逗号(,)
	var dealwithParam = function(params){
		 if(params == null || params == ""){
			 return "";
		 }
		 return params.substring(1,params.length-1);
		 
	}
	//交易对手手填之后的处理函数
	var oppCounterPartyInlist = function(param){
		 Ajax.req({
             url: "${pageContext.request.contextPath}/common/query.do",
             type: "json",
             method: "get",
             params: {
                 uc: "UC_SCS_SE_COUNTERPARTY_SEARCH",
                 codevalue: param
             },
             ok: function(text){
                 var entity = text.rows;
                 if(entity.length>0){
     	        	 $('#oppcounterpartyid').RComboGrid('setAllValue',[entity[0]['urid'],entity[0]['codename']]);
                	 oppCounterPartySelFn();
                 }else{
                	//手工输入交易对手名称时，默认交易对手户名为名称
                	$('#oppbankaccountname').val(param);
                 }
             },
             err: function(text){
                 $.RMessage.alert("消息", text);
             }
         });
	}
	//交易对手交易账户手填之后的处理函数
	var oppCounterPartyAccountInlist = function(param){
		Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH",
                accountnumber: param
            },
            ok: function(text){
                var entity = text.rows;
                if(entity.length > 0){
                	$('#oppcounterpartyaccountid').RComboGrid('setAllValue',[entity[0]['urid'],entity[0]['accountnumber']]);
                	oppCounterPartyAccountSelFn();
                }else{
                	 //手动输入且为新账户时
        	        $('#oppbankaccountname').RComboGrid('setReadOnly',false);
        	        $('#oppbanklocationid').RComboGrid('setReadOnly',false);
        	        //设置付方账户id为空
        	        $('#oppbankaccountid').attr('value','');
        	        $('#oppbankaccountid').RComboGrid('setValue');
                }
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
	}
	//设置唯一交易账户
	var setOnlyOneVal = function(oppcounterpartyid){
		var categoryid = $("#oppcounterpartycategoryrange").val();
		var applyorgid = $("#applyorgid").RComboGrid('getValue');
		Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH",
                counterpartyid: oppcounterpartyid,
                orgid:applyorgid,
                isactive:"1",
                cp_isactive:"1",
                categoryid:categoryid
            },
            ok: function(text){
                var entity = text.rows;
                if(entity.length == 1){
                	$('#oppcounterpartyaccountid').RComboGrid('setAllValue',[entity[0]['urid'],entity[0]['accountnumber']]);
                	oppCounterPartyAccountSelFn();
                }
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
	}
	//附件上传
    var upload = function(urid){
    	//获取选择上传文件的数量，0：没有需要上传的文件；其他：存在需要上传的文件
    	var fileNum = $('#file_upload').RUploadfile('getAddFileNum');
    	if(fileNum == 0 ){
    		uploadSuccess();
    	}else{
    		var addUrl = "<%=addUrl %>";
    	    var url = addUrl +　"&catalog=T_BD_PAYMENTS&subkeyid=" + urid;
    	    $('#file_upload').RUploadfile('changeUrl',url);
    		$('#file_upload').RUploadfile('upload');//上传文件触发函数
    	}
    }
</script>