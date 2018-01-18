<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@page	import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%	
    String dataUrl = request.getContextPath() + "/reimburse/reimburseconfig/edit.do";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="reimburseconfigadd" >
	<input type="hidden" id="urid" name="urid" value=""/>
	<input id="tenantid" type="hidden" name="tenantid" value="<%=tenantid %>"/>
	<r:tinyPanel title="基本信息" hasHeader="false">      	
		<r:panelItem>
			<r:checkbox title="自动确认收款" id="isautoconfirm" name="isautoconfirm"/>
		</r:panelItem>
		<r:panelItem>
			<r:textArea  id="description" name="description" title="描述"/>
		</r:panelItem>
	</r:tinyPanel>
</form>
<div class="btn_block">
    <r:button text="保存" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="saveFn"/>
</div>
</body>
</html>
<script type="text/javascript">
    $(function(){
    	
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
                tenantid:tenantid
            },
            ok: function(text){
            	$("#reimburseconfigadd").RForm({value:text});
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
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
	        	//普通租户操作报销配置后不会跳回列表页面
	            $.RMessage.alert("消息", text.msg);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
    
</script>