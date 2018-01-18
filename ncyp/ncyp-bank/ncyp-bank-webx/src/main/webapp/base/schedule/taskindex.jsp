<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
	String dataSystemtask = request.getContextPath()+"/base/schedule/systemtask/systemtask.jsp";
	String dataRunscheduler = request.getContextPath()+"/base/schedule/runscheduler/runscheduler.jsp";
	String dataRunhistory = request.getContextPath()+"/base/schedule/runhistory/runhistory.jsp";
%>

	<r:tabs id="myTab"  index="0">
        <r:tab title="系统任务" url="<%=dataSystemtask %>" id="systemtask" ></r:tab>
        <r:tab title="当日运行计划" url="<%=dataRunscheduler %>" id="runscheduler" ></r:tab>
        <r:tab title="运行记录" url="<%=dataRunhistory %>" id="runhistory" ></r:tab>
   	</r:tabs>
</body>
</html>

<script>

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