<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_BASE_MAIL_OBJECTS_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
