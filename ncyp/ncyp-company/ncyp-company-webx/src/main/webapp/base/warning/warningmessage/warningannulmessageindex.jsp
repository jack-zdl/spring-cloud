<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.pub.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_WORKFLOW_DONETASK_QUERY";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();

    ComRowSet objectRowSet = commonQueryController.search("UC_BASE_WARNINGMESSAGE_OBJECT_STATISTICS",new String[]{"userid", "isannul"},new String[]{userid, "1"});
%>


<r:win title="预警撤销信息" id="warningAnnulMessage"  maxable="true"/>
<div class="waringcancel_wrap">
    <%if(objectRowSet.getRowCount() < 1){%>
    无预警撤销信息
    <%}else{%>
    <%for(int i=0; i<objectRowSet.getRowCount(); i++){%>
    <div class="waringcancel_list">
        <h5><%=objectRowSet.getValue(i, "name")%></h5>
        <ul class="waringcancel_item">
            <%
                String[] fieldArray = new String[]{"userid", "warningobjid", "isannul"};
                String[] valueArray = new String[]{userid, objectRowSet.getValue(i, "urid"), "1"};
                ComRowSet ruleRowSet = commonQueryController.search("UC_BASE_WARNINGMESSAGE_RULE_STATISTICS",fieldArray,valueArray);
                for(int j=0; j<ruleRowSet.getRowCount(); j++){
            %>
            <li onclick="showList('<%=ruleRowSet.getValue(j, "urid")%>')"><%=ruleRowSet.getValue(j, "name")%>
                <span class="waringcancel_dis">
                       <i class="triangle"></i>
                       描述:<%=ruleRowSet.getValue(j, "description")%>
                   </span>
            </li>
            <%}%>
        </ul>
    </div>
    <%}}%>
</div>

</body>
</html>
<script type="text/javascript">

    var showList = function(warningruleid){
        var url = "${pageContext.request.contextPath}/base/warning/warningmessage/warningmessage.jsp?warningruleid="+warningruleid+"&isannul=1";
        $("#warningAnnulMessage").RWin('createWin',url);
    }
</script>
</body>
</html>



