<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
	String dataUrl =null;
	if(modFlag){
    	dataUrl = request.getContextPath() + "/generalset/calendarspecial/edit.do";		
	}else{
   	 	dataUrl = request.getContextPath() + "/generalset/calendarspecial/add.do";
	}
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="calendarspecialadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel title="基本信息" hasHeader="false">
        	<r:panelItem>
        		<jsp:include page="/common/wedget/ucsearch/calendar.jsp">
	                <jsp:param name="id" value="calendarid"/>
	                <jsp:param name="title" value="日历"/>
	                <jsp:param name="width" value="6"/>
	                <jsp:param name="check" value="required"/>
	            </jsp:include>						
	        </r:panelItem>
	        <r:panelItem>
	        	<r:calendar id="specialdate" width="6" name="specialdate" title="特殊日期" showOpts="yyyy-MM-dd" />
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textField id="name" name="name" title="日期名称" check="required" width="6"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<jsp:include page="/common/wedget/dictionary/datetype.jsp">
	                <jsp:param name="id" value="specialcalendartype"/>
	                <jsp:param name="title" value="日期类型"/>
	                <jsp:param name="width" value="6"/>
	                <jsp:param name="check" value="required"/>
	            </jsp:include>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:textArea  id="description" name="description" title="描述"/>
	        </r:panelItem> 
        </r:tinyPanel>
    </form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_SET_CALENDARSPECIAL_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
					$("#calendarspecialadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#calendarspecialadd").RValidate({
            'success': function(){
                //var action = $("#calendarspecialadd").attr("action");
                var params = $("#calendarspecialadd").AllSerialize();
                //params = decodeURIComponent(params);
                Ajax.req({
                    url: '<%=dataUrl%>',
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
        $("#calendarspecialadd").RValidate("validate");
    }
</script>