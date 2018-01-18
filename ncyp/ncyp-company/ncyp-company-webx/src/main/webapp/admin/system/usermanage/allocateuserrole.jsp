<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>
<jsp:include page="/common/include.jsp"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[{id : 'roleCode',name : 'roleCode',title:'角色编码',type:'text'},
    {id : 'roleName',name : 'roleName',title:'角色名称',type:'text'},
    {id :'isAllocate',name : 'isAllocate',title:'是否已分配',type:'combo',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999007'}]" />
    <jsp:param name="girdId" value="grid" />
    <jsp:param name="defaultQuery" value="{id : 'roleCode',name : 'roleCode',title:'角色编码',type:'text'}" />
</jsp:include>

<%
    String userId = request.getParameter("userId");
    String tenantId = request.getParameter("tenantId");
    String condition = "{'userId':'" + userId + "','tenantId':'" + tenantId + "'}";
%>
<html>
<body class="body_col_o">
<div class="main_context">
    <div class="main_inner">
        <div class="block_title_wrap">
            <span class="block_title"></span>
        </div>
        <r:buttonList>
            <r:button text="分配" iclass="fa-plus" onClick="allocate" />
            <r:button text="取消" iclass="fa-remove" onClick="cancelAllocate" />
        </r:buttonList>
        <div class="grid_wrap">
            <r:grid id="grid" dataUrl="${pageContext.request.contextPath}/sysuser/queryRoleAllocate.do"
                    baseParams="<%=condition%>"
                    colModel="{name : 'is_Allocate',index : 'isAllocate',sortable:false},
                        {name : 'roleCode',index : 'orgCode',sortable:false},
                        {name : 'roleName',index : 'orgName',sortable:false}"
                    colNames="'是否已分配','角色编码','角色名称'" multiSelect="true" ></r:grid>
        </div>
    </div>
</div>
<a class="be_Top" href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png">
</a>
</body>

<script>
    function refresh(){
        $("#grid").RGrid("setGridParam",{rows:50, page:1});
    }

    function allocate(){
        var rowData = $("#grid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].roleCode);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/roleAllocate.do",
            params: {
                id: pksArray.join(","),
                userId:'<%=userId%>',
                tenantId:'<%=tenantId%>'
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }

    function cancelAllocate(){
        var rowData = $("#grid").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请至少选择一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            pksArray.push(rowData[i].roleCode);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/sysuser/roleCancelAllocate.do",
            params: {
                id: pksArray.join(","),
                userId:'<%=userId%>',
                tenantId:'<%=tenantId%>'
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.mes, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", "操作失败！" + text.mes);
            }
        });
    }

</script>
</html>