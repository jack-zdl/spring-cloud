
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'orgCode',name : 'orgCode',title:'组织编码',type:'text'},
        {id : 'orgName',name : 'orgName',title:'组织名称',type:'text'},
        {id : 'status',name : 'status',title:'组织状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999008'},
        {id : 'orgLevel',name : 'orgLevel',title:'组织级别',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999005'},
        {id : 'orgCate',name : 'orgCate',title:'组织分类',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999004'},
        {id : 'parentId',name : 'parentId',title:'上级组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
        {id : 'manageId',name : 'manageId',title:'主管组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
        {id : 'tenantId',name : 'tenantId',title:'企业',type:'text'}
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'orgCode',name : 'orgCode',title:'组织编码'}" />
</jsp:include>
<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
%>
<r:button text="新增" iclass="fa-plus" onClick="add"/>
<r:button text="修改" iclass="fa-pencil-square-o" onClick="edit"/>
<r:button text="删除" iclass="fa-remove"  onClick="deleteOrg"/>

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/organization/children.do"
        colModel="{name : 'orgId',index : 'orgId',sortable:false,hidden:true},
                    {name : 'orgCode',index : 'orgCode',sortable:false},
                    {name : 'orgName',index : 'orgName',sortable:false},
                    {name : 'status',index : 'status',sortable:false,hidden:true},
                    {name : 'statusName',index : 'statusName',sortable:false},
                    {name : 'parentId',index : 'parentId',sortable:false,hidden:true},
                    {name : 'parentIdName',index : 'parentIdName',sortable:false},
                    {name : 'manageId',index : 'manageId',sortable:false,hidden:true},
                    {name : 'manageIdName',index : 'manageIdName',sortable:false},
                    {name : 'orgCate',index : 'orgCate',sortable:false,hidden:true},
                    {name : 'orgCateName',index : 'orgCateName',sortable:false},
                    {name : 'orgLevel',index : 'orgLevel',sortable:false,hidden:true},
                    {name : 'orgLevelName',index : 'orgLevelName',sortable:false}"
        colNames="'组织标志(隐藏)','组织编码','组织名称','组织状态(隐藏)','组织状态','上级组织(隐藏)','上级组织','主管组织(隐藏)','主管组织','组织分类(隐藏)','组织分类','组织级别(隐藏)','组织级别'" multiSelect="true"></r:grid>

<%
    String treeinfo = "urid,name,parentid,null";
%>
<jsp:include page="/common/tree.jsp">
    <jsp:param name="url" value="${pageContext.request.contextPath}/organization/tree2.do" />
    <jsp:param name="treerelationparam" value="orgId" />
    <jsp:param name="gridId" value="orgGrid" />
    <jsp:param name="treeinfo" value="urid,name,parentid,null" />
</jsp:include>

<r:win title="新增组织" id="addModal" width="800" height="500"/>
<r:win title="修改组织" id="editModal" width="800" height="500"/>




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
