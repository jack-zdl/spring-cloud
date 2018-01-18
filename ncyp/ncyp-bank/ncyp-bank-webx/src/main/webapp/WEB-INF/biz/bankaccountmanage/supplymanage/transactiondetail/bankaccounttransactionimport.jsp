<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    int tenantid = currUser.getTenant_id();
    String orgid = currUser.getOrg_id();
    String condition = "&userid="+userid+"&tenantid="+tenantid+"&orgid="+orgid;
    String url = request.getContextPath() + "/uploadtomemory?withouttranslate=true&type=banktransaction" + condition;
%>
<jsp:include page="/common/formhead.jsp" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/RUI/plugins/uploadify/uploadify.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/RUI/bootstrap/assets/css/uploadfile.css" />
	    <style>
	        .uploadBox{
	            width: 100%;
	            border: 1px solid #CCCCCC;
	        }
	        .uploadBox .title{
	            background-color: #F7F7F7;
	            color: #7B9FD0;
	            font-size: 15px;
	            padding: 3px 5px;
	            border-bottom: 1px solid #CCCCCC;
	        }
	        .upload_Btn{
	            background-color: #F7F7F7;
	            border-top: 1px solid #CCCCCC;
	            padding: 3px 5px;
	        }
	        .uploaded table{
	            width: 100%;
	            text-align: center;
	        }
	        .uploaded table tr td{
	            border-right:1px solid #CCCCCC;
	            padding: 3px 0;
	        }
	        .uploaded table tr td:last-of-type,.uploaded table th:last-of-type{
	            border:none;
	        }
	        .uploaded table tr{
	            border-bottom: 1px solid #CCCCCC;
	
	        }
	        .uploaded table th{
	            border-right:1px solid #CCCCCC;
	            /*width: 20%;*/
	            font-weight: normal;
	            text-align: center;
	            padding: 3px;
	        }
	        .uploaded table th:nth-of-type(1){
	            /*width: 40%;*/
	        }
	        .remove_file{
	            color: red;
	            cursor: pointer;
	        }
	    </style>
	    <form role="form" id="bankaccounttransactionimport">
	    	<r:tinyPanel title="附件信息" hasHeader="false" column="1">
	            <r:panelItem>
	               <r:uploadfile id="file_upload" width="750" dataUrl="" addUrl="<%=url%>" fileTypeExts="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"FileSuffix\")%>" fileSizeLimit="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"AttachmentSize\")%>" 
				  	uploadSuccess="uploadSuccess" uploadError="uploadError" queueSizeLimit="20"/>
	            </r:panelItem> 
	        </r:tinyPanel>
	    </form>	
<jsp:include page="/common/formbottom.jsp" />	
<script src="${pageContext.request.contextPath}/RUI/plugins/uploadify/jquery.uploadify.min.js"></script>
<script type="text/javascript">

	var saveFn = function(){
		var url = "<%=url %>";
	    $('#file_upload').RUploadfile('changeUrl',url);
		$('#file_upload').RUploadfile('upload');//上传文件触发函数
	}
	//附件上传之后，关闭页面
	var uploadSuccess = function(){
		$.RMessage.alert("消息", "附件上传成功", parent.closeWinFn);
	}
	
		//附件上传失败，弹出提示信息
	var uploadError = function(text){
		$.RMessage.alert("消息", "附件上传失败！" + text);
	}

</script>