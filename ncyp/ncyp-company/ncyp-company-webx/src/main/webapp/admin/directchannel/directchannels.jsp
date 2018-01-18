<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Sass平台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
    <jsp:include page="/common/include.jsp"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>
</head>
<body class="body_col_o">
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">直联渠道</span>
        </div>
        <r:buttonList>
            <r:button text="新增" iclass="fa-gears" onClick="" />
            <r:button text="修改" iclass="fa-gears" onClick="" />
            <r:button text="删除" iclass="fa-gears" onClick="" />
        </r:buttonList>
        <div class="grid_wrap">
            <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/directchannels/page.do"
                    colModel="{name : 'urid',index : 'urid',sortable:false,hidden:true},
                    {name : 'code',index : 'code',sortable:false},
                    {name : 'name',index : 'name',sortable:false},
                    {name : 'bankid',index : 'bankid',sortable:false},
                    {name : 'isactive',index : 'isactive',sortable:false},
                    {name : 'description',index : 'description',sortable:false}"
                    colNames="'ID','代码','代码名称','银行ID','是否有效','描述'" multiSelect="true"></r:grid>

        </div>
    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="删除" id="deleteModal" maxable="true" />

<script>
    function refresh(){
        $("#grid").RGrid("setGridParam",null);
    }

    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        refresh();
    }

    <%--function add() {--%>
    <%--var url = "${pageContext.request.contextPath}/admin/currencies/currenciesadd.jsp";--%>
    <%--$("#addModal").RWin("createWin", url);--%>
    <%--}--%>

    <%--function edit(){--%>
    <%--var rowData = $("#grid").RGrid("getSelectedDatas");--%>
    <%--if(rowData.length != 1){--%>
    <%--$.RMessage.alert("消息", "请选择一条操作记录");--%>
    <%--return;--%>
    <%--}--%>
    <%--var url = "${pageContext.request.contextPath}/admin/currencies/currenciesadd.jsp?contractId="+rowData[0].contractId;--%>
    <%--console.log(url);--%>
    <%--console.log(rowData);--%>
    <%--$("#editModal").RWin("createWin", url);--%>
    <%--}--%>

    <%--function del(){--%>
    <%--var rowData = $("#grid").RGrid("getSelectedDatas");--%>
    <%--if(rowData.length < 1){--%>
    <%--$.RMessage.alert("消息", "请至少选择一条操作记录");--%>
    <%--return;--%>
    <%--}--%>
    <%--var pksArray = new Array();--%>
    <%--for(var i=0; i<rowData.length; i++){--%>
    <%--pksArray.push(rowData[i].contractId);--%>
    <%--}--%>
    <%--$.RMessage.confirm("消息", "是否确认删除！", function(){--%>
    <%--Ajax.req({--%>
    <%--url: "${pageContext.request.contextPath}/syscontract/delete.do",--%>
    <%--params: {--%>
    <%--contractId: pksArray.join(",")--%>
    <%--},--%>
    <%--ok: function(text) {--%>
    <%--console.log(text);--%>
    <%--console.log(text.mes);--%>
    <%--$.RMessage.alert("消息", text.mes, refresh);--%>
    <%--},--%>
    <%--err: function(text) {--%>
    <%--$.RMessage.alert("消息", "操作失败！" + text.mes);--%>
    <%--}--%>
    <%--});--%>
    <%--});--%>
    <%--}--%>


</script>
</html>