<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.util.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
	String dataUrl = null;
	if(modFlag){
	    dataUrl = request.getContextPath() + "/warning/warningobject/edit.do";
	} else{
	    dataUrl = request.getContextPath() + "/warning/warningobject/add.do";
	}
	SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenantid=currUser.getTenantId().toString();
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="warningobjectadd">
	<input type="hidden" id="urid" name="urid" value=""/>
	<r:tinyPanel title="基本信息" hasHeader="false">
		<r:panelItem>
			<r:textField id="code" name="code" title="代码" check="required"/>
		</r:panelItem>
     	<r:panelItem>
     		<r:textField id="name" name="name" title="名称" check="required"/>
     	</r:panelItem>
     	<r:panelItem>
     		<jsp:include page="/common/wedget/ucsearch/noteobject.jsp">
	            <jsp:param name="id" value="noteobjectid"/>
	            <jsp:param name="title" value="单据对象"/>
	            <jsp:param name="check" value="required"/>
            </jsp:include>
     	</r:panelItem>
     	<r:panelItem>
			<%if(tenantid.equals(CommonConstants.SUPERTENANT)){ %>
				<jsp:include page="/common/wedget/ucsearch/tenant.jsp">
					<jsp:param name="id" value="tenantid"/>
					<jsp:param name="check" value="required"/>
					<jsp:param name="title" value="企业"/>
				</jsp:include>
			<%}else{ %>
				<input id="tenantid" type="hidden" name="tenantid" value="<%=tenantid %>"/>
			<%} %>
        </r:panelItem>
     	<r:panelItem>
     		<jsp:include page="/common/wedget/dictionary/triggermode.jsp">
	            <jsp:param name="id" value="triggermode"/>
	            <jsp:param name="title" value="触发方式"/>
	            <jsp:param name="check" value="required"/>
            </jsp:include>
     	</r:panelItem>
     	<r:panelItem>
     		<r:checkbox title="是否有效" id="isactive" name="isactive"/>
      	</r:panelItem>
     	<r:panelItem>
     		<r:checkbox title="内置" id="isbuiltin" name="isbuiltin"/>
     	</r:panelItem>
     	<r:panelItem>
     		<r:textField id="uniquefield" name="uniquefield" title="数据唯一标识字段"/>
     	</r:panelItem>
     	<r:panelItem>
     		<r:textArea  id="sqlstatement" name="sqlstatement" title="查询SQL" check="required"/>
     	</r:panelItem>
     	<r:panelItem>
     		<r:textArea  id="description" name="description" title="描述" height="3"/>
     	</r:panelItem>
     </r:tinyPanel>
     
     <r:tinyPanel title="预警条件"> 
     	<jsp:include page="/base/warning/warningobject/warningconditionattr.jsp">
			<jsp:param name="warningobjid" value="<%=urid %>"/>
		</jsp:include>
     </r:tinyPanel>
     
     <r:tinyPanel title="消息模板"> 
     	<jsp:include page="/base/warning/warningobject/msgtemplateattr.jsp">
			<jsp:param name="warningobjid" value="<%=urid %>"/>
		</jsp:include>
     </r:tinyPanel>
     
     <r:tinyPanel title="通知方式"> 
     	<jsp:include page="/base/warning/warningobject/noticemodeattr.jsp">
			<jsp:param name="warningobjid" value="<%=urid %>"/>
		</jsp:include>
     </r:tinyPanel>

</form>
	
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">

    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_WARNINGOBJECT_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#warningobjectadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    
    var saveFn = function(){
    	$("#warningobjectadd").RValidate({
			'success': save
  		});
		$("#warningobjectadd").RValidate('validate');
    }
    
    var save = function(){
	    var params = $("#warningobjectadd").serialize();
	    params = params.replace(/\+/g," ");
		var jsonParams = toJson(params);
	    
	    jsonParams.isactive = $("#isactive").is(":checked") ? "1" : "0";
	    jsonParams.isbuiltin = $("#isbuiltin").is(":checked") ? "1" : "0";
	    //获取新增的预警条件、消息模板、通知方式
	    var warningConditionAddDatas = $('#warningConditionTab').EditableGrid('getAddValue');
	    var msgTemplateAddDatas = $('#msgTemplateTab').EditableGrid('getAddValue');
	    var noticeModeAddDatas = $('#noticeModeTab').EditableGrid('getAddValue');
	    
	    jsonParams.warningConditionAddDatas = JSON.stringify(warningConditionAddDatas);
	    jsonParams.msgTemplateAddDatas = JSON.stringify(msgTemplateAddDatas);
	    jsonParams.noticeModeAddDatas = JSON.stringify(noticeModeAddDatas);
	    if(<%=modFlag%>){
	    	//获取修改的预警条件、消息模板、通知方式
	    	var warningConditionEditDatas = $('#warningConditionTab').EditableGrid('getEditValue');
		    var msgTemplateEditDatas = $('#msgTemplateTab').EditableGrid('getEditValue');
		    var noticeModeEditDatas = $('#noticeModeTab').EditableGrid('getEditValue');
	    	jsonParams.warningConditionEditDatas = JSON.stringify(warningConditionEditDatas);
	    	jsonParams.msgTemplateEditDatas = JSON.stringify(msgTemplateEditDatas);
	    	jsonParams.noticeModeEditDatas = JSON.stringify(noticeModeEditDatas);
	    	//获取删除的预警条件、消息模板、通知方式
	    	var warningConditionDelIds = $('#warningConditionTab').EditableGrid('getDelArray');
	    	var msgTemplateDelIds = $('#msgTemplateTab').EditableGrid('getDelArray');
		    var noticeModeDelIds = $('#noticeModeTab').EditableGrid('getDelArray');
	    	jsonParams.warningConditionDelIds = warningConditionDelIds.join(",");
	    	jsonParams.msgTemplateDelIds = msgTemplateDelIds.join(",");
	    	jsonParams.noticeModeDelIds = noticeModeDelIds.join(",");
	    }
	    Ajax.req({
	        url: "<%=dataUrl%>",
	        params: jsonParams,
	        ok: function(text) {
	            $.RMessage.alert("消息", text.msg, parent.closeWinFn);
	        },
	        err: function(text){
	            $.RMessage.alert("消息", text.msg);
	        }
	    })
    }
	function toJson(str){
    	var mJson = {};
     	var arr = str.split('&');
  		for(var i=0;i<arr.length;i++){
       		var arr2 = arr[i].split('=');
         	if(arr2.length > 2){	//包含多个等号
          		for(var j=2; j<arr2.length; j++){
                	arr2[1] = arr2[1] + "=" + arr2[j];
                	}
                }
			mJson[arr2[0]] = decodeURIComponent(arr2[1]);
    	}
		return mJson;
	}
</script>