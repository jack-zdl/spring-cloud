
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'org_code',name : 'org_code',title:'组织编码',type:'text'},
        {id : 'org_name',name : 'org_name',title:'组织名称',type:'text'},
        {id : 'org_cate',name : 'org_cate',title:'组织分类',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999004'},
        {id : 'org_level',name : 'org_level',title:'组织级别',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999005'},
        {id : 'status',name : 'status',title:'组织状态',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999008'},
        {id : 'areaid',name : 'areaid',title:'区域',type:'grid',url:'${pageContext.request.contextPath}/area/page.do',displayField:'codename',valueField:'urid'},
        {id : 'parent_id',name : 'parent_id',title:'上级组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
        {id : 'manage_id',name : 'manage_id',title:'主管组织',type:'grid',url:'${pageContext.request.contextPath}/organization/page.do',displayField:'codename',valueField:'orgId'},
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'org_code',name : 'org_code',title:'组织编码'}" />
</jsp:include>
<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String gridtenantid = currUser.getTenantId().toString();
%>
<r:button text="新增" iclass="fa-plus" />
<r:button text="修改" iclass="fa-pencil-square-o" />
<r:button text="删除" iclass="fa-remove"  />

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/cpi/organization.do"
        colModel="{name : 'org_code',index : 'org_code',sortable:false},
                    {name : 'org_name',index : 'org_name',sortable:false},
                    {name : 'org_cate_show',index : 'org_cate_show',sortable:false},
                    {name : 'org_level_show',index : 'org_level_show',sortable:false},
                    {name : 'status_show',index : 'status_show',sortable:false},
                    {name : 'manageidname',index : 'manageidname',sortable:false},
                    {name : 'parentidname',index : 'parentidname',sortable:false},
                    {name : 'legalperson',index : 'legalperson',sortable:false},
                    {name : 'address',index : 'address',sortable:false},
                    {name : 'areaid',index : 'areaid',sortable:false,hidden:true},
                    {name : 'areaname',index : 'areaname',sortable:false},
                    {name : 'platformsupplierrate',index : 'platformsupplierrate',sortable:false}"
        colNames="'组织编码','组织名称','组织分类','组织级别','组织状态','主管组织','上级组织','法人','地址','区域','区域','平台向供应商收取的费率'" multiSelect="true"></r:grid>

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

