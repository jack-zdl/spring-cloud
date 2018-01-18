
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'corecompanyid',name : 'corecompanyid',title:'核心企业',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
        {id : 'supplierid',name : 'supplierid',title:'供应商',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
        {id : 'invoicenumber',name : 'invoicenumber',title:'发票号',type:'text'},
        {id : 'amount',name : 'amount',title:'发票金额',type:'numb'},
        {id : 'billdate',name : 'billdate',title:'发票日期',type:'calendar'},
        {id : 'contractid',name : 'contractid',title:'合同编号',type:'text'},
        {id : 'expiringdate',name : 'expiringdate',title:'应付日期',type:'calendar'},
        {id : 'payabledate',name : 'payabledate',title:'保理到期日',type:'calendar'}
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'invoicenumber',name : 'invoicenumber',title:'发票号'}" />
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

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/cpi/accountspayable.do"
        colModel="{name : 'corecompanyidname',index : 'corecompanyidname',sortable:false},
                    {name : 'supplieridname',index : 'supplieridname',sortable:false},
                    {name : 'contractid',index : 'contractid',sortable:false},
                    {name : 'invoicenumber',index : 'invoicenumber',sortable:false},
                    {name : 'amount',index : 'amount',sortable:false},
                    {name : 'billdate',index : 'billdate',sortable:false},
                    {name : 'expiringdate',index : 'expiringdate',sortable:false},
                    {name : 'payabledate',index : 'payabledate',sortable:false},
                    {name : 'lastoperationflag',index : 'lastoperationflag',sortable:false},
                    {name : 'payableno',index : 'payableno',sortable:false},
                    {name : 'isactive',index : 'isactive',sortable:false},
                    {name : 'description',index : 'description',sortable:false}"
        colNames="'核心企业','供应商','合同编号','发票号','发票金额','发票日期','应付日期','保理到日期','状态','应付账款编号','是否有效','描述'" multiSelect="true"></r:grid>

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

