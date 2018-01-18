<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sass平台</title>
    <jsp:include page="/common/include.jsp" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/transfer.css" />
</head>
<body class="body_col_wrap">
<div class="top_bar">
    <span class="title">企业资金管理云Saas平台</span>
    <div class="person">
        <img src="images/person.png" />
        <span class="person_name">Jone</span>
        <i class="fa fa-angle-down" aria-hidden="true"></i>
    </div>
    <div class="message" >
        <img src="images/message.png" />
    </div>
</div>
<div class="menu_bar" style="margin-top: 10px;">
    <span class="company_name">上海钜策科技有限公司</span>
    <span class="line"></span>
    <ul class="menu_list">
        <li class="active">首页</li>
        <li>审批管理</li>
        <li>交易信息</li>
    </ul>
    <span class="login_time">上次登录时间 2017-01-24 14:20:21</span>
</div>
<div class="step_guidance">
    <span class="step">1</span>单笔转账录入<span class="step_line"></span>
    <span class="step">2</span>单笔转账确认<span class="step_line"></span>
    <span class="step active">3</span>单笔转账结果
</div>
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">单笔确认</span>
        </div>
        <div class="operation_block clearfix">
            <div class="pay_result_block">
                    <img class="pay_success" src="images/pay_success.png">
                    <p class="pay_result">单笔转账申请成功,待XXXXX角色审核!</p>
               </div>
        </div>
        <div class="operation_btn">
            <button class="blue_btn">返回</button>
        </div>
    </div>
</div>
</body>
</html>