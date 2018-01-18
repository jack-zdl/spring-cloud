<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<jsp:include page="/common/include.jsp"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[{id : 'roleCode',name : 'roleCode',title:'角色编号',type:'text'},
    {id : 'roleName',name : 'roleName',title:'角色名称',type:'text'},
    {id :'tenantId',name : 'tenantId',title:'企业',type:'grid',url:'${pageContext.request.contextPath}/tenant/page.do',displayField:'codename',valueField:'tenantId'}]" />
    <jsp:param name="girdId" value="roleGrid" />
    <jsp:param name="defaultQuery" value="{id : 'roleCode',name : 'roleCode',title:'角色编号'}" />
</jsp:include>

<r:buttonList>
    <r:button text="新增" iclass="fa-plus" onClick="roleAdd" />
    <r:button text="修改" iclass="fa-pencil-square-o" onClick="roleEdit" />
    <r:button text="删除" iclass="fa-remove" onClick="roleDel" />
    <r:button text="分配用户" iclass="fa-users" onClick="roleAllocateuser" />
    <r:button text="分配权限" iclass="fa-gears" onClick="roleAllocatepower" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="roleGrid" dataUrl="${pageContext.request.contextPath}/sysrole/page.do"
            colModel="{name : 'roleCode',index : 'roleCode',sortable:false},
            {name : 'roleName',index : 'roleName',sortable:false},
            {name : 'roleUserDto.userName',index : 'creator',sortable:false},
            {name : 'remark',index : 'remark',sortable:false},
            {name : 'roleOrder',index : 'roleOrder',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false},
            {name : 'modifyDate',index : 'modifyDate',sortable:false},
            {name : 'sysOrganizationDto.orgName',index : 'orgId',sortable:false},
            {name : 'tenantId',index : 'tenantId',sortable:false,hidden:true},
            {name : 'sysTenantDto.tenantName',index : 'tenantId',sortable:false}"
            colNames="'角色编号','角色名称','创建者','备注','排序','创建时间','修改时间','组织','','企业'" multiSelect="true"></r:grid>

</div>
<r:win title="新增角色" id="addModal" width="800" height="500"/>
<r:win title="修改角色" id="editModal" width="800" height="500"/>
<r:win title="分配用户" id="allocateuserModal"  maxable="true" />
<r:win title="分配权限" id="allocatepowerModal"  width="800" height="650" maxable="true" />

<script>
    function roleRefresh(){
        //$("#roleGrid").trigger("reloadGrid");
        $("#roleGrid").RGrid("setGridParam",{rows:50, page:1});
    }

    function roleAllocateuser(){
        var rowData = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/rolemanage/allocateuser.jsp?roleCode="+rowData[0].roleCode;
        $("#allocateuserModal").RWin('createWin',url);
    }
    function roleAllocatepower(){
        var rowDatas = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/rolemanage/allocatepower.jsp?rolecode="+rowDatas[0].roleCode+"&tenant_id="+rowDatas[0].tenantId;
        $("#allocatepowerModal").RWin('createWin',url);
    }

    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        $("#allocatepowerModal").modal("hide");
        roleRefresh();
    }

    function roleAdd() {
        var url = "${pageContext.request.contextPath}/admin/system/rolemanage/sysroleadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function roleEdit(){
        var rowData = $("#roleGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/rolemanage/sysroleadd.jsp?roleCode="+rowData[0].roleCode;
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

    var closepowerWinFn = function(){
        $("#allocatepowerModal").modal("hide");
    }
</script>
</html>