<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<jsp:include page="/common/include.jsp"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[{id : 'userId',name : 'userId',title:'用户编号',type:'text'},
    {id : 'userName',name : 'userName',title:'用户名称',type:'text'},
    {id :'orgId',name : 'orgId',title:'所属组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
    {id :'allocateFlag',name : 'allocateFlag',title:'是否已分配',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999007'}]" />
    <jsp:param name="girdId" value="grid" />
    <jsp:param name="defaultQuery" value="{id : 'userId',name : 'userId',title:'用户编号'}" />
</jsp:include>

<%
    String roleCode = request.getParameter("roleCode");
    String condition = "{'roleCode':'"+roleCode+"'}";
%>
<html>
<body class="body_col_o">
    <div class="main_context">
        <div class="main_inner">
            <div class="block_title_wrap">
                <span class="block_title"></span>
            </div>
            <r:buttonList>
                <r:button text="分配" iclass="fa-plus" onClick="allocateuser" />
                <r:button text="取消" iclass="fa-remove" onClick="unallocateuser" />
            </r:buttonList>
            <div class="grid_wrap">
                <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/sysrole/getRoleUsers.do"
                        baseParams="<%=condition%>"
                        colModel="{name : 'allocateFlag',index : 'allocateFlag',sortable:false},
                        {name : 'sysOrganizationDto.orgName',index : 'orgId',sortable:false},
                        {name : 'userId',index : 'userId',sortable:false},
                        {name : 'userName',index : 'userName',sortable:false},
                        {name : 'userType_show',index : 'userType',sortable:false},
                        {name : 'userStatus_show',index : 'userStatus',sortable:false},
                        {name : 'tenantId',index : 'tenantId',sortable:false,hidden:true}"
                        colNames="'是否已分配','所属组织','用户编码','用户名称','用户状态','用户类别','隐藏租户'" multiSelect="true"></r:grid>
            </div>
        </div>
    </div>
    <a class="be_Top" href="#top">
        <img src="<%=request.getContextPath()%>/images/top.png">
    </a>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
<script>
    function refresh(){
        $("#grid").RGrid("setGridParam",{rows:50, page:1});
    }

    function unallocateuser(){
        var checkedRows = $("#grid").RGrid("getSelectedDatas");

        if (checkedRows.length == 0) {
            $.RMessage.alert("消息","请选择至少一条数据！");
            return ;
        }
        var strs = [];
        var tenantStr = [];
        for ( var i = 0, n = checkedRows.length; i < n; i++) {
            if (checkedRows[i]['allocateFlag'] == '未分配') {
                $.RMessage.alert("消息","选项还未分配角色，请重新选择！");
                return;
            }
            strs.push(checkedRows[i]['userId']);
            tenantStr.push(checkedRows[i]['tenantId']);
        }
        var userIds = strs.join(',');
        var tenantIds = tenantStr.join(',');
        Ajax.req({
            url : "${pageContext.request.contextPath}/sysrole/unAllocateUser.do",
            params : {
                userIds : userIds,
                roleCode : "<%=roleCode%>",
                rightFlag : '1',
                tenantIds : tenantIds
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });

    }

    function allocateuser(){
        var checkedRows = $("#grid").RGrid("getSelectedDatas");

        if (checkedRows.length == 0) {
            $.RMessage.alert("消息","请选择至少一条数据！");
            return ;
        }
        var strs = [];
        var tenantStr = [];
        for ( var i = 0, n = checkedRows.length; i < n; i++) {
            if (checkedRows[i]['allocateFlag'] == '已分配') {
                $.RMessage.alert("消息","选项已经分配角色，请重新选择！");
                return;
            }
            strs.push(checkedRows[i]['userId']);
            tenantStr.push(checkedRows[i]['tenantId']);
        }
        var userIds = strs.join(',');
        var tenantIds = tenantStr.join(',');
        console.log(userIds);
        console.log(tenantIds);
        Ajax.req({
            url : "${pageContext.request.contextPath}/sysrole/allocateUser.do",
            params : {
                userIds : userIds,
                roleCode : "<%=roleCode%>",
                rightFlag : '1',
                tenantIds : tenantIds
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }

</script>
</html>