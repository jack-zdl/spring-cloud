<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id=(request.getParameter("id")==null)?(""):(request.getParameter("id"));
    String dataUrl = request.getContextPath() + "/common/query.do?uc="+request.getParameter("uc");

%>

<r:multiSelect
        valueField="urid"  displayField="codename"
        filterField="codename"
        id="${param.id}" name="${param.id}"
        title="${param.title}"
        forceLoad="true"
        colModel="[{title:'代码-名称',field:'codename',width:120}]"
        dataUrl="<%=dataUrl%>"
        />
        
