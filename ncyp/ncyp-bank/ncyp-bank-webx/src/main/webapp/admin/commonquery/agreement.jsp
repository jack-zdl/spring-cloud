
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'bankid',name : 'bankid',title:'银行名称',type:'text'},
        {id : 'corecompanyid',name : 'corecompanyid',title:'核心企业名称',type:'text'},
        {id : 'supplierid',name : 'supplierid',title:'供应商名称',type:'text'},
        {id : 'invoicenumber',name : 'invoicenumber',title:'发票号',type:'text'},
        {id : 'financingamount',name : 'financingamount',title:'融资金额',type:'text'},
        {id : 'contractid',name : 'contractid',title:'合同编号',type:'text'}
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'bankid',name : 'bankid',title:'银行名称'}" />
</jsp:include>

<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%
    SysUserLoginDto currUser = (SysUserLoginDto) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String gridtenantid = currUser.getTenantId().toString();
%>
<r:button text="新增" iclass="fa-plus" />
<r:button text="修改" iclass="fa-pencil-square-o" />
<r:button text="删除" iclass="fa-remove"  />

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/cpi/agreement.do"
        colModel="{name : 'urid',index : 'urid',sortable:false},
                    {name : 'bankid',index : 'bankid',sortable:false},
                    {name : 'corecompanyid',index : 'corecompanyid',sortable:false},
                    {name : 'supplierid',index : 'supplierid',sortable:false},
                    {name : 'supplastoperateflag',index : 'supplastoperateflag',sortable:false},
                    {name : 'corelastoperateflag',index : 'corelastoperateflag',sortable:false},
                    {name : 'supplastoperateflag',index : 'supplastoperateflag',sortable:false},
                    {name : 'invoicenumber',index : 'invoicenumber',sortable:false},
                    {name : 'financingamount',index : 'financingamount',sortable:false},
                    {name : 'contractid',index : 'contractid',sortable:false},
                    {name : 'payableno',index : 'payableno',sortable:false},
                    {name : 'amount',index : 'amount',sortable:false},
                    {name : 'tacontractid',index : 'tacontractid',sortable:false},
                    {name : 'estimatereturndate',index : 'estimatereturndate',sortable:false},
                    {name : 'lendingdate',index : 'lendingdate',sortable:false},
                    {name : 'returndate',index : 'returndate',sortable:false},
                    {name : 'signaturecontent',index : 'signaturecontent',sortable:false}"
        colNames="'主键id','银行名称','核心企业名称','供应商名称','银行最后一次操作标识','核心企业最后一次操作标识','供应商最后一次操作标识','发票号',
        '融资金额','合同编号','应付账款编号','应付账款金额','三方协议编号','保理到期日','放款日期','还款日期','协议详细内容'" multiSelect="true"></r:grid>

<script>
    var configObject = new Object({
        PlatformCode : 0,  //平台代码
        BankCode : 1,//银行代码
        CoreCompanyCode : 2, //核心企业代码
        SupplierCode : 3,    //供应商代码
        BankCateCode : 1,
        SupplierCateCode : 2,
        CoreCateCode:3,
    });
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#allocateRelaModal").modal("hide");
        $('#treeDemo').RTree("refresh");
        exeComQuery();
    }

    var refresh = function(){
        $('#treeDemo').RTree("refresh");
        exeComQuery();
    }
    var exeComQuery = function (baseParams) {
        var queryParams = $("#queryForm").serialize();
        queryParams = decodeURIComponent(queryParams);
        if (baseParams != null && baseParams != "") {
            queryParams = baseParams;
        }
        var qparams = toJson(queryParams);
        $("#orgGrid").RGrid("setGridParam",qparams);

    };
    function add() {
        var objvalue =  $('#treeDemo').RTree("getValue");
        if(objvalue.length<=0){
            $.RMessage.alert("消息","请选择右侧树中的分类");
            return;
        }else if(objvalue.length>1){
            $.RMessage.alert("消息","只能选择一条右侧树中的分类！");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/orgmanage/sysorgadd.jsp?type="+objvalue[0];
        $("#addModal").RWin('createWin',url);
    }
    function edit(){
        var rowDatas = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }
        var url = "${pageContext.request.contextPath}/admin/system/orgmanage/sysorgadd.jsp?type=mod&pks="+rowDatas[0].orgId;
        $("#editModal").RWin('createWin',url);
    }
    function deleteOrg(){
        var rowDatas = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowDatas.length==0){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }
        var orgcodes = new Array();
        for ( var j = 0; j < rowDatas.length; j++) {
            orgcodes.push(rowDatas[j].orgId);
        }
        $.RMessage.confirm("消息", "是否确认删除？", function(){
            Ajax.req({
                url : "${pageContext.request.contextPath}/organization/delete.do",
                params : {
                    orgId : orgcodes.join(",")
                },
                ok : function(text) {
                    $.RMessage.alert("消息",text.mes,refresh);
                },
                err : function(text) {
                    $.RMessage.alert("消息",text.mes,refresh);
                }
            });
        });
    }


    function toJson(str){
        var mJson = {};
        var arr	= str.split('&');
        for(var i=0;i<arr.length;i++){
            var arr2 = arr[i].split('=');
            mJson[arr2[0]] = arr2[1];
        }

        return mJson;
    }
</script>

