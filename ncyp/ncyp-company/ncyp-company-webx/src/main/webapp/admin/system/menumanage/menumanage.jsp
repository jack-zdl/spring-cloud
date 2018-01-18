<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
        {id : 'menuName',name : 'menuName',title:'菜单名称',type:'text'},
        {id : 'kindCode',name : 'kindCode',title:'类别名称',type:'text'}
    ]" />
    <jsp:param name="girdId" value="grid-table" />
    <jsp:param name="defaultQuery" value="{id : 'menuName',name : 'menuName',title:'菜单名称'}" />
</jsp:include>
<%
    String moveUrl = request.getContextPath()+"/sysmenu/move.do";
    String delUrl = request.getContextPath()+"/sysmenu/del.do";
    String treetitle = "系统菜单";
    String treerelationparam = "menu_code";
    String treeinfo = "menu_code,menu_name,parent_code,null";
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String userid = currUser.getUserId();
    String treetenantid = currUser.getTenantId().toString();
    String dataUrl = null;
    if(treetenantid.equals("10000")) {//CommonConstants.SUPERTENANT
        dataUrl=request.getContextPath()+"/sysmenu/submenu.do?queryType=1&treeinfo="+treeinfo+"&treeLevel=0";
    } else {
        dataUrl=request.getContextPath()+"/sysmenu/submenu.do?queryType=1&treeinfo="+treeinfo+"&treeLevel=0"+"&treetenantid="+treetenantid;
    }
%>

<r:button text="新增" iclass="fa-plus"  onClick="addMenu" />
<r:button text="修改" iclass="fa-pencil-square-o"  onClick="editMenu"/>
<r:button text="删除" iclass="fa-remove"   onClick="del"/>
<r:button text="上移" iclass="fa-chevron-up" id="moveup" onClick="moveUp"/>
<r:button text="下移" iclass="fa-chevron-down" id="movedown" onClick="moveDown"/>

<r:grid id="grid-table" dataUrl="${pageContext.request.contextPath}/sysmenu/all.do"
        colModel="{name : 'menuCode',index : 'menuCode',sortable:false},
                    {name : 'menuName',index : 'menuName',sortable:false},
                    {name : 'parentCode',index : 'parentCode',sortable:false,hidden:true},
                    {name : 'parentCodeName',index : 'parentCodeName',sortable:false},
                    {name : 'menuUrl',index : 'menuUrl',sortable:false},
                    {name : 'kindCode',index : 'kindCode',sortable:false,hidden:true},
                    {name : 'kindCodeName',index : 'kindCodeName',sortable:false},
                    {name : 'windowType',index : 'windowType',sortable:false,hidden:true},
                    {name : 'windowTypeName',index : 'windowTypeName',sortable:false},
                    {name : 'kindCode',index : 'kindCode',sortable:false}"
        colNames="'菜单编码','菜单名称','上级菜单(隐藏)','上级菜单','菜单URL','类别名称(隐藏)','类别名称','窗口类型(隐藏)','窗口类型','KIND_CODE'" multiSelect="true"></r:grid>

<r:win title="新增菜单" id="addMenuModal" maxable="true"/>
<r:win title="编辑菜单" id="editMenuModal" maxable="true"/>

<jsp:include page="/common/tree.jsp">
    <jsp:param name="url" value="${pageContext.request.contextPath}/sysmenu/submenu2.do" />
    <jsp:param name="treerelationparam" value="menuCode" />
    <jsp:param name="gridId" value="grid-table" />
    <jsp:param name="treeinfo" value="menu_code,menu_name,parent_code,null" />
</jsp:include>
<script type="text/javascript">
    $(function(){
        $("#button-div").attr("style","padding: 5px 20px;");
    })

    var addMenu = function(){
        var nodeids = $('#treeDemo').RTree('getValue');
        var nodenames = $('#treeDemo').RTree('getName');
        if(nodeids==null||nodeids==""||nodeids.length!=1){
            $.RMessage.alert("消息","请在菜单树上选择一个节点作为上级菜单");
        }else{
            var url = "${pageContext.request.contextPath}/admin/system/menumanage/menuadd.jsp?type=add&parent_name="+encodeURI(encodeURI(nodenames[0]))+"&parent_code="+nodeids[0];
            $("#addMenuModal").RWin('createWin',url);
        }
    }

    var editMenu = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
        }else{
            var url = "${pageContext.request.contextPath}/admin/system/menumanage/menuadd.jsp?type=mod&menu_code="+
                rowDatas[0].menuCode + "&kind_code="+rowDatas[0].kindCode + "&parent_code_name="+rowDatas[0].parentCodeName+ "&parent_code="+rowDatas[0].parentCode;
            $("#editMenuModal").RWin('createWin',url);
        }
    }

    var del = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length==0){
            $.RMessage.alert("消息","请选择记录进行操作");
        }else{
            var menucodes = new Array();
            var kindcodes = new Array();
            var parentcodes = new Array();
            var namecodes = new Array();
            for(var j=0;j<rowDatas.length;j++){
                menucodes.push(rowDatas[j].menuCode);
                kindcodes.push(rowDatas[j].kindCode);
                parentcodes.push(rowDatas[j].parentCode);
                namecodes.push(rowDatas[j].menuName);
            }
            menucodes= menucodes.join(",");
            kindcodes= kindcodes.join(",");
            parentcodes = parentcodes.join(",");
            namecodes=namecodes.join(",");
            $.RMessage.confirm("消息", "是否确认删除", function(){
                Ajax.req({
                    url: "<%=delUrl%>",
                    params: {
                        "menuCode":menucodes,
                        "kindCode":kindcodes,
                        "parentCode":parentcodes,
                        "menuName":namecodes
                    },
                    ok: function(text) {
                        if(text.success=="true"||text.success==true){
                            $.RMessage.alert("消息",text.mes);
                            exeComQuery();
                            $("#treeDemo").RTree("refresh");
                        }else{
                            $.RMessage.alert("消息",text.mes);
                            exeComQuery();
                            $("#treeDemo").RTree("refresh");
                        }
                    },
                    err: function(text) {
                        $.RMessage.alert("消息",text.msg);
                    }
                });
            });
        }
    }

    var moveUp = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作");
        }else{
            Ajax.req({
                url: "<%=moveUrl%>",
                params:{
                    menuCode:rowDatas[0].menuCode,
                    kindCode:rowDatas[0].kindCode,
                    sortType:'desc'
                },
                ok: function(text) {
                    exeComQuery();
                },
                err: function(text) {
                    $.RMessage.alert("消息",text.mes);
                }
            });
        }
    }

    var moveDown = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作");
        }else{
            Ajax.req({
                url: "<%=moveUrl%>",
                params:{
                    menuCode:rowDatas[0].menuCode,
                    kindCode:rowDatas[0].kindCode,
                    sortType:'asc'
                },
                ok: function(text) {
                    exeComQuery();
                },
                err: function(text) {
                    $.RMessage.alert("消息",text.mes);
                }
            });
        }
    }

    var closeWinFn = function(){
        exeComQuery();
        $("#editMenuModal").modal("hide");
        $("#addMenuModal").modal("hide");
        $("#treeDemo").RTree("refresh");
    }

    var closeAdd_EditWinFn = function(){
        exeComQuery();
        $("#editMenuModal").modal("hide");
        $("#addMenuModal").modal("hide");
        $("#treeDemo").RTree("refresh");
    }
    var exeComQuery = function (baseParams) {
        var queryParams = $("#queryForm").serialize();
        queryParams = decodeURIComponent(queryParams);
        if (baseParams != null && baseParams != "") {
            queryParams = baseParams;
        }
        var qparams = toJson(queryParams);
        $("#grid-table").RGrid("setGridParam",qparams);

    };
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