<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.pub.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<form action="" role="form" id="form2">
	<r:tinyPanel title="任务信息" hasHeader="false" column="3">
   	<%
        ComRowSet rowSet = commonQueryController.search("UC_BASE_TASKCOMMANDPARAMDEF_SEARCH",new String[]{"commandid", "isactive"}, new String[]{request.getParameter("urid"), "1"});
        for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
            String fieldname = rowSet.getValue(i, "DISPLAYNAME");
            String attributename = rowSet.getValue(i, "FIELDNAME").toLowerCase();

            String type = rowSet.getValue(i, "FIELDTYPE");
            Boolean ISNULL = rowSet.getValue(i, "ISNULL").toString().equalsIgnoreCase("0") ? false : true;
            String check = "";
            if (!ISNULL) {
                check = "required";
            }
            String contextPath = request.getContextPath();
            String DATA = rowSet.getValue(i, "DATA");
            String dateurl = contextPath + DATA;
    %>
    <%
        if (type.equals("1") || type.equals("1")) {
    %>
		    <r:panelItem>
		    	<r:textField id="<%=attributename %>" name="<%=attributename %>" check="<%=check %>" title="<%=fieldname %>" width="4"></r:textField>
		    </r:panelItem> 
    <%
    	} else if (type.equals("2") || type.equals("2")) {
    %>
		    <r:panelItem>
		        <r:numberField id="<%=attributename %>" name="<%=attributename %>" moneyFormat="true"
		                       check="<%=check %>" title="<%=fieldname%>" width="4"></r:numberField>
		    </r:panelItem> 
    <%
    	} else if (type.equals("3")) {
    %>
		    <r:panelItem>
		    	<r:calendar id="<%=attributename %>" width="4" name="<%=attributename %>" title="<%=fieldname %>" showOpts="yyyy-MM-dd" check="<%=check %>"></r:calendar>
		    </r:panelItem> 
    <% } else if (type.equals("6")) {
        	String hidden = attributename + "hi";
        	String select = attributename + "select";
    %>
		    <r:panelItem>
		    	<r:checkbox title="<%=fieldname%>" id="<%=attributename %>" name="<%=attributename %>" />
		    </r:panelItem> 	
    <%

	    } else if (type.equals("4") || type.equals("5")) {
	        String multiSelect = type.equals("4") ? "false" : "true";
	        String showText = type.equals("4") ? "false" : "true";
	        String valueField = "urid";
	        String displayField = "name";
	        String sh = "[{title:'名称',field:'codename',width:100}]";
	        if (attributename.startsWith("message")) {
	            valueField = "user_id";
	            displayField = "codename";
	        }
	        if (DATA.indexOf("wedget") != -1) {
    %>
		    <r:panelItem>
		        <jsp:include page="<%=DATA %>">
		            <jsp:param name="id" value="<%=attributename %>"/>
		            <jsp:param name="check" value="<%=check %>"/>
		            <jsp:param name="title" value="<%=fieldname %>"/>
		            <jsp:param name="multiSelect" value="<%=multiSelect %>"/>
		            <jsp:param name="showText" value="<%=showText %>"/>
		        </jsp:include>
		    </r:panelItem> 	
    <%
    		} else {
    %>
		    <r:panelItem>
		    	<r:comboGrid title="<%=fieldname%>"
		             	valueField="urid" displayField="name" forceLoad="true"
		                id="<%=attributename %>" name="<%=attributename %>" check="<%=check %>"
		                multiSelect="<%=multiSelect %>"
		                colModel="<%=sh %>"
		                dataUrl="<%=dateurl %>"/>
		    </r:panelItem>
    <%
		        }
		    } else if (type.equals("8") || type.equals("9")) {
		        String multiSelect = type.equals("8") ? "false" : "true";
    %>
		    <r:panelItem>
		    	<r:combo check="<%=check%>" id="<%=attributename%>" name="<%=attributename%>" title="<%=fieldname%>" autoload="true" width="4"
		         valueField="value" displayField="text" multiSelect="<%=multiSelect %>"
		         displayFormat="{displayField}"  dataUrl="<%=dateurl %>"/>
		    </r:panelItem>
    <%
	        }
	        if ((i + 1) % 2 == 0 || i == rowSet.getRowCount() - 1) {
    %>
    <%
            }
        }
    %>
  </r:tinyPanel>
</form>

