<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.ceying.chx.pub.service.ComRowSet"%>
<%@page import="com.ceying.chx.crm.web.pub.WebHelper"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>

<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>


</div>

<%
    String queryuc = request.getParameter("queryuc");
    String condition = request.getParameter("condition");
    String onRowDbClick = request.getParameter("onRowDbClick") == null ? "" : request.getParameter("onRowDbClick");
    String operateColumn = request.getParameter("operateColumn");
    String securitylevel = request.getParameter("securitylevel") == null ? "1" : request.getParameter("securitylevel");
    String pageType = request.getParameter("pageType") == null ? "" : request.getParameter("pageType");
    if(condition!=null&&!"".equals(condition)){
        condition = "&"+condition;
    }else{
        condition="";
    }
    String uniqueid = request.getParameter("uniqueid");
    if(uniqueid!=null&&!"".equals(uniqueid)){
        uniqueid = "grid-table"+uniqueid;
    }else{
        uniqueid = "grid-table";
    }

    String gwidth = request.getParameter("width");
    String gheight = request.getParameter("height");

    if(gwidth==null||"".equals(gwidth)){
        gwidth="20";
    }


    String dataUrl=request.getContextPath()+"/common/query.do?uc="+queryuc+"&securitylevel="+securitylevel+"&pageType="+pageType+condition;
    ComRowSet viewConfig = CommonQueryController.getViewConfigCustom(queryuc,"1");
    String colNames = "";
    String colModel = "";
    for (int i = 0, m = viewConfig.getRowCount(); i < m; i++) {
        String frametype = viewConfig.getValue(i, "frametype");
        String linkRender = StringUtils.isBlank(frametype) ? "" : "linkRender";
        String width = "150";
        if(viewConfig.getValue(i, "len")!=null&&!"".equals(viewConfig.getValue(i, "len").trim())){
            width=viewConfig.getValue(i, "len").toString();
        }
        colNames += "'"+viewConfig.getValue(i, "viewname")+"',";
        colModel += "{name:'"+viewConfig.getValue(i, "property")+"',index:'"+viewConfig.getValue(i, "property")+"', width:"+width+"},";
    }

    ComRowSet unviewConfig = CommonQueryController.getViewConfigCustom(queryuc,"0");
    for (int i = 0, m = unviewConfig.getRowCount(); i < m; i++) {
        colNames += "'"+unviewConfig.getValue(i, "viewname")+"',";
        colModel += "{name:'"+unviewConfig.getValue(i, "property")+"',index:'"+unviewConfig.getValue(i, "property")+"', hidden:true},";
    }
    String sumFieldColumn = request.getParameter("sumFieldColumn");

%>

<r:grid id="<%=uniqueid%>" dataUrl="<%=dataUrl%>" width="<%=gwidth%>"  height="<%=gheight%>" colModel="<%=colModel.substring(0,colModel.length()-1)%>" colNames="<%=colNames.substring(0,colNames.length()-1)%>" onRowDbClick="<%=onRowDbClick %>" isDefine="<%=operateColumn %>" sumFieldColumn="<%=sumFieldColumn %>"></r:grid>

</div>

</body>
</html>