<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
	String rtRecmentUrl = request.getContextPath()+"/scs/settlement/smartpayment/recmenttrade/rtrecments.jsp";
%>
<r:tabs id="myTab"  index="0">
   <r:tab title="实时收款" url="<%=rtRecmentUrl %>" id="rtRecment" />
</r:tabs>

