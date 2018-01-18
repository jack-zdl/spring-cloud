<%--
  Created by IntelliJ IDEA.
  User: wangy
  Date: 2017/10/12
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>--%>
<%--<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>--%>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数字证书使用安全提示</title>
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bizframe/css/CFCAnotive.css"/>
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
            <div class="col-xs-12 mtb15">
                <h1>数字证书使用安全提示</h1>
                <div><b>为了防止用户在使用数字证书的过程中出现不应该出现的安全问题，中国金融认证中心(CFCA)提醒广大用户：</b></div>
                <p>1.申请数字证书时要仔细阅读中国金融认证中心(CFCA)提供的数字证书服务协议，明确自己的权利义务；</p>
                <p>2.在申请数字证书时应提供真实、完整、准确的身份信息和其他相关信息，并在这些信息变更时及时到申请网点办理变更手续；</p>
                <p>3.获取数字证书时，应当使用安全的工具产生并存储私钥及证书，比如使用USB Key来存储数字证书；使用完USB Key后应立即将其从电脑上拔出，不要将USB Key长时间留在电脑上；不使用已被证实产生弱私钥的工具来产生私钥。</p>
                <p>4.设置密码时，避免设置与个人资料相关的简单密码，如身份证号码、出生日期、电话号码等，应定期更改密码；</p>
                <p>5.务必妥善保管数字证书使用密码及存储数字证书的USB Key设备，防止机密信息泄漏或被他人窃取；如果数字证书遗失，或者发现相关的密码泄漏，务必及时到申请网点办理挂失手续并按照规定重新办理证书和/或设置密码；</p>
                <p>6.避免在公共场所或他人计算机上使用数字证书；</p>
                <p>7.在使用数字证书的电脑上要及时安装操作系统和浏览器的最新安全补丁，提高系统安全性；安装个人防火墙，防止他人的非法访问和恶意攻击；安装并定期更新防病毒软件，防止受到新病毒的侵害；切勿在使用数字证书的电脑上随意登陆不明网站，下载、安装不明软件或运行不明程序。</p>
                <p>8.请定期访问中国金融认证中心(CFCA)网站（<a href="http://www.cfca.com.cn">http://www.cfca.com.cn</a>），下载并阅读最新的《CFCA电子认证业务规则》、《CFCA数字证书服务协议》等相关文件。</p>
                <p>9.建议您经常通过网上银行或ATM查看帐户内资金变动情况，并使用银行提供的手机短信通知等服务。</p>
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
                   style="display:inline-block">
                    <img src="../image/img/record.png" style="float:left;"/>
                    <p style="float:left;color:white">沪公网安备 31011202006304号</p>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
