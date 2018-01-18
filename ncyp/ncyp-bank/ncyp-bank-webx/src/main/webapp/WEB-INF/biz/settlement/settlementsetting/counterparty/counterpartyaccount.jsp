<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<jsp:include page="/common/include.jsp" />
<%
	String counterpartyid = request.getParameter("urid");
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String queryuc = "UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH";
    String params = "counterpartyid=" + counterpartyid;
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:button text="交易对手账户新增" iclass="fa-plus" visible="<%=userid+\"#settlementsetting/counterparty/counterpartyaccountadd\"%>" onClick="counterpartyaccountaddFn" />
<r:button text="交易对手账户修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#settlementsetting/counterparty/counterpartyaccountedit\"%>" onClick="counterpartyaccounteditFn" />
<r:button text="交易对手账户删除" iclass="fa-remove" visible="<%=userid+\"#settlementsetting/counterparty/counterpartyaccountdel\"%>" onClick="counterpartyaccountdelFn" />
<r:win title="交易对手账户新增" id="counterpartyaccountaddModal" maxable="true" />
<r:win title="交易对手账户修改" id="counterpartyaccounteditModal" maxable="true" />
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=params%>" />
    <jsp:param name="height" value="150" />
    
</jsp:include>

<script type="text/javascript">
	$(function(){
		$("#button-div").attr("style","padding: 5px 20px;");
	})

    var counterpartyaccountaddFn = function(){
        var url = "${pageContext.request.contextPath}/scs/settlement/settlementsetting/counterparty/counterpartaccountsadd.jsp?type=add&counterpartyid="+"<%= counterpartyid%>";
        $("#counterpartyaccountaddModal").RWin("createWin", url);
    }

    var counterpartyaccounteditFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url = "${pageContext.request.contextPath}/scs/settlement/settlementsetting/counterparty/counterpartaccountsadd.jsp?type=mod&urid=" + rowData[0].urid;
        $("#counterpartyaccounteditModal").RWin("createWin", url);
    }

    var counterpartyaccountdelFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除", function(){
        	Ajax.req({
                url: "${pageContext.request.contextPath}/settlementsetting/counterparty/counterpartyaccountdel.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                	clearCache(['UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH']);
                    $.RMessage.alert("消息", text.msg,counterpartyaccountRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", text.msg);
                }		
            });
        });
    }
    
    var counterpartyaccountRefresh = function(){
    	var qparams = {"uc":"UC_SCS_SE_COUNTERPARTYACCOUNT_SEARCH","counterpartyid":"<%=counterpartyid%>"};
    	$("#grid-table").RGrid("setGridParam",qparams); 
    }
</script>