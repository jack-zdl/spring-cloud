<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="sysParamAdd" />
    <r:button text="修改" iconCls="edit" onClick="sysParamEdit" />
    <r:button text="删除" iconCls="delete" onClick="sysParamDel" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="sysParamGrid" dataUrl="${pageContext.request.contextPath}/sysparam/page.do"
            colModel="{name : 'paramName',index : 'paramName',sortable:false}
            ,{name : 'paramCode',index : 'paramCode',sortable:false}
            ,{name : 'paramValue',index : 'paramValue',sortable:false}"
            colNames="'参数名称','参数编号','参数值'" multiSelect="true"></r:grid>

</div>
<script>
    function sysParamRefresh(){
        $("#sysParamGrid").RGrid("setGridParam",null);
    }

    var userCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        userRefresh();
    }

    function sysParamAdd() {
        var url = "${pageContext.request.contextPath}/admin/sys/sysParameterAdd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function sysParamEdit(){
        var rowData = $("#sysParamGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/sys/sysParameterAdd.jsp?paramCode="+rowData[0].paramCode;
        $("#editModal").RWin("createWin", url);
    }

    function sysParamDel(){
        var rowData = $("#sysParamGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].paramCode);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/sysparam/delete.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.mes, sysParamRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }


</script>
</html>