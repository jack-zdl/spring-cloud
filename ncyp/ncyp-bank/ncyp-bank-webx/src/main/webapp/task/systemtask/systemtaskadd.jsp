<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
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
	<form action="" role="form" id="form1" class="clearfix radio_list">
    	<div>
         	<div class="col-xs-4">
   				<div  class=" each_list panel panel-blue">
					<div class="panel-heading">银行直联对接-日</div>
					<div class="panel-body" id="querytaskid">
					</div>
	          </div>
		</div>
		<div class="col-xs-4">
			<div  class=" each_list panel panel-blue">
				<div class="panel-heading">银行直联对接-月</div>
				<div class="panel-body" id="payrecid">
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div  class="each_list panel panel-blue">
				<div class="panel-heading">银行直联对接-周</div>
				<div class="panel-body" id="outtaskid">
				</div>
			</div>
		</div>
	</div>
	</form>
	<div class="btn_block" style="" align="center">
	   <r:button text="下一步" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="next"/>
	   <r:button text="取消" id="cancelid" iclass="bigger-110" bclass="btn btn-primary" onClick="parent.closeWinFn"/>
	</div>
</body>
</html>

<script type="text/javascript">

$(function(){
	getTaskData();
});

var next = function(){
    var next = $("input[name='commondradio']:checked").val();
    if(next!=null) {
    	parent.$("#editModal").modal("hide");
    	parent.$("#addModal").modal("hide");
    	parent.$('#nextWin').RWin('createWin', '${pageContext.request.contextPath}/task/systemtask/systemtaskform.jsp?next=' + next);
    }else{
      $.RMessage.alert("消息", "请选择要新建的任务！");
    }
};

var cancel = function(){
	parent.location.reload();
}
   
   
//查询任务接口
function getTaskData(){
	$.ajax({
	    url: "${pageContext.request.contextPath}/taskcommands/page.do",
	    type: "json",
	    type: "post",
	    data: {},
	    success: function(data) {
	 	    //console.log(data);
	 	   	var querytaskid = $("#querytaskid");
	 		var payrecid = $("#payrecid");
	 		var outtaskid = $("#outtaskid");
	 		querytaskid.empty();
	 		payrecid.empty();
	 		outtaskid.empty();
	 		
	        var rows = data.rows;
	        var querytaskstr = "";
	     	var payrecstr = "";
	  		var outtaskstr = "";
	  
	        var length = data.rows.length;
	        for(var i=0; i< length ; i++){
	        	if(rows[i].category=='0'){
	        		querytaskstr = querytaskstr + '<div>';
	   	        	querytaskstr = querytaskstr + 	'<input  id="'+rows[i].urid+'" type="radio" name="commondradio" value="'+rows[i].urid+'" >'+rows[i].name+'</input>';
	   	        	querytaskstr = querytaskstr + '</div>';
	        	}else if (rows[i].category=='1'){
	        		payrecstr = payrecstr + '<div>';
	        		payrecstr = payrecstr + 	'<input  id="'+rows[i].urid+'" type="radio" name="commondradio" value="'+rows[i].urid+'" >'+rows[i].name+'</input>';
	        		payrecstr = payrecstr + '</div>';
	        	}else if (rows[i].category=='2'){
	        		outtaskstr = outtaskstr + '<div>';
	        		outtaskstr = outtaskstr + 	'<input  id="'+rows[i].urid+'" type="radio" name="commondradio" value="'+rows[i].urid+'" >'+rows[i].name+'</input>';
	        		outtaskstr = outtaskstr + '</div>';
	        	}
	        }
	     	querytaskid.append(querytaskstr);
	  		payrecid.append(payrecstr);
			outtaskid.append(outtaskstr);
	    },
	    error: function(text){
	        $.RMessage.alert("消息", text.mes);
	    }
	});
}
</script>