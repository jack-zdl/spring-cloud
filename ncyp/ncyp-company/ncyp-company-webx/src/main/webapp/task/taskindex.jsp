<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
	String dataSystemtask = request.getContextPath()+"/task/systemtask/systemtask.jsp";
	String dataRunscheduler = request.getContextPath()+"/task/runscheduler/runscheduler.jsp";
	String dataRunhistory = request.getContextPath()+"/task/runhistory/runhistory.jsp";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Saas平台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/account.css"/>
    <jsp:include page="/common/include.jsp"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/account.js"></script>
</head>
<body class="body_col_o">
<jsp:include page="/common/navigation.jsp"/>
<div class="main_context">
	<div class="main_inner">
		<r:tabs id="myTab"  index="0">
	        <r:tab title="系统任务" url="<%=dataSystemtask %>" id="systemtask" ></r:tab>
	        <%-- <r:tab title="当日运行计划" url="<%=dataRunscheduler %>" id="runscheduler" ></r:tab> --%>
	        <r:tab title="运行记录" url="<%=dataRunhistory %>" id="runhistory" ></r:tab>
	   	</r:tabs>
   	</div>
</div>
</body>
</html>

<script>
	$(".menu_list li").removeClass("active");
	$("#taskManage").addClass("active");
	
	$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		if( $(e.target).attr('href') == "#systemtask" ) {
			$("#iframe-systemtask").attr("src","<%=dataSystemtask %>");
		}
		if($(e.target).attr('href') == "#runscheduler"){
			$("#iframe-runscheduler").attr("src","<%=dataRunscheduler %>");
		}
		if($(e.target).attr('href') == "#runhistory"){
			$("#iframe-runhistory").attr("src","<%=dataRunhistory %>");
		}
	});
	
</script>