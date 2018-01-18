
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>

<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_SYS_ORG_USER";
    String condition = "orgid="+request.getParameter("orgid");
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
   	String tenant_id = currUser.getTenantId().toString();
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="分配" iclass="fa-plus" visible="<%=userid+\"#usermanage/org/allocateuser\"%>" onClick="allocateuser" />
<r:button text="取消" iclass="fa-remove" visible="<%=userid+\"#usermanage/org/unallocateuser\"%>" onClick="unallocateuser"/>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>


<script type="text/javascript">
    var closeWinFn = function(){
        refresh();
        parent.refresh();
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }
    var allocateuser = function(){
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");

        if(checkedRows.length == 0){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return ;
        }
        var strs = [];
        for (var i = 0, n = checkedRows.length; i < n; i++) {
            if(checkedRows[i]['isallocateid']==1){
                $.RMessage.alert("消息","<%=MessageUtil.format("FUM0001")%>");
                return ;
            }
            strs.push(checkedRows[i]['userid']);
        }
        var params = strs.join(',');

        Ajax.req({
            url : "${pageContext.request.contextPath}/usermanage/org/allocateuser.do",
            params : {
                resCode : 'bizSetRole',
                opCode : 'roleUserDel',
                userIds : params,
                roleCode : '${param.rolecode}',
                orgId : '${param.orgid}',
                rightFlag : '1',
                tenant_id : '<%=tenant_id%>',
                uc : 'UC_SYS_ROLE_ADDUSER'
            },
            ok : function(text) {
                $.RMessage.alert("消息",text.msg,closeWinFn);
            },
            err : function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }

    var unallocateuser = function() {
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");

        if (checkedRows.length == 0) {
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return ;
        }
        var strs = [];
        for ( var i = 0, n = checkedRows.length; i < n; i++) {
            if (checkedRows[i]['isallocateid'] == 0) {
                $.RMessage.alert("消息","<%=MessageUtil.format("FUM0002")%>");
                return;
            }
            strs.push(checkedRows[i]['userid']);
        }
        var params = strs.join(',');

        Ajax.req({
            url : "${pageContext.request.contextPath}/usermanage/org/unallocateuser.do",
            params : {
                resCode : 'bizSetRole',
                opCode : 'roleUserDel',
                userIds : params,
                roleCode : '${param.rolecode}',
                orgId : '${param.orgid}',
                rightFlag : '1',
                tenant_id : '<%=tenant_id%>',
                uc : 'UC_SYS_ROLE_DELUSER'
            },
            ok : function(text) {
                $.RMessage.alert("消息",text.msg,closeWinFn);
            },
            err : function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }
</script>
