<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<jsp:include page="/common/include.jsp"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[{id : 'userId',name : 'userId',title:'用户编号',type:'text'},
    {id : 'userName',name : 'userName',title:'用户名称',type:'text'},
    {id :'userStatus',name : 'userStatus',title:'用户状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999018'},
    {id :'orgId',name : 'orgId',title:'所属组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'}]" />
    <jsp:param name="girdId" value="userGrid" />
    <jsp:param name="defaultQuery" value="{id : 'userId',name : 'userId',title:'用户编号'}" />
</jsp:include>

<r:buttonList>
    <r:button text="新增" iclass="fa-plus" onClick="userAdd" />
    <r:button text="修改" iclass="fa-pencil-square-o" onClick="userEdit" />
    <%--<r:button text="删除" iclass="fa-remove" onClick="userDel" />--%>
    <r:button text="注销" iclass="fa-remove" onClick="userDisactive" />
    <r:button text="激活" iclass="fa-users" onClick="userActive" />
    <r:button text="密码重置" iclass="fa-users" onClick="userResetPwd" />
    <r:button text="分配组织" iclass="fa-users" onClick="allocateOrg" />
    <r:button text="分配角色" iclass="fa-users" onClick="allocateRole" />
    <r:button text="分配权限" iclass="fa-gears" onClick="allocateUserPower"/>
    <r:button text="信息查看" iclass="fa-users"	 onClick="viewUserInfo"/>
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="userGrid" dataUrl="${pageContext.request.contextPath}/sysuser/page.do"
            colModel="
            {name : 'userId',index : 'userId',sortable:false},
            {name : 'userName',index : 'userName',sortable:false},
            {name : 'sysOrganizationDto.orgName',index : 'orgId',sortable:false},
            {name : 'userStatus_show',index : 'userStatus_show',sortable:false},
            {name : 'remark',index : 'remark',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false},
            {name : 'modifyDate',index : 'modifyDate',sortable:false},
            {name : 'cCredentials',index : 'cCredentials',sortable:false},
            {name : 'tenantId',index : 'tenantId',sortable:false,hidden:true}"
            colNames="'用户编号','用户姓名','组织','用户状态','备注','创建时间','修改时间','KEY证书编号','企业id'" multiSelect="true"/>

</div>

<r:win title="新增用户" id="addModal" width="800" height="500"/>
<r:win title="修改用户" id="editModal" width="800" height="500"/>
<r:win title="分配组织" id="allocateOrgModal" maxable="true"/>
<r:win title="分配角色" id="allocateUserRoleModal" maxable="true"/>
<r:win title="分配权限" id="allocateUserPowerModal" height="500" width="500"/>
<r:win title="信息查看" id="viewUserInfoModal" maxable="true"/>

<jsp:include page="/common/tree.jsp">
    <jsp:param name="url" value="${pageContext.request.contextPath}/organization/tree2.do" />
    <jsp:param name="treerelationparam" value="orgId" />
    <jsp:param name="treeinfo" value="orgId,name,parentid,null" />
    <jsp:param name="gridId" value="userGrid" />
</jsp:include>

<script>
    function userRefresh(){
        $("#userGrid").RGrid("setGridParam",{rows:50, page:1});
    }

    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        $("#allocateUserPowerModal").modal("hide");
        userRefresh();
    }

    function userAdd() {
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/sysuseradd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function userEdit(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/sysuseradd.jsp?userId="+rowData[0].userId;
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
                $.RMessage.alert("消息", text.mes+"重置后密码为：666666！", userRefresh);
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
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/allocateuserorg.jsp?userId="+rowData[0].userId+"&tenantId="+rowData[0].tenantId;
        $("#allocateOrgModal").RWin("createWin", url);
    }
    function allocateRole(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/allocateuserrole.jsp?userId="+rowData[0].userId+"&tenantId="+rowData[0].tenantId;
        $("#allocateUserRoleModal").RWin("createWin", url);
    }
    function allocateUserPower(){
        var rowData = $("#userGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/allocateuserpower.jsp?userId="+rowData[0].userId+"&tenantId="+rowData[0].tenantId;
        $("#allocateUserPowerModal").RWin("createWin", url);
    }
    function viewUserInfo(){
        var rowDatas = $("#userGrid").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条操作记录");
            return ;
        }
        var url = "${pageContext.request.contextPath}/admin/system/usermanage/viewusertab.jsp?userid="+rowDatas[0].userId;
        $("#viewUserInfoModal").RWin('createWin',url);
    }
</script>
</html>