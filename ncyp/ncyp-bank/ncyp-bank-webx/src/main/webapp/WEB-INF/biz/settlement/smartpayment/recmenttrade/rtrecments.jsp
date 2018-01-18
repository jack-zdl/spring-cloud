<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants" %>
<%@ page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants" %>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = String.valueOf(currUser.getTenant_id());
    String queryuc = "UC_SCS_SE_RTRECMENTS_SEARCH";
    String condition;
    if(tenantid.equals(CommonConstants.SUPERTENANT)){
        condition="&gridtenantid=";
    }else{
        condition="&gridtenantid="+tenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="网关支付" iclass="fa-plus" visible="<%=userid+\"#supplybkaccountmanage/bankaccountbalance/add\"%>" onClick="payFn" />
<r:win title="网关支付" id="payModal" maxable="true" />

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    function closeWinFn(){
        $("#payModal").modal("hide");
        refresh();
    }
    function refresh(){
        exeComQuery();
    }

    function payFn(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var recmentsId = rowData[0].urid;
        var amount = rowData[0].ouramount;
        var tenantid = rowData[0].tenantid;
        var productName = encodeURI(encodeURI(rowData[0].productname));
        var accountName = encodeURI(encodeURI(rowData[0].ourbankaccountname));
        var orderId = rowData[0].srcnotecode;

        var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/recmenttrade/gatewayrequest.jsp?";
        var condition = "recmentsId="+recmentsId+"&tenantId="+tenantid+"&amount="+amount+"&productName="+productName+
            "&accountName="+accountName+"&orderId="+orderId;
        url = url + condition;
        window.open(url);
    }
</script>