<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant"  %>
<%--<%@ page import="com.ceying.chx.dto.user.SysUserDto"  %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    int tenantid = 0;
    if(currUser!=null){
        tenantid = currUser.getTenantId();
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Saas平台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/account.css"/>
    <jsp:include page="/common/include.jsp"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/account.js"></script>
</head>
<body class="body_col_o">

<jsp:include page="/common/navigation.jsp"/>

<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">账户管理</span>
        </div>
        <div class="tab_account">
             <button  class="active">内部账户</button><button>交易对手</button>
        </div>
        <div class="tab_one">
            <div class="pay_account clearfix">
                    <div class="account_list col-xs-10" id="pay_account">
                    </div>
                    <div class="account_operate_btn col-xs-2">
                        <div>
                            <r:buttonList>
                                <r:button text="新增" iconCls="add-o" onClick="payadd" />
                                <r:button id="pay_btn" text="更多" iconCls="more" onClick="paymore" />
                            </r:buttonList>
                        </div>
                    </div>
            </div>
            <div class="bank_account clearfix">
                    <div class="account_list col-xs-10" id="bank_account">
                    </div>
                    <div class="account_operate_btn col-xs-2">
                        <div>
                            <r:buttonList>
                                <r:button text="新增" iconCls="add-o" onClick="bankadd" />
                                <r:button id="bank_btn" text="更多" iconCls="more" onClick="bankmore" />
                            </r:buttonList>
                        </div>
                    </div>
            </div>
            <div class="internet_account clearfix">
                    <div class="account_list col-xs-10" id="internet_account">
                    </div>
                    <div class="account_operate_btn col-xs-2">
                        <div>
                            <r:buttonList>
                                <r:button text="新增" iconCls="add-o" onClick="internetadd" />
                                <r:button id="internet_btn" text="更多" iconCls="more" onClick="internetmore" />
                            </r:buttonList>
                        </div>
                    </div>
            </div>
        </div>
        <div class="tab_two">
                <jsp:include page="/admin/counterpartyaccounts/counterpartyaccounts.jsp"/>
        </div>
    </div>
</div>
<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />


<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
<script type="text/javascript">
$(function(){
	$(".menu_list li").removeClass("active");
    $("#accountManage").addClass("active");
	pay_account();
	bank_account();
	internet_account();
});

//支付宝
function pay_account(){
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	rows: 10,
	    	accounttype: '3'
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#pay_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
	        if(length>6){
	     	   length = 6;
	        }
	        for(var i=0; i< length ; i++){
	        	 str = str + 		'<li class="col-xs-6">';
	        	 str = str + 		  '<div class="card_wrap" urid="'+rows[i].urid+'" id="pay_data'+i+'">';
	        	 str = str + 		     '<img src="<%=request.getContextPath()%>/images/pay.png">';
	        	 str = str + 		     '<span title="'+rows[i].bankaccountname+'">名称：'+rows[i].bankaccountname+'</span>';
	        	 str = str + 		     '<span>账户：'+rows[i].bankaccountnumber+'</span>';
	        	 str = str + 		     '<i class="fa fa-times" aria-hidden="true"></i>';
	        	 str = str + 		   '</div>';
	        	 str = str + 		'</li>';
	        }
	        str = str +    '</ul>';
	        pay_account.append(str);
	        if(data.rows<=6){
	     	    $('#pay_btn').RButton('setInvisible',true);
	        }
	      	//显示删除图标
	        showClose();
	        //实现onclick
	        $('.card_wrap .fa').unbind('click');
	        $('.card_wrap .fa').bind('click',function(ev){
	        	var ev = ev || window.event;
	        	var urid = $(this).parents('.card_wrap').attr('urid');
	        	del(urid);
	        	ev.stopPropagation();
	        })
	        for(var i=0; i< length ; i++){
	        	$('#pay_data'+i).bind('click',function(ev){
		        	var ev = ev || window.event;
		        	var urid = $(this).attr('urid');
		        	payedit(urid);
		        	ev.stopPropagation();
		        })
	        }
	    },
	    err: function(text){
	        $.RMessage.alert("消息", text.mes);
	    }
		});
}

//银行账户
function bank_account(){
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	rows: 10,
	    	accounttype: '1'
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#bank_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
	        if(length>6){
	     	   length = 6;
	        }
	        for(var i=0; i< length ; i++){
	        	 str = str + 		'<li class="col-xs-6">';
	        	 str = str + 		  '<div class="card_wrap" urid="'+rows[i].urid+'" id="bank_data'+i+'">';
	        	 str = str + 		     '<img src="<%=request.getContextPath()%>/images/china.png">';
	        	 str = str + 		     '<span>名称：'+rows[i].bankaccountname+'</span>';
	        	 str = str + 		     '<span>账户：'+rows[i].bankaccountnumber+'</span>';
	        	 str = str + 		     '<i class="fa fa-times" aria-hidden="true"></i>';
	        	 str = str + 		   '</div>';
	        	 str = str + 		'</li>';
	        	 
	        	 
	        }
	        str = str +    '</ul>';
	        pay_account.append(str);
	        if(data.rows.length<=6){
	     	   $('#bank_btn').RButton('setInvisible',true);
	        }
	      	//显示删除图标
	        showClose();
	        //实现onclick
	        $('.card_wrap .fa').unbind('click');
	        $('.card_wrap .fa').bind('click',function(ev){
	        	var ev = ev || window.event;
	        	var urid = $(this).parents('.card_wrap').attr('urid');
	        	del(urid);
	        	ev.stopPropagation();
	        })
	        for(var i=0; i< length ; i++){
	        	$('#bank_data'+i).bind('click',function(ev){
		        	var ev = ev || window.event;
		        	var urid = $(this).attr('urid');
		        	bankedit(urid);
		        	ev.stopPropagation();
		        })
	        }
	    },
	    err: function(text){
	        $.RMessage.alert("消息", text.mes);
	    }
		});
}

//网商银行
function internet_account(){
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	rows: 10,
	    	accounttype: '2'
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#internet_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
	        if(length>6){
	     	   length = 6;
	        }
	        for(var i=0; i< length ; i++){
	        	 str = str + 		'<li class="col-xs-6">';
	        	 str = str + 		  '<div class="card_wrap" urid="'+rows[i].urid+'" id="internet_data'+i+'">';
	        	 str = str + 		     '<img src="<%=request.getContextPath()%>/images/agriculture.png">';
	        	 str = str + 		     '<span>名称：'+rows[i].bankaccountname+'</span>';
	        	 str = str + 		     '<span>账户：'+rows[i].bankaccountnumber+'</span>';
	        	 str = str + 		     '<i class="fa fa-times" aria-hidden="true"></i>';
	        	 str = str + 		   '</div>';
	        	 str = str + 		'</li>';
	        }
	        str = str +    '</ul>';
	        pay_account.append(str);
	        if(data.rows.length<=6){
	     	   $('#internet_btn').RButton('setInvisible',true);
	        }
	        //显示删除图标
	        showClose();
	        //实现onclick
	        $('.card_wrap .fa').unbind('click');
	        $('.card_wrap .fa').bind('click',function(ev){
	        	var ev = ev || window.event;
	        	var urid = $(this).parents('.card_wrap').attr('urid');
	        	del(urid);
	        	ev.stopPropagation();
	        })
	        for(var i=0; i< length ; i++){
	        	$('#internet_data'+i).bind('click',function(ev){
		        	var ev = ev || window.event;
		        	var urid = $(this).attr('urid');
		        	internetedit(urid);
		        	ev.stopPropagation();
		        })
	        }
	    },
	    err: function(text){
	        $.RMessage.alert("消息", text.mes);
	    }
	});
}

function refresh(){
	pay_account();
	bank_account();
	internet_account();
}

var closeWinFn = function(){
    $("#addModal").modal("hide");
    $("#editModal").modal("hide");
    refresh();
}

//新增
function payadd() {
    var url = "${pageContext.request.contextPath}/admin/account/payaccountadd.jsp?tenantid="+'<%=tenantid%>';
    $("#addModal").RWin("createWin", url);
}

function bankadd() {
    var url = "${pageContext.request.contextPath}/admin/account/bankaccountadd.jsp?tenantid="+'<%=tenantid%>';
    $("#addModal").RWin("createWin", url);
}

function internetadd() {
    var url = "${pageContext.request.contextPath}/admin/account/internetaccountadd.jsp?tenantid="+'<%=tenantid%>';
    $("#addModal").RWin("createWin", url);
}

//删除
function del(urid){
	var pksArray = new Array();
    pksArray.push(urid);
    if(pksArray.length<=0){
    	$.RMessage.alert("消息", "请选择删除记录！");
    }
    $.RMessage.confirm("消息", "是否确认删除！", function(){
        Ajax.req({
            url: "${pageContext.request.contextPath}/account/delete.do",
            method:'post',
            type:'json',
            params: {
                id: pksArray.join(","),
                tenantid: <%=tenantid%>
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    });
}

//修改
function payedit(urid){
    if(urid==''||urid==null){
        $.RMessage.alert("消息", "请选择一条操作记录");
        return;
    }
    var url = "${pageContext.request.contextPath}/admin/account/payaccountadd.jsp?urid="+urid+"&tenantid="+'<%=tenantid%>';
    $("#editModal").RWin("createWin", url);
}


function bankedit(urid){
    if(urid==''||urid==null){
        $.RMessage.alert("消息", "请选择一条操作记录");
        return;
    }
    var url = "${pageContext.request.contextPath}/admin/account/bankaccountadd.jsp?urid="+urid+"&tenantid="+'<%=tenantid%>';
    $("#editModal").RWin("createWin", url);
}


function internetedit(urid){
    if(urid==''||urid==null){
        $.RMessage.alert("消息", "请选择一条操作记录");
        return;
    }
    var url = "${pageContext.request.contextPath}/admin/account/internetaccountadd.jsp?urid="+urid+"&tenantid="+'<%=tenantid%>';
    $("#editModal").RWin("createWin", url);
}


//更多
function paymore(){
	window.location.href='${pageContext.request.contextPath}/admin/account/accountmore.jsp?type='+'pay';
}

function bankmore(){
	window.location.href='${pageContext.request.contextPath}/admin/account/accountmore.jsp?type='+'bank';
}

function internetmore(){
	window.location.href='${pageContext.request.contextPath}/admin/account/accountmore.jsp?type='+'internet';
}



</script>
</html>