<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
	String directSingleBankPayUrl = request.getContextPath()+"/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpay.jsp";
	String directBatchPayUrl = request.getContextPath()+"/scs/settlement/smartpayment/paymenttrade/directbatchpay/directbatchpay.jsp";
%>
<r:tabs id="myTab"  index="0">
   <r:tab title="直联单笔支付" url="<%=directSingleBankPayUrl %>" id="directsinglebankpay" />
   <r:tab title="直联批量支付" url="<%=directBatchPayUrl %>" id="directbatchpay" />
</r:tabs>

