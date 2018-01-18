<%@page import="java.util.Date"%>
<%@page import="com.ceying.chx.common.util.stringtools.FString"%>
<%@page import="com.ceying.chx.biz.utils.task.CommonUtil"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>
<%@page import="com.ceying.chx.common.utils.task.JresUtil"%>

<%@page import="com.ceying.chx.biz.constants.ATSSystemParamCodeEnum"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    //是否启用附件上传
	  boolean isfileupload = true;
	  String fileupload = "true";//SystemParamUtil.getSystemParam(ATSSystemParamCodeEnum.FILEUPLOAD.getValue());
	  if(fileupload!=null&&fileupload!=""){
	     isfileupload = Boolean.parseBoolean(fileupload);
	  }	 
		String basePath = request.getContextPath();
		String id = request.getParameter("urid");
		String catalog = request.getParameter("catalog");
		
%>
<script type="text/javascript" src="<%=basePath%>/ui/swfupload/js/swfupload.js"></script>
<script type="text/javascript" src="<%=basePath%>/ui/swfupload/js/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=basePath%>/ui/swfupload/js/handlers.js"></script>
<script type="text/javascript">
var swfu;
var accessoryIds;
var arr = new Array();


$(function() {
	 console.log("aaqqqqa");
  var settings = {
    flash_url: "http://localhost:8082/web/ui/swfupload/js/swfupload.swf",
    upload_url: "http://localhost:8082/web/upload?actiontype=PREADD&workflowadd=1",
    file_size_limit: '<%=CommonQueryController.getSysparameterByPK("FUNDCRM", "System", "AttachmentSize")%> MB',
    file_types: '<%=CommonQueryController.getSysparameterByPK("FUNDCRM", "System", "FileSuffix")%>',
    file_types_description: "请您选择文件",
    file_upload_limit: 0,
    file_queue_limit: 0,
    custom_settings: {
      after: addApproveData
    },
    debug: false,

    button_image_url: "/web/ui/swfupload/images/upload_custom_approve.png",
    button_placeholder_id: "spanButtonPlaceholder",
    button_width: 113,
    button_height: 22,
    button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,

    swfupload_preload_handler: preLoad,
    swfupload_load_failed_handler: loadFailed,
    swfupload_loaded_handler: swfUploadLoaded,

    file_dialog_start_handler: fileDialogStart,
    file_dialog_complete_handler: fileDialogComplete, //文件选择窗口关闭时触发的事件.
    file_queued_handler: fileQueued, //文件成功选择后触发的事件.
    file_queue_error_handler: fileQueueError, //文件选择失败后触发事件（类型不对、大小不对等等）.
    upload_start_handler: uploadStart, //开始上传文件前触发的事件.
    upload_progress_handler: uploadProgress, //文件上传过程中触发的事件（处理上传进度）.
    upload_error_handler: uploadError, //文件传输过程中出错触发的事件.
    upload_success_handler: uploadSuccess, //文件上传成功后触发的事件.
    upload_complete_handler: uploadComplete, //文件上传完成后触发的事件.
    queue_complete_handler: queueComplete
  };
console.log(settings);
  swfu = new SWFUpload(settings);
  
});

var taskidonly="";
var approvetypeonly="";
var upload = function(taskid,approvetype) {  
   taskidonly = taskid;
   approvetypeonly = approvetype;
   uploadDo(); 
};

var uploadDo = function() {
   var length = 0;
<%if(isfileupload) {%>
	//length = swfu.getStats().files_queued;
<%}%>

  if (length == 0) {   
    return;
  }
  swfu.addPostParam("securitylevel", '0');
  swfu.addPostParam("type", '');
  swfu.addPostParam("memo", '');
  swfu.startUpload();
};

var addApproveData = function(data) {
  var ret = eval("(" + data + ')');
  console.log("data="+data);
  arr.push(ret._storageid);
  
  accessoryIds = arr.join(",");
  var taskid = taskidonly;
  var approvetype = approvetypeonly;
  saveFileDo(accessoryIds,taskid,approvetype)
};

function saveFileDo(accessoryids,taskid,approvetype) {
	if(accessoryids!=null&&accessoryids!=""){
  Ajax.req({
    url:'http://localhost:8082/web/upload?actiontype=EDIT',// '/common/query.do',
    type: "json",
    params: {
      accessoryids: accessoryids,
      taskid: taskid,
      approvetype: approvetype,
      uc: "UC_ATS_FILEUPLOAD"
    },
    ok: function(text) {
    	$('body').removeMask();
    	$.RMessage.alert("消息", "chenggong" );
    	
    },
    err: function(text) {
      $.RMessage.alert("消息", "操作失败！！" + text);
    }
  });
 }
}

var setUploadDisplay = function () {
	<%if(isfileupload) {%>
	//$("#fileuploadbutton").css("display","none");
	<%}else{%>
	//$("#fileuploadbuttonccic").css("display","none");	 
	<%}%>
};


</script>
<span id="fileuploadbuttonccic"> 
	<r:button id="uploadbutton" onClick="uploadFn" text="上传修改附件" iconCls="upload_attach_icon" />	
</span>
 
<span id="fileuploadbutton"> 
		<span id="spanButtonPlaceholder" ></span>
</span>




<%--ccic影像系统begin--%>
<script type="text/javascript">
var busi_num= "WF"+workflow.taskId;	
var uploadFn = function(){
	busi_num= "WF"+workflow.taskId;	
	if(busi_num==null||busi_num==""||busi_num=="null"||busi_num=="0"){
	     $.FMessage.alert("消息", "业务编号不能为空！");	
	     return;	
	}
  var htmlsrc = "<%=request.getContextPath()%>/tiles/widget/uploadccic.jsp?busi_num="+busi_num;
  window.open(htmlsrc,'_blank'); 
};

$(function(){
	<%if(true) {%>
		//$("#uploadbutton").RButton('setInvisible', false);
	  $("#fileuploadbuttonccic").css("display","none");
	  console.log("aaa");
	<%}else{%>
	//	$("#uploadbutton").RButton('setInvisible', false);
		$("#fileuploadbutton").css("display","none");		
	<%}%>
});

	</script>
<%--ccic影像系统end--%>

