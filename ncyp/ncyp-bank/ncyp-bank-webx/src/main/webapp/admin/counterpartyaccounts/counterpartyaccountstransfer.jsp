<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Sass平台</title>


    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
    <jsp:include page="/common/include.jsp"/>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>

</head>
<body class="body_col_o">

<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">新增收方账户</span>
        </div>
        <r:buttonList>
            <r:button text="银行账户" iclass="fa-gears" onClick="BankAccount" />
            <r:button text="网商银行账户" iclass="fa-gears" onClick="NetBankAccount" />
            <r:button text="支付宝" iclass="fa-gears" onClick="Alipay" />

        </r:buttonList>

    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
<r:win title="银行账户" id="BankAccountModal" maxable="true" />
<r:win title="网商银行账户" id="NetBankAccountModal" maxable="true" />
<r:win title="支付宝" id="AlipayModal" maxable="true" />

<script>


    var transferCloseWinFn = function(){
        $("#BankAccountModal").modal("hide");
        $("#NetBankAccountModal").modal("hide");
        $("#AlipayModal").modal("hide");

        parent.accountsCloseWinFn();
    }

    function BankAccount() {
        var url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountsadd.jsp?accounttype="+"1";
        $("#BankAccountModal").RWin("createWin", url);
    }
    function NetBankAccount() {
        var url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountsadd.jsp?accounttype="+"2";
        $("#NetBankAccountModal").RWin("createWin", url);
    }
    function Alipay() {
        var url = "${pageContext.request.contextPath}/admin/counterpartyaccounts/counterpartyaccountsalipayadd.jsp?accounttype="+"3";
        $("#AlipayModal").RWin("createWin", url);
    }



</script>
</html>