<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@	page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@	page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@	page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%	
    String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
	String dataUrl = null;
	if(modFlag){
	    dataUrl = request.getContextPath() + "/reimburse/reimburseconfig/edit.do";
	} else{
	    dataUrl = request.getContextPath() + "/reimburse/reimburseconfig/add.do";
	}
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenantid= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="reimburseconfigadd" >
	<input type="hidden" id="urid" name="urid" value=""/>
	<r:tinyPanel title="基本信息" hasHeader="false">      	
		<%if(tenantid.equals(CommonConstants.SUPERTENANT)){ %>
		<r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/tenant.jsp">
                <jsp:param name="id" value="tenantid"/>
                <jsp:param name="name" value="tenantid"/>
                <jsp:param name="valueField" value="tenant_id"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="title" value="企业"/>
            </jsp:include>
        </r:panelItem>
		<%}else{ %>
		<input id="tenantid" type="hidden" name="tenantid" value="<%=tenantid %>"/>
		<%} %>
		<r:panelItem>
			<r:checkbox title="自动确认收款" id="isautoconfirm" name="isautoconfirm"/>
		</r:panelItem>
		<r:panelItem>
			<r:textArea  id="description" name="description" title="描述"/>
		</r:panelItem>
	</r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">
    $(function(){
    	
        if(<%=modFlag%>){
        	var tenantid = "<%=tenantid%>";
        	if(tenantid == "<%=CommonConstants.SUPERTENANT%>"){
        		tenantid = "";
        	}
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "post",
                params: {
                    uc: "UC_SCS_RB_REIMBURSECONFIG_SEARCH",
                    urid: "<%=urid%>",
                    tenantid:tenantid
                },
                ok: function(text){
                	$("#reimburseconfigadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    
    var saveFn = function(){
    	$("#reimburseconfigadd").RValidate({
			'success': save
  		});
		$("#reimburseconfigadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#reimburseconfigadd").AllSerialize();
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
    
</script>