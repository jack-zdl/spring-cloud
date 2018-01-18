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
            <span class="block_title">直联渠道交易信息码</span>
        </div>

        <div class="grid_wrap">
            <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/directChannelTransCodes/page.do"
                    colModel="{name : 'urid',index : 'urid',sortable:false,hidden:true},
                    {name : 'code',index : 'code',sortable:false},
                    {name : 'directchannelid',index : 'directchannelid',sortable:false},
                    {name : 'transcodeid',index : 'transcodeid',sortable:false},
                    {name : 'matchrule',index : 'matchrule',sortable:false},
                    {name : 'isactive',index : 'isactive',sortable:false}"
                    colNames="'ID','代码','直联渠道','交易信息码','匹配规则','是否有效'" multiSelect="true"></r:grid>

        </div>
    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>


<script>
    function refresh(){
        $("#grid").RGrid("setGridParam",null);
    }
</script>
</html>