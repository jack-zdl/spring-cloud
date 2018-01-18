<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<jsp:include page="/common/include.jsp"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[{id : 'tenantCode',name : 'tenantCode',title:'租户代码',type:'text'},
    {id : 'codename',name : 'codename',title:'代码-名称',type:'text'},
    {id : 'tenantName',name : 'tenantName',title:'租户名称',type:'text'},
    {id :'tenantType',name : 'tenantType',title:'企业状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999017'}]" />
    <jsp:param name="girdId" value="tenantGrid" />
    <jsp:param name="defaultQuery" value="{id : 'tenantCode',name : 'tenantCode',title:'租户代码'}" />
</jsp:include>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="tenantAdd" />
    <r:button text="修改" iconCls="edit" onClick="tenantEdit" />
    <r:button text="删除" iconCls="delete" onClick="tenantDel" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="tenantGrid" dataUrl="${pageContext.request.contextPath}/tenant/page.do"
            colModel="{name : 'tenantId',index : 'tenantId',hidden:true},
            {name : 'tenantCode',index : 'tenantCode',sortable:false},
            {name : 'tenantName',index : 'tenantName',sortable:false},
            {name : 'tenantShortname',index : 'tenantShortname',sortable:false},
            {name : 'tenantCnshortname',index : 'tenantCnshortname',sortable:false},
            {name : 'mobile',index : 'mobile',sortable:false},
            {name : 'email',index : 'email',sortable:false},
            {name : 'tenantStatus_show',index : 'tenantStatus',sortable:false},
            {name : 'tenantType_show',index : 'tenantType_show',sortable:false},
            {name : 'telno',index : 'telno',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false},
            {name : 'modifyDate',index : 'modifyDate',sortable:false},
            {name : 'tenantOrder',index : 'tenantOrder',sortable:false},
            {name : 'codename',index : 'codename',sortable:false},
            {name : 'remark',index : 'remark',sortable:false}"
            colNames="'租户id','租户代码','租户名称','租户英文简称','租户中文简称','法人手机','法人邮箱','租户状态','租户类型','固定电话','创建日期','修改日期','排序','代码名称','备注'" multiSelect="true"></r:grid>

</div>
<r:win title="新增企业" id="addModal"  width="800" height="600"/>
<r:win title="修改企业" id="editModal"  width="800" height="600"/>

<script>
    function tenantRefresh(){
        $("#tenantGrid").RGrid("setGridParam",{rows:50,
            page:1});
    }



    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        tenantRefresh();
    }

    function tenantAdd() {
        var url = "${pageContext.request.contextPath}/admin/syscompany/syscompanyadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function tenantEdit(){
        var rowData = $("#tenantGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/syscompany/syscompanyadd.jsp?tenantId="+rowData[0].tenantId;
        $("#editModal").RWin("createWin", url);
    }

    function tenantDel(){
        var rowData = $("#tenantGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].tenantId);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/tenant/delete.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.msg, tenantRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！"+ text.msg);
                }
            });
        });
    }


</script>
</html>