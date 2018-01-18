<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@	page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@	page import="com.ceying.chx.biz.constants.ENApproveState"%>
<%@	page import="com.ceying.chx.biz.constants.ENCancelState"%>
<%@	page import="com.ceying.chx.biz.constants.ENMoneyWay"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String passelno = request.getParameter("passelno");
    String userid = currUser.getUserId();
    String queryuc = "UC_SCS_SE_PAYMENT_SEARCH";
    String tenantid = currUser.getTenant_id().toString();
    String condition = "passelno=" + passelno;
    if(!tenantid.equals(CommonConstants.SUPERTENANT)) {
        condition = "&tenantid="+tenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:buttonList>
<%-- <r:button text="作废" iclass="fa-gears" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpaycancel\"%>" onClick="cancelFn" /> --%>
<%-- 	<r:button text="确认已支付" iclass="fa-plus" visible="<%=userid+\"#smartpayment/paymenttrade/directbatchpayconfirmpaid\"%>" onClick="addFn" />
 --%></r:buttonList>
<r:win title="详情页面" id="detailModal" maxable="true" />
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="onRowDbClick" value="onRowDbClick" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#importModal").modal("hide");
        exeComQuery();
    }
    var refresh = function(){
        exeComQuery();
    }

    var cancelFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directbatchpaycancel.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var onRowDbClick = function(id, data){
    	var url = "${pageContext.request.contextPath}/scs/settlement/smartpayment/paymenttrade/directsinglebankpay/directsinglebankpaydetail.jsp?urid=" + data["urid"];
        $("#detailModal").RWin("createWin", url);
    }
    

</script>