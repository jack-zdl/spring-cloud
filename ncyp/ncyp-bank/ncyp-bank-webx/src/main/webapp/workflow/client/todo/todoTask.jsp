<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String queryuc = "UC_WORKFLOW_TODOTASK_QUERY";
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String userid = currUser.getUserId();
    String processid = request.getParameter("processid");
    //String condition="userid=" + userid + "&processid="+processid;
    String condition = "userid=" + userid+ "&processid=" + processid;
    String url = "/front"+"/workbench/agreementTempTodo.do?userId="+userid;
%>
<%--<jsp:include page="/common/search.jsp">--%>
    <%--<jsp:param name="rows" value="[{id : 'createby',name : 'createby',title:'发起人',type:'text'}]" />--%>
    <%--<jsp:param name="girdId" value="todoGrid" />--%>
    <%--<jsp:param name="defaultQuery" value="{id : 'createby',name : 'createby',title:'发起人'}" />--%>
<%--</jsp:include>--%>

<%-- <r:button text="导出本页" iclass="fa-arrow-down" onClick="exputPage" ></r:button>
<r:button text="导出所有" iclass="fa-arrow-down"  onClick="exputAll"></r:button> --%>

<div class="grid_wrap">
    <r:grid id="todoGrid" dataUrl="<%=url%>"
            colModel="{name : 'urid',index : 'urid',sortable:false,hidden:true},
            {name : 'lastOperateflag',index : 'lastOperateflag',sortable:false,formatter:nowOperateFmatter},
            {name : 'createdon',index : 'createdon',sortable:false},
            {name : 'createby',index : 'createby',sortable:false},
            {name : 'num',index : 'num',sortable:false,formatter:customFmatter}"
            colNames="'id','当前操作环节','创建时间','发起人','流程名称'" multiSelect="true"
            onRowDbClick="onRowDbClick"/>

</div>
<r:win title="待办事项" id="newpage"  maxable="true"></r:win>

<script type="text/javascript">

//    $(function(){
//        $("#todoGrid").setVal();
//    });
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        $("#addModal").modal("hide");
        $("#allocatepowerModal").modal("hide");
        $("#wf_taskProcessing_win").modal("hide");
        exeComQuery();
    };
    var nowOperateFmatter=function (cellvalue, options, rowObject){
        //100-银行经办待发布,101-银行经办已发布,102-银行复核签约,103-银行审批签约,201-核心企业经办签约,202-核心企业复核签约,203-核心企业审批签约
        if(cellvalue=="100"){
            return "银行经办发布"
        }if(cellvalue=="101"){
            return "银行复核签约"
        }if(cellvalue=="102"){
            return "银行审批签约"
        }if(cellvalue=="201"){
            return "核心企业复核签约"
        }if(cellvalue=="202"){
            return "核心企业审批签约"
        }
    }
    var customFmatter=function (cellvalue, options, rowObject){
        return "三方协议模板";
    }

var refresh = function(){
        exeComQuery();
    };
    var onRowDbClick = function(rowid,iRow,iCol,e){
       var urid=iRow.urid;
       var usre="<%=userid%>";
        var url = "${pageContext.request.contextPath}/workflow/chx.jsp?processid="+id;
        $("#newpage").RWin('createWin',url);
//        var paras = {};
//        paras.taskId = data["id"];
//        paras.userId = data["userid"];
//        workflow.taskwindow.callBack = callBackGrid;
//        workflow.taskwindow.open(paras);
    }
    var callBackGrid = function () {
    };
    var exputPage = function(){

    };

    var exputAll = function(){

    };
</script>