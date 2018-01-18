
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'bankid',name : 'bankid',title:'银行名称',type:'text'},
        {id : 'corecompanyid',name : 'corecompanyid',title:'核心企业名称',type:'text'},
        {id : 'tatemplatecode',name : 'tatemplatecode',title:'模板编号',type:'text'},
        {id : 'isactive',name : 'isactive',title:'状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999067'},
        {id : 'lastoperateflag',name : 'lastoperateflag',title:'审批状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999084'}
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'tatemplatecode',name : 'tatemplatecode',title:'三方协议模板编号'}" />
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

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/cpi/agreementtemp.do"
        colModel="{name : 'urid',index : 'urid',sortable:false},
                    {name : 'bankid',index : 'bankid',sortable:false},
                    {name : 'corecompanyid',index : 'corecompanyid',sortable:false},
                    {name : 'tatemplatecode',index : 'tatemplatecode',sortable:false},
                    {name : 'tatemplateversion',index : 'tatemplateversion',sortable:false},
                    {name : 'isactive',index : 'isactive',sortable:false},
                    {name : 'lastoperateflag',index : 'lastoperateflag',sortable:false},
                    {name : 'isrecourse',index : 'isrecourse',sortable:false},
                    {name : 'description',index : 'description',sortable:false},
                    {name : 'templatecontent',index : 'templatecontent',sortable:false}"
        colNames="'主键id','银行名称','核心企业名称','三方协议模板编号','三方协议模板版本号','状态','审批状态','有追无追','描述','模板内容'" multiSelect="true"></r:grid>

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

