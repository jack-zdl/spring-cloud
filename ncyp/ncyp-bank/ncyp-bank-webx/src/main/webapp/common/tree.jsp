<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@page import="com.ceying.chx.common.system.constants.CommonConstants"%>--%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%--<%@page import="com.ceying.chx.pub.service.ComRowSet"%>--%>
<%--<%@page import="com.ceying.chx.crm.web.pub.WebHelper"%>--%>
<%--<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>--%>
<%--<%@page--%>
	<%--import="com.ceying.chx.sys.user.SysUserLogin"%>--%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
		
			
<%
			String url = request.getParameter("url");
			String treeinfo = request.getParameter("treeinfo");
			String gridId = request.getParameter("gridId");
			String treerelationparam = request.getParameter("treerelationparam");
//			SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
//			String treetenantid = currUser.getTenant_id().toString();
			String dataUrl = null;
//			if(treetenantid.equals(CommonConstants.SUPERTENANT)) {
				dataUrl=url+"?&queryType=1&treeinfo="+treeinfo+"&treeLevel=0";
//			} else {
//			    dataUrl=request.getContextPath()+"/common/query.do?uc="+treequeryuc+"&queryType=1&treeinfo="+treeinfo+"&treeLevel=0"+"&treetenantid="+treetenantid;
//			}
%>			
					
		   <r:tree id="treeDemo" dataUrl="<%=dataUrl%>" onNodeClick="mytext" height="45"></r:tree>
    
<script type="text/javascript">
	
	
			function mytext(){
			      var objvalue =  $('#treeDemo').RTree("getValue");
            jQuery("#<%=gridId%>").setGridParam({postData:{'<%=treerelationparam%>':objvalue[0]}}).trigger("reloadGrid");
			}
			
			
</script>

</div>

</body>
</html>		