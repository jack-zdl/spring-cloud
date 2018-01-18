<%@ page import="com.ceying.chx.common.constants.ErrorCodeConstants" %>
<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%
    String invitecode = request.getParameter("invitecode");
    String tenantcode = request.getParameter("tenantcode");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
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
</head>
<body>
<nav class="navbar navbar-white" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Saas</a>
        </div>
        <form class="navbar-form navbar-right">
            <button type="button" class="btn btn-default" onclick="window.location.href='${pageContext.request.contextPath}/bizframe/jsp/login.jsp'">登录</button>
        </form>
    </div>
</nav>
<div class="body_wrap">
    <h2>注册Saas平台账号</h2>
    <p class="ad_des">Saas平台,助你成长</p>
    <div class="input-wrap">
        <div class="tab tab_one">
            <form role="form" id="register" onsubmit="return false;">
                <input type="hidden" id="type" name="type" value="jointenant"/>
                <input type="hidden" id="invitecode" name="invitecode" value="<%=invitecode%>"/>
                <input type="hidden" id="tenantcode" name="tenantcode" value="<%=tenantcode%>"/>
                <div class="input-group">
                    <span class="input-group-addon">+86</span>
                    <input type="text" class="form-control" placeholder="手机号" id="mobile" name="mobile">
                </div>
                <ul class="clearfix">
                    <li class="col-xs-8">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入图片内容" id="imagecode" name="imagecode">
                            <span class="input-group-addon identifyingCode">
                                <img onclick="reloadcheckcode(this)" title="如果看不清，请点击本图片换一张"
                                     src="${pageContext.request.contextPath}/checkcode.image" id="img" name="img"/>
                            </span>
                        </div>
                    </li>
                    <li class="col-xs-4 ">
                        <div class="input-group">
                            <button class="getCode" onclick="getMobileCode()">获取短信验证码</button>
                        </div>
                    </li>
                </ul>
                <div class="input-group">
                    <span class="input-group-addon">验证码</span>
                    <input type="text" class="form-control" placeholder="短信验证码" id="verifycode" name="verifycode">
                </div>
                <input type="button" class="next" value="下一步" onclick="submitForm()"/>
            </form>
        </div>
        <a href="#" class="guidance">了解Saas</a>
    </div>
</div>
</body>
<script>
    function reloadcheckcode(img){
        img.src = "${pageContext.request.contextPath}/checkcode.image?" + Math.random();
    }

    function getMobileCode(){
        var imagecode = $("#imagecode").val();
        var mobile = $("#mobile").val();
        var verifycode = $("#verifycode").val();
        if(mobile == null || mobile == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0028)%>");
            return;
        }
        if(imagecode == null || imagecode == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0026)%>");
            return;
        }
        var phoneReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!phoneReg.test(mobile)) {
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0025)%>");
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/registermanage/getMobileCode.do",
            params: {
                mobile: mobile,
                imagecode: imagecode
            },
            ok: function(text){
                //获取手机验证码后变更图片验证码
                $("#img").attr("src", "${pageContext.request.contextPath}/checkcode.image?" + Math.random());

                var _this = $('button.getCode');
                _this.attr('disabled','disabled');

                var num = 60;
                _this.html(num+'秒后可重试');
                var timer = setInterval(function(){
                    num--;
                    _this.html(num+'秒后可重试');
                    if(num <= 0){
                        _this.removeAttr('disabled');
                        _this.html('获取短信验证码');
                        clearInterval(timer);
                    }
                },1000)
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    function submitForm(){
        var params = $("#register").AllSerialize();
        var mobile = $("#mobile").val();
        var invitecode = $("#invitecode").val();
        var tenantcode = $("#tenantcode").val();
        Ajax.req({
            url: "${pageContext.request.contextPath}/registermanage/checkMobileCode.do",
            params: params,
            ok: function(text) {
                var condition = "?mobile=" + mobile + "&invitecode=" + invitecode + "&tenantcode=" + tenantcode;
                window.location.href = "${pageContext.request.contextPath}/bizframe/jsp/register_next.jsp" + condition;
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }
</script>
</html>