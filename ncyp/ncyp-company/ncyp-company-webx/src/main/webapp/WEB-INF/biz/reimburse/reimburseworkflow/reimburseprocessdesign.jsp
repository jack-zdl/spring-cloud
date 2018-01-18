<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@page import="com.ceying.chx.util.framework.RemoteService"%>
<%@page import="com.ceying.chx.biz.service.cache.SysBaseDataCache" %>
<%@page import="com.ceying.chx.biz.constants.ENDataCacheKey" %>
<%@page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@page import="java.util.Map" %>
<%
	String queryuc = "UC_SYS_WF_PROCESSDESIGN_SEARCH";
	SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String userid = currUser.getUserId();
	String tenant_id=currUser.getTenant_id().toString();
	String condition="state=4";
	if(!tenant_id.equals(CommonConstants.SUPERTENANT)){
		condition=condition+"&gridtenantid="+tenant_id;
	}
	SysBaseDataCache sysBaseDataCache = RemoteService.getSysBaseDataCache();
	Map<String, Object> tenantConfigsMap = sysBaseDataCache.getCacheData(ENDataCacheKey.REIMBURSESERVICE);
	Map<String, Object> tenantsMap = sysBaseDataCache.getCacheData(ENDataCacheKey.TENANTS);
	
	Map<String, Object> tenantMap = (Map<String, Object>)tenantsMap.get(tenant_id);
	String tenantCode = tenantMap.get("tenant_code").toString();
	Map<String, Object> tenantConfigMap = (Map<String, Object>)tenantConfigsMap.get(tenantCode);
	String reimburseWorkFlowTypeId = null;
	if(tenantConfigMap != null && !tenant_id.equals(CommonConstants.SUPERTENANT)){
		reimburseWorkFlowTypeId = ((Map<String, Object>)tenantConfigMap.get("ATS")).get("WorkFlowTypeId").toString();
		condition += "&typeid="+reimburseWorkFlowTypeId;
	}
	
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新增" iclass="fa-plus"  visible="<%=userid+\"#workflow/flowdesign/processdesign/add\"%>" onClick="add"></r:button>
<r:button text="修改" iclass="fa-pencil-square-o"  visible="<%=userid+\"#workflow/flowdesign/processdesign/edit\"%>" onClick="edit"></r:button>
<r:button text="删除" iclass="fa-remove"  visible="<%=userid+\"#workflow/flowdesign/processdesign/del\"%>" onClick="deleteWf"></r:button>
<r:button text="绑定表单" iclass="fa-users"  visible="<%=userid+\"#workflow/flowdesign/processdesign/bindform\"%>" onClick="binding"></r:button>
<r:button text="设计" iclass="fa-gears"  visible="<%=userid+\"#workflow/flowdesign/processdesign/design\"%>" onClick="design" ></r:button>
<%-- <r:button text="发布" iclass="fa-caret-square-o-right"  visible="<%=userid+\"#workflow/flowdesign/processdesign/publish\"%>" onClick="publish"></r:button>
<r:button text="导入" iclass="fa-arrow-up"  visible="<%=userid+\"#workflow/flowdesign/processdesign/import\"%>" onClick="input" ></r:button>
<r:button text="导出" iclass="fa-arrow-down"  visible="<%=userid+\"#workflow/flowdesign/processdesign/export\"%>" onClick="output" ></r:button>
 --%>
<r:win title="新增" id="addModal"  width="800" height="500"></r:win>
<r:win title="修改" id="editModal"  width="800" height="500"></r:win>
<r:win title="设计" id="designModal"  maxable="true"></r:win>
<r:win title="绑定表单" id="bindModal" maxable="true"></r:win>


<jsp:include page="/common/grid.jsp">
	<jsp:param name="queryuc" value="<%=queryuc%>" />
	<jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">

var closeWinFn = function(){
	 $("#editModal").modal("hide");	
	 $("#addModal").modal("hide");	
	 $("#designModal").modal("hide");
	 $("#bindModal").modal("hide");
	  exeComQuery();
}

var refresh = function(){	 
	  exeComQuery();
}
	function add(){
		var url = "${pageContext.request.contextPath}/admin/workflow/flowdesign/processdesignadd.jsp?type=add&typeid=" +　"<%=reimburseWorkFlowTypeId%>";
		$("#addModal").RWin('createWin',url);
	}
	function edit(){
		var rowDatas = $("#grid-table").RGrid("getSelectedDatas"); 
		if(rowDatas.length!=1){
			 $.RMessage.alert("消息","请选择一条记录进行操作！");
		}
		var url = "${pageContext.request.contextPath}/admin/workflow/flowdesign/processdesignadd.jsp?type=mod&pks="+rowDatas[0].dbid+"&versiondbid="+rowDatas[0].versiondbid+"&type_id="+rowDatas[0].type_id;
		$("#editModal").RWin('createWin',url);
	}
	function deleteWf(){
		var rowDatas = $("#grid-table").RGrid("getSelectedDatas"); 
		if(rowDatas.length!=1){
			 $.RMessage.alert("消息","请选择一条记录进行操作！");
			 return;
		}
		var hsBpmKey = rowDatas[0].process_id;
		
		$.RMessage.confirm("消息","删除流程会删除该流程下所有版本信息和流程实例,您确认要删除所选流程?",function(){
		  	Ajax.req({
		      	url: "${pageContext.request.contextPath}/workflow/flowdesign/processdesign/del.do",
		      	params: {hsBpmKey:hsBpmKey,
		      			userId:'<%=userid%>'},
		      	ok: function(text) {
		    	  	$.RMessage.alert("消息",text.msg,refresh);
		      	},
		      	err: function(text) {
		    	  	$.RMessage.alert("消息","操作失败！！"+text.msg);
		      	}
		  	});   
		}); 
	}
	function binding(){
		var rowDatas = $("#grid-table").RGrid("getSelectedDatas"); 
		if(rowDatas.length!=1){
			 $.RMessage.alert("消息","请选择一条记录进行操作！");
		}
		var url = "${pageContext.request.contextPath}/admin/workflow/flowdesign/processbindpage.jsp?versiondbid="+rowDatas[0].versiondbid+"&pageid="+rowDatas[0].pageid;
		$("#bindModal").RWin('createWin',url);
	}
	function design(){
		var rowDatas = $("#grid-table").RGrid("getSelectedDatas"); 
		if(rowDatas.length!=1){
			 $.RMessage.alert("消息","请选择一条记录进行操作！");
		} 
		var url = "${pageContext.request.contextPath}/workflow/flowdesign/processdesign/design.do?versiondbid="+rowDatas[0].versiondbid+"&editable=1";
		window.open(url);
	}

</script>