<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.system.constants.ErrorCodeConstants" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<% 
    String mobile = request.getParameter("mobile")==null?"":request.getParameter("mobile");
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
    <div class="input-wrap">
        <ul class="tab_way clearfix">
            <li class="active">注册</li>
            <li><div>加入已有企业<p>(邀请码注册)</p></div></li>
        </ul>
        <div class="tab tab_one">
            <form role="form" id="register" onsubmit="return false;">
                <input type="hidden" id="type" name="type" value="directregister"/>
                <div class="input-group">
                    <span class="input-group-addon">+86</span>
                    <input type="text" class="form-control" placeholder="手机号" id="mobile" name="mobile" value="<%=mobile%>">
                </div>
                <ul class="clearfix">
                    <li class="col-xs-8">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入图片内容" id="imagecode" name="imagecode">
                            <span class="input-group-addon identifyingCode">
                                <img onclick="reloadcheckcode(this)"  title="如果看不清，请点击本图片换一张"
                                     src="${pageContext.request.contextPath}/checkcode.image" />
                            </span>
                        </div>
                    </li>
                    <li class="col-xs-4 ">
                        <div class="input-group">
                            <button  class="getCode" onclick="getMobileCode()" >获取短信验证码</button>
                        </div>
                    </li>
                </ul>
                <div class="input-group">
                    <span class="input-group-addon">验证码</span>
                    <input type="text" class="form-control" placeholder="短信验证码" id="verifycode" name="verifycode">
                </div>
                <input type="button" class="next" value="下一步" onclick="registerSubmit()"/>
            </form>
        </div>
        <div class="tab tab_two">
            <form id="jointenant">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="邀请码" id="invitecode" name="invitecode">
                </div>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="企业号" id="tenantcode" name="tenantcode">
                </div>
                <input type="button" class="next" value="下一步" onclick="jointenantSubmit()"/>
            </form>
        </div>
        <a href="${pageContext.request.contextPath}/bizframe/jsp/index.jsp" class="guidance">了解策赢平台</a>
    </div>
</div>
</body>

<script>
    function reloadcheckcode(img){
        img.src = "${pageContext.request.contextPath}/checkcode.image?" + Math.random();
    }

    function getMobileCode(){
        var mobile = $("#mobile").val();
        var imagecode = $("#imagecode").val();
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

    //直接注册的方法
    function registerSubmit(){
        var mobile = $("#mobile").val();
        var imagecode = $("#imagecode").val();
        var verifycode = $("#verifycode").val();
        if(mobile == null || mobile == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0028)%>");
            return;
        }
        if(imagecode == null || imagecode == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0026)%>");
            return;
        }
        if(verifycode == null || verifycode == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0031)%>");
            return;
        }
        var params = $("#register").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/registermanage/checkMobileCode.do",
            params: params,
            ok: function(text) {
                var condition = "?mobile=" + mobile;
                window.location.href = "${pageContext.request.contextPath}/bizframe/jsp/register_next.jsp" + condition;
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    //加入已有企业的方法
    function jointenantSubmit(){
        var invitecode = $("#invitecode").val();
        var tenantcode = $("#tenantcode").val();
        if(invitecode == null || invitecode == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0029)%>");
            return;
        }
        if(tenantcode == null || tenantcode == ""){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.FUM0030)%>");
            return;
        }
        var params = $("#jointenant").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/registermanage/verifyinvitecode.do",
            params: params,
            ok: function(text) {
                var condition = "?invitecode=" + invitecode + "&tenantcode=" + tenantcode;
                window.location.href = "${pageContext.request.contextPath}/bizframe/jsp/registerandjoin.jsp" + condition;
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }
</script>
</html>