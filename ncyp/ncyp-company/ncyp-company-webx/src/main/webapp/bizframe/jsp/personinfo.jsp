<--%

%-->
<%@ page import="com.ceying.chx.common.constants.*" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String tenantname = currUser.getTenantCnshortname();
    String userId = currUser.getUserId();

    String mobile = currUser.getMobile();
    String username = currUser.getUserName();
    String usershortname;
    if(username.length()>2){
        usershortname = username.substring(username.length() - 2);
    }else {
        usershortname = username;
    }
    String tenantid = String.valueOf(currUser.getTenantId());
    String orgid = currUser.getOrgId();

    String isFirst = request.getParameter("isFirst");
    String isApplyKey = request.getParameter("isApplyKey");
    /*String roleCode = AccountsPayableConntroller.getRoleCode(userId);
    OrganizationEntity orgInfo = OrgController.getOrgInfo(orgid);
    BigDecimal corecompanyrate = orgInfo.getcorecompanyrate();

    //系统基础数据缓存
    String securityLevel = CommonQueryController.getIndividuation(orgid);

    if (securityLevel.equals(ENSecurityLevel.NONE.getValue())) {
        securityLevel = "明码";
    } else if (securityLevel.equals(ENSecurityLevel.PART.getValue())) {
        securityLevel = "局部保密";
    } else if (securityLevel.equals(ENSecurityLevel.ALL.getValue())) {
        securityLevel = "全部保密";
    }

    String quoteTemplate = CommonQueryController.getQuoteTemplate(orgid);

    if (quoteTemplate!=null&&quoteTemplate.equals(ENQuoteTemplate.FLOATING.getValue())) {
        quoteTemplate = "基准上浮";
    } else if (quoteTemplate!=null&&quoteTemplate.equals(ENQuoteTemplate.MONTHLYRATE.getValue())) {
        quoteTemplate = "月息";
    }else{
        quoteTemplate = "实际利率";
    }

    boolean isAdmin = RoleController.ifAdminRole(userId);*/
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>云平台</title>
    <link href="${pageContext.request.contextPath}/bizframe/image/favicon.ico" rel="icon" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.min.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/bizframe/css/personinfo.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css"/>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bizframe/js/personinfo.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/common/js/adapter.js"></script>
</head>
<body>
<div class="top_block">
    <div class="operate_nav">
        <i class="fa fa-cloud fa-2x" aria-hidden="true"></i>
        <span><%=tenantname%></span>
        <%if (isApplyKey == null || !isApplyKey.equals("false")) {%>
        <div class="user_info">
            <i class="fa fa-caret-square-o-down"></i>
            <i class="fa fa-caret-up"></i>
            <ul class="btn_list">
                <li>
                    <a href="${pageContext.request.contextPath}/bizframe/jsp/personinfo.jsp">我的主页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp"><%=tenantname%>
                    </a>
                </li>
            </ul>
        </div>
        <%}%>
        <div class="operate_btn">
            <ul>
                <li class="person_center">
                    <%=username%><span><%=usershortname%></span>
                    <i class="fa fa-caret-up"></i>
                    <ul class="btn_list">
                        <li>
                            个人设置
                        </li>
                        <li>
                            <a href="javascript:void(0)" onclick="modifyPassword()">修改密码</a>
                        </li>
                        <li>
                            <a href="login.jsp" id="logout">退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main-container">
    <div class="user_name">
        <div>
            <div class="name_circle"><%=usershortname%>
            </div>
            <div><%=username%>
            </div>
        </div>
    </div>
    <div class="detail_info">
        <div class="detail_userInfo">
            <h4>个人信息</h4>
            <ul>
                <li class="name_wrap">
                    <div class="name_tips">
                        <span class="star">*</span>
                        姓名:
                    </div>
                    <div class="name">
                        <%=username%>
                    </div>
                    <div class="edit">
                        <input type="hidden" id="oldUserName" name="oldUserName"/>
                        <span>修改</span>
                        <button class="btn btn-info" onclick="modifyName()">提交</button>
                        <button class="btn btn-default" onclick="restoreName()">取消</button>
                    </div>
                </li>

                <li class="tel_wrap">
                    <div class="tel_tips">
                        <span class="star">*</span>
                        手机号:
                    </div>
                    <div class="tel">
                        <%=mobile%>
                    </div>
                    <div class="edit">
                        <span>修改</span>
                    </div>
                </li>
                <li class="password_wrap">
                    <div class="password_tips">
                        <span class="star">*</span>
                        密码:
                    </div>
                    <div class="password">
                        ******
                    </div>
                    <span style=" color: #5CABF1;cursor: pointer;" href="javascript:void(0)" onclick="modifyPassword()">修改</span>
                </li>
            </ul>
        </div>
        <%--<%if(roleCode != null){
            if(roleCode.equals("10000201")) {%>--%>
        <%if(false){
            if(false) {%>
        <div class="detail_userInfo">
            <h4>基础设置</h4>
            <ul>
                <li class="rate_wrap">
                    <div class="name_tips">
                        <span class="star">*</span>
                        费率(%):
                    </div>
                    <div class="rate" style="width: 200px;margin-left: 20px;" id="corecompanysupplierrate">
                    </div>
                    <div class="edit">
                        <input type="hidden" id="oldRate" name="oldRate"/>
                        <span>修改</span>
                        <button class="btn btn-info" onclick="modifyRate()">提交</button>
                        <button class="btn btn-default" onclick="restoreRate()">取消</button>
                    </div>
                </li>
                <li class="security_wrap">
                    <div class="name_tips">
                        <span class="star">*</span>
                        保密级别:
                    </div>
                    <div class="security" style="width: 200px;margin-left: 20px;">
                        <%--<%=securityLevel%>--%>
                    </div>
                    <div class="edit">
                        <input type="hidden" id="oldSecurity" name="oldSecurity"/>
                        <span>修改</span>
                        <button class="btn btn-info" onclick="modifySecurity()">提交</button>
                        <button class="btn btn-default" onclick="restoreSecurity()">取消</button>
                    </div>
                </li>
            </ul>
        </div>
        <%}}%>
        <%--<% } else if (roleCode.equals("10000101")) {%>--%>
        <%--<div class="detail_userInfo">--%>
        <%--<h4>我的主页</h4>--%>
        <%--<ul>--%>
        <%--<li class="template_wrap">--%>
        <%--<div class="name_tips">--%>
        <%--<span class="star">*</span>--%>
        <%--银行报价模板:--%>
        <%--</div>--%>
        <%--<div class="template" style="width: 200px;margin-left: 20px;">--%>
        <%--<%=quoteTemplate%>--%>
        <%--</div>--%>
        <%--<div class="edit">--%>
        <%--<input type="hidden" id="oldTemplate" name="oldTemplate"/>--%>
        <%--<span>修改</span>--%>
        <%--<button class="btn btn-info" onclick="modifyTemplate()">提交</button>--%>
        <%--<button class="btn btn-default" onclick="restoreTemplate()">取消</button>--%>
        <%--</div>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--</div>--%>
        <%--<%}}%>--%>

    </div>
</div>
<div class="window_mask">

</div>
<div class="edit_tel">
    <p><i class="fa fa-close"></i></p>
    <h4>修改手机号绑定</h4>
    <form onsubmit="return false" id="modMobile">
        <div class="input-group">
            <span class="input-group-addon">+86</span>
            <input type="text" class="form-control" placeholder="手机号" id="mobile" name="mobile">
        </div>

        <div class="input-group">
            <button class="btn btn-info btn-block" id="saveMobile" name="saveMobile" onclick="submitModmobileForm()">
                确认
            </button>
        </div>
    </form>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade edit_password" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改密码
                </h4>
            </div>
            <div class="modal-body">
                <form onsubmit="return false" id="modifyPwd">
                    <p style="font-size:12px;text-align:center;color:red">密码长度必须大于8位,必须包含数字，小写，大写，特殊字符中的三种 </p>
                    <div class="input-group">
                        <span class="input-group-addon">当前用户</span>
                        <input type="text" class="form-control" id="userid" name="userid" value="<%=userId%>" readonly>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">当前密码</span>
                        <input type="password" class="form-control" id="password" name="oldPwd" placeholder="请输入当前密码">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">新密码&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="请输入新密码"
                               onblur="checkComplex()">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">确认密码</span>
                        <input type="password" class="form-control" id="newPwdre" name="newPwdre" placeholder="请输入确认密码"
                               onblur="checkpwd()">
                    </div>
                    <p id="message" style="font-size:12px;text-align:center;color:red"></p>
                    <div class="input-group">
                        <button class="btn btn-info btn-block" id="savePwd" onclick="modifyPwd()">确认</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<r:win title="创建企业" id="createTenantModal" width="800" height="500"/>
<r:win title="修改企业信息" id="modTenantInfoModal" width="800" height="500"/>
<r:win title="修改密码" id="modifyPasswordModal" width="400" height="330"/>
</body>

</html>
<script type="text/javascript">
    var closeWinFn = function () {
        $("#createTenantModal").modal("hide");
        $("#modTenantInfoModal").modal("hide");
        $("#modifyPasswordModal").modal("hide");
        $(".edit_password").modal("hide");
        window.location.reload();
    };
    var closeWinMp = function () {
        $("#modifyPasswordModal").modal("hide");
        $(".edit_password").modal("hide");
        $(location).attr('href', '${pageContext.request.contextPath}/usermanage/user/logout.do');
        exeComQuery();
    };

    function modifyName() {
        var username = $("#username").val();
        if(username.length>10){
            $.RMessage.alert("消息", "用户名过长，请重新输入");
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/user/modifyUserName.do",
            params: {
                username: username,
                userid: "<%=userId%>"
            },
            ok: function (text) {
                window.location.reload();
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    function modifyRate() {
        var corecompanyrate = (Number)($("#rate").val());
        if (corecompanyrate > 2) {
            $.RMessage.alert("消息", "费率过高");
            return;
        }
        if (corecompanyrate < 0) {
            $.RMessage.alert("消息", "费率不能为负数");
            return;
        }
        if(corecompanyrate.toString().split(".")[1] !=null ){
            if(corecompanyrate.toString().split(".")[1].length >2){
                $.RMessage.alert("消息", "请输入两位小数");
                return;
            }
        }
        corecompanyrate = FloatDiv(corecompanyrate,100);
        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/org/modifyrate.do",
            params: {
                corecompanyrate: corecompanyrate
            },
            ok: function (text) {
                window.location.reload();
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    //浮点数乘法运算

    function FloatMul(arg1,arg2)

    {

        var m=0,s1=arg1.toString(),s2=arg2.toString();

        try{m+=s1.split(".")[1].length}catch(e){}
        try{m+=s2.split(".")[1].length}catch(e){}

        return to2bits(Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m),4)

    }

    //浮点数除法运算

    function FloatDiv(arg1,arg2){

        var t1=0,t2=0,r1,r2;

        try{t1=arg1.toString().split(".")[1].length}catch(e){}
        try{t2=arg2.toString().split(".")[1].length}catch(e){}

        with(Math){

            r1=Number(arg1.toString().replace(".",""));
            r2=Number(arg2.toString().replace(".",""));

            return to2bits((r1/r2)*pow(10,t2-t1),4);

        }

    }

    //但是以上方法仍然不能完好的控制精度，还得需要保留小数位数的方法控制

    function to2bits(flt,pos) {

        var rd=1;

        for(var i=1;i<=parseInt(pos);i++)    {
            rd=rd*10;
        }

        if(parseFloat(flt) == flt){
            return Math.round(flt * rd) / rd;
        }
        else{
            return 0;
        }
    }
    function modifySecurity() {
        var securitylevel = $("input[type='radio']:checked").val();
        Ajax.req({
            url: "${pageContext.request.contextPath}/individuation/corecompany/edit.do",
            params: {
                securitylevel: securitylevel
            },
            ok: function (text) {
                window.location.reload();
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    function modifyTemplate() {
        var quoteTemplate = $("input[type='radio']:checked").val();
        Ajax.req({
            url: "${pageContext.request.contextPath}/individuation/bank/edit.do",
            params: {
                quoteTemplate: quoteTemplate
            },
            ok: function (text) {
                window.location.reload();
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    function createTenant() {
        var tenantid = "<%=tenantid%>";
        if (tenantid == "9999") {
            var url = "${pageContext.request.contextPath}/bizframe/jsp/createTenant.jsp";
            $("#createTenantModal").RWin("createWin", url);
        } else {
            $.RMessage.alert("消息", "您已加入企业，不能创建企业");
        }
    }



    function getMobileCode() {
        var mobile = $("#mobile").val();
        var phoneReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (!phoneReg.test(mobile)) {
            alert('请输入有效的手机号码！');
            return;
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/user/getMobileCode.do",
            params: {
                mobile: mobile,
                tenantid: "<%=tenantid%>"
            },
            ok: function (text) {
                var _this = $('button.getCode');
                _this.attr('disabled', 'disabled');

                var num = 60;
                _this.html(num + '秒后可重试');
                var timer = setInterval(function () {
                    num--;
                    _this.html(num + '秒后可重试');
                    if (num <= 0) {
                        _this.removeAttr('disabled');
                        _this.html('获取短信验证码');
                        clearInterval(timer);
                    }
                }, 1000)
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    function submitModmobileForm() {
        var mobile = $("#mobile").val();
        var phoneReg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
        if (!phoneReg.test(mobile)) {
            $.RMessage.alert("消息", "请输入有效的手机号码！");
            return;
        }
        var params = $("#modMobile").AllSerialize();
        Ajax.req({
            url: "${pageContext.request.contextPath}/usermanage/user/modifyMobile.do",
            params: params,
            ok: function (text) {
                window.location.reload();
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    //点击取消恢复修改前的用户名
    function restoreName() {
        var oldUserName = $("#oldUserName").val();
        $(".name").html(oldUserName);
    }

    //点击取消恢复修改前的费率
    function restoreRate() {
        var oldRate = $("#oldRate").val();
        $(".rate").html(oldRate);
    }

    //点击取消恢复修改前的保密级别
    function restoreSecurity() {
        var oldSecurity = $("#oldSecurity").val();
        $(".security").html(oldSecurity);
    }

    //点击取消恢复修改前的银行报价模板
    function restoreTemplate() {
        var oldTemplate = $("#oldTemplate").val();
        $(".template").html(oldTemplate);
    }

    function modifyCompanyInfo() {
        var tenantid = "<%=tenantid%>";
        var url = "${pageContext.request.contextPath}/admin/system/companymanage/companyadd.jsp?type=mod&urid=" + tenantid;
        $("#modTenantInfoModal").RWin("createWin", url);
    }

    window.onload = function () {
        if ("<%=isFirst%>" == "true") {
            firstModifyPassword()
        }
        var corecompanyrate = FloatMul(<%--<%=corecompanyrate%>--%>,100);
        $("#corecompanysupplierrate").text(corecompanyrate);
    }

    function modifyPassword() {
        var url = "${pageContext.request.contextPath}/bizframe/jsp/modifyPassword.jsp";
        $("#modifyPasswordModal").RWin("createWin", url);
    }

    function firstModifyPassword() {
        $(".edit_password").show();
        $('.edit_password').modal({backdrop: 'static', keyboard: false});
    }

    function checkComplex() {
        var pwd = $("#newPwd").val();
        if (pwd.length < 8) {
            document.getElementById("message").innerHTML = "密码长度必须大于8位";
            $("#savePwd").attr("disabled", true);
            return;
        } else {
            document.getElementById("message").innerHTML = "";
            $("#savePwd").attr("disabled", false);
        }

        var modes = 0;
        //正则表达式验证符合要求的
        if (/\d/.test(pwd)) {
            modes++; //数字
        }
        if (/[a-z]/.test(pwd)) {
            modes++; //小写
        }
        if (/[A-Z]/.test(pwd)) {
            modes++; //大写
        }
        if (/\W/.test(pwd)) {
            modes++; //特殊字符
        }
        if (modes < 3) { //密码复杂等级必须大于等于3
            document.getElementById("message").innerHTML = "必须包含数字，小写，大写，特殊字符中的三种";
            $("#save").attr("disabled", true);
        } else {
            document.getElementById("message").innerHTML = "";
            $("#save").attr("disabled", false);
        }
    }

    function checkpwd() {
        var newPwd = $("#newPwd").val();
        var rptPwd = $("#newPwdre").val();
        if (newPwd != rptPwd) {
            document.getElementById("message").innerHTML = "两次输入的密码不一致";
            $("#savePwd").attr("disabled", true);
            return true;
        } else {
            document.getElementById("message").innerHTML = "";
            $("#savePwd").attr("disabled", false);
            return false;
        }
    }

    function modifyPwd() {
        var flag = checkpwd();
        if (flag) {
            return false;
        } else {
            $("#savePwd").attr("disabled", false);
            var params = $("#modifyPwd").AllSerialize();
            Ajax.req({
                url: "${pageContext.request.contextPath}/usermanage/user/modifyPwd.do",
                params: params,
                ok: function (text) {
                    $.RMessage.alert("消息", text.msg, closeWinMp);
                },
                err: function (text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    }
</script>