<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<%@page import="com.ceying.chx.common.constants.UserConstant"%>
<%
    request.getSession().setAttribute(UserConstant.USER_LOGIN_SESSION,null);
%>
<!DOCTYPE html>
<html >
<head>
    　<meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>策赢网络</title>
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bizframe/css/login.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/adapter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/dick_param.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/jquery.cookie.js"></script>
</head>
<body>
<header>
    <div class="logo">
        <div class="logo_img">
            <img class="logo_img" src="${pageContext.request.contextPath}/bizframe/image/img/logo(s).png" alt="logo">
        </div>
        <div class="logo_text">策赢网络</div>
    </div>
    <nav>
        <ul>
            <li class="active">登陆
                <div class="line"></div>
            </li>
            <li><a target="_blank" onfocus="this.blur();" href="${pageContext.request.contextPath}/bizframe/jsp/download.jsp">下载
                <div class="line"></div>
            </a></li>
        </ul>
    </nav>
</header>
<div class="main">
    <div class="main_text">
        <div class="main_text_cn">策赢网络 科技改变世界</div>
        <div class="main_text_en">TECHNOLOGY REBOOTS THE WORLD</div>
    </div>
    <form class="login_form clearfix" id="login" name="login" onSubmit="return false;">
        <div class="main_login">
            <div class="login_box">

                <div class="login_title">用户登陆</div>
                <div class="red_line"></div>
                <div class="username input_group">
                    <img class="input_ahead" src="${pageContext.request.contextPath}/bizframe/image/img/username.png"
                         alt="username">
                    <input name="userName" class="input_text" id="userName" placeholder="&nbsp&nbsp用户名/手机/邮箱" type="text">
                    <input id="bizEncryptFalg" name="bizEncryptFalg" value="" type="hidden">
                    <input id="resCode" name="resCode" value="bizSign" type="hidden">
                    <input id="opCode" name="opCode" value="bizSignIn" type="hidden">
                </div>
                <div class="passward input_group">
                    <img class="input_ahead" src="${pageContext.request.contextPath}/bizframe/image/img/password.png"
                         alt="password">
                    <input name="userPwd" class="input_text" id="userPwd" placeholder="&nbsp&nbsp密码" type="password">
                </div>
                <div id="drag"></div>
                <p id="message"></p>
                <button class="login_btn">登录</button>
            </div>
            <div class="main_login_img">
                <img src="${pageContext.request.contextPath}/bizframe/image/img/show.png" alt="show">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">
    $(function () {
        var flag = true;
        $.fn.drag = function(options){
            flag = false;
            var x, drag = this, isMove = false, defaults = {
            };
            var options = $.extend(defaults, options);
            //添加背景，文字，滑块
            var html = '<div class="drag_bg"></div>'+
                '<div class="drag_text" onselectstart="return false;" unselectable="on">拖动滑块验证</div>'+
                '<div class="handler handler_bg"></div>';
            this.append(html);

            var handler = drag.find('.handler');
            var drag_bg = drag.find('.drag_bg');
            var text = drag.find('.drag_text');
            var maxWidth = drag.width() - handler.width();  //能滑动的�?大间�?

            //鼠标按下时�?�的x轴的位置
            handler.mousedown(function(e){
                isMove = true;
                x = e.pageX - parseInt(handler.css('left'), 10);
            });

            //鼠标指针在上下文移动时，移动距离大于0小于 大间距，滑块x轴位置等于鼠标移动距
            $(document).mousemove(function(e){
                var _x = e.pageX - x;
                if(isMove){
                    if(_x > 0 && _x <= maxWidth){
                        handler.css({'left': _x});
                        drag_bg.css({'width': _x});
                    }else if(_x > maxWidth){  //鼠标指针移动距离达到大时清空事件
                        handler.css({'left': 260});
                        drag_bg.css({'width': 260});
                        dragOk();
                    }
                }
            }).mouseup(function(e){
                isMove = false;
                var _x = e.pageX - x;
                if(_x < maxWidth){ //鼠标松开时，如果没有达到大距离位置，滑块就返回初始位?
                    handler.css({'left': 0});
                    drag_bg.css({'width': 0});
                }
            });

            //清空事件
            function dragOk(){
                handler.removeClass('handler_bg').addClass('handler_ok_bg');
                text.text('验证通过');
                drag.css({'color': '#fff'});
                handler.unbind('mousedown');
                $(document).unbind('mousemove');
                $(document).unbind('mouseup');
            }
        };
        $('#drag').drag();
        $("#username","#password").keydown(function userformOnkeydown(e) {
            var ev = window.event || e;
            if (ev.keyCode == 13) {
                if ($("#username").val() == '') {
                    $("#username").focus();
                    flag = false;
                }
                else if ($("#password").val() == '') {
                    $("#password").focus();
                    flag = false;
                }
                else if ($(".handler").position().left != 260) {
                    flag = false;
                }
            }
            if (ev.keyCode == 13 && flag) {
                userformSubmit();
            }
        });

        $(".login_btn").click(function userformSubmit() {
            var sysLoginName = $("#userName").val();
            var pwd = $("#userPwd").val();
            if (sysLoginName == '') {
                $("#message").text('用户名不能为空!');
                return;
            }else if (pwd == '') {
                $("#message").text('密码不能为空!');
                return;
            }else if ($(".handler").position().left != 260) {
                $("#message").text('请拖动验证滑块!');
                return;
            }
            var json = $("#login").serializeObject();
            var jsonParam = {};
            jsonParam.userName = $("#userName").val();
            jsonParam.userPwd = $("#userPwd").val();
            console.info(json);
            Ajax.req({
                method: "POST",
                url: configObject.TAG+'/user/login',
                params:  JSON.stringify(jsonParam),     // $('#login').serialize(),
                async: false,
                type: "json",
                headers:"AJAX",
                err: function (request) {
                    $("#message").text(request.msg);
                },
                ok: function (text) {
                    Ajax.req({
                        method: "POST",
                        url: '${pageContext.request.contextPath}/user/login.do',
                        params:  $('#login').serialize(),     // $('#login').serialize(),
                        async: false,
                        type: "json",
                        err: function (request) {
                            $("#message").text(request.msg);
                        },
                        ok: function (data) {
                            if(data.result == 1){
                                window.location.href = "${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp";
                            }else {
                                $("#message").text(data.msg);
                            }
                        }
                    });
                }
            });
        })
    })
</script>
</body>
</html>
