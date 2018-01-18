<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    int tenantid = currUser.getTenantId();
    String username = currUser.getUserName();
    String orgid = currUser.getOrgId();
    String userid = currUser.getUserId();
    String usershortname = username;
    if(username.length()>3){
        usershortname = username.substring(username.length()-2);
    }
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/quote/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/index.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/reset.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/index.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/CYUI/bootstrap/assets/css/RUI.all.css" rel="stylesheet" type="text/css"  />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CYUI/themes/default/css/treegrid.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/quote/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/js/RUI.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jqGrid/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/bootstrap/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/grid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/CYUI/themes/default/js/treegrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/adapter.js"></script>
</head>
<body>
<style>
    .dianji{
        position: relative;
    }
    .new{
        width: 46px;
        height:46px;
        background: url("../image/img/new.png");
        position: absolute;
        top: -2px;
        right: 0;
    }
    #warning{
        width: 314px;
        position: absolute;
        top: 44px;
        left: 0;
        background-color: #F8F8F9;
        display: none;
    }
    #warning>li>p{
        margin: 5px;
        text-indent: 4em;
        cursor: pointer;
    }
    #warning>li>p:hover{
        box-shadow: 0 3px 5px #EAECEF;
        border: 1px solid #D9DBDE;
        border-radius: 3px;
    }
</style>
<div class="task_wrap">
    <div class="task_list">
        <div class="user_info">
            <div class="user_img">
                <%=usershortname%>
            </div>
            <div class="user_des">
                <ul>
                    <li></li>
                    <li class="name"><%=username%></li>
                </ul>
            </div>
        </div>
        <div class="task_nav">
            <ul class="auto-menu">
                <%--
                <li class="dianji" page-href="/workflow/workbench/todo/accountTodoTaskIndex.jsp" >
                    <span><img src="../image/img/to-dos(g).png" alt=""></span>
                    <span>应付账款待办任务</span>
                </li>
                <li class="dianji" page-href="/workflow/workbench/todo/agreementTodoTaskIndex.jsp" >
                    <span><img src="../image/img/to-dos(g).png" alt=""></span>
                    <span>三方协议待办任务</span>
                </li>
                <li class="dianji" page-href="/workflow/workbench/hist/doneTask.jsp">
                    <span><img src="../image/img/done(g).png" alt=""></span>
                    <span>已办任务</span>
                </li>
                <li class="dianji" page-href="/workflow/workbench/delegate/delegate.jsp">
                    <span><img src="../image/img/entrust(g).png" alt=""></span>
                    <span>委托</span>
                </li>
                <li class="dianji" page-href="/workflow/workbench/myprocess/finished.jsp">
                    <span><img src="../image/img/request(g).png" alt=""></span>
                    <span>未完成请求</span>
                </li>
                <li class="dianji" page-href="/workflow/workbench/myprocess/unfinished.jsp">
                    <span><img src="../image/img/requested(g).png" alt=""></span>
                    <span>已完成请求</span>
                </li>--%>
            </ul>
        </div>
        <div class="exit">
            <a id="logout" target="_parent" href="${pageContext.request.contextPath}/usermanage/user/logout.do"><img src="../image/img/end.png" alt="退出平台"></a>
        </div>
    </div>
    <div class="ad_block"><span class="close_ad"></span><p class="ad_block_text">策&nbsp;赢&nbsp;网&nbsp;络&nbsp;&nbsp;&nbsp;&nbsp;科&nbsp;技&nbsp;改&nbsp;变&nbsp;世&nbsp;界</p>
        <p class="ad_block_text">Technology Reboots The World</p></div>
    <div class="work_block">
        <iframe name="work_block_win" id="work_block_win" frameborder="no" src=""></iframe>
    </div>
    <div class="module">
        <div class="each_module notice">
            <img class="region" src="../image/img/region.png" alt="region">
            <img class="each_module_icon" src="../image/img/news.png" alt="news">
            <div class="each_module_text">今日公告</div>
            <img class="right" src="../image/img/right.png" alt="right">
            <ul id="notice">

            </ul>
        </div>
        <div class="each_module handbook">
            <img class="region" src="../image/img/region.png" alt="region">
            <img class="each_module_icon" src="../image/img/guide.png" alt="guide">
            <div class="each_module_text">新手指南</div>
            <img class="right" src="../image/img/right.png" alt="right">
        </div>
        <div class="each_module notice">
            <img class="region" src="../image/img/region.png" alt="region">
            <img class="each_module_icon" src="../image/img/warning.png" alt="warning">
            <div class="each_module_text">预警</div>
            <img class="right" src="../image/img/right.png" alt="right">
            <%--<ul id="warning">
                <%if(objectRowSet.getRowCount() < 1){%>
                <li>无预警信息</li>
                <%}else{%>
                <%for(int i=0; i<objectRowSet.getRowCount(); i++){%>
                            <%
                                String[] fieldArray = new String[]{"userid","warningobjid", "isannul"};
                                String[] valueArray = new String[]{userid, objectRowSet.getValue(i, "urid"), "0"};
                                ComRowSet ruleRowSet = commonQueryController.search("UC_BASE_WARNINGMESSAGE_RULE_STATISTICS",fieldArray,valueArray);
                                for(int j=0; j<ruleRowSet.getRowCount(); j++){
                            %>
                    <li>
                        <p onclick="showList('<%=ruleRowSet.getValue(j, "urid")%>')">
                            <%=ruleRowSet.getValue(j, "name")%>
                            <span><%=ruleRowSet.getValue(j, "count") + "笔"%></span>
                        </p>
                    </li>
                <%}%>
                <%}}%>
            </ul>--%>
        </div>
    </div>
</div>
<r:win title="详情" id="detailModal" width="850" height="500"/>
<r:win title="更多公告" id="moreNoticeModal" width="1200" height="500"/>
<r:win title="更多预警" id="moreWarningModal" width="1200" height="500"/>
<r:win title="创建企业" id="createTenantModal" width="900" height="500"/>
<r:win title="待办事项" id="newpage"  width="900" height="500"/>
<r:win title="添加委托关系" id="addModal" width="900" height="500"></r:win>
<r:win title="委托流程增加（在此只能增加）" id="setupModal" width="900" height="500"></r:win>
<r:win title="查看委托流程" id="viewModal" width="900" height="500" ></r:win>
<r:win title="预警撤销信息" id="warningMessage"  maxable="true"/>
</body>
</html>

<script type="text/javascript">
    var rootPath = getRootPath_web();

    window.onload = function () {
        var userid = <%=userid%>;
        var parentCode = 'userManager';

        /*Ajax.req({
         url: '${pageContext.request.contextPath}/sysmenu/submenu.do',
         type: "json",
         method: "POST",
         async: false,
         params: {
         userid:userid,
         parentCode:parentCode
         },
         ok: function (data) {
         var submenuList = data.data;
         console.log(submenuList);
         var appendStr = "";
         for (var i = 0; i < submenuList.length; i++) {
         appendStr = appendStr + '<li page-href="'+submenuList[i].attribute1+'" class="dianji" ><span><img src="../image/img/to-dos(g).png">'+submenuList[i].menuName+'</span></li>';

         }

         $('.auto-menu').empty();
         $('.auto-menu').append(appendStr);
         $('.auto-menu li').eq(0).addClass("active");
         if(appendStr){
         window.frames['work_block_win'].location.href = getRootPath_web()+ $('.task_nav li').eq(0).attr('page-href');
         }
         var src=$('.auto-menu').find('.active').find('span').find('img').attr("src")+"";
         src=src.substring(0,src.length-7)+"(r).png";
         $('.auto-menu').find('.active').find('span').find('img').attr("src",src);
         },
         err: function (text) {
         $.RMessage.alert("消息", text.msg);
         }
         })*/
    };

    function payableIntentionList(queryuc,operationflag,lastoperationflag){
        Ajax.req({
            url: '${pageContext.request.contextPath}/common/query.do',
            type:"json",
            async:false,
            method:"get",
            params: {
                uc: queryuc,
                operationflag: operationflag,
                lastoperationflag: lastoperationflag
            },
            ok: function(text) {
                if (text.rows.length > 0) {
                    aasyncflag=true;
                }else{
                    aasyncflag=false;
                }

            },
            err: function(text) {
                alert("消息："+text);
            }
        });
        return aasyncflag;
    }
    function todoTaskSimple(){
        var todoTaskSimpleflag = false;
        Ajax.req({
            url: '${pageContext.request.contextPath}/common/query.do',
            type:"json",
            method:"get",
            async:false,
            params: {
                uc: 'UC_WORKFLOW_TODOTASK_STATISTICQUERY',
                userid:"<%=userid%>"
            },
            ok: function(text) {
                if(text.rows.length>0){
                    todoTaskSimpleflag =true;
                }else{
                    todoTaskSimpleflag =false;
                }
            },
            err: function(text) {
                alert("消息："+text);
            }
        });
        return todoTaskSimpleflag;
    }
    /* function agreementtodo(){
     var agreementflag = false;
     Ajax.req({
     url: '${pageContext.request.contextPath}/common/query.do',
     type:"json",
     method:"get",
     async:false,
     params: {
     uc: 'UC_RFP_TRIPARTITEAGREEMENT_CHXTODOTASK_COUNT_SEARCH',
     org_id:"<%=orgid%>"
     },
     ok: function(text) {
     if(text.rows.length>0){
     agreementflag =true;
     }else{
     agreementflag =false;
     }
     },
     err: function(text) {
     alert("消息："+text);
     }
     });
     return agreementflag;
     }*/


    function createNewpageWin(ID){
        var url = "${pageContext.request.contextPath}/workflow/workbench/todo/todoTask.jsp?processid="+ID;
        $("#newpage").RWin('createWin',url);
    }
    function createAddModalWin(){
        var url = "${pageContext.request.contextPath}/workflow/client/delegate/delegateadd.jsp";
        $("#addModal").RWin('createWin',url);
    }
    function createSetupModalWin(data){
        var url = "${pageContext.request.contextPath}/workflow/client/delegate/delegatesetup.jsp?delegateId="+data[0].dbid;
        $("#setupModal").RWin('createWin',url);
    }
    function createViewModalWin(data){
        var url = "${pageContext.request.contextPath}/workflow/workbench/delegate/delegateview.jsp?delegateId="+data[0].dbid;
        $("#viewModal").RWin('createWin',url);
    }
    var closeWinFn = function(){
        $("#detailModal").modal("hide");
        $("#moreNoticeModal").modal("hide");
        $("#createTenantModal").modal("hide");
    };
    $(function(){



        createTenant();
    })

    var createTenant = function(){
        var tenantid = "<%=tenantid%>";
        if(tenantid == "9999"){
            var url = "${pageContext.request.contextPath}/bizframe/jsp/createTenant.jsp";
            $("#createTenantModal").RWin("createWin", url);
        }
    }

    var getnoticedetail = function(self){
        var urid = self.id;
        var url = "${pageContext.request.contextPath}/base/system/notice/indexnoticedetail.jsp?urid=" + urid;
        $("#detailModal").RWin("createWin", url);
    }

    var nofind = function(){
        var img = document.getElementById("logo");
        img.src = "${pageContext.request.contextPath}/workflow/designer/images/logo.jpg";
        img.onerror = null;
    }

    /* var moreNotice = function (){
     var createdonstart = "createdonstart=" + "";
     var createdonend = "&createdonend=" + "";
     var condition = createdonstart + createdonend;
     var url = "${pageContext.request.contextPath}/base/system/notice/indexnotice.jsp?" + condition;
     $("#moreNoticeModal").RWin("createWin", url);
     }*/


    var getWarningDetail = function(self){
        var userid = '<%=userid%>';
        var urid = self.id;
        var url = "${pageContext.request.contextPath}/base/warning/warningmessage/warningmessage.jsp?userid="+userid+"&warningruleid="+urid+"&isannul=0";
        $("#detailModal").RWin('createWin',url);
    }

    var moreWarning = function (){
        var url = "${pageContext.request.contextPath}/base/warning/warningmessage/warningmessageindex.jsp";
        $("#moreWarningModal").RWin("createWin", url);
    }

    var showList = function(warningruleid){
        debugger;
        var url = "${pageContext.request.contextPath}/base/warning/warningmessage/warningmessage.jsp?warningruleid="+warningruleid+"&isannul=0";
        $("#warningMessage").RWin('createWin',url);
    }
    $(function(){
        $("ul").on('mouseover mouseout','.dianji',function (e) {
            if(e.type =="mouseover" ){
                var src=$(this).find('span').find('img').attr("src")+"";
                src=src.substring(0,src.length-7)+"(r).png";
                $(this).find('span').find('img').attr("src",src);
            }else if(e.type =="mouseout"){
                if($(this).hasClass("active")){
                    var src=$(this).find('span').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(r).png";
                    $(this).find('span').find('img').attr("src",src);

                }else{
                    var src=$(this).find('span').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(g).png";
                    $(this).find('span').find('img').attr("src",src);
                }
            }
        });
        $('.dianji').hover(
            function(){
                var src=$(this).find('span').find('img').attr("src")+"";
                src=src.substring(0,src.length-7)+"(r).png";
                $(this).find('span').find('img').attr("src",src);
            },
            function(){
                if($(this).hasClass("active")){
                    var src=$(this).find('span').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(r).png";
                    $(this).find('span').find('img').attr("src",src);

                }else{
                    var src=$(this).find('span').find('img').attr("src")+"";
                    src=src.substring(0,src.length-7)+"(g).png";
                    $(this).find('span').find('img').attr("src",src);
                }
            }
        );

        var divHtml = $(window.frames["work_block_win"].document).find(".middle-box").html();
        var msg1 = "<h1>暂无待办任务</h1>";
        var msg2 = "<h1>暂无审批信息</h1>";
        var msg3 = "<h1>暂无签约信息</h1>";

        var newTimer = setInterval(function () {
            if(divHtml == msg1 || divHtml == msg2 || divHtml == msg3){
                console.log(111);
                $(".active>.new").removeClass("new");
            }
        },1000)

        $(".notice").click(function () {
            $("#warning").toggle();
        })
    });
</script>