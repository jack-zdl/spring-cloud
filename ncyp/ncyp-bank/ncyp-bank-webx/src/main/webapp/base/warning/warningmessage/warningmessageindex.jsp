<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.pub.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_WORKFLOW_DONETASK_QUERY";
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();

    ComRowSet objectRowSet = commonQueryController.search("UC_BASE_WARNINGMESSAGE_OBJECT_STATISTICS",new String[]{"userid", "isannul"},new String[]{userid, "0"});
%>


<r:win title="预警信息" id="warningMessage"  maxable="true"/>
<div class="waringlog_wrap clearfix">
    <%if(objectRowSet.getRowCount() < 1){%>
    无预警信息
    <%}else{%>
    <%for(int i=0; i<objectRowSet.getRowCount(); i++){%>
    <div class="col-xs-4">
        <div class="waringlog_list">
            <h5><%=objectRowSet.getValue(i, "name")%></h5>
            <div class="waringlog_item_wrap">
                <%
                    String[] fieldArray = new String[]{"userid","warningobjid", "isannul"};
                    String[] valueArray = new String[]{userid, objectRowSet.getValue(i, "urid"), "0"};
                    ComRowSet ruleRowSet = commonQueryController.search("UC_BASE_WARNINGMESSAGE_RULE_STATISTICS",fieldArray,valueArray);
                    for(int j=0; j<ruleRowSet.getRowCount(); j++){
                %>
                <div class="waringlog_item">
                    <!-- <div class="waringlog_item_dis"> -->
                    <div onclick="showList('<%=ruleRowSet.getValue(j, "urid")%>')">
                    <%=ruleRowSet.getValue(j, "name")%>
                    <!--     </div>	 -->
                    <span><%=ruleRowSet.getValue(j, "count") + "笔"%></span>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <%}}%>
</div>
</body>
</html>
<script>
    var showList = function(warningruleid){
        var url = "${pageContext.request.contextPath}/base/warning/warningmessage/warningmessage.jsp?warningruleid="+warningruleid+"&isannul=0";
        $("#warningMessage").RWin('createWin',url);
    }
</script>



