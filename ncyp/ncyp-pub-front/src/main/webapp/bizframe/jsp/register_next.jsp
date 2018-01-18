<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String type = request.getParameter("type");
    String mobile = request.getParameter("mobile");
    String invitecode = request.getParameter("invitecode") == null ? "" : request.getParameter("invitecode");
    String tenantcode = request.getParameter("tenantcode") == null ? "" : request.getParameter("tenantcode");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>策赢平台</title>
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/bizframe/css/register.css" />
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/register.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/adapter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/register_next.js"></script>

</head>
<body>
<nav class="navbar navbar-white" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/bizframe/jsp/index.jsp">策赢平台</a>
        </div>
        <form class="navbar-form navbar-right">
            <button type="button" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/bizframe/jsp/login.jsp'">登录</button>
        </form>
    </div>
</nav>
<div class="body_wrap">
     <h2>注册策赢平台账号</h2>
    <p class="ad_des">随时随地,轻松报销</p>
    <div class="user_info">
        <form role="form" id="register">
            <input type="hidden" id="type" name="type" value="<%=type%>"/>
            <input type="hidden" id="mobile" name="mobile" value="<%=mobile%>"/>
            <input type="hidden" id="invitecode" name="invitecode" value="<%=invitecode%>"/>
            <input type="hidden" id="tenantcode" name="tenantcode" value="<%=tenantcode%>"/>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="用户名" id="username" name="username"/>
            </div>
            <div class="input-group">
                <input type="password" class="form-control" placeholder="密码" id="pwd" name="pwd" onblur="checkComplex()"/>
            </div>
            <div class="input-group">
                <input type="password" class="form-control" placeholder="请再次输入密码" id="pwdrepeat" name="pwdrepeat" onblur="checkpwd()"/>
                <p id="message"></p>
            </div>
        </form>
        <p class="notice">点击 "注册" 即同意并接受<a class="guidance" href="#">《服务协议》</a></p>
        <button class="btn btn-info confirm" id="save" name="save" onclick="submitForm()">注册</button>
         <a href="${pageContext.request.contextPath}/bizframe/jsp/index.jsp" class="guidance">了解策赢平台</a>
    </div>
</div>
</body>

<script type="text/javascript">
    function checkComplex(){
        var pwd = $("#pwd").val();
        if(pwd.length < 8){
            document.getElementById("message").innerHTML = "密码长度必须大于8位";
            $("#save").attr("disabled", true);
            return;
        } else{
            document.getElementById("message").innerHTML = "";
            $("#save").attr("disabled", false);
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
        var pwd = $("#pwd").val();
        var pwdrepeat = $("#pwdrepeat").val();
        if(pwd != pwdrepeat){
            document.getElementById("message").innerHTML = "两次输入的密码不一致";
            $("#save").attr("disabled", true);
        } else{
            document.getElementById("message").innerHTML = "";
            $("#save").attr("disabled", false);
        }
    }

    function submitForm(){
        var params = $("#register").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/registermanage/register.do",
            params: params,
            ok: function(text) {
                window.location.href="${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp";
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }
</script>
</html>