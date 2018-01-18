<%--<%@ page import="com.ceying.chx.sys.user.SysUserLogin" %>--%>
<%--<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>--%>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>下载</title>
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bizframe/css/download.css"/>
</head>

<body>
<div class="row-fluid wrap">
    <div class="head">
        <div class="logo">
            <div class="logo_img">
                <img src="${pageContext.request.contextPath}/bizframe/image/img/favicon(48).ico"/>
            </div>
            <div class="logo_text">策赢网络</div>
        </div>
    </div>
    <div class="main">
        <div class="row">
            <div class="col-xs-12 col-sm-6 mtb15" style="min-height: 414px !important;">
                <div class="background-sprite glyphicon glyphicon-download"></div>
                <div class="widget-title" style="min-height: 39px !important;">
                    <h3>控件下载</h3>
                </div>
                <p class="text-center" style="min-height: 21px !important;">CFCA定制控件，为您的交易保驾护航！</p>
                <div>
                    <a class="btn bg-blue-button" download="CryptoKit.Cypfintech.exe" onfocus="this.blur();"
                           href="${pageContext.request.contextPath}/bizframe/download/CryptoKit.Cypfintech.exe">证书控件下载</a>
                    <br>
                    <a class="btn bg-blue-button" target="_blank" onfocus="this.blur();"
                       href="${pageContext.request.contextPath}/bizframe/jsp/CFCAnotice.jsp">数字证书使用安全提示</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 mtb15">
                <div class="background-sprite register-your-product-icon"></div>
                <div class="widget-title" style="min-height: 39px !important;">
                    <h3>其他相关下载内容，敬请期待！</h3>
                </div>
                <!--<p class="text-center" style="min-height: 21px !important;"></p>-->
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
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011202006304"
                   style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                    <img src="../image/img/record.png" style="float:left;"/>
                    <p style="float:left;height:20px;line-height:20px;color:white;margin: 0">沪公网安备 31011202006304号</p>
                </a>
            </div>
        </div>
    </div>
</div>
</body>

</html>