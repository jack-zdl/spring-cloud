<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    SysUserLoginDto currUser = (SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    if(currUser != null){
        //如果用户已经登录，则直接跳转到策赢平台界面
        request.getRequestDispatcher("indexFrame.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>策赢平台</title>
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/bizframe/css/index.css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/index.js"></script>--%>
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon" />
</head>
<body>
<div class="row-fluid wrap">
    <div class="head">
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar">
                        <span class="icon-bar"><img src="${pageContext.request.contextPath}/bizframe/image/img/favicon(48).ico"/></span>
                    </a>
                    <a href="#" class="brand">策赢网络</a>
                    <div class="nav-collapse navbar-responsive-collapse pull-right">
                        <ul class="nav_btn">
                            <li>
                                <%--<!-- <a href="#">相关下载</a>-->--%>
                             </li>
                             <!--<li class="divider-vertical"></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="advertising"></div>
        </div>
    </div>
    <div class="main">
        <div class="page banner">
            <div class="left_top"><img src="${pageContext.request.contextPath}/bizframe/image/img/leftTop.png" height="283" width="404"/></div>
            <div class="banner_text">
                <p class="ad_block_text">策&nbsp;赢&nbsp;网&nbsp;络&nbsp;&nbsp;&nbsp;&nbsp;科&nbsp;技&nbsp;改&nbsp;变&nbsp;世&nbsp;界</p>
                <p class="ad_block_text">Technology Reboots The World</p>
                <button id="login" class="btn btn-danger login_btn"  onclick="window.location.href='${pageContext.request.contextPath}/bizframe/jsp/login.jsp'">即刻登陆</button>
            </div>
            <div class="right_bottom"><img src="${pageContext.request.contextPath}/bizframe/image/img/rightBottom.png" height="282" width="390"/></div>
        </div>
        <div class="page company">
            <div class="company_title">
                <img src="${pageContext.request.contextPath}/bizframe/image/img/text_title.png" height="48" width="655"/>
            </div>
            <div class="company_text">
                    <span class="company_text_title">
                        上海策赢网络科技有限公司简介
                    </span><br><br>
                <span class="company_text_text">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp上海策赢网络科技有限公司是一家为商业银行提供金融科技服务的科技创新型企业，旨在运用最新的分布式账本与智能合约技术，把中国社会利率畸高的类金融、高利贷及互联网金融的业务回归到正规低利率的商业银行，破解中小企业融资难融资贵的传统难题，降低中国社会的整体融资成本，协助和支持金融真正服务实体经济，促进中国金融机构转型升级。策赢金融科技项目是区块链金融应用的最大项目，是中国供应链金融的一场伟大的实践。
                    </span>
            </div>
        </div>
        <div class="page">
            <div class="publicKey">
                <div class="keyW">
                    <img class="publicKey-title" src="${pageContext.request.contextPath}/bizframe/image/img/last_title.png" height="96" width="180"/>
                    <div class="keyW-text">
                        04 26 c7 05 2b 42 bb b1 ce 3b 16 7e 1a 48 0a 21 17 86 02 5d 66 61 fc 1b 49 94 d1 a9 41 da d8 ca 6f ce 98 87 57 ec a9 97 98 70 6d a2 07 1a 8c 5a c9 07 7a 59 02 3e a6 75 4e 28 1e f8 5f c2 4e 0c de
                    </div>
                </div>
                <div class="keyR">
                    <div class="keyR-text">
                        04 1f da cc 43 bb 30 81 8f 10 be fc 83 ac ae e9 0a 7a f3 6f 72 72 c4 7b 85 3a ed 85 22 4f 4c c8 c1 e9 2b 88 e3 0b a0 b1 98 17 76 7b 74 96 b7 a1 d9 55 0b b3 df f4 ee 99 97 82 0c e4 5a bd 19 33 4b
                    </div>
                </div>
                <div class="keyW">
                    <div class="keyW-text">
                        04 7a bf 0d 4a 46 77 97 92 90 e8 67 67 bc 14 31 9b cc b9 70 ab c4 78 82 e6 30 e6 31 fd c3 c1 d2 d7 57 3d 81 04 3c b4 fd 5a ec 63 a9 b1 c4 f4 09 db 78 64 15 b8 4e 33 bb 47 10 88 ba fe fa 2c 91 94
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="foot">
        <div class="foot_left">
            <ul>
                <li style="font-size: 16px">联系方式</li>
                <li>客服电话：021-64056979</li>
                <li>公司地址：上海市苏虹路333号虹桥万通中心A座301</li>
            </ul>
        </div>
        <div class="foot_right">
            <div class="QR"></div>
            <div class="permission">
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011202006304" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                    <img src="${pageContext.request.contextPath}/bizframe/image/img/record.png" style="float:left;"/>
                    <p style="float:left;height:20px;line-height:20px;color:white;margin: 0">沪公网安备 31011202006304号</p>
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $(".page").height($(window).height());
        $(".publicKey").height($(window).height()-76-140);
    })
</script>
</body>
</html>