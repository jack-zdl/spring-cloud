<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String dataUrl =request.getContextPath()+"/common/query.do?uc=UC_RFP_BANKVIEWCOMPANYANDSUP_SEARCH";
    if("6000001".equals(currUser.getOrg_id())){
        dataUrl=request.getContextPath()+"/common/query.do?uc=UC_RFP_ORGBANK_SEARCH";
    }
%>
<jsp:include page="/common/formhead.jsp" />
<div role="form" id="templateadd" name="templateadd">
    <%--<input id="urid" type="hidden" name="urid" />--%>
    <%--<input id="rowversion" type="hidden" name="rowversion" />--%>

    <r:tinyPanel title="请选择Key领用机构" hasHeader="true" >
        <!-- 银行检索
        gridtenantid.equals(CommonConstants.SUPERTENANT)
        是设置是否是新增或者是编辑的判断
        -->
        <r:panelItem>
            <r:comboGrid id="orgId" name="orgId" valueField="urid" displayField="codename" colModel="[{title:'代码-名称',field:'codename',width:120}]" dataUrl="<%=dataUrl%>" title="领用机构" ></r:comboGrid>
        </r:panelItem>
        <button class="showMenu btn btn-primary">确定</button>
    </r:tinyPanel>
</div>


<style>
    body{
        background-color: #f3f3f4;
    }

    li {
        width: 16.666666666666666%;
        margin: 0 auto -2px;
        text-align: center;
        font-size: 20px;
    }

    .main-text {
        width: 60%;
        margin: 0 auto;
    }

    .nav-tabs > li {
        margin-right: 0;
    }

    .complete {
        background-color: #FFF;
        border: 1px solid #ddd;
        border-bottom: 0;
        border-radius: 5px 5px 0 0;
    }

    .ApplyList {
        width: 80%;
        margin: 5% auto;
        transition: all .6s;
        margin-top: 20px;
        opacity: 0;
        position: relative;
    }

    .show {
        margin: 5% auto;
        transition: all .6s;
        margin-top: 20px;
        opacity: 1;
        display: inline-block;
    }

    .tab-content {
        background-color: white;
        padding: 10px;
        border: 1px solid #ddd;
        border-top: 0;
    }

    .tab-pane > div {
        text-align: center;
        margin: 20px auto;
    }

    .tab-pane > div > div {
        text-align: center;
        margin: 30px auto;
    }

    .form-control {
        margin: 0 auto;
    }

    .button {
        color: #666;
        background-color: #EEE;
        border-color: #EEE;
        font-weight: 300;
        font-size: 16px;
        text-decoration: none;
        text-align: center;
        line-height: 40px;
        height: 40px;
        padding: 0 40px;
        margin: 0 10px;
        display: inline-block;
        cursor: pointer;
        border: none;
        box-sizing: border-box;
        transition-property: all;
        transition-duration: .3s;
    }

    .button-rounded {
        border-radius: 4px;
    }

    .button-pill {
        border-radius: 200px;
    }

    .button-3d {
        position: relative;
        top: 0;
        box-shadow: 0 7px 0 #bbbbbb, 0 8px 3px rgba(0, 0, 0, 0.2);
    }

    .button-3d:hover, .button-3d:focus {
        box-shadow: 0 7px 0 #bbbbbb, 0 8px 3px rgba(0, 0, 0, 0.2);
    }

    .button-3d:active, .button-3d.active, .button-3d.is-active {
        top: 5px;
        transition-property: all;
        transition-duration: .15s;
        box-shadow: 0 2px 0 #bbbbbb, 0 3px 3px rgba(0, 0, 0, 0.2);
    }

    .button-3d.button-primary {
        box-shadow: 0 7px 0 #0880d7, 0 8px 3px rgba(0, 0, 0, 0.3);
        background-color: #1B9AF7;
        border-color: #1B9AF7;
        color: #FFF;
    }

    .button-3d.button-primary:hover, .button-3d.button-primary:focus {
        box-shadow: 0 7px 0 #077ace, 0 8px 3px rgba(0, 0, 0, 0.3);
        background-color: #1B9AF7;
        border-color: #1B9AF7;
        color: #FFF;
    }

    .button-3d.button-primary:active, .button-3d.button-primary.active, .button-3d.button-primary.is-active {
        box-shadow: 0 2px 0 #0662a6, 0 3px 3px rgba(0, 0, 0, 0.2);
        background-color: #1B9AF7;
        border-color: #1B9AF7;
        color: #FFF;
    }

    .button-3d.button-highlight {
        box-shadow: 0 7px 0 #e59501, 0 8px 3px rgba(0, 0, 0, 0.3);
        background-color: #FEAE1B;
        border-color: #FEAE1B;
        color: #FFF;
    }

    .button-3d.button-highlight:hover, .button-3d.button-highlight:focus {
        box-shadow: 0 7px 0 #db8e01, 0 8px 3px rgba(0, 0, 0, 0.3);
        background-color: #FEAE1B;
        border-color: #FEAE1B;
        color: #FFF;
    }

    .button-3d.button-highlight:active, .button-3d.button-highlight.active, .button-3d.button-highlight.is-active {
        box-shadow: 0 2px 0 #b27401, 0 3px 3px rgba(0, 0, 0, 0.2);
        background-color: #FEAE1B;
        border-color: #FEAE1B;
        color: #FFF;
    }

    .showMenu {
        margin: 9px 5px;
        padding: 0 5px;
    }

    .loadBox {
        display: block;
        /*display: none;*/
        background-color: rgba(0, 0, 0, .1);
        z-index: 2;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .sk-spinner-cube-grid {
        width: 50px;
        height: 50px;
        margin: 0 auto;
    }

    .sk-spinner-cube-grid .sk-cube {
        float: left;
        width: 33%;
        height: 33%;
        -webkit-animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;
        animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;
        background-color: #2E90CF;;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(1) {
        -webkit-animation-delay: .2s;
        animation-delay: .2s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(2) {
        -webkit-animation-delay: .3s;
        animation-delay: .3s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(3) {
        -webkit-animation-delay: .4s;
        animation-delay: .4s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(4) {
        -webkit-animation-delay: .1s;
        animation-delay: .1s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(5) {
        -webkit-animation-delay: .2s;
        animation-delay: .2s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(6) {
        -webkit-animation-delay: .3s;
        animation-delay: .3s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(7) {
        -webkit-animation-delay: 0s;
        animation-delay: 0s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(8) {
        -webkit-animation-delay: .1s;
        animation-delay: .1s;
    }

    .sk-spinner-cube-grid .sk-cube:nth-child(9) {
        -webkit-animation-delay: .2s;
        animation-delay: .2s;
    }

    @-webkit-keyframes sk-cubeGridScaleDelay {
        0%,
        100%,
        70% {
            -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
        }
        35% {
            -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1);
        }
    }

    @keyframes sk-cubeGridScaleDelay {
        0%,
        100%,
        70% {
            -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
        }
        35% {
            -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1);
        }
    }
</style>

<script>
    var inject = "";
    var acquire = "";
    // Create ActiveX object according to the platform
    function InstallCert() {
        try {
            var eDiv1 = document.createElement("div");
            var eDiv2 = document.createElement("div");
            if (navigator.appName.indexOf("Internet") >= 0 || navigator.appVersion.indexOf("Trident") >= 0) {
                if (window.navigator.cpuClass == "x86") {
                    eDiv1.innerHTML = "<object id=\"acquire\" codebase=\"CryptoKit.Cypfintech.x86.cab\" classid=\"clsid:F87C344E-3D2A-45C5-BCCF-DBFFEF5668E2\" ></object>";
                    eDiv2.innerHTML = "<object id=\"inject\" codebase=\"CryptoKit.CertEnrollment.Cypfintech.x86.cab\" classid=\"clsid:1FF2FBB0-2BB1-4BC7-AC55-F1E1CB6146B5\" ></object>";
                }
                else {
                    eDiv1.innerHTML = "<object id=\"acquire\" codebase=\"CryptoKit.Cypfintech.x64.cab\" classid=\"clsid:FE9859B2-245B-4794-A9B7-6E01BA93B5CD\" ></object>";
                    eDiv2.innerHTML = "<object id=\"inject\" codebase=\"CryptoKit.CertEnrollment.Cypfintech.x64.cab\" classid=\"clsid:28923276-76FC-46B9-8CB3-96D3FF99FB19\" ></object>";
                }
            }
            else {
                eDiv1.innerHTML = "<embed id=\"acquire\" type=\"application/npCryptoKit.Cypfintech.x86\" style=\"height: 0; width: 0\">";
                eDiv2.innerHTML = "<embed id=\"inject\" type=\"application/npCryptoKit.CertEnrollment.Cypfintech.x86\" style=\"height: 0; width: 0\">";
            }
            document.body.appendChild(eDiv1);
            document.body.appendChild(eDiv2);
        }
        catch (e) {
            return;
        }
        inject = document.getElementById("inject");
        acquire = document.getElementById("acquire");

        acquire.SetSM2CSPList("CFCA CSP v3.0||CFCA Ulan CSP v4.0");
    }

    window.onload = InstallCert;

    var strContainName = "";
    var keyLen = 256;
    var cspName = "CFCA Ulan CSP v4.0";
    var keyAlgorithm = "SM2";
    var strSubjectDN = "CN=singleCert,O=ZXJ,O=CFCA TEST CA,C=CN";

    //产生 PKCS10证书申请请求
    function PKCS10() {
        try {
            //SM2单证、双证  PKCS10请求
            inject.CFCA_SetCSPInfo(keyLen, cspName);
            inject.CFCA_SetKeyAlgorithm(keyAlgorithm);
            //SM2单证
            var pkcs10Requisition = inject.CFCA_PKCS10CertRequisition(strSubjectDN, 1, 0);
            strContainName = inject.CFCA_GetContainer();
            return pkcs10Requisition;
        }catch(e){
            $(".loadBox").hide();
            return " ";
            var LastErrorDesc = inject.GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }

    //安装单证
    function InstallSingleCert(signCert) {
        try{
            // keyLen、cspName、keyAlgorithm需与申请单证时设定的一致
            // strContainName为申请单证时保存下来的密钥容器名称
            // signCert为  CA返回的证书数据
            signCert = signCert || "";
            var res1 = inject.CFCA_SetCSPInfo(keyLen, cspName);
            var res2 = inject.CFCA_SetKeyAlgorithm(keyAlgorithm);
            var res3 = inject.CFCA_ImportSignCert(1, signCert, strContainName);

            if (!res1 || !res2 || !res3) {
                var LastErrorDesc = inject.GetLastErrorDesc();
                alert(LastErrorDesc);
                return false;
            }
        }catch (e){
            var LastErrorDesc = inject.GetLastErrorDesc();
            alert(LastErrorDesc);
            return false;
        }
        return true;
    }

    // Select certificate
    function GetCertInfo(name) {
        try {
            acquire.SelectCertificate("", "", "");
            // certificate information identifier
            name.value = acquire.GetSignCertInfo("SerialNumber");
        } catch (e) {
            var LastErrorDesc = acquire.GetLastErrorDesc();
            alert(LastErrorDesc);
//            alert("未检测到见证密钥");
        }
    }

    function GetKeyID() {
        try {

            var keyID = inject.CFCA_GetKeyID();
            if (!keyID) {
                var errorDesc = inject.GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("witness").value = keyID;
        }
        catch (e) {
            var LastErrorDesc = inject.GetLastErrorDesc();
            alert(e + ": " + LastErrorDesc);
        }
    }

</script>

<body>
<div id="wrap">
    <div class="container-fluid ApplyList">
        <div class="loadBox col-sm-12">
            <div class="sk-spinner-cube-grid">
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
                <div class="sk-cube"></div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="tabbable" id="tabs">
                <ul class="nav nav-tabs">
                    <li class="tab1 complete">
                        欢迎
                    </li>
                    <li class="tab2">
                        确认用户信息
                    </li>
                    <li class="tab3">
                        经办
                    </li>
                    <li class="tab4">
                        复核
                    </li>
                    <li class="tab5">
                        审批
                    </li>
                    <li class="tab6">
                        完成
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab1 tab-pane active" id="welcome">
                        <div class="main-text">
                            <h3>见证KEY信息</h3>
                            <div class="form-group">
                                <label for="witness" class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="witness" placeholder="请插入见证KEY" readonly
                                           value="">
                                </div>
                                <input type="hidden" class="page" value="1">
                                <button class="button button-3d button-highlight button-rounded"
                                        onclick="GetCertInfo(witness)">校验
                                </button>
                            </div>
                            <div class="command">
                                <button class="button button-3d button-primary button-pill next toTab2">下一步</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab2 tab-pane" id="information">
                        <div class="main-text">
                            <h3>确认用户信息</h3>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="IdentNo" class="col-sm-3 control-label">工商登记号</label>
                                    <div class="col-sm-6 has-error forIdentNo">
                                        <input type="text" class="form-control error info" id="IdentNo" name="IdentNo"
                                               value="">
                                        <span class="help-block">请正确填写营业执照注册号内容</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Duration" class="col-sm-3 control-label">有效期限</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control info" id="Duration" name="Duration"
                                               value="60个月" readonly>
                                    </div>
                                </div>
                            </div>
                            <p>如若发现用户信息异常，请终止操作并联系客服人员。</p>

                            <input type="hidden" class="page" value="2">
                            <div class="command">
                                <button class="button button-3d button-primary button-pill previous toTab1">上一步</button>
                                <button class="saveInfo button button-3d button-primary button-pill next toTab3">下一步
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab3 tab-pane" id="handle">
                        <div class="main-text">
                            <h3>初始化经办KEY</h3>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户选择</label>
                                    <div class="col-sm-6">
                                        <select class="form-control handle" id="handler">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">经办</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control keyno" id="handleKey" readonly value="">
                                    </div>
                                </div>
                                <button class="binding button button-3d button-highlight button-rounded">生成</button>
                            </div>
                            <input type="hidden" class="page" value="3">
                            <div class="command">
                                <%--<button class="button button-3d button-primary button-pill previous toTab2">上一步</button>--%>
                                <button class="button button-3d button-primary button-pill next toTab4">下一步</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab4 tab-pane" id="review">
                        <div class="main-text">
                            <h3>初始化复核KEY</h3>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户选择</label>
                                    <div class="col-sm-6">
                                        <select class="form-control review" id="reviewer">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">复核</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control keyno" id="reviewKey" readonly>
                                    </div>
                                </div>
                                <button class="binding button button-3d button-highlight button-rounded">生成</button>
                            </div>
                            <input type="hidden" class="page" value="4">
                            <div class="command">
                                <%--<button class="button button-3d button-primary button-pill previous toTab3">上一步</button>--%>
                                <button class="button button-3d button-primary button-pill next toTab5">下一步</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab5 tab-pane" id="approve">
                        <div class="main-text">
                            <h3>初始化审批KEY</h3>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">用户选择</label>
                                    <div class="col-sm-6">
                                        <select class="form-control approve" id="approver">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">审核</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control keyno" id="approveKey" readonly>
                                    </div>
                                </div>
                                <button class="binding button button-3d button-highlight button-rounded">生成</button>
                            </div>
                            <input type="hidden" class="page" value="5">
                            <div class="command">
                                <%--<button class="button button-3d button-primary button-pill previous toTab4">上一步</button>--%>
                                <button class="button button-3d button-primary button-pill next toTab6">下一步</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab6 tab-pane" id="accomplish">
                        <div class="main-text">
                            <h3>生成确认书</h3>
                            <input type="hidden" class="page" value="6">
                            <div class="command">
                                <%--<button class="button button-3d button-primary button-pill previous toTab4">上一步</button>--%>
                                <button class="button button-3d button-primary button-pill finish">完成并打印附件</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<r:win title="证书申请确认书" id="confirmModal" width="1100" height="600"/>

<script>
    var urid ="";
    var jb = {};
    var fh = {};
    var sp = {};
    var info = {};

    $(function () {

        var closeWinFn = function () {
            $("#adjustModal").modal("hide");
            $("#editModal").modal("hide");
            $("#addModal").modal("hide");
            exeComQuery();
        };

        var refresh = function () {
            exeComQuery();
        };

        $(".showMenu").click(function () {
            jb = {};
            fh = {};
            sp = {};
            if (navigator.appName.indexOf("Internet") >= 0 || navigator.appVersion.indexOf("Trident") >= 0) {
                $(".sk-spinner-cube-grid").css("marginTop", "12%");
            } else {
                $(".sk-spinner-cube-grid").css("margin-top", "12%");
            }
            $(".loadBox").hide();
            if ($("#orgId").val()) {
                $(".ApplyList").addClass("show")
            }

            Ajax.req({
                url: '${pageContext.request.contextPath}/common/query.do',
                type:"json",
                method:"get",
                params: {
                    uc: "UC_RFP_ALLUSERANDROLEINORG_SEARCH",
                    org_id: $("#orgId").val()
                },
                ok: function(text) {
                    jsonarr = text.rows;
                    for (var i = 0; i < jsonarr.length; i++){
                        var jsonobj = jsonarr[i];
                        if (jsonobj.hasOwnProperty("role_code") && jsonobj.hasOwnProperty("user_name") && jsonobj.hasOwnProperty("user_id")){
                            var role = jsonobj["role_code"].substr(-2, 2);
                            var user_name = jsonobj["user_name"];
                            var user_id = jsonobj["user_id"];
                            switch (role){
                                case "01":
                                    jb[user_id] = user_name;
                                    break;
                                case "02":
                                    fh[user_id] = user_name;
                                    break;
                                case "03":
                                    sp[user_id] = user_name;
                                    break;
                            }
                        }else{
                            continue;
                        }
                    }
                    for(var key in jb){
                        $(".handle").append("<option value='" + key + "'>"+jb[key]+"</option>");
                    }
                    for(var key in fh){
                        $(".review").append("<option value='"+ key + "'>"+fh[key]+"</option>");
                    }
                    for(var key in sp){
                        $(".approve").append("<option value='"+ key + "'>"+sp[key]+"</option>");
                    }
                },
                err: function(text) {
                    $.RMessage.alert("消息",text.msg);
                }
            });
        });

        $('.previous').click(function () {
            $(this).parent().parent().parent().hide();
            $(this).parent().parent().parent().removeClass("active");
            $(this).parent().parent().parent().prev().fadeIn();
            $(this).parent().parent().parent().prev().addClass("active");
            $("ul>." + "tab" + $(this).attr('class').substr($(this).attr('class').length-1, 1)).addClass("complete");
            $("ul>." + $(this).parent().parent().parent().attr('class').substr(0, 4)).removeClass("complete");
        });

        $('.next').click(function () {
            for (var i = 0; i < $(".active :input").length; i++) {
                if (!$(".active :input").eq(i).val() || $(".active :input").eq(i).val().replace(/\s+/g, "") == "") {
                    $(".active :input").eq(i).focus();
                    break;
                } else {
                    $(this).parent().parent().parent().hide();
                    $(this).parent().parent().parent().removeClass("active");
                    $(this).parent().parent().parent().next().fadeIn();
                    $(this).parent().parent().parent().next().addClass("active");
                    $("ul>." + "tab" + $(this).attr('class').substr($(this).attr('class').length-1, 1)).addClass("complete");
                    $("ul>." + $(this).parent().parent().parent().attr('class').substr(0, 4)).removeClass("complete");
                }
            }
        });

        $(".error").keyup(function () {
            if($(".error").val().length > 32 || $(".error").val() == ""){
                $(".error").val("");
                $(".error").parent().addClass("has-error");
                $(".error").next().css('display', 'inline-block');
            }else {
                $(".error").parent().removeClass("has-error");
                $(".error").next().css('display', 'none');
            }
        });

        $('.saveInfo').click(function saveInfo() {
            $.each($('.info'), function () {
                info[$(this)[0].name] = $(this).val();
            });
        });

        $('.binding').click(function () {
            var userid = "";

            $(".loadBox").show();
            var p10 = PKCS10();

            if(p10 == " "){
                alert("检测Key出现异常，请检查Key并重新尝试");
                $(".loadBox").hide();
                return;
            }else {
                info['PK10'] = p10;
            }

            pageno =  $(this).parent().parent().find(".page").val();
            info['witnesskeynum'] = $("#witness").val();

            switch (pageno){
                case "3":
                    userid = $("#handler").val();
                    break;
                case "4":
                    userid = $("#reviewer").val();
                    break;
                case "5":
                    userid = $("#approver").val();
                    break;
            }

            Ajax.req({
                url: "${pageContext.request.contextPath}/keymgmt/certapplydownload.do",
                params: {
                    jsondata: JSON.stringify(info),
                    urid: urid,
                    userid: userid,
                    pageno: pageno,
                    orgid: $("#orgId").val()
                },
                ok: function (text) {
                    if (!text.hasOwnProperty("urid") || !text.hasOwnProperty("cert") || !text.hasOwnProperty("SN")) {
                        $.RMessage.alert("消息", "申请证书失败！");
                        return;
                    } else {
                        urid = text["urid"];
                        var result = InstallSingleCert(text["cert"]);
                        sn = text["SN"];
                        $(".loadBox").hide();

                        switch (pageno){
                            case "3":
                                $(handleKey).val(sn);
                                break;
                            case "4":
                                $(reviewKey).val(sn);
                                break;
                            case "5":
                                $(approveKey).val(sn);
                                break;
                        }
                        if (result) {
                            $.RMessage.alert("消息", "KEY初始化成功！\n 请确认拔出已初始化Key！", refresh);
                        }else {
                            $.RMessage.alert("消息", "证书写入失败！\n 请检查Key连接并重新初始化该Key！", refresh);
                        }
                    }
                },
                err: function (text) {
                    $(".loadBox").hide();
                    $.RMessage.alert("消息", text.msg);

                    if (text.msg == "请确保插入正确的见证Key!"){
                        backtowitpage();
                    }
                }
            });
        });

        var backtowitpage = function(){
            $(this).parent().parent().parent().hide();
            $(this).parent().parent().parent().removeClass("active");
            $("#welcome").fadeIn();
            $("#welcome").addClass("active");
            $("ul>." + $(this).parent().parent().parent().attr('class').substr(0, 4)).removeClass("complete");
        }

        $('.finish').click(function () {
            var url = "${pageContext.request.contextPath}/rfp/keymgmt/keyinitconfirm.jsp?urid="+urid+"&keynum="+$("#witness").val();
            $("#confirmModal").RWin('createWin', url);
        });

    });
</script>
</body>
