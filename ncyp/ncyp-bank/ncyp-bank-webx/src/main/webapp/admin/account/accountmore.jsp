<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant"  %>
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
    <jsp:include page="/common/include.jsp"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/account_more.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/account_more.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/account.js"></script>
</head>
<body class="body_col_o">

<jsp:include page="/common/navigation.jsp"/>

<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title">全部账户</span>
            <div class="block_search">
             	<input id="key" name="key" type="text" placeholder="名称/账号"><i class="fa fa-search" aria-hidden="true" onclick="getData();"></i>
            	<input type="hidden" id="page" name="page"/>
           </div>
        </div>
        <div class="pay_account clearfix" id="pay_div">
             <div class="account_list col-xs-10" id="pay_account">
             </div>
             <div class="account_operate_btn col-xs-2">
                 <div>
                     <r:buttonList>
                         <r:button text="新增" iconCls="add-o" onClick="payadd" />
                     </r:buttonList>
                 </div>
             </div>
        </div>
        <div class="bank_account clearfix" id="bank_div">
             <div class="account_list col-xs-10" id="bank_account">
             </div>
             <div class="account_operate_btn col-xs-2">
                 <div>
                     <r:buttonList>
                         <r:button text="新增" iconCls="add-o" onClick="bankadd" />
                     </r:buttonList>
                 </div>
             </div>
        </div>
        <div class="internet_account clearfix" id="internet_div">
             <div class="account_list col-xs-10" id="internet_account">
             </div>
             <div class="account_operate_btn col-xs-2">
                 <div>
                     <r:buttonList>
                         <r:button text="新增" iconCls="add-o" onClick="internetadd" />
                     </r:buttonList>
                 </div>
             </div>
        </div>
        <div class="account_page">
        	<div style="width: 350px;">
	            <i class="fa fa-angle-double-left" aria-hidden="true" onclick="indexPage();"></i>
	            <i class="fa fa-angle-left" aria-hidden="true" onclick="upPage();"></i>
	               	跳转到<input value="1" type="text" id="curpage" name="curpage"> 
	               	共 <span id="totalpage"></span> 页 <span id="total"></span> 条
	            <i class="fa fa-angle-right" aria-hidden="true" onclick="nextPage();"></i>
	            <i class="fa fa-angle-double-right" aria-hidden="true" onclick="endPage();"></i>
	        </div>
	    </div>
    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
<r:win title="新增" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
</body>
<script type="text/javascript">

//每页显示条数
var pageSize = 10;

$(function(){
	$(".menu_list li").removeClass("active");
    $("#accountManage").addClass("active");
    
    //数据选择
    getData();
    
});


//数据选择
function getData(){
	if('${param.type}'=='pay'){
    	pay_account();
    	$("#pay_div").show();
    	$("#bank_div").hide();
    	$("#internet_div").hide();
    }else if('${param.type}'=='bank'){
    	bank_account();
    	$("#pay_div").hide();
    	$("#bank_div").show();
    	$("#internet_div").hide();
    }else if('${param.type}'=='internet'){
    	internet_account();
    	$("#pay_div").hide();
    	$("#bank_div").hide();
    	$("#internet_div").show();
    }
}

//支付宝
function pay_account(){
	
	var curpage = parseInt($('#curpage').val());
	var totalpage = parseInt($('#totalpage').text());
	if(curpage<=0){
		curpage=1;
	}
	
	if(curpage>totalpage&&totalpage!=''){
		curpage = totalpage;
	}
	
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	accounttype: '3',
	    	rows: pageSize,
	    	page: curpage,
	    	key: $('#key').val()
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#pay_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var total = data.total;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
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
	        //页数赋值
	        var totalPages = Math.ceil(total / pageSize);
	        $('#total').text(total);
	        $('#totalpage').text(totalPages);
	        if(curpage>totalPages){
	        	curpage = totalPages;
	        }
	        if(curpage<=0){
	        	curpage = 1;
	        }
	        $('#curpage').val(curpage);
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
	
	var curpage = parseInt($('#curpage').val());
	var totalpage = parseInt($('#totalpage').text());
	if(curpage<=0){
		curpage=1;
	}
	
	if(curpage>totalpage&&totalpage!=''){
		curpage = totalpage;
	}
	
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	accounttype: '1',
	    	rows: pageSize,
	    	page: curpage,
	    	key: $('#key').val()
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#bank_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var total = data.total;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
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
	      	//页数赋值
	        var totalPages = Math.ceil(total / pageSize);
	        $('#total').text(total);
	        $('#totalpage').text(totalPages);
	        if(curpage>totalPages){
	        	curpage = totalPages;
	        }
	        if(curpage<=0){
	        	curpage = 1;
	        }
	        $('#curpage').val(curpage);
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
	
	var curpage = parseInt($('#curpage').val());
	var totalpage = parseInt($('#totalpage').text());
	if(curpage<=0){
		curpage=1;
	}
	
	if(curpage>totalpage&&totalpage!=''){
		curpage = totalpage;
	}
	
	Ajax.req({
	    url: "${pageContext.request.contextPath}/account/page.do",
	    type: "json",
	    method: "post",
	    params: {
	    	tenantid: <%=tenantid%>,
	    	accounttype: '2',
	    	rows: pageSize,
	    	page: curpage,
	    	key: $('#key').val()
	    },
	    ok: function(data) {
	 	   //console.log(data);
	        var pay_account = $("#internet_account");
	        pay_account.empty();
	        var rows = data.rows;
	        var total = data.total;
	        var str = "";
	        str = str + 	   '<ul>';
	        var length = data.rows.length;
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
	      	//页数赋值
	        var totalPages = Math.ceil(total / pageSize);
	        $('#total').text(total);
	        $('#totalpage').text(totalPages);
	        if(curpage>totalPages){
	        	curpage = totalPages;
	        }
	        if(curpage<=0){
	        	curpage = 1;
	        }
	        $('#curpage').val(curpage);
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

function indexPage(){
	$('#curpage').val('1');
	getData();
}

function upPage(){
	$('#curpage').val(parseInt($('#curpage').val())-1);
	getData();
}

function nextPage(){
	$('#curpage').val(parseInt($('#curpage').val())+1);
	getData();
}

function endPage(){
	$('#curpage').val(parseInt($('#totalpage').text()));
	getData();
}

</script>
</html>