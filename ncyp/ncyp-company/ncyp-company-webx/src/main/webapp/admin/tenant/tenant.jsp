<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<r:buttonList>
    <r:button text="新增" iconCls="add" onClick="tenantAdd" />
    <r:button text="修改" iconCls="edit" onClick="tenantEdit" />
    <r:button text="删除" iconCls="delete" onClick="tenantDel" />
    <r:button text="激活" iconCls="lamp" onClick="tenantActive" />
    <r:button text="冻结" iconCls="snow" onClick="tenantDisactive" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="tenantGrid" dataUrl="${pageContext.request.contextPath}/tenant/page.do"
            colModel="{name : 'tenantId',index : 'tenantId',sortable:false},
        {name : 'tenantName',index : 'tenantName',sortable:false},
        {name : 'contact',index : 'contact',sortable:false},
        {name : 'telno',index : 'telno',sortable:false},
        {name : 'mobile',index : 'mobile',sortable:false},
        {name : 'tenantStatus_show',index : 'tenantStatus_show',sortable:false}"
            colNames="'租户ID','租户名称','法人','固定电话','手机号','状态'" multiSelect="true"/>
</div>

<script>
    function tenantRefresh(){
        $("#tenantGrid").RGrid("setGridParam",null);
    }

    var tenantCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        tenantRefresh();
    }

    function tenantAdd() {
        var url = "${pageContext.request.contextPath}/admin/tenant/tenantadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function tenantEdit(){
        var rowData = $("#tenantGrid").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/tenant/tenantadd.jsp?tenantId="+rowData[0].tenantId;
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
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, tenantRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
    
    function tenantActive(){
        var rowData = $("#tenantGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].tenantId);
        }
        $.RMessage.confirm("消息", "是否确认激活！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/tenant/active.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.mes, tenantRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
    
    
    function tenantDisactive(){
        var rowData = $("#tenantGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].tenantId);
        }
        $.RMessage.confirm("消息", "是否确认冻结！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/tenant/disactive.do",
                params: {
                    id: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.mes, tenantRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }
</script>
</html>