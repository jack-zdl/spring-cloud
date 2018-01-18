<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ page import="com.ceying.chx.common.utils.task.JresUtil"%>
<%@ page import="com.ceying.chx.biz.constants.ENSource"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/settlementsetting/counterparty/add.do";
    if(modFlag){
    	dataUrl = request.getContextPath() + "/settlementsetting/counterparty/edit.do";
    }
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
    String orgid = currUser.getOrg_id();
    String orgname = JresUtil.getOrg(orgid).getOrg_name();
%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="counterpartyadd">
    	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    	<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
     	<r:tinyPanel title="基本信息" hasHeader="false">
    		<r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/organizationoption.jsp">
		            <jsp:param name="id" value="orgid"/>
		            <jsp:param name="title" value="组织"/>
		            <jsp:param name="readonly" value="true"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/source.jsp">
		            <jsp:param name="id" value="source"/>
		            <jsp:param name="title" value="数据来源"/>
		            <jsp:param name="readonly" value="true"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="name" name="name" title="名称" check="required"/>
	        </r:panelItem>
	        <r:panelItem>
    			<jsp:include page="/common/wedget/dictionary/category.jsp">
		            <jsp:param name="id" value="category"/>
		            <jsp:param name="title" value="交易对手类别"/>
		            <jsp:param name="check" value=""/>
		            <jsp:param name="readonly" value=""/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
            <r:panelItem>
    			<r:textField id="othercode" name="othercode" title="对接系统代码"/>
	        </r:panelItem>
        	<r:panelItem>
    			<r:textField id="email" name="email" title="邮件地址" check="email"/>
	        </r:panelItem>
	        <r:panelItem>
    			<r:textField id="address" name="address" title="地址"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textArea  id="description" name="description" title="描述"/>
	        </r:panelItem> 
    	</r:tinyPanel>
	</form>
	<%
		if(modFlag){
	%>
		<div class="form-group">
			<jsp:include page="/scs/settlement/settlementsetting/counterparty/counterpartyaccount.jsp" >
				<jsp:param name="urid"  value="<%=urid %>" />
			</jsp:include>
		</div>
	<%}%>
		
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">
    $(function(){
        if(<%= modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_SE_COUNTERPARTY_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#counterpartyadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }else{
        	//初始化时，默认为租户所在组织，数据来源为手工录入
    		$('#orgid').RComboGrid('setAllValue',["<%=orgid%>","<%=orgname%>"]);
        	$('#source').attr('value','<%= ENSource.HAND.getValue()%>');
    		$('#source').RCombo('setValue');
        }
    })
    
    var saveFn = function(){
    	$("#counterpartyadd").RValidate({
			'success': save
  		});
		$("#counterpartyadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#counterpartyadd").AllSerialize();
	    params = decodeURIComponent(params);
	    Ajax.req({
        url: '<%= dataUrl%>',
	        params: params,
	        ok: function(text) {
	        	clearCache(['UC_SCS_SE_COUNTERPARTY_SEARCH']);
	            $.RMessage.alert("消息", text.msg, parent.closeWinFn);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
</script>