	<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
		<%@page language="java" contentType="text/html; charset=UTF-8"%>
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="utf-8">
		<title>Sass平台</title>


		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css" />
		<jsp:include page="/common/include.jsp" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>

		</head>
		<body class="body_col_o">
		<div class="top_bar" id="top">
		<span class="title">企业资金管理云Saas平台</span>
		<div class="person">
		<img src="<%=request.getContextPath()%>/images/person.png" />
		<span class="person_name">Jone</span>
		<i class="fa fa-angle-down" aria-hidden="true"></i>
		</div>
		<div class="message" >
		<img src="<%=request.getContextPath()%>/images/message.png" />
		</div>
		</div>
		<div class="menu_bar">
		<span class="company_name">上海钜策科技有限公司</span>
		<span class="line"></span>
		<ul class="menu_list">
		<li class="active">首页</li>
		<li>审批管理</li>
		<li>交易信息</li>
		</ul>
		<span class="login_time">上次登录时间 2017-01-24 14:20:21</span>
		</div>
		<div class="main_context">
		<div class="main_inner">
		<div class="block_title_wrap">
		<span class="block_title">审批管理</span>
		</div>
		<div class="operation_block">
		<div>
		审批类型
		<span class="active">单笔转账</span>
		<span>批量转账</span>
		</div>
		<div>
		审批状态
		<span class="active">全部</span>
		<span>审批中</span>
		<span>已审批</span>
		<span>已拒绝</span>
		</div>
		<div class="time_block">
		申请时间
		<div>
		<r:calendar id="t1" name="t1" style="green" showOpts="yyyy-MM-dd"/>
		</div>
		<div class="time_line"></div>
		<div>
		<r:calendar id="t2" name="t2" style="green" showOpts="yyyy-MM-dd"/>
		</div>
		<button>搜索</button>
		</div>
		</div>
		<div class="grid_wrap">
		<r:grid id="g1" dataUrl="http://localhost:8082/webx/js/data.json"  colModel="{name : 'code',index : 'code',sortable:false},{name : 'createdby',index : 'createdby',sortable:false},{name : 'dataRight',index : 'dataRight',sortable:false},{name : 'isactive',index : 'isactive',sortable:false},{name : 'lastmodifiedon',index : 'lastmodifiedon',sortable:false}" colNames="'标题','标题','标题','标题','标题'" multiSelect="false" isDefine="[test,'支付']"></r:grid>

		</div>
		</div>
		</div>
		<a class="be_Top" href="#top">
		<img src="<%=request.getContextPath()%>/images/top.png">
		</a>
		</body>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/grid.js"></script>
		<script>
		function test(){
		alert('支付去~');
		}
		</script>
		</html>