<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.stringtools.FString"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.fund.pub.service.ComRowSet" %>
<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String commandid = request.getParameter("next");
    String urid = request.getParameter("urid");
    String modtype = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(modtype);
    String dataUrl = request.getContextPath() + "/schedule/edit.do";
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp" />
      <form action="" role="form" id="form1">
		<r:tinyPanel title="任务信息" hasHeader="true" column="3">
    		<r:panelItem>
    			<jsp:include page="/common/wedget/ucsearch/organizationoption.jsp">
				     <jsp:param name="id" value="orgid"/>
				     <jsp:param name="title" value="组织"/>
				     <jsp:param name="check" value="required"/>
				     <jsp:param name="readonly" value="true"/>
			    </jsp:include>
            </r:panelItem> 
	        <r:panelItem>                 
                  <r:comboGrid id="commandid" name="commandid" valueField="urid" displayField="name" check="required"
                                        colModel="[{title:'名称',field:'name',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                                        title="任务命令" ></r:comboGrid>
            </r:panelItem> 
	        <r:panelItem>                          
                  <r:textField  id="taskname" name="taskname" title="任务名称" check="required"></r:textField>
            </r:panelItem> 
            <r:panelItem>
	        	<r:checkbox title="是否有效:" id="isactive" name="isactive" />
        	</r:panelItem> 
        	<r:panelItem>     
                <r:textField  id="taskdescription" name="taskdescription" title="备注" width="4"></r:textField>
            </r:panelItem>
       </r:tinyPanel>     
   </form>
   <form action="" role="form" id="form2">
		<r:tinyPanel title="任务信息" hasHeader="false" column="3">
       	<%
		Map map = new HashMap();
             if (urid != null) {
                 ComRowSet rowSettmp = commonQueryController.search("UC_BASE_SYSTEMTASK_SEARCH", new String[]{"urid"}, new String[]{urid});
                 String[] FIELDSETS = rowSettmp.getValue(0, "FIELDSETS").split("#");
                 for (int i = 0; i < FIELDSETS.length; i++) {
                     String[] tmp = FIELDSETS[i].split("=");
                     map.put(tmp[0], tmp.length == 2 ? tmp[1] : "");
                 }
			     ComRowSet rowSet = commonQueryController.search("UC_BASE_TASKCOMMANDPARAMDEF_SEARCH",new String[]{"commandid", "isactive"}, new String[]{rowSettmp.getValue(0, "commandid"), "1"});
			     for (int i = 0, n = rowSet.getRowCount(); i < n; i++) {
			         String fieldname = rowSet.getValue(i, "DISPLAYNAME");
			         String attributename = rowSet.getValue(i, "FIELDNAME").toLowerCase();
			
			         String type = rowSet.getValue(i, "FIELDTYPE");
			         Boolean ISNULL = rowSet.getValue(i, "ISNULL").toString().equalsIgnoreCase("0") ? false : true;
			         String check = "";
			         if (!ISNULL) {
			             check = "required";
			         }
			         String contextPath = request.getContextPath();
			         String DATA = rowSet.getValue(i, "DATA");
			         String dateurl = contextPath + DATA;
				     if (type.equals("1") || type.equals("1")) {
				     	if (map.containsKey(attributename)) {
		                      String value = map.get(attributename).toString();
				 %>	
					 <r:panelItem>
	                      <r:textField id="<%=attributename %>" name="<%=attributename %>" check="<%=check %>" title="<%=fieldname %>"
	                                   width="4"></r:textField>
	                 </r:panelItem>                  
	                 <script type="text/javascript">
	                     $(function () {
	                         $("#" + "<%=attributename %>").val("<%=value %>");
	                     });
	                 </script>
                          <%
				     	}
					 } else if (type.equals("2") || type.equals("2")) {
					   	if (map.containsKey(attributename)) {
		                    String value = map.get(attributename).toString();
				 %>
					 <r:panelItem>
	                     <r:numberField id="<%=attributename %>" name="<%=attributename %>" moneyFormat="true"
	                                    width="4" check="<%=check %>" title="<%=fieldname%>"></r:numberField>
	                 </r:panelItem>                    
	                 <script type="text/javascript">
	                     $(function () {
	                         $("#" + "<%=attributename %>").val("<%=value %>");
	                     });
	                 </script>
                         <%
					   	}
					 } else if (type.equals("3")) {
					 	if (map.containsKey(attributename)) {
			                  String value = map.get(attributename).toString();
				 %>
					 <r:panelItem>
	                     <r:calendar id="<%=attributename %>" width="4" name="<%=attributename %>" title="<%=fieldname %>" showOpts="yyyy-MM-dd"></r:calendar>
	                 </r:panelItem>      
	                 <script type="text/javascript">
	                     $(function () {
	                         $("#" + "<%=attributename %>").val("<%=value %>");
	                     });
	                 </script>
                         <%
				 		}
					} else if (type.equals("6")) {
						if (map.containsKey(attributename)) {
			                  String value = map.get(attributename).toString();
			                  if (value.isEmpty()) {
			                      value = "false";
			                  }
						      String hidden = attributename + "hi";
						      String select = attributename + "select";
					 %>
				 		<r:panelItem>
					    	<r:checkbox title="<%=fieldname%>" id="<%=attributename %>" name="<%=attributename %>" />
					    </r:panelItem> 	
                        <script type="text/javascript">
                                $(function () {
                                    $("#" + "<%=attributename %>").attr("checked", "<%=value %>" == "1" ? true : false);
                                });
                        </script>
                                  <%
                            }
                        } else if (type.equals("4") || type.equals("5")) {
                        	String multiSelect = type.equals("4") ? "false" : "true";
                        	String showText = type.equals("4") ? "false" : "true";
                        	String valueField = "urid";
                            String displayField = "name";
                            String value = "";
                            if (map.containsKey(attributename) && DATA != null && !"".equals(DATA)) {
                                value = map.get(attributename).toString();
                                String uc = DATA.substring(DATA.indexOf("?uc=") + 4);
                                if (uc.indexOf("&") != -1) {
                                    uc = uc.substring(0, uc.indexOf("&"));
                                }
                                if (DATA.indexOf("wedget") != -1) {
                                  %>
                               <r:panelItem>   
                                  <jsp:include page="<%=DATA %>">
                                      <jsp:param name="id" value="<%=attributename %>"/>
                                      <jsp:param name="SelFn" value=""/>
                                      <jsp:param name="check" value="<%=check %>"/>
                                      <jsp:param name="width" value="4"/>
                                      <jsp:param name="title" value="<%=fieldname %>"/>
                                      <jsp:param name="multiSelect" value="<%=multiSelect %>"/>
                                      <jsp:param name="showText" value="<%=showText %>"/>
                                  </jsp:include>
                               </r:panelItem> 	   
                               <script type="text/javascript">
                                   $(function () {
                                       $("#" + "<%=attributename %>").val("<%=value %>");
                                       $("#" + "<%=attributename %>").RComboGrid('setValue');
                                   });
                               </script>
                                  <%
                               } else {
                                  %>
                                  <r:panelItem> 
                                  	<r:comboGrid title="<%=fieldname%>"
                                               valueField="urid" displayField="name" forceLoad="true"
                                               id="<%=attributename %>" name="<%=attributename %>" check="<%=check %>"
                                               multiSelect="<%=multiSelect %>"
                                               colModel="[{title:'代码',field:'code',width:100},
												{title:'名称',field:'name',width:100}]"
                                               dataUrl="<%=dateurl %>" width="4"/>
                                  </r:panelItem> 	             
                                  <script type="text/javascript">
                                      $(function () {
                                          $("#" + "<%=attributename %>").val("<%=value %>");
                                          $("#" + "<%=attributename %>").RComboGrid('setValue');
                                      });
                                  </script>
                                  <%
                                    }
                                }
                            } else if (type.equals("8") || type.equals("9")) {
                                String multiSelect = type.equals("8") ? "false" : "true";

                                if (map.containsKey(attributename)) {
                                    String value = map.get(attributename).toString();
                                  %>
                                  <r:panelItem> 
                                        <r:combo check="<%=check%>" id="<%=attributename%>" name="<%=attributename%>" title="<%=fieldname%>" autoload="true" width="4"
											         valueField="value" displayField="text" multiSelect="<%=multiSelect %>"
											         displayFormat="{displayField}"  dataUrl="<%=dateurl %>"/>
								  </r:panelItem>			         
                                  <script type="text/javascript">
                                      $(function () {
                                          $("#" + "<%=attributename %>").attr('value',"<%=value %>");
                                          $("#" + "<%=attributename %>").RCombo('setValue');
                                      });
                                  </script>
                                  <%
                                   }
                               }
                             }
                         }
                                  %>
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
                             colModel="[{title:'日历名字',field:'name',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_SET_CALENDARS_SEARCH&isactive=1"
                             title="日历" check="required"/>
            </r:panelItem> 
	        <r:panelItem>
                 <r:combo id="holidayrunmode" name="holidayrunmode" valueField="value" displayField="text"
                          title="节假日状态" defaultValue="1" staticData="[{'text':'节假日不运行','value':'2'},{'text':'节假日运行','value':'1'}]"/>
            </r:panelItem> 
	        <r:panelItem>                  
                <r:combo id="category" name="category" valueField="value" displayField="text" afterSelect="categoryFn"
                         title="日期配置模式" defaultValue="1" staticData="[{'text':'日模式','value':'1'},{'text':'月模式','value':'2'}]"/>
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
                <r:numberField id="intervalTime" name="intervalTime" title="运行间隔(分)" moneyFormat='int' />
            </r:panelItem> 
	        <r:panelItem>     
                <r:button id="gentimepoint"  text="生成时间点" iclass="fa-plus" onClick="genTimePoint"/>
            </r:panelItem> 
	        <r:panelItem>     
                 <r:textArea id="runtimepointlist" name="runtimepointlist" title="时间点信息" check="maxlength:256" width="3"/>
            </r:panelItem> 
	        <r:panelItem>      
                 <r:textArea id="description" name="description" title="描述" check="maxlength:256" width="3"/>
            </r:panelItem>  
         </r:tinyPanel>
     </form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">

    $(function(){
    	$('#startdatetime').RCalendar('afterSelect',startdatetimeFn);
        $('#enddatetime').RCalendar('afterSelect',enddatetimeFn);
        $('#dayDetail').val('1');
        if(<%= modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_SYSTEMTASK_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#scheduleform").RForm({value:text});
                    if (text.rows[0]["categoryvalue"] == '1')//日模式
                    {
                        hiddenMonth();
                        //hiddenWeek();
                        displayDay();
                    } else if (text.rows[0]["categoryvalue"]== '2')//月模式
                    {
                        hiddenDay();
                        //hiddenWeek();
                        displayMonth();
                    }
                    /* else if (entity["category"] == '3')//周模式
                     {
                     hiddenDay();
                     hiddenMonth();
                     displayWeek();
                     } */
                    $("#isactive").attr("checked", text.rows[0]["taskisactive"] == "1" ? true : false);
                    $("#holidayrunmode").attr("value",text.rows[0]["holidayrunmode"]);
                    $("#holidayrunmode").RCombo("setValue");
                    startdatetimeFn();
                    enddatetimeFn();
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    })

    var saveFn = function(){
        var fieldSet = '';
        var dataform1 = '';
        var _category = $("#category").val();
        //判断开始日期是否大于结束日期
        var startdatetime = new Date($("#startdatetime").val().replace(/\-/g, "\/"));  
        var enddatetime = new Date($("#enddatetime").val().replace(/\-/g, "\/")); 
        if(startdatetime > enddatetime){
        	$.RMessage.alert("消息", "计划信息内，开始日期大于结束日期！");
        	return;
        }
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
                Ajax.req({
                    url: '<%= dataUrl%>',
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
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
        //startTime  FComboGrid
        //endTime    FComboGrid
        //intervalTime numberField
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
		return strRunTimePointList.substring(0, strRunTimePointList.length - 1);
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