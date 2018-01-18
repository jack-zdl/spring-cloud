<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.utils.stringtools.FString"%>
<%
	String subkeyid = request.getParameter("subkeyid");
	String userid = request.getParameter("userid")==null? null : request.getParameter("userid");
	String addUrl = request.getContextPath() + "/upload?actiontype=PREADD&userid=" + userid;
	String dataUrl = "";
	if(FString.isNotNullAndNotEmpty(subkeyid)){
		dataUrl = request.getContextPath() + "/common/query.do?uc=UC_BASE_SET_SYSTEMMGT_SEARCHBLOBSTORAGE&subkeyid=" + subkeyid;
	}
%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/plugins/uploadify/uploadify.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/bootstrap/assets/css/uploadfile.css" />
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
 <script src="${pageContext.request.contextPath}/CYUI/plugins/uploadify/jquery.uploadify.min.js"></script>

<r:uploadfile id="${param.id}" width="${param.width}" dataUrl="<%=dataUrl%>" addUrl="<%=addUrl%>" fileTypeExts="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"FileSuffix\")%>" fileSizeLimit="<%=CommonQueryController.getSysparameterByPK(\"FUNDCRM\", \"System\", \"AttachmentSize\")%>" 
			  uploadSuccess="${param.uploadSuccess}" uploadError="${param.uploadError}" queueSizeLimit="5" disabled="${param.disabled}"/>


