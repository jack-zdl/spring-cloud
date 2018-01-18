<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant"  %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    String commandid = request.getParameter("next");
    String urid = request.getParameter("urid");
    SysUserLoginDto  sysuserdto = (SysUserLoginDto)request.getSession().getAttribute(UserConstant.USER_SESSION);
	int tenantid = 0;
	String userid = "";
	String orgid = "";
	String orgname = "测试";
	if(sysuserdto!=null){
		tenantid = sysuserdto.getTenantId();
		orgid = sysuserdto.getOrgId();
		userid = sysuserdto.getUserId();
	}
%>
<div class="main_context">
<div class="operation_block">
      <form action="" role="form" id="form1" class="main_form">
  		 <r:tinyPanel title="任务信息" hasHeader="true" column="3">
    		<r:panelItem>
			    <jsp:include page="/common/wedget/combogrid.jsp">
                     <jsp:param name="id" value="orgid"/>
                     <jsp:param name="valueField" value="orgId"/>
                     <jsp:param name="displayField" value="orgName"/>
                     <jsp:param name="title" value="当前组织"/>
                     <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page"/>
                     <jsp:param name="check" value="required"/>
                 </jsp:include>
	        </r:panelItem> 
	        <r:panelItem>
                <r:comboGrid id="commandid" name="commandid" valueField="urid" displayField="name" check="required" readonly='true'
                          colModel="[{title:'名称',field:'name',width:120}]" dataUrl="${pageContext.request.contextPath}/taskcommands/page.do" title="任务命令" />
            </r:panelItem> 
	        <r:panelItem>
               <r:textField  id="taskname" name="taskname" title="任务名称" check="required"/>
           	</r:panelItem> 
	        <r:panelItem>
	        	<r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
        	</r:panelItem> 
	        <r:panelItem>
                <r:textField  id="taskdescription" name="taskdescription" title="备注" />
            </r:panelItem> 
         </r:tinyPanel>
      </form>

      <%-- <jsp:include page="/base/schedule/systemtask/systemtaskparam.jsp">
          <jsp:param name="urid" value="<%=commandid%>"/>
      </jsp:include> --%>
      
      <form action="" role="form" id="form2" column="3">
		<r:tinyPanel title="任务信息" hasHeader="false" column="3">
			<r:panelItem>
			    <jsp:include page="/common/wedget/combogrid.jsp">
                     <jsp:param name="id" value="taskorgid"/>
                     <jsp:param name="valueField" value="orgId"/>
                     <jsp:param name="displayField" value="orgName"/>
                     <jsp:param name="title" value="组织"/>
                     <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/organization/page"/>
                     <jsp:param name="check" value="required"/>
                 </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
		    	<r:checkbox title="是否包含下级" id="issub" name="issub" />
		    </r:panelItem> 	
		    <r:panelItem>
			     <jsp:include page="/common/wedget/combogrid.jsp">
                     <jsp:param name="id" value="bankid"/>
                     <jsp:param name="valueField" value="urid"/>
                     <jsp:param name="displayField" value="name"/>
                     <jsp:param name="title" value="银行"/>
                     <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/bank/page.do"/>
                 </jsp:include>
	        </r:panelItem>
			<r:panelItem>
			    <jsp:include page="/common/wedget/combogrid.jsp">
                     <jsp:param name="id" value="userid"/>
                     <jsp:param name="valueField" value="userId"/>
                     <jsp:param name="displayField" value="userName"/>
                     <jsp:param name="title" value="消息通知人"/>
                     <jsp:param name="dataUrl" value="${pageContext.request.contextPath}/sysuser/page"/>
                 </jsp:include>
		    </r:panelItem>
		</r:tinyPanel>
	  </form>

      <form role="form" id="scheduleform" onsubmit='return false;'>
   		  <input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
   		  <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
          <input id="optype" type="hidden" name="optype" value="add" />
          <input id="outputflag" type="hidden" name="outputflag" value="0" />
          <input id="transseq" type="hidden" name="transseq"/>
          <r:tinyPanel title="计划信息" hasHeader="true" column="3">
   			 <r:panelItem>
                 <r:comboGrid id="calendarid" name="calendarid" valueField="urid" displayField="name"
                             colModel="[{title:'日历名字',field:'name',width:120}]" dataUrl="${pageContext.request.contextPath}/calendars/page.do?isactive=1"
                             title="日历" check="required"/>
            </r:panelItem> 
	        <r:panelItem>
                 <r:combo id="holidayrunmode" name="holidayrunmode" valueField="value" displayField="text"
                          title="节假日状态"  staticData="[{'text':'节假日不运行','value':'2'},{'text':'节假日运行','value':'1'}]"/>
            </r:panelItem> 
	        <r:panelItem>                  
                <r:combo id="category" name="category" valueField="value" displayField="text" afterSelect="categoryFn"
                         title="日期配置模式"  staticData="[{'text':'日模式','value':'1'},{'text':'月模式','value':'2'}]"/>
            </r:panelItem> 
	        <r:panelItem>                   
                <r:calendar id="startdatetime"  name="startdatetime" title="日期从" showOpts="yyyy-MM-dd"  check="required" />
            </r:panelItem> 
	        <r:panelItem>                   
                <r:calendar id="enddatetime"  name="enddatetime" title="日期到" showOpts="yyyy-MM-dd" check="required" />
            </r:panelItem> 
       	</r:tinyPanel>    
        <r:tinyPanel title="" hasHeader="false" column="3">
	        <r:panelItem classes="day">               
                <r:numberField id="dayDetail" name="dayDetail" title="时间间隔(天)" />
            </r:panelItem>
        </r:tinyPanel>
        <r:tinyPanel title="" hasHeader="false" column="3">     
	        <r:panelItem classes="month"> 
                <r:numberField id="monthDetail" name="monthDetail" title="时间间隔(月)"/>
            </r:panelItem> 
	        <r:panelItem classes="month">                   
                <r:combo id="monthDetailIndex" name="monthDetailIndex" valueField="value" displayField="text"  defaultValue="*"
                         staticData="[ {'text':'每个星期','value':'*'},{'text':'第一个星期','value':'1'},{'text':'第二个星期','value':'2'},{'text':'第三个星期','value':'3'},{'text':'第四个星期','value':'4'},{'text':'最后个星期','value':'5'}]"/>
            </r:panelItem> 
	        <r:panelItem classes="month">                 
                <r:combo id="monthDetaildayofweek" name="monthDetaildayofweek" valueField="value" displayField="text" defaultValue="*"
                                       staticData="[ {'text':'星期一','value':'2'},{'text':'星期二','value':'3'},{'text':'星期三','value':'4'},{'text':'星期四','value':'5'},{'text':'星期五','value':'6'},{'text':'星期六','value':'7'},{'text':'星期日','value':'1'}]"/>
            </r:panelItem> 
        </r:tinyPanel>
        <r:tinyPanel title="" hasHeader="false" column="3">    
	        <r:panelItem>
                <r:textField  id="startTime" name="startTime" title="开始"/>
            </r:panelItem> 
	        <r:panelItem>                  
                <r:textField  id="endTime" name="endTime" title="结束" />
            </r:panelItem> 
	        <r:panelItem>     
                <r:numberField id="intervalTime" name="intervalTime" title="运行间隔(分)" moneyFormat='int'/>
            </r:panelItem> 
	        <r:panelItem>     
                <r:button id="gentimepoint"  text="生成时间点" iclass="fa-plus" onClick="genTimePoint"/>
            </r:panelItem> 
	        <r:panelItem>     
                 <r:textArea id="runtimepointlist" name="runtimepointlist" title="时间点信息" check="required" />
            </r:panelItem> 
	        <r:panelItem>      
                 <r:textArea id="description" name="description" title="描述" check="maxlength:256" />
            </r:panelItem>  
         </r:tinyPanel>   
         <div class="btn_block" align="center">
		    <r:button text="保存" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="saveFn"/>
		    <r:button text="取消" id="cancelid" iclass="bigger-110" bclass="btn btn-primary" onClick="parent.closeWinFn"/>
		</div>   
      </form>
</div>
</div>
<script type="text/javascript">
    $(function(){
    	//赋初值
    	$('#holidayrunmode').RCombo('setAllValue',["1","节假日运行"]);
    	$('#category').RCombo('setAllValue',["1","日模式"]);
        $('#commandid').val('<%=commandid %>');
        $("#commandid").RComboGrid('setValue');
        $('#orgid').RComboGrid('setAllValue',["<%=orgid%>","<%=orgname%>"]);
        $('#dayDetail').val('1');
        $('#startdatetime').RCalendar('afterSelect',startdatetimeFn);
        $('#enddatetime').RCalendar('afterSelect',enddatetimeFn);
        hiddenMonth();
        //hiddenWeek();
    })
    
    var saveFn = function(){
        var fieldSet = '';
        var dataform1 = '';
        var _category = $("#category").val();
        if(_category=='1'){//日模式
            // 需要判断dayDetail不能够为空
            var _dayDetail = $("#dayDetail").val();
            if(_dayDetail==''){
                $.RMessage.alert("消息", '每隔几天开始不能够为空!');
                return;
            }
        }else if(_category=='2'){//月模式
            // 需要判断monthDetail不能够为空
            var _monthDetail = $("#monthDetail").val();
            if(_monthDetail==''){
                $.RMessage.alert("消息", '每隔几月开始不能够为空!');
                return;
            }
        }
        var timepoint = $("#runtimepointlist").val();
        if (timepoint.indexOf(":") < 0) {
            $.RMessage.alert("消息", '时间点格式输入不对!');
            $("#runtimepointlist").val("");
            return;
        }
        $("#form1").RValidate({
            'success': function(){
            	dataform1 = $("#form1").AllSerialize();
            }
        });
        $("#form2").RValidate({
            'success': function(){
            	var fieldSetVal = $("#form2").AllSerialize().split("&");
                $(fieldSetVal).each(function(index){
                    fieldSet += fieldSetVal[index] + "#";
                });
            }
        });

        $("#scheduleform").RValidate({
            'success': function(){
                var params = $("#scheduleform").AllSerialize();
                params += "&" + dataform1;
                params += "&fieldSet=" + fieldSet;
                params = decodeURIComponent(params);
                <%-- Ajax.req({
                    url: '<%= dataUrl%>',
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                }) --%>
            }
        });
        
        $("#form1").RValidate('validate');
        $("#form2").RValidate('validate');
        $("#scheduleform").RValidate("validate");
    }

    /**
     * 时间点信息生成
     */
    var genTimePoint = function(){
        //1.生成时间点的时候需要判断 开始 结束 运行时间间隔(分钟): 都不能够为空
        var _startTime = $("#startTime").val();
        var _endTime =   $("#endTime").val();
        var _intervalTime = $("#intervalTime").val();
        var timeExt =  /^(([01]{1}[0-9]{1})|(2[0-3]{1})){1}:[0-5]{1}[0-9]{1}$/
        if(_startTime==''){
            $.RMessage.alert("消息", "开始：不能够为空");
            return ;
        }
        if(!timeExt.test(_startTime)){
            $.RMessage.alert("消息", "开始时间格式错误，应该为XX:XX,且是24小时制度");
            return;
        }
        if(_endTime==''){
            $.RMessage.alert("消息", "结束：不能够为空");
            return;
        }
        if(!timeExt.test(_endTime)){
            $.RMessage.alert("消息", "结束时间时间格式错误，应该为XX:XX,且是24小时制度");
            return;
        }
        if(_startTime!=''&&_endTime!=''){
            if(_startTime>_endTime){
                $.RMessage.alert("消息", "开始不能够大于结束");
                return;
            }
        }
        if(_intervalTime==''){
            $.RMessage.alert("消息", "运行时间间隔(分钟)：不能够为空");
            return;
        }
        $("#runtimepointlist").val(genTimePointService($("#intervalTime").val(),$("#startTime").val(), $("#endTime").val()));
    };
	//获取所有时间节点信息
    var genTimePointService = function(time, StartTime, EndTime){
        var strRunTimePointList = '';
        if (StartTime != null && EndTime != null && time != null) {
            var startTime = StartTime.split(":");
            var endTime = EndTime.split(":");
            var startHour = startTime[0];
            var startMin = startTime[1];
            var endHour = endTime[0];
            var endMin = endTime[1];
            var dStartTime = new Date(0, 1, 1, startHour, startMin, 0);
            var dEndTime = new Date(0, 1, 1, endHour, endMin, 0);
            for (var dTime = dStartTime; dTime.getTime() <= dEndTime.getTime();) {
                var dTimeSub = dTime;
                strRunTimePointList += dTime.getHours();
                strRunTimePointList += ":";
                if(dTime.getMinutes()-9>0){
                	strRunTimePointList += dTime.getMinutes();
                }else{
                	strRunTimePointList += "0" + dTime.getMinutes();
                }
                strRunTimePointList += ",";
                dTime = new Date(dTime.getTime() + time * 1000 * 60);
                if (dTimeSub.getTime() != dEndTime.getTime() && dTime.getTime() > dEndTime.getTime())// 如果超过了，就把最后的时间加上
                {
                    strRunTimePointList += dEndTime.getHours();
                    strRunTimePointList += ":";
                    if(dEndTime.getMinutes()-9>0){
                    	strRunTimePointList += dEndTime.getMinutes();
                    }else{
                    	strRunTimePointList += "0" + dEndTime.getMinutes();
                    }
                    strRunTimePointList += ",";
                }
            }
        }
        return strRunTimePointList.substring(0, strRunTimePointList.length-1);
    }

    /**
     * 隐藏日模式
     */
    var hiddenDay = function(){
    	$(".day").hide();
    };
    var displayDay = function(){
    	$(".day").show();

    };

    /**
     * 隐藏周模式
     */
    var hiddenWeek = function(){
        //document.getElementById("week").style.display="none";
        //$("#weekPanel").css("display","none");
        //$("#dayPanel").attr('style','display:none;width:1px;height:1px');

    };
    var displayWeek = function(){
        //document.getElementById("week").style.display="block";
        //$("#weekPanel").css("display","block");
        //$("#dayPanel").attr('style','');
    };

    /**
     * 隐藏月模式
     */
    var hiddenMonth = function(){
    	$(".month").hide();
    };
    var displayMonth = function(){
        $(".month").show();
    };
    /**
     * 日历模式选择函数
     */
    var categoryFn = function(){
        var _categoryValue = $("#category").val();
        if(_categoryValue=='1'){
            hiddenMonth();
            //hiddenWeek();
            displayDay();
        }else if(_categoryValue=='2'){
            hiddenDay();
            //hiddenWeek();
            displayMonth();
        }
        else if(_categoryValue=='3'){
            hiddenDay();
            hiddenMonth();
            //displayWeek();
        }
    };

    var startdatetimeFn = function(){
        var startdatetime = $("#startdatetime").val();
        $('#enddatetime').RCalendar('setValidDates',{minDate:startdatetime});
    }

    var enddatetimeFn = function(){
        var enddatetime = $("#enddatetime").val();
        $('#startdatetime').RCalendar('setValidDates',{maxDate:enddatetime});
    }
</script>