<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%

    SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenantid = String.valueOf(currUser.getTenantId());
    String userid = currUser.getUserId();
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>云平台</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/bizframe/css/register.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jqGrid/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/adapter.js"></script>
</head>
<body>
<div class="edit_password">
    <p><i class="fa fa-close"></i></p>
    <form onsubmit="return false" id = "modifyPwd">
        <p style="font-size:12px;text-align:center;color:red">密码长度必须大于8位,必须包含数字，小写，大写，特殊字符中的三种 </p>
        <div class="input-group">
            <span class="input-group-addon">当前用户</span>
            <input type="text" class="form-control" id = "userid" name = "userid" value="<%=userid%>" readonly>
        </div>
        <div class="input-group">
            <span class="input-group-addon">当前密码</span>
            <input type="password" class="form-control" id = "password" name = "oldPwd" placeholder="请输入当前密码">
        </div>
        <div class="input-group">
            <span class="input-group-addon">新密码&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input type="password" class="form-control" id = "newPwd" name = "newPwd" placeholder="请输入新密码" onblur = "checkComplex()">
        </div>
        <div class="input-group">
            <span class="input-group-addon">确认密码</span>
            <input type="password" class="form-control" id = "newPwdre" name = "newPwdre" placeholder="请输入确认密码" onblur = "checkpwd()">
        </div>
        <p id="message" style="font-size:12px;text-align:center;color:red"></p>
        <div class="input-group">
            <button class="btn btn-info btn-block" id ="savePwd" onclick = "modifyPwd()">确认</button>
        </div>
    </form>
</div>
</body>

</html>

<script type="text/javascript">

    function checkComplex(){
        var pwd = $("#newPwd").val();
        if(pwd.length < 8){
            document.getElementById("message").innerHTML = "密码长度必须大于8位";
            $("#savePwd").attr("disabled", true);
            return;
        } else{
            document.getElementById("message").innerHTML = "";
            $("#savePwd").attr("disabled", false);
        }

        var modes = 0;
        //正则表达式验证符合要求的
        if (/\d/.test(pwd)){
            modes++; //数字
        }
        if (/[a-z]/.test(pwd)){
            modes++; //小写
        }
        if (/[A-Z]/.test(pwd)){
            modes++; //大写
        }
        if (/\W/.test(pwd)){
            modes++; //特殊字符
        }
        if(modes < 3){ //密码复杂等级必须大于等于3
            document.getElementById("message").innerHTML = "必须包含数字，小写，大写，特殊字符中的三种";
            $("#save").attr("disabled", true);
        } else{
            document.getElementById("message").innerHTML = "";
            $("#save").attr("disabled", false);
        }
    }

    function checkpwd(){
        var newPwd = $("#newPwd").val();
        var rptPwd = $("#newPwdre").val();
        if(newPwd != rptPwd){
            document.getElementById("message").innerHTML = "两次输入的密码不一致";
            $("#savePwd").attr("disabled", true);
            return true;
        } else{
            document.getElementById("message").innerHTML = "";
            $("#savePwd").attr("disabled", false);
            return false;
        }
    }

    function modifyPwd() {
        var flag = checkpwd();
        if(flag){
            return false;
        }else{
            $("#savePwd").attr("disabled", false);
            var params = $("#modifyPwd").AllSerialize();
            Ajax.req({
                url : "${pageContext.request.contextPath}/usermanage/user/modifyPwd.do",
                params : params,
                ok : function(text) {
                    $.RMessage.alert("消息", text.msg, parent.closeWinMp);
                },
                err : function(text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    }

</script>