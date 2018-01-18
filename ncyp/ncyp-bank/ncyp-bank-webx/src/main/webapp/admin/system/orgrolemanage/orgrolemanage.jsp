<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
    String queryuc = "UC_SYS_USERORGROLE_SEARCH";
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String gridtenantid=currUser.getTenantId().toString();
    String condition;
    if(gridtenantid.equals(CommonConstants.SUPERTENANT)){
        condition="&gridtenantid=";
    }else{
        condition="&gridtenantid="+gridtenantid;
    }
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SYS_USERORGROLE_SEARCH&queryType=2"+condition;
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:button text="分配角色" iclass="fa-users"  visible="<%=userid+\"#usermanage/postion/allocaterole\"%>" onClick="allocaterole"/>
<r:win title="分配角色" id="allocateroleModal"  maxable="true" />

</div>
</div>
</div>

<r:groupGrid id="group-grid" uniqueKey="urid" pid="parentid" dataUrl="<%=dataUrl%>" width="60"
             colModel="{title:'用户',text:'username'},
             {title:'组织',text:'orgname'},
             {title:'角色',text:'rolename'}" />

</div>
</div>
</div>

</body>


<script type="text/javascript">
    var closeWinFn = function(){
        refresh();
    }

    var refresh = function(){
        exeComQuery();
    }

    var allocaterole = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length != 1){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var parentid = obj[0][0];
        var urid = obj[0][1];
        var userorgid = urid.split("#")[1] + "," + urid.split("#")[2];
        var url = "${pageContext.request.contextPath}/admin/system/orgrolemanage/allocaterole.jsp?userorgid="+userorgid;

        $("#allocateroleModal").RWin('createWin',url);
    }


</script>