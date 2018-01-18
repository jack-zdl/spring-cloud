<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.common.utils.task.JresUtil"%>
<%@ page import="com.ceying.chx.biz.constants.ENOppObjectType"%>
<%@ page import="com.ceying.chx.biz.constants.ENOppOrgOption"%>
<%@ page import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@ page import="com.ceying.chx.biz.constants.ENIsActive"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	
    /**
     * 基本信息
     * 当前操作组织的交易对手
     */
    //申请组织id
    String applyorgid = request.getParameter("applyorgid");
	String applyorgname = null;
	if(applyorgid == null){
		applyorgid = "";
	}else{
		applyorgname = JresUtil.getOrg(applyorgid).getOrg_name();
	}
    
    //初始结算方式范围
    String defaultdealtype = (request.getParameter("defaultdealtype") == null) ? ("") : (request.getParameter("defaultdealtype"));
    String linkageParam = (request.getParameter("linkageParam") == null) ? ("") : (request.getParameter("linkageParam"));

    //组织范围标志，用于过滤组织下拉框
    String orgRange = "orgid";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String orgid = currUser.getOrg_id();
    
    String orgname = JresUtil.getOrg(orgid).getOrg_name();

    //组织后置事件
    String OrgSelFn = (request.getParameter("OrgSelFn") == null) ? "" : request.getParameter("OrgSelFn");
    String OrgSelectable = "false";

    //entry表示在哪个模块引用该页面，若不需要特殊的处理逻辑则不需要传入该值
    String entry = request.getParameter("entry");
    //根据传入的entry进行特殊处理
    if ("massPay".equals(entry)) {
        OrgSelectable = "true";
        orgRange = "selfandsuborgid";
    }
    String orgFilter = "{'" + orgRange + "':'" + applyorgid + "'}";
    boolean generalModFlag = (request.getParameter("modFlag") == "true") ? true : false;
%>
<input type="hidden" id="accounttyperange" name="accounttyperange" value=""/>
<input type="hidden" id="accountcategoryrange" name="accountcategoryrange" value=""/>
<input type="hidden" id="oppaccounttyperange" name="oppaccounttyperange" value=""/>
<input type="hidden" id="oppaccountcategoryrange" name="oppaccountcategoryrange" value=""/>
<input type="hidden" id="oppcounterpartycategoryrange" name="oppcounterpartycategoryrange" value=""/>
    <r:panelItem>
	    <jsp:include page="/common/wedget/ucsearch/organizationoption.jsp">
		     <jsp:param name="id" value="orgid"/>
		     <jsp:param name="title" value="组织"/>
		     <jsp:param name="check" value="required"/>
		     <jsp:param name="readonly" value="true"/>
	    </jsp:include>
    </r:panelItem>
    <r:panelItem>
	    <jsp:include page="/common/wedget/ucsearch/organizationoption.jsp">
		     <jsp:param name="id" value="applyorgid"/>
		     <jsp:param name="title" value="申请组织"/>
		     <jsp:param name="BFn" value="applyorgidBFn"/>
		     <jsp:param name="IsUseBFn" value="0"/>
		     <jsp:param name="check" value="required"/>
	    </jsp:include>
    </r:panelItem>
    <r:panelItem>
	    <jsp:include page="/common/wedget/ucsearch/paytype.jsp">
		     <jsp:param name="id" value="paytypeid"/>
		     <jsp:param name="title" value="交易类型"/>
		     <jsp:param name="check" value="required"/>
		     <jsp:param name="BFn" value="paytypeBFn"/>
             <jsp:param name="SelFn" value="paytypeidSelFn"/>
	    </jsp:include>
    </r:panelItem>
    <r:panelItem>
	    <jsp:include page="/common/wedget/ucsearch/settlementmode.jsp">
		     <jsp:param name="id" value="settlementmodeid"/>
		     <jsp:param name="title" value="结算方式"/>
		     <jsp:param name="check" value="required"/>
		     <jsp:param name="readonly" value="true"/>
	    </jsp:include>
    </r:panelItem>
    <r:panelItem>
		<r:calendar id="paydate" name="paydate" title="应付日期" showOpts="yyyy-MM-dd"></r:calendar>
	</r:panelItem>
<script type="text/javascript">
    $(function () {
    	if(!<%=generalModFlag%>){
    		//设置初始化值
           	$('#orgid').RComboGrid('setAllValue',["<%=orgid%>","<%=orgname%>"]);
           	$('#applyorgid').RComboGrid('setAllValue',["<%=applyorgid%>","<%=applyorgname%>"]);
           	$('#paydate').attr('value',getCurrentTime());
            $('#paydate').RCalendar('setValue');
    	}
    });
    
    var applyorgidBFn = function(){
    	return <%= orgFilter%>;
    }
    
    var paytypeBFn = function(){
    	return <%= linkageParam%>;
    }
    //选择交易类型,设置结算方式
    var paytypeidSelFn = function () {
    	$('#settlementmodeid').attr('value',"");
        $('#settlementmodeid').RComboGrid("setValue");
        cleanData();//清除收方数据
        Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: $("#paytypeid").val(),
                uc: 'UC_SCS_SE_PAYTYPES_SEARCH'
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
                $('#settlementmodeid').RComboGrid("setReadOnly",false);
                //设置默认结算方式
                setdefaultsettlementmode(entity['defaultsettlementmodeid']);
                //设置对方组织范围
                setOppOrgRange(entity['opporgoptionvalue']);
                //交易对手对内对外
                var oppobjecttype = entity['oppobjecttypevalue'];
                if (oppobjecttype == <%=ENOppObjectType.INTERNAL_ORG.getValue()%>) {
                    changeOppObjectType("internal");
                    //选择交易类型后保存交易类型的对方可选账户性质和对方可选账户类别，用于过滤对方账户
                    $('#oppaccounttyperange').val(entity['accounttyperangevalue']);
                    $('#oppaccountcategoryrange').val(entity['oppaccountcategoryrangevalue']);

                } else if (oppobjecttype ==<%=ENOppObjectType.EXTERNAL_COUNTERPARTY.getValue()%>) {
                    changeOppObjectType("external");
                }
                //选择交易类型后保存交易类型的可选账户性质，用于过滤本方账户
                $('#accounttyperange').val(entity['accounttyperangevalue']);
                $('#accountcategoryrange').val(entity['accountcategoryrangevalue']);

                //选择交易类型后保存交易对手类型范围
                $('#oppcounterpartycategoryrange').val(entity['oppcounterpartycategoryvalue']);
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
	//设置默认结算方式
    function setdefaultsettlementmode(settlementmodeid) {
        Ajax.req({
        	url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
            	urid: settlementmodeid,
                uc: 'UC_SCS_SE_SETTLEMENTMODES_SEARCH'
            },
            ok: function (text) {
            	if(text.rows.length < 1){
                    $.RMessage.alert("消息", text.msg);
                    return;
                }
                var entity = text.rows[0];
                if (entity['dealtypevalue'] == "<%=defaultdealtype%>" && entity['moneywayvalue'] ==<%=ENMoneyWay.PAY.getValue()%> && entity['isactivevalue'] == <%=ENIsActive.ACTIVE.getValue()%>) {
                	$('#settlementmodeid').attr('value',entity['urid']);
                    $('#settlementmodeid').RComboGrid('setValue');
                }
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    //设置对方组织范围
    function setOppOrgRange(opporgoption) {
        var params = "";
        switch (opporgoption) {
            case "<%=ENOppOrgOption.ALL.getValue()%>":
            	params = {};
                break;
            case "<%=ENOppOrgOption.OURORGANIZATION.getValue()%>":
            	params = {"orgid":"<%=orgid%>"};
                break;
            case "<%=ENOppOrgOption.OTHERORGANIZATION.getValue()%>":
            	params = {"noturid":"<%=orgid%>"};
                break;
            case "<%=ENOppOrgOption.PARENTORGANIZATION.getValue()%>":
            	params = {"superorgid":"<%=orgid%>"};
                break;
            case "<%=ENOppOrgOption.CHILDORGANIZATION.getValue()%>":
            	params = {"suborgid":"<%=orgid%>"};
                break;
            case "<%=ENOppOrgOption.SAMELEVELORGANIZATION.getValue()%>":
            	params = {"peerorgid":"<%=orgid%>"};
                break;
            case "<%=ENOppOrgOption.SETTLEMENTCENTER.getValue()%>":
            	params = {};
                break;
            default:
            	params = {};
        }
        $("#opporgid").RComboGrid("setParam",params);
    }
  	//获得当前日期
    var getCurrentTime = function(){
    	var date = new Date();
		var mon = date.getMonth()  + 1;         //getMonth()返回的是0-11，则需要加1
		if(mon <=9){                                     //如果小于9的话，则需要加上0
			mon = "0" + mon;
		}
		var day = date.getDate();                   //getdate()返回的是1-31，则不需要加1
		if(day <=9){                                     //如果小于9的话，则需要加上0
			day = "0" + day;
		}
    	return date.getFullYear() + "-" +  mon + "-" + day;
    }
</script>