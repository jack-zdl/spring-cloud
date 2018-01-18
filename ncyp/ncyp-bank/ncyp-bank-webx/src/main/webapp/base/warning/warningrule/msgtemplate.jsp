<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
	
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
		String queryuc = "UC_BASE_WARNINGRULE_MSGTEMPLATEDEFINE_SEARCH";

		SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
		String userid = currUser.getUserId();
		String urid = request.getParameter("urid");
		String editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGRULE_MSGTEMPLATEDEFINE_SEARCH&warningruleid=1";
		if(urid != null){
			editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGRULE_MSGTEMPLATEDEFINE_SEARCH&warningruleid="+urid;
		}
		String warningObjectId = request.getParameter("warningObjectId");
		
%>

    <r:editableGrid id="msgTemplateTab" dataUrl="<%=editableDataUrl%>" primaryKey="['urid']" hiddenCol="['urid']" height="150"
                colModel="{title:'文本',text:'msgtext',id:'msgtext',type:1,width:200,check:'required:true'},
                	{title:'预警属性',text:'fieldname',id:'warningobjattrid',Htext:'fieldname',Hid:'urid',type:5,width:200,check:'required:true',beforeSelect:warningobjattridForMsgTmpBFS,url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH'}"/>
			
<script type="text/javascript">

function warningobjattridForMsgTmpBFS(){
	var warningObjectId = <%=warningObjectId%>;
	if(warningObjectId != "" && warningObjectId != undefined){
		return [{"warningobjid":warningObjectId,"attricategory":2}];
	}else{
		return [{"attricategory":2}];
	}
	
}

</script>				