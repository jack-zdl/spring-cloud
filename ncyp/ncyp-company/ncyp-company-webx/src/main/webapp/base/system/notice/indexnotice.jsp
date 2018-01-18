<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String queryuc = "UC_BASE_SET_NOTICES_SEARCH";
    String createdonstart = request.getParameter("createdonstart");
    String createdonend = request.getParameter("createdonend");
    String condition = "createdonstart=" + createdonstart + "&createdonend=" + createdonend;
%>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>"/>
    <jsp:param name="onRowDbClick" value="onRowDbClick" />
</jsp:include>

<r:win title="详情页面" id="detailModal" width="1100" height="400" />

<script type="text/javascript">
    var onRowDbClick = function(id, data){
        var url = "${pageContext.request.contextPath}/base/system/notice/indexnoticedetail.jsp?urid=" + data["urid"];
        $("#detailModal").RWin("createWin", url);
    }
</script>