    <%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
        <%@page language="java" contentType="text/html; charset=UTF-8"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sass平台</title>

        <jsp:include page="/common/include.jsp" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wrap.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/RUI/themes/green/combo.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/RUI/themes/green/combogrid.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/My97DatePicker/WdatePicker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/form.js"></script>
    </head>
    <body class="body_col_wrap">
        <div class="top_bar">
        <span class="title">企业资金管理云Saas平台</span>
        <div class="person">
        <img src="images/person.png" />
        <span class="person_name">Jone</span>
        <i class="fa fa-angle-down" aria-hidden="true"></i>
        </div>
        <div class="message" >
        <img src="images/message.png" />
        </div>
        </div>
        <div class="menu_bar" style="margin-top: 10px;">
        <span class="company_name">上海钜策科技有限公司</span>
        <span class="line"></span>
        <ul class="menu_list">
        <li class="active">首页</li>
        <li>审批管理</li>
        <li>交易信息</li>
        </ul>
        <span class="login_time">上次登录时间 2017-01-24 14:20:21</span>
        </div>
        <div class="step_guidance">
              <span class="step active">1</span>单笔转账录入<span class="step_line"></span>
              <span class="step">2</span>单笔转账确认<span class="step_line"></span>
              <span class="step">3</span>单笔转账结果
        </div>
        <div class="main_context">
            <div class="main_inner">
                <div class="block_title_wrap">
                     <span class="block_title">单笔转账</span>
                </div>
                <div class="operation_block">
                    <form class="main_form">
                    <r:tinyPanel title="付方信息" iconCls="none" column="2">
                        <r:panelItem>
                            <r:calendar textAlign="left" id="t1" name="t1" title="付款时间" style="green" showOpts="yyyy-MM-dd"/>
                        </r:panelItem>
                        <r:panelItem>
                            <r:textField textAlign="left" id="subject" name="subject" title="可用余额"/>
                        </r:panelItem>
                        <r:panelItem>
                            <r:combo textAlign="left" selectable="true" valueField="value" title="通知方式"
                                     id="noticemode" name="noticemode"  displayField="text"
                                     staticData="[{'text':'预警消息','value':'1'},{'text':'短信','value':'4'}]"/>
                        </r:panelItem>
                        <r:panelItem>
                            <r:comboGrid textAlign="left" id="commandid" name="commandid" valueField="urid" displayField="name" colModel="[{title:'名称',field:'name',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH" title="任务命令" />
                        </r:panelItem>
                        <r:panelItem>
                            <r:textField textAlign="left" id="subject2" name="subject" title="转账金额"/>
                        </r:panelItem>
                    </r:tinyPanel>
                    <r:tinyPanel title="收方信息" iconCls="none">
                        <r:panelItem>
                            <r:textField textAlign="left" id="subject3" name="subject" title="转账金额"/>
                        </r:panelItem>
                        <r:panelItem>
                            <r:textField textAlign="left" id="subject4" name="subject" title="转账金额"/>
                        </r:panelItem>
                    </r:tinyPanel>
                    </form>
                </div>
                <div class="operation_btn">
                    <button class="blue_btn">下一步</button>
                </div>
            </div>
        </div>
    </body>
</html>