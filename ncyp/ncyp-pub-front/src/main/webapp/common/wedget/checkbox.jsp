<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String width = "col-sm-" + (FString.isNullOrEmpty(request.getParameter("width")) ? "6" : request.getParameter("width"));
    String checked = FString.isNullOrEmpty(request.getParameter("ischecked")) ? "false" : request.getParameter("ischecked");
%>
<div class="<%=width%>">
    <div style="padding:10px 0;">
        <label class="col-sm-4 control-label no-padding-right">${param.title}:</label>
        <div class="checkbox col-sm-7">
            <label class="col-sm-4">
                <input id="${param.id}" name="${param.id}" type="checkbox" class="ace"/>
                <span class="lbl"></span>
            </label>
        </div>
    </div>
</div>
<script>
    if("<%=checked%>" == "true"){
        $("#" + "${param.id}").prop("checked", true);
    }

    function getCheckValueByID(id, params){
        if($("#" + id).is(":checked")){
            if(params.indexOf(id + "=%E2%88%9A") != -1){
                params = params.replace(new RegExp(id + "=%E2%88%9A"), id + "=1");    //√号
            }else if(params.indexOf(id + "=%C3%97") != -1){
                params = params.replace(new RegExp(id + "=%C3%97"), id + "=1");       //×号
            }else if(params.indexOf(id + "=on") != -1){
                params = params.replace(new RegExp(id + "=on"), id + "=1");
            }else{
                $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0007")%>");
            }
        }
        else{
            if(params.indexOf(id + "=%E2%88%9A") != -1){
                params = params.replace(new RegExp(id + "=%E2%88%9A"), id + "=0");    //√号
            }else if(params.indexOf(id + "=%C3%97") != -1){
                params = params.replace(new RegExp(id + "=%C3%97"), id + "=0");       //×号
            }else if(params.indexOf(id + "=on") != -1){
                params = params.replace(new RegExp(id + "=on"), id + "=0");
            }else{
                params += "&" + id + "=" + "0";
            }
        }
        return params;
    }
</script>