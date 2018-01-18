<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="packetAdd" />
    <r:button text="修改" iconCls="edit" onClick="packetEdit" />
    <r:button text="删除" iconCls="delete" onClick="packetDel" />
    <r:button text="激活" iconCls="lamp" onClick="packetActive" />
    <r:button text="冻结" iconCls="snow" onClick="packetClose" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="packetGrid" dataUrl="${pageContext.request.contextPath}/syspackage/page.do"
            colModel="{name : 'packageId',index : 'packageId',sortable:false,hidden:true},
            {name : 'packageCode',index : 'packageCode',sortable:false},
            {name : 'packageName',index : 'packageName',sortable:false},
            {name : 'isactive_show',index : 'isactive_show',sortable:false},
            {name : 'createDate',index : 'createDate',sortable:false,hidden:true},
            {name : 'modifyDate',index : 'modifyDate',sortable:false,hidden:true}"
            colNames="'套餐ID','套餐编号','套餐名称','是否有效','创建日期','修改日期'" multiSelect="true"/>

</div>

<script>
    function packetRefresh(){
        $("#packetGrid").RGrid("setGridParam",null);
    }

    var packetCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        packetRefresh();
    }

    function packetAdd() {
        var url = "${pageContext.request.contextPath}/admin/permpackage/permpackageadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function packetEdit(){
        var rowData = $("#packetGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/permpackage/permpackageadd.jsp?packageId="+rowData[0].packageId;
        console.log(url);
        console.log(rowData);
        $("#editModal").RWin("createWin", url);
    }

    function packetDel(){
        var rowData = $("#packetGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].packageId);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/syspackage/delete.do",
                params: {
                    packageId: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, packetRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
    var packetActive = function(){
        var rowData = $("#packetGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }

        var pksArray = new Array();

        for(var i=0; i<rowData.length; i++){
            if("1"==rowData[i].isactive)
            {
                $.RMessage.alert("消息","套餐无需激活");
                return

            }
            else
            pksArray.push(rowData[i].packageId);
        }
        $.RMessage.confirm("消息", "是否确认激活！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/syspackage/active.do",
                params: {
                    packageId: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, packetRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
    var packetClose = function() {
        var rowData = $("#packetGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }

        var pksArray = new Array();

        for(var i=0; i<rowData.length; i++){
            if("0"==rowData[i].isactive)
            {
                $.RMessage.alert("消息","套餐无需冻结");
                return

            }
            else
                pksArray.push(rowData[i].packageId);
        }
        $.RMessage.confirm("消息", "是否确认冻结！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/syspackage/close.do",
                params: {
                    packageId: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, packetRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
</script>
</html>