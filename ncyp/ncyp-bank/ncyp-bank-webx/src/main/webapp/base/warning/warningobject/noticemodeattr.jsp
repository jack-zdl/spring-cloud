<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
	
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
		String queryuc = "UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH";
		SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
		String userid = currUser.getUserId();
		
		//新建时可编辑控件没有数据，可编辑控件不支持空请求，暂时随意给一个不会有返回数据的请求
		String editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH&attricategory=4";
		String warningobjid = request.getParameter("warningobjid");
		if(warningobjid != null){
			editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH&attricategory=3&warningobjid="+warningobjid;
		}

%>

    <r:editableGrid id="noticeModeTab"  dataUrl="<%=editableDataUrl%>" primaryKey="['urid']" hiddenCol="['urid']" height="150"
                colModel="{title:'代码',text:'fieldcode',id:'fieldcode',type:1,width:200,check:'true'},
                    {title:'名称',text:'fieldname',id:'fieldname',type:1,width:200,check:'true'}" />
			
<script type="text/javascript">

</script>				