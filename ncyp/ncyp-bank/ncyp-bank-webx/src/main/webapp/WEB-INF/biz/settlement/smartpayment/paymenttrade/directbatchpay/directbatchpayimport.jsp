<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@page	import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@ page import="com.ceying.chx.biz.constants.ENIsActive"%>
<%@ page import="com.ceying.chx.biz.constants.ENDealType"%>
<%@ page import="com.ceying.chx.base.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
	ComRowSet rowSet = commonQueryController.search("UC_BASE_SYSTEMRULE_DTSOBJRULE_SEARCH",new String[]{"code"}, new String[]{request.getParameter("code")});
	SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String userid = currUser.getUserId();
	String tenantid= currUser.getTenant_id().toString();
	String orgid = currUser.getOrg_id();
	
    String url = request.getContextPath() + "/uploadtomemory?withouttranslate=true&type=directbatchpay&userid=" + userid +
    		"&tenantid=" + tenantid + "&orgid=" + orgid;
%>

<jsp:include page="/common/formhead.jsp" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/RUI/plugins/uploadify/uploadify.css" />
	    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/RUI/bootstrap/assets/css/uploadfile.css" />
	    <style>
	    	body{
	            background: #fff;
	        }
	        .uploadBox{
	            width: 100%;
	            border: 1px solid #CCCCCC;
	        }
	        .uploadBox .title{
	            background-color: #F7F7F7;
	            color: #7B9FD0;
	            font-size: 15px;
	            padding: 3px 5px;
	            border-bottom: 1px solid #CCCCCC;
	        }
	        .upload_Btn{
	            background-color: #F7F7F7;
	            border-top: 1px solid #CCCCCC;
	            padding: 3px 5px;
	        }
	        .uploaded table{
	            width: 100%;
	            text-align: center;
	        }
	        .uploaded table tr td{
	            border-right:1px solid #CCCCCC;
	            padding: 3px 0;
	        }
	        .uploaded table tr td:last-of-type,.uploaded table th:last-of-type{
	            border:none;
	        }
	        .uploaded table tr{
	            border-bottom: 1px solid #CCCCCC;
	
	        }
	        .uploaded table th{
	            border-right:1px solid #CCCCCC;
	            /*width: 20%;*/
	            font-weight: normal;
	            text-align: center;
	            padding: 3px;
	        }
	        .uploaded table th:nth-of-type(1){
	            /*width: 40%;*/
	        }
	        .remove_file{
	            color: red;
	            cursor: pointer;
	        }
	    </style>
	<form role="form" id="directsglbankpayimport">
		<r:tinyPanel column="3">
			<r:panelItem>
			    <jsp:include page="/common/wedget/ucsearch/dtsobjrule.jsp">
				     <jsp:param name="id" value="ruleid"/>
				     <jsp:param name="title" value="导入规则"/>
				     <jsp:param name="check" value="required"/>
				     <jsp:param name="readonly" value="true"/>
			    </jsp:include>
	        </r:panelItem>
			<r:panelItem>
			    <jsp:include page="/common/wedget/ucsearch/paytype.jsp">
				     <jsp:param name="id" value="paytypeid"/>
				     <jsp:param name="title" value="交易类型"/>
				     <jsp:param name="check" value="required"/>
				     <jsp:param name="BFn" value="paytypeidBFn"/>
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
     	</r:tinyPanel>
     	<r:tinyPanel title="附件信息" hasHeader="false" column="1">
            <r:panelItem>
               <r:uploadfile id="file_upload" width="750" dataUrl="" addUrl="<%=url%>" fileTypeExts="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"FileSuffix\")%>" fileSizeLimit="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"AttachmentSize\")%>" 
			  	uploadSuccess="uploadSuccess" uploadError="uploadError" queueSizeLimit="20"/>
            </r:panelItem> 
        </r:tinyPanel>
	</form>
<jsp:include page="/common/formbottom.jsp" />	
<script src="${pageContext.request.contextPath}/RUI/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('#ruleid').RComboGrid('setAllValue',["<%=rowSet.getValue(0,"urid")%>","<%=rowSet.getValue(0,"name")%>"]);
	})
	
	var saveFn = function(){
		$("#directsglbankpayimport").RValidate({
            'success': function(){
            	//附件上传
        		var params = $("#directsglbankpayimport").AllSerialize();
        		var url = "<%=url %>";
        	    url += 　"&" + params;
        	    $('#file_upload').RUploadfile('changeUrl',url);
        		$('#file_upload').RUploadfile('upload');//上传文件触发函数
            }
        });
        $("#directsglbankpayimport").RValidate("validate");
	}
	var paytypeidBFn = function(){
		return [{
	        'dealtype': '1',
	        'isactive': '1',
	        'iscanmanualentry': '1',
	        'moneyway': '1',
	        'paytypecategorynotin': '1,2',
	        'directpaywayin': '2'////直联渠道指令的直联支付方式为批量代付
		}];
    }
    //选择交易类型,设置结算方式
    var paytypeidSelFn = function () {
    	$('#settlementmodeid').attr('value',"");
        $('#settlementmodeid').RComboGrid("setValue");
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
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
	//设置默认结算方式
    var setdefaultsettlementmode = function(settlementmodeid) {
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
                if (entity['dealtypevalue'] == "1" && entity['moneywayvalue'] ==<%=ENMoneyWay.PAY.getValue()%> && entity['isactivevalue'] == <%=ENIsActive.ACTIVE.getValue()%>) {
                	$('#settlementmodeid').attr('value',entity['urid']);
                    $('#settlementmodeid').RComboGrid('setValue');
                }
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
	
  	//设置结算方式范围
	var setSettlementmoderange = function(settlementmoderangevalue) {
	    var dealtype = '<%=ENDealType.DIRECT.getValue()%>';
	    var moneyway = '<%=ENMoneyWay.PAY.getValue()%>';
	    var directpaywayin = '2';
	    var json = {"urids":settlementmoderangevalue,"dealtype":dealtype,"moneyway":moneyway,"isactive":"1","directpaywayin":directpaywayin};
	    $("#settlementmodeid").RComboGrid("setParam",json);
	}
  	
	//附件上传之后，关闭页面
    var uploadSuccess = function(){
    	$.RMessage.alert("消息", "附件上传成功", parent.closeWinFn);
	}
	
  	//附件上传失败，弹出提示信息
    var uploadError = function(text){
    	$.RMessage.alert("消息", "附件上传失败！" + text);
    }
</script>