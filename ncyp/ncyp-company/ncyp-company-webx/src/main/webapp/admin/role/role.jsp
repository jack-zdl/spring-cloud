<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="roleAdd" />
    <r:button text="修改" iconCls="edit" onClick="roleEdit" />
    <r:button text="删除" iconCls="delete" onClick="roleDel" />
    <r:button text="分配用户" iconCls="add" onClick="roleAllocateuser" />
    <%--<r:button text="分配权限" iconCls="add" onClick="roleAllocatepower" />--%>
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="roleGrid" dataUrl="${pageContext.request.contextPath}/sysrole/page.do"
            colModel="{name : 'roleCode',index : 'roleCode',sortable:false},
            {name : 'roleName',index : 'roleName',sortable:false},
            {name : 'creator',index : 'creator',sortable:false},
            {name : 'tenantId',index : 'tenantId',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false},
            {name : 'modifyDate',index : 'modifyDate',sortable:false},
            {name : 'orgId',index : 'orgId',sortable:false},
            {name : 'roleOrder',index : 'roleOrder',sortable:false}"
            colNames="'角色编号','角色名称','创建者','创建时间','修改时间','租户','组织','排序'" multiSelect="true"></r:grid>

</div>

<script>
    function roleRefresh(){
        $("#roleGrid").RGrid("setGridParam",null);
    }

    function roleAllocateuser(){
        var rowData = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/role/allocateorleuser.jsp?roleCode="+rowData[0].roleCode;
        $("#allocateUserModal").RWin('createWin',url);
    }
    function roleAllocatepower(){

    }

    var roleCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        roleRefresh();
    }

    function roleAdd() {
        var url = "${pageContext.request.contextPath}/admin/role/roleadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function roleEdit(){
        var rowData = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/role/roleadd.jsp?roleCode="+rowData[0].roleCode;
        $("#editModal").RWin("createWin", url);
    }

    function roleDel(){
        var rowData = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].roleCode);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/sysrole/delete.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, roleRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
</script>
</html>