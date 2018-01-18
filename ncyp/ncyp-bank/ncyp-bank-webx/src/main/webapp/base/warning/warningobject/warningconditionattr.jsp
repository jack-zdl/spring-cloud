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
			editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH&attricategory=1&warningobjid="+warningobjid;
		}
%>

    <r:editableGrid id="warningConditionTab" dataUrl="<%=editableDataUrl%>" primaryKey="['urid']" hiddenCol="['urid']" height="200"
                colModel="{title:'代码',text:'fieldcode',id:'fieldcode',type:1,check:'true'},
                	{title:'名称',text:'fieldname',id:'fieldname',type:1,check:'true'},
                	{title:'字段类型',text:'fieldtypename',id:'fieldtype',Htext:'text',Hid:'value',type:4,url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999026'},
                	{title:'输入字段值',text:'caption',id:'fieldvalue',Htext:'codename',Hid:'caption',type:5,beforeSelect:fieldvalueBFS,url:'${pageContext.request.contextPath}/common/query.do'}"/>
<script type="text/javascript">

function fieldvalueBFS(val){
	 var ID = this.ID;
    var arr = toGetNum(ID);
    $("#" + ID).RComboGrid('setValue', ['','']);
    if(val[0] == "M"){
   	 return [{'uc':'UC_SYS_SVCMIDSERACH_QUERY'},['type','caption']];
    }else if(val[0] == "N"){
   	 return [{'uc':'UC_SYS_TDICTIONARY_SEARCH'},['keyno','codename']];
    }
}

</script>				