<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.ceying.chx.pub.service.ComRowSet"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>

<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>


</div>
<%
    String queryuc = request.getParameter("queryuc");
    String condition = request.getParameter("condition");
    String operateColumn = request.getParameter("operateColumn");
    String primaryKey = request.getParameter("primaryKey");
    if(condition!=null&&!"".equals(condition)){
        condition = "&"+condition;
    }else{
        condition="";
    }
    String uniqueid = request.getParameter("uniqueid");
    if(uniqueid!=null&&!"".equals(uniqueid)){
        uniqueid = "SimpleGrid-table"+uniqueid;
    }else{
        uniqueid = "SimpleGrid-table";
    }

    String gheight = "300";

    String dataUrl=request.getContextPath()+"/common/query.do?uc="+queryuc+condition;
    ComRowSet viewConfig = CommonQueryController.getViewConfigCustom(queryuc,"1");
    String colModel = "";
    for (int i = 0, m = viewConfig.getRowCount(); i < m; i++) {
        String frametype = viewConfig.getValue(i, "frametype");
        String linkRender = StringUtils.isBlank(frametype) ? "" : "linkRender";
        colModel += "{'title':'"+viewConfig.getValue(i, "viewname")+"','text':'"+viewConfig.getValue(i, "property")+"'},";
    }
%>

<r:SimpleGrid id="<%=uniqueid%>" dataUrl="<%=dataUrl%>" height="<%=gheight%>" colModel="<%=colModel.substring(0,colModel.length()-1)%>" primaryKey="<%=primaryKey%>" operateFn="<%=operateColumn %>"></r:SimpleGrid>

</div>

</body>
</html>