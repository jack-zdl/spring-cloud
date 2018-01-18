<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="contractAdd" />
    <r:button text="修改" iconCls="edit" onClick="contractEdit" />
    <r:button text="删除" iconCls="delete" onClick="contractDel" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="contractGrid" dataUrl="${pageContext.request.contextPath}/syscontract/page.do"
            colModel="{name : 'contractId',index : 'contractId',sortable:false,hidden:true},
            {name : 'tenantId',index : 'tenantId',sortable:false},
            {name : 'packageId',index : 'packageId',sortable:false},
            {name : 'effectiveDate',index : 'effectiveDate',sortable:false},
            {name : 'expiryDate',index : 'expiryDate',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false,hidden:true},
            {name : 'modifyDate',index : 'modifyDate',sortable:false,hidden:true}"
            colNames="'协议ID','租户','套餐','生效日期','失效日期','创建日期','修改日期'" multiSelect="true"/>
</div>

<script>
    function contractRefresh(){
        $("#contractGrid").RGrid("setGridParam",null);
    }

    var contractCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        contractRefresh();
    }

    function contractAdd() {
        var url = "${pageContext.request.contextPath}/admin/contract/contractadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function contractEdit(){
        var rowData = $("#contractGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/contract/contractadd.jsp?contractId="+rowData[0].contractId;
        $("#editModal").RWin("createWin", url);
    }

    function contractDel(){
        var rowData = $("#contractGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].contractId);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/syscontract/delete.do",
                params: {
                    contractId: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.mes, contractRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }


</script>
</html>