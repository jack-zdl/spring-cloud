<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String recmentsId = request.getParameter("recmentsId");
    String tenantId = request.getParameter("tenantId");
    String amount = request.getParameter("amount");
    String productName = URLDecoder.decode(request.getParameter("productName").trim(), "utf-8");
    String accountName = URLDecoder.decode(request.getParameter("accountName").trim(), "utf-8");
    String orderId = request.getParameter("orderId");
%>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<%--http://172.168.2.34:9090/jsp/business/gatewaypayment.jsp--%>
<form action="http://127.0.0.1:8082/gateway/jnsbpay/submitOrderForTest.do" id="request" name="request" method="POST">
    <input type="hidden" name="recmentsId" value="<%=recmentsId%>"/>
    <input type="hidden" name="tenantId" value="<%=tenantId%>"/>
    <input type="hidden" name="amount" value="<%=amount%>"/>
    <input type="hidden" name="productName" value="<%=productName%>"/>
    <input type="hidden" name="accountName" value="<%=accountName%>"/>
    <input type="hidden" name="orderId" value="<%=orderId%>"/>
</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.3.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $("#request").submit();
    }
</script>
</html>