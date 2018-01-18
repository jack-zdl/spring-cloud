<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString"%>
<%@page	import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid")==null?"":request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
	String dataUrl = request.getContextPath() + "/generalset/notice/add.do";
	if(modFlag){
		dataUrl = request.getContextPath() + "/generalset/notice/edit.do";
	}
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
    String deleteUrl = request.getContextPath() + "/upload?actiontype=DEL&userid=" + userid +"&ids=";
    String addUrl = request.getContextPath() + "/upload?actiontype=PREADD&userid=" + userid;
%>
<jsp:include page="/common/formhead.jsp" />
    <form role="form" id="noticeadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
        <r:tinyPanel title="基本信息" hasHeader="false" column="1.2">
        	<r:panelItem>
        		<r:textField  id="name" name="name" title="标题" check="required"/>
	        </r:panelItem> 
        </r:tinyPanel>
        <r:tinyPanel title="基本信息" hasHeader="false" column="1.2">
        	<r:panelItem>
        		<jsp:include page="/common/editor.jsp" >
					  <jsp:param name="id"  value="container" />
					  <jsp:param name="title"  value="内容" />
				</jsp:include>
	        </r:panelItem> 
        </r:tinyPanel>
        <r:tinyPanel title="基本信息" hasHeader="false" column="1.2">         
            <r:panelItem>
               <jsp:include page="/common/fileupload.jsp" >
                    <jsp:param name="id"  value="file_upload" />
                    <jsp:param name="subkeyid"  value="<%=urid %>" />
                    <jsp:param name="userid"  value="<%=userid %>" />
                    <jsp:param name="uploadSuccess"  value="uploadSuccess" />
                    <jsp:param name="uploadError"  value="uploadError" />
                    <jsp:param name="width"  value="8" />
                </jsp:include>
            </r:panelItem> 
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
                    uc: "UC_BASE_SET_NOTICES_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	$("#noticeadd").RForm({value:text});
                    $('#container').REditor('setValue',text.rows[0]["noticecontent"]);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        };
    })

    var saveFn = function(){
    	if(!<%=modFlag%>){
	    	Ajax.req({
	            url: "${pageContext.request.contextPath}/common/getUUID.do",
	            type: "json",
	            method: "post",
	            async: false,
	            ok: function(text){
	                if(text == '{"data":[]}'){
	                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
	                    return;
	                }
	                var entity = text.rows[0];
	                $("#urid").val(entity["urid"]);
	                upload(entity["urid"]);
	            },
	            err: function(text){
	                $.RMessage.alert("消息", text);
	            }
	        });
    	}else{
    		 upload("<%=urid%>");
    	}
    }
    //附件上传之后，保存表单
    var uploadSuccess = function(){
    	//当表单保存失败之后，需要删除相关的附件
    	var addFileName =  $('#file_upload').RUploadfile('getAddFileName').join(",");//获得已经上传的附件文件名
    	//当表单保存成功之后，删除选中的附件
    	var delDataKeys =  $('#file_upload').RUploadfile('getDelData').join(",");//获得删除文件的主键数组
        $("#noticeadd").RValidate({
            'success': function(){
            	var paramJson = {};
                paramJson.name = $("#name").val();
                paramJson.tenantid = $("#tenantid").val();
                paramJson.str = $('#container').REditor('getValue');
                paramJson.urid = $("#urid").val();
                paramJson.addFileName = addFileName;
                paramJson.delDataKeys = delDataKeys;
                Ajax.req({
                    url: '<%= dataUrl%>',
                    params: paramJson,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#noticeadd").RValidate("validate");
    }
    //附件上传失败，弹出提示信息
    var uploadError = function(){
    	$.RMessage.alert("消息", "附件上传失败！");
    }
  //附件上传
    var upload = function(urid){
    	//获取选择上传文件的数量，0：没有需要上传的文件；其他：存在需要上传的文件
    	var fileNum = $('#file_upload').RUploadfile('getAddFileNum');
    	if(fileNum == 0 ){
    		uploadSuccess();
    	}else{
    		var addUrl = "<%=addUrl %>";
    	    var url = addUrl +　"&catalog=t_notice&subkeyid=" + urid;
    	    $('#file_upload').RUploadfile('changeUrl',url);
    		$('#file_upload').RUploadfile('upload');//上传文件触发函数
    	}
    }
</script>