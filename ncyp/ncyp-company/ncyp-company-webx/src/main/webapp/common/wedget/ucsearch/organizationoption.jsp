<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String orgid = currUser.getOrgId();
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SYS_ORGANIZATION_ALLSEARCH";
%>
<%
    String width = (request.getParameter("width") == null) ? ("6") : (request.getParameter("width"));
    String id = (request.getParameter("id") == null) ? ("") : (request.getParameter("id"));
    String title=(request.getParameter("title")==null)?(""):(request.getParameter("title"));
    String beforeFunc = (request.getParameter("BFn") == null) ? ("") : (request.getParameter("BFn"));
    String linkageParam = (request.getParameter("linkageParam") == null) ? ("") : (request.getParameter("linkageParam"));
    //是否启用公用的BFn，1表示启用 0表示不用,默认启用。对于一些复杂的处理过程，通用的BFn无法处理，要在页面中进行定义
    String IsUseBFn = (request.getParameter("IsUseBFn") == null) ? ("1") : (request.getParameter("IsUseBFn"));
    //是否使用默认的前置方法
    String beforeDefaultFunc = beforeFunc;
    if (!beforeFunc.equals("") && IsUseBFn.equals("1")) {
        beforeDefaultFunc += "Default";
    }
    String listWidth = request.getParameter("listWidth")==null ? "" : request.getParameter("listWidth");
%>
<r:comboGrid
        valueField="urid" displayField="codename"
        filterField="codename" title="<%=title %>"
        id="${param.id}" name="${param.id}"
        listWidth="<%=listWidth%>"
        colModel="[{title:'代码-名称',field:'codename',width:120}]"
        readonly="${param.readonly}"
        dataUrl="<%=dataUrl%>"
        multiSelect="${param.multiSelect}"
        showText="${param.showText}"
        width="<%=width%>"
        check="${param.check}"
        beforeSelect="<%=beforeDefaultFunc%>"
        afterSelect="${param.SelFn}"
        />

<script type="text/javascript">
    //前置事件初始化;setBaseParams 用于获得初始化参数
    <%
    if(!beforeFunc.equals("")&&IsUseBFn.equals("1")){
    %>
    var <%=beforeFunc%>Default =
            function () {
                <%
                if(!id.equals("") && (!linkageParam.equals(""))){
                %>
                var json = '<%=linkageParam%>';
               	json = json.substring(1,json.length-1);
               	var key = json.split(":")[0];
               	var value = json.split(":")[1].split("\"")[1];
               	var val = $(value).val();
                json = {key:val};
                return json;
                <%
                }
                %>
            };
    <%
    }
    %>
    
    
</script>