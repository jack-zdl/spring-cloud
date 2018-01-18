<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    SysUserLogin currUser = (SysUserLogin) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenantid = String.valueOf(currUser.getTenant_id());
    String userid = currUser.getUserId();
    String userName = currUser.getUserName();
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/bizframe/css/inviteuser.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/plugins/jquery/jquery-zclip-master/jquery.zclip.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/inviteuser.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/adapter.js"></script>
</head>
<body>
<nav class="nav-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp">策赢平台</a>
    <span class="nav-login"><%=userName%></span>
</nav>
<div class="main-wrap">
	<form class="member-form" onsubmit="return false;" id="mobileform">
		<input type="hidden" id="userid" name="userid" value="<%=userid%>"/>
		<input type="hidden" id="tenantid" name="tenantid" value="<%=tenantid%>"/>
		<h2 class="title">邀请成员加入</h2>
		<div class="member-wrap">
			<input type="text" class="member-info" placeholder="手机号码" id="mobile1" name="mobiles"/>
			<a class="input-clear" href="javascript:void(0);">
				<i class="fa fa-times-circle" aria-hidden="true"></i>
			</a>
		</div>
		<div class="member-wrap">
			<input type="text" class="member-info" placeholder="手机号码" id="mobile2" name="mobiles"/>
			<a class="input-clear" href="javascript:void(0);">
				<i class="fa fa-times-circle" aria-hidden="true"></i>
			</a>
		</div>
		<div class="member-wrap">
			<input type="text" class="member-info" placeholder="手机号码" id="mobile3" name="mobiles"/>
			<a class="input-clear" href="javascript:void(0);">
				<i class="fa fa-times-circle" aria-hidden="true"></i>
			</a>
		</div>
		<div class="member-wrap">
			<input type="text" class="member-info" placeholder="手机号码" id="mobile4" name="mobiles"/>
			<a class="input-clear" href="javascript:void(0);">
				<i class="fa fa-times-circle" aria-hidden="true"></i>
			</a>
		</div>
		<div class="member-wrap">
			<input type="text" class="member-info" placeholder="手机号码" id="mobile5" name="mobiles"/>
			<a class="input-clear" href="javascript:void(0);">
				<i class="fa fa-times-circle" aria-hidden="true"></i>
			</a>
		</div>
		<div class="add-more">
			<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;
			<span>添加更多</span>
		</div>
		<button class="submit-info" onclick="submitForm()">
			确认邀请
		</button>
	</form> 
 	<div class="member-num-info">
 		<p>还可以使用手机号码邀请
 			<span class="max-invite-num">10</span>
 		人</p>
 	</div>
 	<div class="other-invite-method">
 	    <span class="text-danger"></span> 
 		<h4 class="clearfix">
 			<span class="other-method">其他邀请方式</span>
 			<a class="copy" href="javascript:void(0);">复制</a>
 		</h4>
 		<div class="copy_block">
 		    <div class="invite-code clearfix">
                <span id="invitecode"></span>
		 		<span id="tenantcode"></span>
		 	</div>
		 	<div class="register-addr clearfix">
		 		<span class="title">注册地址：</span>
		 		<a class="url" href="${pageContext.request.contextPath}/bizframe/jsp/registerdirect.jsp">/web/bizframe/jsp/registerdirect.jsp</a>
		 	</div>
		 	<div class="invite-tips">
		 		您可以用QQ、微信等方式把邀请码和企业号发送给同事，对方完成认证后就可以和您一起使用策赢平台了。邀请码有效时间24小时。
		 	</div>
 		</div>
 	</div>
 	<div class="enter-wrap">
 		<a href="${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp">进入系统<i class="fa fa-angle-double-right" aria-hidden="true"></i>
		</a>
 	</div>
</div>
<footer class="copyright text-center">
	<p>
		<span>
			Copyright © 2010-2017 保融科技 版权所有&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
	</p>
	<p>
		<img src="${pageContext.request.contextPath}/bizframe/image/ghs.png">
		<span>浙ICP备15008497号-1</span>
	</p>
</footer>
</body>

<script type="text/javascript">
    Ajax.req({
        url: "${pageContext.request.contextPath}/registermanage/getInviteCode.do",
        params: {
            tenantid: '<%=tenantid%>'
        },
        ok: function(text) {
            var invitecode = text["invitecode"];
            $("#invitecode").html("邀请码："+invitecode);
        },
        err: function(text) {
            $.RMessage.alert("消息", text.msg);
        }
    });

    Ajax.req({
        url: '${pageContext.request.contextPath}/common/query.do',
        type:"json",
        method:"get",
        params: {
            uc: 'UC_SYS_SYSCOMPANY_SEARCH',
            tenant_id: '<%=tenantid%>'
        },
        ok: function(text) {
            var entity = text.rows[0];
            var tenantcode = entity["tenant_code"];
            $("#tenantcode").html("企业号："+tenantcode);
        },
        err: function(text) {
            $.RMessage.alert("消息",text);
        }
    });

    function submitForm(){
        var params = $("#mobileform").AllSerialize();
        Ajax.req({
            url: '${pageContext.request.contextPath}/registermanage/inviteUser.do',
            params: params,
            ok: function(text) {
                $.RMessage.alert("消息", text.msg);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }
</script>
</html>