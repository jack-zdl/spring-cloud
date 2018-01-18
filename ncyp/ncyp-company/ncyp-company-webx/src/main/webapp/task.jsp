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
</body>
<script type="text/javascript">
Ajax.req({
    url: "${pageContext.request.contextPath}/upstreamtask/runtaskschedule.do",
    type: "json",
    method: "post",
    params: {
    	
    },
    ok: function(text) {
    	console.log(text);
        $.RMessage.alert("消息", text.mes);
    },
    err: function(text){
        $.RMessage.alert("消息", text.mes);
    }
})


</script>
</html>