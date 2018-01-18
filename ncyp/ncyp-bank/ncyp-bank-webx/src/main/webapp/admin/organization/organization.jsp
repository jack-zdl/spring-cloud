<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String dataUrl = null;
    String treerelationparam = "orgId";
    String treeinfo = "orgId,orgName,parentId,null";
    dataUrl = request.getContextPath()+"/organization/page.do";

%>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="orgAdd" />
    <r:button text="修改" iconCls="edit" onClick="orgEdit" />
    <r:button text="删除" iconCls="delete" onClick="orgDel" />
    <r:button text="分配用户" iconCls="add" onClick="orgAllocateUser" />
</r:buttonList>


<%--<r:tree id="treeDemo" dataUrl="<%=dataUrl%>" onNodeClick="mytext" height="45"></r:tree>--%>

<div class="grid_wrap">
    <r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/organization/page.do"
            colModel="{name : 'orgId',index : 'orgId',sortable:false,hidden:true},
            {name : 'tenantId',index : 'tenantId',sortable:false},
            {name : 'orgCode',index : 'orgCode',sortable:false},
            {name : 'orgName',index : 'orgName',sortable:false},
            {name : 'orgCate_show',index : 'orgCate_show',sortable:false,hidden:true},
            {name : 'orgLevel_show',index : 'orgLevel_show',sortable:false,hidden:true},
            {name : 'parentId',index : 'parentId',sortable:false}"
            colNames="'组织编号','租户','组织编码','组织名称','组织分类','组织级别','上级组织'" multiSelect="true"/>
</div>

<script>
    function orgRefresh(){
        $("#orgGrid").RGrid("setGridParam",null);
    }

    var orgCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        orgRefresh();
    }

    function orgAllocateUser(){
        var rowData = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/organization/allocateorguser.jsp?orgId="+rowData[0].orgId;
        $("#allocateModal").RWin('createWin',url);
    }

    function orgAdd() {
        var url = "${pageContext.request.contextPath}/admin/organization/organizationadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function orgEdit(){
        var rowData = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/organization/organizationadd.jsp?orgId="+rowData[0].orgId;
        $("#editModal").RWin("createWin", url);
    }

    function orgDel(){
        var rowData = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].orgId);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/organization/delete.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, orgRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }

    <%--function mytext(){--%>
        <%--var objvalue =  $('#treeDemo').RTree("getValue");--%>
        <%--jQuery("#grid").setGridParam({postData:{'<%=treerelationparam%>':objvalue[0]}}).trigger("reloadGrid");--%>
    <%--}--%>
</script>
</html>