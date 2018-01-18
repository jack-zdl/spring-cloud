<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.ats.common.util.WorkFlowUtil" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%
    Map map = new HashMap();
    String taskId ="";
    String userId ="";
    String InstanceId ="";
    Boolean isCanApprove=false;
	if(request.getParameter("urid")!=null){
		try{
			map =WorkFlowUtil.isCanApprove(request.getParameter("urid"), request);
			if(map.containsKey("InstanceId")){
			    InstanceId = map.get("InstanceId").toString();	    
			 }
			 isCanApprove=Boolean.valueOf(map.get("isCanApprove").toString());
			 if(isCanApprove){
				 taskId = map.get("TaskID").toString();
				 userId = map.get("UserID").toString();
		    }
		}catch (Exception e) {
			map = new HashMap();
		}
	}
	   
	String ret = "{\"ret_data\":{\"taskId\":\""+taskId+"\",\"userId\":\"" +userId+ "\"},";
	response.getWriter().print(ret+"\"ret_status\":\"1\",\"returnCode\":0}");
%>
