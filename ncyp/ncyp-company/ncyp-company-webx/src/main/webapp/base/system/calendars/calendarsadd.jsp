<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
	String dataUrl = null;
	if(modFlag){
		dataUrl = request.getContextPath() + "/generalset/calendar/edit.do";
	}else{
		dataUrl = request.getContextPath() + "/generalset/calendar/add.do";
	}
%>

<jsp:include page="/common/formhead.jsp"/>
    <form  role="form" id="calendarsadd" >
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel title="基本信息" hasHeader="false">
        	<r:panelItem>
        		<r:textField id="name" name="name" title="名称" check="required"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
	        </r:panelItem>
            <r:panelItem>
                <r:calendar  id="year" name="year" title="年份" check="required" showOpts="yyyy"></r:calendar>
            </r:panelItem>
            <r:panelItem>
        		<r:checkbox title="星期一" id="monday" name="monday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期二" id="tuesday" name="tuesday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期三" id="wednesday" name="wednesday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期四" id="thursday" name="thursday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期五" id="friday" name="friday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期六" id="saturday" name="saturday"/>
	        </r:panelItem>
	        <r:panelItem>
	        	<r:checkbox title="星期日" id="sunday" name="sunday"/>
	        </r:panelItem>
	      	<r:panelItem>
       			<r:textArea id="description" name="description" title="描述"/>
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
                    uc: "UC_BASE_SET_CALENDARS_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#calendarsadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#calendarsadd").RValidate({
            'success': function(){
                var action = $("#calendarsadd").attr("action");
                var params = $("#calendarsadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: '<%=dataUrl%>',
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_SET_CALENDARS_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#calendarsadd").RValidate("validate");
    }
</script>