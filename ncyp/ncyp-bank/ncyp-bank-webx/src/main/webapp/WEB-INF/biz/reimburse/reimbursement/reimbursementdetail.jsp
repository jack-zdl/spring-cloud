<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@page	import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
    String condition = "reimbursementid=" + urid;
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="reimbursementdetail">
	<input type="hidden" id="urid" name="urid" value=""/>
   	<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
	<r:tinyPanel title="基本信息" hasHeader="false">
			<r:panelItem>
 			<r:textField id="orgid" name="orgid" title="组织" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="employeename" name="employeename" title="员工" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="employeeid" name="employeeid" title="手机号码" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="notecode" name="notecode" title="报销单号" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="itemname" name="itemname" title="项目" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="workflowtypename" name="workflowtypename" readonly="true" title="流程" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="approvestate" name="approvestate" title="审批状态" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="paystate" name="paystate" title="支付状态" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:textField id="generatestate" name="generatestate" title="生成状态" readonly="true" width="6"/>
 		</r:panelItem>
 		
 		<r:panelItem>
 			<r:checkbox title="确认收款" id="isconfirm" name="isconfirm" readonly="true"/>
 		</r:panelItem>
 	</r:tinyPanel>
 	
	<r:tinyPanel title="票据列表"> 
		<jsp:include page="/common/grid.jsp">
			<jsp:param name="queryuc" value="UC_SCS_RB_REIMBURSEBILL_SEARCH" />
			<jsp:param name="condition" value="<%=condition%>" />
			<jsp:param name="operateColumn" value="[test,'查看附件']"/>
		</jsp:include>
	</r:tinyPanel>

</form>
</body>
</html>
<r:win title="附件" id="accessoryModal" width="800" height="500" />
<script type="text/javascript">
    $(function(){
    	
	    Ajax.req({
	        url: "${pageContext.request.contextPath}/common/query.do",
	        type: "json",
	        params: {
	            uc: "UC_SCS_RB_REIMBURSEMENT_SEARCH",
	            urid: "<%=urid%>"
	        },
	        ok: function(text){
	            var entity = text.rows[0];
	            for(key in entity){
	                var $ele=$(document.getElementsByName(key)[0]);
	                $ele.attr("Value", entity[key]);
	            }
	            $("#isconfirm").attr("checked", entity["isconfirm"] == "√" ? true : false);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text);
	        }
	    });
    })
    
    function test(data){
       	var url = "${pageContext.request.contextPath}/reimburse/reimbursement/viewmulti.do?urid="+data["urid"];
        $("#accessoryModal").RWin("createWin", url);
    }
    
</script>