<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.task.JresUtil"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page
        import="com.ceying.chx.biz.utils.stringtools.FString"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
    String queryuc = "UC_BASE_IO_EXTOBJECTS_SEARCH";
    SysUserLogin currUser = (SysUserLogin) session
            .getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
%>
<style type="text/css">
    #orgid_wrap,
    #orgid2_wrap,
    #orgid3_wrap{
        display: inline-block;
        width: 100px;
    }
    #orgid_wrap .text_box,
    #orgid2_wrap .text_box,
    #orgid3_wrap .text_box{
        border-color: #8fbcd9 !important;
        border-radius: 10px;
        height: 29px;
        border-bottom-width:2px;
    }
    #orgid_wrap .text_box input,
    #orgid2_wrap .text_box input,
    #orgid3_wrap .text_box input{
        border-radius: 15px !important;
    }
    #orgid_wrap .text_box span,
    #orgid2_wrap .text_box span,
    #orgid3_wrap .text_box span{
        border-radius: 0 15px 15px 0;
    }
    #form1 .col-xs-4{
        padding-left: 0px;
    }
    .for_title{
        color: #7AADCF;
        margin-left: 5px;
    }
    #startdate_wrap,
    #enddate_wrap{
        display: inline-block;
    }
    .split_line{
        height: 10px;
        background-color: #EEEEEE;
        margin-bottom: 10px;
    }
    #startdate_wrap,
    #enddate_wrap{
        width: 100px;
    }
    #startdate_wrap input,
    #enddate_wrap input{
        border-color: #8fbcd9 !important;
        border-radius: 10px !important;
        height: 29px;
        border-bottom-width:2px;
        width: 100px;
    }
    .table_info{
        color: #3089C1;
        margin-bottom: 20px;
    }
    .table_info span{
        margin-right: 20px;
    }
    #tableOne-r,#tableTwo-r{
        padding-top: 20px;
    }
</style>
<!-- <link rel="stylesheet" type="text/css" href="../../../../RUI/themes/default/css/add.css"> -->
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<span class="for_title">银行账户</span>
<input type="hidden" id="orgid" name="orgid"/>
<span class="for_title">银行账户</span>
<input type="hidden" id="orgid2" name="orgid2"/>
<span class="for_title">银行账户</span>
<input type="hidden" id="orgid3" name="orgid3"/>
<r:button text="全部查询" iclass="fa-search-plus"
          visible="<%=userid +\"#tenantmanage/tenant/add\"%>" onClick="allsearch" />
<r:button text="重置" iclass="fa-times-circle"
          visible="<%=userid +\"#tenantmanage/tenant/edit\"%>" onClick="reset" />
<r:button text="L" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="L" />
<r:button text="R" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="R" />
<form action="" role="form" id="form1">
    <r:tinyPanel hasHeader="false" column="4">
        <%--
            <r:panelItem>
                <jsp:include page="/login/wedget/ucsearch/organizationoption.jsp">
                    <jsp:param name="id" value="orgid" />
                    <jsp:param name="title" value="组织" />
                    <jsp:param name="readonly" value="false" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:comboGrid id="bankaccount" name="bankaccount" valueField="urid"
                    displayField="name" check="required" readonly='false'
                    colModel="[{title:'名称',field:'name',width:120}]"
                    dataUrl="${pageContext.request.contextPath}/login/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                    title="银行账户" />
            </r:panelItem>
            <r:panelItem>
                <r:comboGrid id="dealway" name="dealway" valueField="urid"
                    displayField="name" check="required" readonly='false'
                    colModel="[{title:'名称',field:'name',width:50}]"
                    dataUrl="${pageContext.request.contextPath}/login/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                    title="交易方向" />
            </r:panelItem>
            <r:panelItem>
                <r:textField id="selection" name="selection" title="查询" />
            </r:panelItem>
        --%>
        <r:panelItem>
            <r:comboGrid id="dealstatus" name="dealstatus" valueField="urid"
                         displayField="name" readonly='false'
                         colModel="[{title:'名称',field:'name',width:120}]"
                         dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                         title="交易状态" />
        </r:panelItem>
        <r:panelItem>
            <r:comboGrid id="otheraccount1" name="otheraccount1"
                         valueField="urid" displayField="name" readonly='false'
                         colModel="[{title:'名称',field:'name',width:50}]"
                         dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                         title="对方户名" />
        </r:panelItem>
        <r:panelItem>
            <r:comboGrid id="checkstatus" name="checkstatus" valueField="urid"
                         displayField="name" readonly='false'
                         colModel="[{title:'名称',field:'name',width:120}]"
                         dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                         title="核对状态" />
        </r:panelItem>
        <r:panelItem>
            <r:comboGrid id="otheraccount2" name="otheraccount2"
                         valueField="urid" displayField="name" readonly='false'
                         colModel="[{title:'名称',field:'name',width:50}]"
                         dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH"
                         title="对方户名" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="startdatetime1" name="startdatetime1" title="交易日期从"
                        showOpts="yyyy-MM-dd" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="enddatetime1" name="enddatetime1" title="交易日期到"
                        showOpts="yyyy-MM-dd" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="startdatetime2" name="startdatetime2" title="交易日期从"
                        showOpts="yyyy-MM-dd" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="enddatetime2" name="enddatetime2" title="交易日期到"
                        showOpts="yyyy-MM-dd" />
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dealamountfrom1" name="dealamountfrom1"
                         title="交易金额从" />
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dealamountto1" name="dealamountto1" title="交易金额到" />
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dealamountfrom2" name="dealamountfrom2"
                         title="交易金额从" />
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dealamountto2" name="dealamountto2" title="交易金额到" />
        </r:panelItem>
    </r:tinyPanel>
</form>
</div>
<div class="split_line"></div>

<r:button text="手动核对" iclass="fa-pencil-square-o"
          visible="<%=userid +\"#tenantmanage/tenant/edit\"%>" onClick="reset" />
<span class="for_title">其他操作功能：</span>
<r:button text="交易本页" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="L" />
<r:button text="交易所有" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="R" />
<r:button text="银行本页" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="L" />
<r:button text="银行所有" iclass="fa-arrows"
          visible="<%=userid +\"#tenantmanage/tenant/del\"%>" onClick="R" />

<div class="col-xs-6" id="tableOne-r">
    <div class="table_info"><span>交易信息列表</span><span>勾选总条数:0</span><span>勾选总金额:0.00</span></div>
    <div class="row">
        <div class="col-xs-12">
            <table id="tableOne"></table>
            <div id="tableOne-grid-pager"></div>
        </div>
    </div>
</div>
<div class="col-xs-6" id="tableTwo-r">
    <div class="table_info"><span>交易信息列表</span><span>勾选总条数:0</span><span>勾选总金额:0.00</span></div>
    <div class="row">
        <div class="col-xs-12">
            <table id="tableTwo"></table>
            <div id="tableTwo-grid-pager"></div>
        </div>
    </div>
</div>
<!-- <jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param value="2" name="onRowDbClick"/>
</jsp:include>


<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param value="2" name="uniqueid"/>
    <jsp:param value="1" name="onRowDbClick"/>
</jsp:include> -->


<script type="text/javascript">
    var saveFn = function(){}
    var allsearch = function(){}
    var reset = function(){}
    var L = function(){}
    var R = function(){}
    $("#orgid").RComboGrid({
        panelWidth:'200',
        panelHeight:'200',
        idField: 'urid',//用于获取值，不显示
        textField: 'name',//用于检索，显示
        url: '${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH',
        method: 'post',
        pageSize: 6,
        columns: [{title:'名称',field:'name'}],
        icon:true,
        isCache:false,
    });
    $("#orgid2").RComboGrid({
        panelWidth:'200',
        panelHeight:'200',
        idField: 'urid',//用于获取值，不显示
        textField: 'name',//用于检索，显示
        url: '${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH',
        method: 'post',
        pageSize: 6,
        columns: [{title:'名称',field:'name'}],
        icon:true,
        isCache:false,
    });
    $("#orgid3").RComboGrid({
        panelWidth:'200',
        panelHeight:'200',
        idField: 'urid',//用于获取值，不显示
        textField: 'name',//用于检索，显示
        url: '${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_TASKCOMMAND_SEARCH',
        method: 'post',
        pageSize: 6,
        columns: [{title:'名称',field:'name'}],
        icon:true,
        isCache:false,
    });
    $('#startdate').RCalendar({
        dateFmt: "yyyy-mm-dd"
    });
    $('#enddate').RCalendar({
        dateFmt: "yyyy-mm-dd"
    });
    $("#tableOne").RGrid({
        dataUrl :" ",
        height : "300",
        colModel :[
            {name : 'taskId',index : 'taskId'},
            {name : 'serino',index : 'serino'},
            {name : 'fieldTraceString',index : 'fieldTraceString'}
        ],
        colNames :['代码','名称','是否有效'],
        onRowDbClick :null
    });
    $("#tableTwo").RGrid({
        dataUrl :" ",
        height : "300",
        colModel :[
            {name : 'taskId',index : 'taskId'},
            {name : 'serino',index : 'serino'},
            {name : 'fieldTraceString',index : 'fieldTraceString'}
        ],
        colNames :['代码','名称','是否有效'],
        onRowDbClick :null
    });
</script>
