<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.biz.constants.ENOppObjectType"%>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/settlementsetting/paytype/add.do";
	if(modFlag){
		dataUrl = request.getContextPath() + "/settlementsetting/paytype/edit.do";		
	}	
    SysUserLogin currUser = (SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="paytypeadd">
    	<input type="hidden" id="urid" name="urid" value=""/>
    	<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
     	<r:tinyPanel title="基本信息" hasHeader="false" column="3">
    		<r:panelItem>
    			<r:textField id="code" name="code" title="代码" check="required" />
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="name" name="name" title="名称" check="required" />
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/moneyway.jsp">
		            <jsp:param name="id" value="moneyway"/>
		            <jsp:param name="title" value="交易方向"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="SelFn" value="moneywaySelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/paytypecategory.jsp">
		            <jsp:param name="id" value="paytypecategory"/>
		            <jsp:param name="title" value="交易类型类别"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="SelFn" value="paytypecategorySelFn"/>
	            </jsp:include>
	        </r:panelItem>
     		<r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/settlementmode.jsp">
		            <jsp:param name="id" value="settlementmoderange"/>
		            <jsp:param name="title" value="可选结算方式"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="showText" value="true"/>
		            <jsp:param name="multiSelect" value="true"/>
		            <jsp:param name="BFn" value="settlementmoderangeBFn"/>
		            <jsp:param name="SelFn" value="settlementmoderangeSelFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/settlementmode.jsp">
		            <jsp:param name="id" value="defaultsettlementmodeid"/>
		            <jsp:param name="title" value="默认结算方式"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="BFn" value="defaultsettlementmodeidBFn"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/accountcategory.jsp">
		            <jsp:param name="id" value="accounttyperange"/>
		            <jsp:param name="title" value="可选账户性质"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="showText" value="true"/>
		            <jsp:param name="multiSelect" value="true"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/accountcategory.jsp">
		            <jsp:param name="id" value="accountcategoryrange"/>
		            <jsp:param name="title" value="可选账户类别"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="multiSelect" value="true"/>
	            </jsp:include>
	        </r:panelItem>
            <r:panelItem>
	            <jsp:include page="/common/wedget/dictionary/oppobjecttype.jsp">
		            <jsp:param name="id" value="oppobjecttype"/>
		            <jsp:param name="title" value="对方对象类型"/>
		            <jsp:param name="check" value="required"/>
		            <jsp:param name="multiSelect" value="true"/>
		            <jsp:param name="SelFn" value="oppobjecttypeSelFn"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	            <jsp:include page="/common/wedget/dictionary/organizationrange.jsp">
		            <jsp:param name="id" value="opporgoption"/>
		            <jsp:param name="title" value="对方组织范围"/>
		            <jsp:param name="check" value=""/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	            <jsp:include page="/common/wedget/ucsearch/accountcategory.jsp">
		            <jsp:param name="id" value="oppaccounttyperange"/>
		            <jsp:param name="title" value="对方账户性质"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="showText" value="true"/>
		            <jsp:param name="multiSelect" value="true"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	            <jsp:include page="/common/wedget/dictionary/accountcategory.jsp">
		            <jsp:param name="id" value="oppaccountcategoryrange"/>
		            <jsp:param name="title" value="对方账户类别"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="multiSelect" value="true"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	            <jsp:include page="/common/wedget/dictionary/category.jsp">
		            <jsp:param name="id" value="oppcounterpartycategoryrange"/>
		            <jsp:param name="title" value="交易对手类别"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="multiSelect" value="true"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	        	<r:checkbox title="生成对方收款单" id="isgenrelatetrans" name="isgenrelatetrans" onclick='isgenrelatetransFn()'/>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/ucsearch/paytype.jsp">
		            <jsp:param name="id" value="relatepaytypeid"/>
		            <jsp:param name="title" value="对方交易类型"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="readonly" value="true"/>
	            </jsp:include>
            </r:panelItem>
            <r:panelItem>
	        	<r:checkbox title="允许手工录入" id="iscanmanualentry" name="iscanmanualentry" checked="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="允许记账" id="iscanaccount" name="iscanaccount" />
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="代发代扣" id="isagentpayoff" name="isagentpayoff" />
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
	    	<r:panelItem>
	        	<r:textArea  id="description" name="description" title="描述" width="3"/>
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
                    uc: "UC_SCS_SE_PAYTYPES_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#paytypeadd").RForm({value:text});
                    isgenrelatetransFn();
                    oppobjecttypeSelFn();
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    })
    
    var saveFn = function(){
    	$("#paytypeadd").RValidate({
			'success': save
  		});
		$("#paytypeadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#paytypeadd").AllSerialize();
	    params = decodeURIComponent(params);
	    Ajax.req({
	        url: '<%= dataUrl%>',
	        params: params,
	        ok: function(text) {
	        	clearCache(['UC_SCS_SE_PAYTYPES_SEARCH']);
	            $.RMessage.alert("消息", text.msg, parent.closeWinFn);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
    
    var moneywaySelFn = function(){
    	$('#settlementmoderange').RComboGrid('setAllValue',["",""]);
    	$('#defaultsettlementmodeid').RComboGrid('setAllValue',["",""]);
    }
    
    var paytypecategorySelFn = function(){
    }
    
    var settlementmoderangeBFn = function(){
    	var moneyway = $('#moneyway').val();
    	return [{"moneyway":moneyway}];
    }
    
    var settlementmoderangeSelFn = function(){
    	$('#defaultsettlementmodeid').RComboGrid('setAllValue',["",""]);
    }
    
    var defaultsettlementmodeidBFn = function(){
    	var settlementmoderange = $("#settlementmoderange").RComboGrid("getValue");
    	var moneyway = $('#moneyway').RCombo("getValue");
    	return [{"urids":settlementmoderange,"moneyway":moneyway}];
    }
    
    var oppobjecttypeSelFn = function(){
        if ($('#oppobjecttype').val() == <%=ENOppObjectType.INTERNAL_ORG.getValue()%>) {//内部组织
    		$('#oppcounterpartycategoryrange').attr('value','');
        	$('#oppcounterpartycategoryrange').RCombo('setValue');
    		$('#oppcounterpartycategoryrange').RCombo('setReadOnly',true);
    		$("#opporgoption").RCombo("setCheck","required:true");
            $("#opporgoption").RCombo('setReadOnly',false);
            $('#oppaccounttyperange').RComboGrid('setReadOnly',false);
            $('#oppaccountcategoryrange').RCombo('setReadOnly',false);
        } else if ($('#oppobjecttype').val() == <%=ENOppObjectType.EXTERNAL_COUNTERPARTY.getValue()%>) {//交易对手
        	$("#opporgoption").RCombo("setCheck","");
        	$('#opporgoption').attr('value','');
        	$('#opporgoption').RCombo('setValue');
    		$("#opporgoption").RCombo('setReadOnly',true);
    		$('#oppcounterpartycategoryrange').RCombo('setReadOnly',false);
            $('#oppaccounttyperange').attr('value','');
        	$('#oppaccounttyperange').RComboGrid('setValue');
    		$('#oppaccounttyperange').RComboGrid('setReadOnly',true);
    		$('#oppaccountcategoryrange').attr('value','');
        	$('#oppaccountcategoryrange').RCombo('setValue');
    		$('#oppaccountcategoryrange').RCombo('setReadOnly',true);
        }
    }
    
    var isgenrelatetransFn = function(){
    	if($("#isgenrelatetrans").is(":checked")){
    		$('#relatepaytypeid').RComboGrid('setReadOnly', false);
        } else {
        	$('#relatepaytypeid').attr('value','');
            $('#relatepaytypeid').RComboGrid('setValue');
            $('#relatepaytypeid').RComboGrid('setReadOnly', true);
        }
    }
    
</script>