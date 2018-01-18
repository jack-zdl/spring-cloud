<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>


        <r:buttonList>
            <r:button text="新增" iconCls="add" onClick="accountsAdd" />
            <r:button text="修改" iconCls="edit" onClick="accountsEdit" />
            <r:button text="删除" iconCls="delete" onClick="accountsDel" />
        </r:buttonList>
        <div class="grid_wrap">
            <r:grid id="accountsGrid" dataUrl="${pageContext.request.contextPath}/counterpartyaccounts/page.do"
                    colModel="{name : 'urid',index : 'urid',sortable:false,hidden:true},
                    {name : 'accountname',index : 'accountname',sortable:false},
                    {name : 'accountnumber',index : 'accountnumber',sortable:false},
                    {name : 'privateflag',index : 'privateflag',sortable:false},
                    {name : 'accounttype',index : 'accounttype',sortable:false}"
                    colNames="'urid','账户名称','账户','类型','账户性质'" multiSelect="true"></r:grid>
        </div>

<script>
    function accountsRefresh(){
        $("#accountsGrid").RGrid("setGridParam",null);
    }

    var accountsCloseWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        accountsRefresh();
    }

    function accountsAdd() {
        var url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountstransfer.jsp";
        $("#addModal").RWin("createWin", url);
    }

    function accountsEdit(){
        var rowData = $("#accountsGrid").RGrid("getSelectedDatas");
        var url;
        if(rowData.length != 1){
            $.RMessage.alert("消息", "请选择一条操作记录");
            return;
        }
        if("3"==rowData[0].accounttype) {
            url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountsalipayadd.jsp?urid="+rowData[0].urid;
        }
        else {
            url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountsadd.jsp?urid="+rowData[0].urid;
        }
        console.log(url);
        console.log(rowData);
        $("#editModal").RWin("createWin", url);
    }

    function accountsDel(){
        var rowData = $("#accountsGrid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/counterpartyaccounts/delete.do",
                params: {
                    urid: pksArray.join(",")
                },
                ok: function(text) {
                    console.log(text);
                    console.log(text.mes);
                    $.RMessage.alert("消息", text.mes, accountsRefresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", "操作失败！" + text.mes);
                }
            });
        });
    }

</script>
