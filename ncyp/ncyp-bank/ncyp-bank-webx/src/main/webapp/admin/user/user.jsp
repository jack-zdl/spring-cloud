<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="userAdd" />
    <r:button text="修改" iconCls="edit" onClick="userEdit" />
    <r:button text="删除" iconCls="delete" onClick="userDel" />
    <r:button text="激活" iconCls="lamp" onClick="userActive" />
    <r:button text="禁用" iconCls="snow" onClick="userDisactive" />
    <r:button text="密码重置" iconCls="add" onClick="userResetPwd" />
    <r:button text="分配组织" iconCls="add" onClick="allocateOrg" />
    <r:button text="分配角色" iconCls="add" onClick="allocateRole" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="userGrid" dataUrl="${pageContext.request.contextPath}/sysuser/page.do"
            colModel="
            {name : 'userId',index : 'userId',sortable:false,hidden:true},
            {name : 'userName',index : 'userName',sortable:false},
            {name : 'orgId',index : 'orgId',sortable:false},
            {name : 'userStatus_show',index : 'userStatus_show',sortable:false},
            {name : 'remark',index : 'remark',sortable:false},
            {name : 'tenantId',index : 'tenantId',sortable:false,hidden:true}"
            colNames="'用户编号','用户姓名','组织','用户状态','备注','租户ID'" multiSelect="true"/>

</div>
<script>
    function userRefresh(){
        $("#userGrid").RGrid("setGridParam",null);
    }

    var userCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        userRefresh();
    }

    function userAdd() {
        var url = "${pageContext.request.contextPath}/admin/user/useradd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function userEdit(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/user/useradd.jsp?userId="+rowData[0].userId;
        $("#editModal").RWin("createWin", url);
    }

    function userDel(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].userId);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/sysuser/delete.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.mes, userRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }

    function userActive(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].userId);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/active.do",
            params: {
                id: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, userRefresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }
    function userDisactive(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].userId);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/disactive.do",
            params: {
                id: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, userRefresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }
    function userResetPwd(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].userId);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/resetPwd.do",
            params: {
                id: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, userRefresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }
    function allocateOrg(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/user/allocateOrg.jsp?userId="+rowData[0].userId+"&tenantId="+rowData[0].tenantId;
        $("#allocateOrgModal").RWin("createWin", url);
    }
    function allocateRole(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/user/allocateRole.jsp?userId="+rowData[0].userId+"&tenantId="+rowData[0].tenantId;
        $("#allocateRoleModal").RWin("createWin", url);
    }
</script>
</html>