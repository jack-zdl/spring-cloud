<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page import="com.ceying.chx.common.constants.UserConstant"%>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.dto.SysMenuDto" %>
<%
    String $_path=request.getScheme()+"://"
            + request.getServerName()+":"
            + request.getServerPort()
            + request.getContextPath();
    String initMenuStr="";
    String initMenuName="";
    String initMenuId="";

    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
//    由登录次数来判定是否是第一次登录 isFirstLogin ：true第一次登录 false不是第一次登录
    String loginTime = currUser.getExtField();
    boolean isFirstLogin = false;
    if(loginTime!=null&&loginTime.equals("1")){
        isFirstLogin = true;
    }
    String tenantid = String.valueOf(currUser.getTenantId());
    String tenantname = currUser.getTenantCnshortname();
    String userId = currUser.getUserId();
    String username = currUser.getUserName();
    String usershortname = username;
    if(username.length()>3){
        usershortname = username.substring(username.length()-2);
    }
    String parentCode = "BIZFRAME";

%>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <title>策赢平台</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/wrap.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/guidance.css" />
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/wrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/reload.js"></script>--%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/adapter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/dick_param.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/jquery.cookie.js"></script>
    <style>
        a{
            display: inline-block;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="top_block">
    <div class="operate_nav">
        <div class="logo_bar">
            <img src="../image/img/logo.png" alt="logo">
            <span>策赢网络</span>
        </div>
        <div class="operate_btn">
            <ul>
                <li class="person_center">
                    <%=username%><span><%=usershortname%></span>
                    <i class="fa fa-caret-up"></i>
                    <ul class="btn_list">
                        <li>
                            <a href="${pageContext.request.contextPath}/bizframe/jsp/personinfo.jsp" >个人设置</a>
                        </li>
                        <li>
                            <a href="#" onclick="modifyPassword()">修改密码</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/usermanage/user/logout.do" id="logout">退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="menu_list">
            <ul class="page_nav" id="page_nav">
                <li class="active dianji" id="index" index="1" create="true">
                    <div style="width: 32px;"><img src="../image/img/workbench(w).png" alt="工作台"></div>
                    <p style="text-align: center">工作台</p>
                </li>
            </ul>
            <div class="add_menu dianji" create="true">
                <div style="width: 32px;"><img src="../image/img/more(g).png" alt="more"></div>
                <p style="text-align: center">菜单</p>
            </div>

        </div>
    </div>
    <div class="other_menu" style="display: none;">
        <div class="menu_prev"><i class="fa fa-angle-left" aria-hidden="true"></i></div>
        <div>
            <ul class="other_menulist">

            </ul>

        </div>
        <div class="menu_right"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
    </div>
</div>
<div class="main-container">
    <iframe id="main-iframe" index="1" class="main-iframe" frameborder="no" src="${pageContext.request.contextPath}/bizframe/jsp/workspace.jsp"></iframe>
</div>
<div class="work_block">
    <iframe name="work_block_win" id="work_block_win" frameborder="no" src=""></iframe>
</div>
<r:win title="修改密码" id="modifyPasswordModal" width="400" height="330"/>
<%--<%--%>
    <%--if(isFirstLogin){--%>
<%--%>--%>
<%--<div class="new_guide_wrap">--%>
    <%--<img src="../../CYUI/bootstrap/assets/css/img/guide_one.png" class="guide_one">--%>
<%--</div>--%>
<%--<%}%>--%>

<script>
    var rootPath = getRootPath_web();
    window.onload = function () {
        Ajax.req({
            method: "POST",
            url: configObject.TAG+'/menu/queryMenu.do',
            params:{
                parentCode:'BIZFRAME'
            },
            async: false,
            type: "json",
            err: function (request) {
                $("#message").text(request.msg);
            },
            ok: function (data) {
                var menuList = data.menuList;
                var appendStr1 = "";
                var appendStr2 = "";
                for(var i = 0; i < menuList.length; i++) {
                    appendStr2 = appendStr2 + '<li index="' + menuList[i].menuCode + '" class="col-xs-2 dianji" ><div style="width: 32px;"><img src="../image/img/' + menuList[i].menuIcon + '" alt="' + menuList[i].menuName + '" ></div><p style="text-align: center">' + menuList[i].menuName + '</p></li>';
                }
                if(menuList.length <=5){
                    for(var i = 0; i < menuList.length; i++) {
                        appendStr1 = appendStr1 + '<li index="' + menuList[i].menuCode + '" class="dianji"><div style="width: 32px;"><img src="../image/img/' + menuList[i].menuIcon + '" alt="' + menuList[i].menuName + '" ></div><p style="text-align: center">' + menuList[i].menuName + '</p><i class="fa fa-minus-circle dis" aria-hidden="true"></i></li>';
                    }
                    $('.page_nav').append(appendStr1);

                }else if(menuList.length >5){
                    for(var i = 0; i < 5; i++) {
                        appendStr1 = appendStr1 + '<li index="' + menuList[i].menuCode + '" class="dianji"><div style="width: 32px;"><img src="../image/img/' + menuList[i].menuIcon + '" alt="' + menuList[i].menuName + '" ></div><p style="text-align: center">' + menuList[i].menuName + '</p><i class="fa fa-minus-circle dis" aria-hidden="true"></i></li>';
                    }

                    $('.page_nav').append(appendStr1);
                    $('.other_menulist').append(appendStr2);
                }

            }
        });
    }

    $(function(){
        <%--reload('${pageContext.request.contextPath}/usermanage/user/logout.do');--%>
        $("ul").on('mouseover mouseout','.dianji',function (e) {
            if(e.type =="mouseover" ){
                var src=$(this).find('div').find('img').attr("src")+"";
                src=src.substring(0,src.length-7)+"(w).png";
                $(this).find('div').find('img').attr("src",src);
            }else if(e.type =="mouseout"){
                if($(this).hasClass("active")){
                    var src=$(this).find('div').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(w).png";
                    $(this).find('div').find('img').attr("src",src);

                }else{
                    var src=$(this).find('div').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(g).png";
                    $(this).find('div').find('img').attr("src",src);
                }
            }
        });
        $('.dianji').hover(
            function(){
                var src=$(this).find('div').find('img').attr("src")+"";
                src=src.substring(0,src.length-7)+"(w).png";
                $(this).find('div').find('img').attr("src",src);
            },
            function(){
                if($(this).hasClass("active")){
                    var src=$(this).find('div').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(w).png";
                    $(this).find('div').find('img').attr("src",src);

                }else{
                    var src=$(this).find('div').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(g).png";
                    $(this).find('div').find('img').attr("src",src);
                }
            }
        );
    });



    var w,h,l,t;
    w = $('.add_menu').width();
    h = $('.add_menu').height();
    t = parseInt($('.add_menu').offset().top);
    l = parseInt($('.add_menu').offset().left);

    $('.new_guide_wrap').css({'width':(w+20),'height':(h+20),'top':(t-1000-10)+'px','left':(l-2000-10)+'px'});

    $('.new_guide_wrap img').click(function() {
        $('.other_menu').show();
        $('.new_guide_wrap img').attr('src','../../CYUI/bootstrap/assets/css/img/guide_two.png');
        $('.new_guide_wrap img').removeClass('guide_one').addClass('guide_two');
        w = $('.other_menu_list').width();
        h = $('.other_menu_list').height();
        t = parseInt($('.other_menu_list').offset().top);
        l = parseInt($('.other_menu_list').offset().left);

        $('.new_guide_wrap').css({'width':(w+20),'height':(h+20),'top':(t-1000-10)+'px','left':(l-2000-10)+'px'});
        $('.new_guide_wrap img').click(function(){
            $('.other_menu').hide();
            $('.new_guide_wrap').remove();
        })
    })
    var modifyPassword = function(){
        var url = "${pageContext.request.contextPath}/bizframe/jsp/modifyPassword.jsp";
        $("#modifyPasswordModal").RWin("createWin", url);
    }
    var closeWinMp = function () {
        $("#modifyPasswordModal").modal("hide");
        $(location).attr('href', '${pageContext.request.contextPath}/usermanage/user/logout.do');
        exeComQuery();
    };
</script>
</body>
</html>