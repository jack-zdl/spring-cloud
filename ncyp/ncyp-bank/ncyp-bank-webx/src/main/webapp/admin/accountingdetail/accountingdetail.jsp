<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sass平台</title>


    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css" />
    <jsp:include page="/common/include.jsp" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>

</head>
<body class="body_col_o">
<jsp:include page="/common/navigation.jsp"/>
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">账务明细</span>
        </div>
        <div class="operation_block">
            <r:panelItem>
                <jsp:include page="/common/wedget/combogrid.jsp">
                    <jsp:param name="id" value="orgId"/>
                    <jsp:param name="valueField" value="orgId"/>
                    <jsp:param name="displayField" value="orgName"/>
                    <jsp:param name="title" value="组织"/>
                    <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page.do"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/combogrid.jsp">
                    <jsp:param name="id" value="accountId"/>
                    <jsp:param name="valueField" value="urid"/>
                    <jsp:param name="displayField" value="bankaccountnumber"/>
                    <jsp:param name="title" value="账户"/>
                    <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/account/page.do"/>
                </jsp:include>
            </r:panelItem>
            <div class="time_block">
                时间
                <div>
                    <r:calendar id="t1" name="t1" style="green" showOpts="yyyy-MM-dd"/>
                </div>
                <div class="time_line"></div>
                <div>
                    <r:calendar id="t2" name="t2" style="green" showOpts="yyyy-MM-dd"/>
                </div>
                <button onclick="query()">搜索</button>
            </div>
        </div>
        <div class="grid_wrap">
            <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/accountingdetail/page.do"
                    colModel="
                    {name : 'tradedatetime',index : 'tradedatetime',sortable:false},
                    {name : 'purpose',index : 'purpose',sortable:false},
                    {name : 'income',index : 'income',sortable:false},
                    {name : 'expenditure',index : 'expenditure',sortable:false},
                    {name : 'currentbalance',index : 'currentbalance',sortable:false}"
                    colNames="'交易时间','用途','收入','支出','账户余额'" multiSelect="false"/>

        </div>
    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
<script>
    function query(){
        var accountId = $("#accountId").RComboGrid("getValue");
        alert(accountId);
        $("#grid").RGrid('setGridParam', {'bankaccountid':accountId});
    }
</script>
</html>