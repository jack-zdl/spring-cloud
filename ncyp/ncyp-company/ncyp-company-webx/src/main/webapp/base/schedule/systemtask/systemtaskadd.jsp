<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.pub.service.ComRowSet" %>
<%@ page import="java.util.Hashtable" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String[] fieldArray = null;
	String[] valueArray = null;
	String dataright =  "1";
	String queryuc = "UC_BASE_TASKCOMMAND_SEARCH";
	ComRowSet rowSet = (ComRowSet) commonQueryController.search(queryuc,fieldArray,valueArray);
%>
<style>
	.radio_list{
	   background-color:white;
	}
	.radio_list .col-xs-4{
	    padding-top:10px
	}
	.panel-blue{
	    border-color:#7DB4D8 !important;
	}
	.panel-blue > .panel-heading {
		color: #fff;
		background-color: #7DB4D8;
		border-color: #7DB4D8;
		padding: 5px 10px !important;
	}
	.panel-blue input{
	    margin: 7px 0 !important;
	    vertical-align: middle;
	}
</style>
<jsp:include page="/common/formhead.jsp" />
	<form action="" role="form" id="form1" class="clearfix radio_list">
    	<div>
         	<div class="col-xs-4">
   				<div  class=" each_list panel panel-blue">
					<div class="panel-heading">银行直联对接</div>
					<div class="panel-body">
					<%
       			  		for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
              			String category = rowSet.getValue(i, "CATEGORY");
              			String urid = rowSet.getValue(i, "URID");
              			String name = rowSet.getValue(i, "NAME");
       			  	  	if(category.equals("0")){ %>
						<div>
							<input  id="<%=urid %>" type="radio" name="commondradio" value="<%=urid %>" ><%=name %></input>
						</div>
					<%
				          	}
				          }
		          	%>
					</div>
	          </div>
		</div>
		<div class="col-xs-4">
			<div  class=" each_list panel panel-blue">
				<div class="panel-heading">银行直联对接</div>
				<div class="panel-body">
					<%
       			  		for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
              			String category = rowSet.getValue(i, "CATEGORY");
              			String urid = rowSet.getValue(i, "URID");
              			String name = rowSet.getValue(i, "NAME");
       			  	  	if(category.equals("1")){ 
     			  	%>
						<div>
							<input  id="<%=urid %>" type="radio" name="commondradio" value="<%=urid %>" ><%=name %></input>
						</div>
					<%
				          	}
				          }
		            %>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div  class="each_list panel panel-blue">
				<div class="panel-heading">银行直联对接</div>
				<div class="panel-body">
				<%
   			  		for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
          			String category = rowSet.getValue(i, "CATEGORY");
          			String urid = rowSet.getValue(i, "URID");
          			String name = rowSet.getValue(i, "NAME");
   			  	  	if(category.equals("2")){ 
			  	%>
					<div>
						<input  id="<%=urid %>" type="radio" name="commondradio" value="<%=urid %>" ><%=name %></input>
					</div>
				<%
			          	}
			          }
		        %>
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="btn_block">
	   <r:button text="下一步" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="next"/>
	   <r:button text="取消" id="cancelid" iclass="bigger-110" bclass="btn btn-primary" onClick="parent.closeWinFn"/>
	</div>
</body>
</html>

<script type="text/javascript">
	var next = function(){
	    var next = $("input[name='commondradio']:checked").val();
	    if(next!=null) {
	    	parent.$("#editModal").modal("hide");
	    	parent.$("#addModal").modal("hide");
	    	parent.$('#nextWin').RWin('createWin', '${pageContext.request.contextPath}/base/schedule/systemtask/systemtaskform.jsp?next=' + next);
	    }else{
	      $.RMessage.alert("消息", "请选择要新建的任务！");
	    }
	};
    var cancel = function(){
    	parent.location.reload();
    }
</script>