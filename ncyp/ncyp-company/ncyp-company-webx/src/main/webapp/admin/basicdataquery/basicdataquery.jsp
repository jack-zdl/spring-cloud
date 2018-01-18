<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Sass平台</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>

    <jsp:include page="/common/include.jsp"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/operateBtn.css"/>
</head>
<body class="body_col_o">
<jsp:include page="/common/navigation.jsp"/>
<div class="main_context">
    <div class="main_inner">
        <r:tabs id="myTab" fit="modal"  index="0">
            <r:tab title="基础资料"  id="basicdataManage" >
                <jsp:include page="/admin/basicdataquery/basicdata.jsp"/>
            </r:tab>
            <r:tab title="直联设置"  id="directsettingManage" >
                <jsp:include page="/admin/basicdataquery/directsetting.jsp"/>
            </r:tab>
        </r:tabs>

    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>
<r:win title="币种" id="currencyModal" maxable="true" />
<r:win title="日历管理" id="calendarModal" maxable="true" />
<r:win title="单据对象" id="noteobjectsModal" maxable="true" />
<r:win title="区域" id="areaModal" maxable="true" />
<r:win title="银行" id="bankModal" maxable="true" />
<r:win title="开户银行" id="banklocationModal" maxable="true" />
<r:win title="交易信息码" id="transcodeModal" maxable="true" />
<r:win title="直联渠道" id="directchannelModal" maxable="true" />
<r:win title="直联渠道区域" id="directchannelAreaModal" maxable="true" />
<r:win title="直联渠道指令" id="directchannelCmdModal" maxable="true" />
<r:win title="直联渠道指令参数定义" id="directchannelCmdParamdefModal" maxable="true" />
<r:win title="直联渠道指令参数值" id="directchannelCmdParamvalModal" maxable="true" />
<r:win title="直联渠道交易信息码" id="directchannelTransCodeModal" maxable="true" />
<r:win title="直联渠道交易结果" id="directchannelTransResultModal" maxable="true" />
<r:win title="直联查询指令配置" id="directqueryCmdConfigModal" maxable="true" />
</html>