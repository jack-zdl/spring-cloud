<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String orgId = request.getParameter("orgId");
    String condition = "{'orgId':'"+orgId+"'}";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Sass平台</title>


    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
    <jsp:include page="/common/include.jsp"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>

</head>
<body class="body_col_o">
    <div class="main_context">
        <div class="main_inner">
            <div class="block_title_wrap">
                <span class="block_title">组织管理</span>
            </div>
            <r:buttonList>
                <r:button text="分配" iconCls="lamp" onClick="allocateuser" />
                <r:button text="取消" iconCls="snow" onClick="unallocateuser" />
            </r:buttonList>
            <div class="grid_wrap">
                <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/sysorguser/getOrgUsers.do"
                        baseParams="<%=condition%>"
                        colModel="{name : 'allocateFlag',index : 'allocateFlag',sortable:false},
                        {name : 'orgId',index : 'orgId',sortable:false},
                        {name : 'userId',index : 'userId',sortable:false},
                        {name : 'userName',index : 'userName',sortable:false},
                        {name : 'userType_show',index : 'userType',sortable:false},
                        {name : 'userStatus_show',index : 'userStatus',sortable:false},
                        {name : 'tenantId',index : 'tenantId',sortable:false,hidden:true},
                        {name : 'roleCode',index : 'roleCode',sortable:false,hidden:true}"
                        colNames="'是否已分配','所属组织','用户编码','用户名称','用户状态','用户类别','隐藏租户','角色代码'" multiSelect="true"></r:grid>
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
        $("#grid").RGrid("setBaseParams","<%=condition%>");
    }

    function unallocateuser(){
        var checkedRows = $("#grid").RGrid("getSelectedDatas");

        if (checkedRows.length == 0) {
            $.RMessage.alert("消息","请选择至少一条数据！");
            return ;
        }
        var strs = [];
        var tenantStr = [];
        var roleCodeStr = [];
        for ( var i = 0, n = checkedRows.length; i < n; i++) {
            if (checkedRows[i]['allocateFlag'] == '未分配') {
                $.RMessage.alert("消息","选项还未分配组织，请重新选择！");
                return;
            }
            strs.push(checkedRows[i]['userId']);
            tenantStr.push(checkedRows[i]['tenantId']);
            roleCodeStr.push(checkedRows[i]['roleCode']);
        }
        var userIds = strs.join(',');
        var tenantIds = tenantStr.join(',');
        var roleCodes = roleCodeStr.join(',');

        Ajax.req({
            url : "${pageContext.request.contextPath}/organization/unAllocateUser.do",
            params : {
                userIds : userIds,
                roleCodes : roleCodes,
                orgId : '<%=orgId%>',
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
        var roleCodeStr = [];
        for ( var i = 0, n = checkedRows.length; i < n; i++) {
            if (checkedRows[i]['allocateFlag'] == '已分配') {
                $.RMessage.alert("消息","选项已经分配组织，请重新选择！");
                return;
            }
            strs.push(checkedRows[i]['userId']);
            tenantStr.push(checkedRows[i]['tenantId']);
            roleCodeStr.push(checkedRows[i]['roleCode']);
        }
        var userIds = strs.join(',');
        var tenantIds = tenantStr.join(',');
        var roleCodes = roleCodeStr.join(',');

        Ajax.req({
            url : "${pageContext.request.contextPath}/organization/allocateUser.do",
            params : {
                userIds : userIds,
                roleCodes : roleCodes,
                orgId : '<%=orgId%>',
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