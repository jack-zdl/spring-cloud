<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant"  %>
<%@ page import="com.ceying.chx.dto.user.SysUserDto"  %>
<%
	SysUserDto  sysuserdto = (SysUserDto)request.getSession().getAttribute(UserConstant.USER_SESSION);
	int tenantid = 0;
	String orgid = "";
	String userid = "";
	if(sysuserdto!=null){
		tenantid = sysuserdto.getTenantId();
		orgid = sysuserdto.getOrgId();
		userid = sysuserdto.getUserId();
	}
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/RUI/themes/green/ui.jqgrid.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/grid.css"/>
<jsp:include page="/common/include.jsp"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/i18n/grid.locale-cn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/RUI/plugins/jqGrid/jquery.jqGrid.src.js"></script>
<r:buttonList>
	<r:button text="新增" iconCls="add"  onClick="addFn" />
	<r:button text="修改" iconCls="edit" onClick="editFn" />
	<r:button text="删除" iconCls="delete" onClick="delFn" />
	<r:button text="运行" iconCls="add"  onClick="runFn" />
	<r:button text="启动" iconCls="lamp"  onClick="startFn" />
	<r:button text="暂停1" iconCls="snow" onClick="pauseFn" />
</r:buttonList>
<div class="grid_wrap">
    <r:grid id="taskschedulersGrid" dataUrl="${pageContext.request.contextPath}/taskschedulers/page.do"
            colModel="{name : 'urid',index : 'urid',sortable:false,hidden:true},
        {name : 'name',index : 'name',sortable:false},
        {name : 'description',index : 'description',sortable:false},
        {name : 'lasttimecompleted',index : 'lasttimecompleted',sortable:false},
        {name : 'runstate',index : 'runstate',sortable:false},
        {name : 'nextexecutetime',index : 'nextexecutetime',sortable:false},
        {name : 'category',index : 'category',sortable:false}"
            colNames="'ID','任务名称','描述','最后完成时间','启用状态','下次执行时间','运行模式'" multiSelect="true"/>
</div>
<r:win title="任务选择" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="任务详情" id="nextWin" maxable="true" />
<script type="text/javascript">

$(function(){
	$("#editModal").modal("hide");
    $("#addModal").modal("hide");
    $("#nextWin").modal("hide");
});
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#nextWin").modal("hide");
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/task/systemtask/systemtaskadd.jsp";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length != 1){
            $.RMessage.alert("消息", "");
            return;
        }
        var url = "${pageContext.request.contextPath}/base/schedule/systemtask/systemtaskedit.jsp?type=mod&urid=" + rowData[0].urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作数据");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除", function(){
        	Ajax.req({
                url: "${pageContext.request.contextPath}/schedule/del.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        });
    }
    
    var runFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
    	if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作数据");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/schedule/run.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var startFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
    	if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作数据");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/schedule/start.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var pauseFn = function(){
    	var rowData = $("#grid-table").RGrid("getSelectedDatas");
    	if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作数据");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/schedule/pause.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
</script>