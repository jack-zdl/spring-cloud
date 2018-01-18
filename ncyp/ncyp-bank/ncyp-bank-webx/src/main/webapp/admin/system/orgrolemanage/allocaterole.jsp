<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/include.jsp" />

<%
    String queryuc = "UC_SYS_USERORGROLE_SEARCHROLE";
    String condition = "userorgid="+request.getParameter("userorgid");
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String gridtenantid=currUser.getTenantId().toString();
    if(gridtenantid.equals(CommonConstants.SUPERTENANT)){
        condition=condition+"&gridtenantid=";
    }else{
        condition=condition+"&gridtenantid="+gridtenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="分配" iclass="fa-plus"  visible="<%=userid+\"#usermanage/postion/allocaterole\"%>" onClick="allocaterole" />
<r:button text="取消" iclass="fa-remove" visible="<%=userid+\"#usermanage/postion/unallocaterole\"%>" onClick="unallocaterole"/>

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

    var allocaterole = function(){
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");

        if(checkedRows.length == 0){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return ;
        }
        var strs = [];
        for (var i = 0, n = checkedRows.length; i < n; i++) {
            if(checkedRows[i]['isallocate']=='分配'){
                $.RMessage.alert("消息","<%=MessageUtil.format("FUM0001")%>");
                return ;
            }
            strs.push(checkedRows[i]['rolecode']);
        }
        var params = strs.join(',');

        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/postion/allocaterole.do",
            params: {
                rolecodes:params,
                userorgid:'${param.userorgid}',
				tenantid:"<%=gridtenantid%>",
                uc: 'UC_SYS_USERORGROLE_ADDROLE'
            },
            ok: function(text) {
                $.RMessage.alert("消息",text.msg,closeWinFn);
            },
            err: function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }

    var unallocaterole = function(){
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");

        if(checkedRows.length == 0){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return ;
        }
        var strs = [];
        for (var i = 0, n = checkedRows.length; i < n; i++) {
            if(checkedRows[i]['isallocate']=='未分配'){
                $.RMessage.alert("消息","<%=MessageUtil.format("FUM0002")%>");
                return;
            }
            strs.push(checkedRows[i]['rolecode']);
        }
        var params = strs.join(',');

        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/postion/unallocaterole.do",
            params: {
                rolecodes:params,
                userorgid:'${param.userorgid}',
                uc: 'UC_SYS_USERORGROLE_DELROLE'
            },
            ok: function(text) {
                $.RMessage.alert("消息",text.msg,closeWinFn);
            },
            err: function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }
</script>