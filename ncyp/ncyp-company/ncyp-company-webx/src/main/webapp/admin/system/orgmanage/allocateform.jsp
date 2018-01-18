<%--
  User: zhangdl
  Date: 2017/6/28
  Time: 22:13
  version : v1.0
  description :  组织机构设置的分配页面的form表单页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>

<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String queryuc = "UC_SYS_ORG_USER";
    Integer bank = 1;  //银行编码
    Integer core =  2; //核心企业编码
    Integer supplier = 3;//供应商编码
    String ownid = new String( request.getParameter("ownid").getBytes("Iso-8859-1"),"GBK");  //己方组织id
    String ownname = "";
    String ua = request.getHeader("User-Agent") ;
    if (ua != null) {
        if( ua.indexOf("Firefox") >-1 ){
            ownname = new String(request.getParameter("ownname").getBytes("Iso-8859-1"),"UTF-8"); //获得己方组织名称
        }else {
            ownname = new String(request.getParameter("ownname").getBytes("Iso-8859-1"),"GBK"); //获得己方组织名称
        }
    }
    String type = request.getParameter("type");  //得到前端传来的银行信息 type=银行类型编号
    String cateType = request.getParameter("catetype");
    Integer a = Integer.valueOf(type);
    if(bank.equals(Integer.valueOf(type))){
      queryuc = "UC_RFP_ORGRELATIONBANK_SEARCH";
    }else if(core.equals(Integer.valueOf(type))){
      queryuc = "UC_RFP_ORGRELATIONCORE_SEARCH";
    }else if(supplier.equals(Integer.valueOf(type))){
      queryuc = "UC_RFP_ORGRELATIONSUPPLIER_SEARCH";
    }
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
   	String tenant_id = currUser.getTenant_id().toString();
    String condition = "ourorgid="+request.getParameter("ourorgid");

%>
<input type="text" id="orgtype" hidden="hidden" value="<%=type%>"/>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="分配" iclass="fa-plus" visible="<%=userid+\"#usermanage/org/addallocaterela\"%>" onClick="allocateorg" />
<r:button text="取消" iclass="fa-remove" visible="<%=userid+\"#usermanage/org/delallocaterela\"%>" onClick="unallocateorg"/>

<r:win title="分配组织关系" id="allocateModal" height="500" width="800"/>

<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=condition%>" />
</jsp:include>


<script type="text/javascript">
    var configObject = new Object({
      AllocateCode : "0" ,//未分配
      UnAllocateCode : "1",  //已分配
    });


    var closeWinFn = function(){
        $("#allocateModal").modal("hide");
        refresh();
        parent.refresh();
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    /**
     * 分配组织关系事件
     * 1 根据选中的组织是否已分配，点击按钮是是新增还是修改
     * 2 pks=checkedRows[0].urid 对方组织id
     * @return {[type]} [description]
     */
    var allocateorg = function(){
        var orgType = $("#orgtype").val();
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");
        if(checkedRows.length!=1){
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var url ;
        if(configObject.AllocateCode === checkedRows[0].isallocate){
            url = "${pageContext.request.contextPath}/admin/system/orgmanage/allocaterelation.jsp?catetype=<%=cateType%>&type=add&orgType="+orgType+"&opporgid="+checkedRows[0].urid+"&opporgname="+checkedRows[0].name
            +"&ownid=<%=ownid%>&ownname=<%=ownname%>";
        }else if(configObject.UnAllocateCode === checkedRows[0].isallocate){
            url = "${pageContext.request.contextPath}/admin/system/orgmanage/allocaterelation.jsp?catetype=<%=cateType%>&type=edit&orgType="+orgType+"&opporgid="+checkedRows[0].urid+"&opporgname="+checkedRows[0].name
            +"&ownid=<%=ownid%>&ownname=<%=ownname%>";
        }else{
            $.RMessage.alert("消息","组织分配关系代码异常");
        }
        $("#allocateModal").RWin('createWin',url);
    }

    /**
     * 取消=取消分配关系
     * 判断选中的对象是否是已分配，如果是则可以删除
     * 如果不是则不可以删除
     * @return {[type]} [description]
     */
    var unallocateorg = function() {
        var checkedRows = $("#grid-table").RGrid("getSelectedDatas");
        if (checkedRows.length == 0) {
            $.RMessage.alert("消息","<%=MessageUtil.format("PUB0003")%>");
            return ;
        }
        var orgcodes = new Array();
        for ( var j = 0; j < checkedRows.length; j++) {
            orgcodes.push(checkedRows[j].urid);
        }
        if(configObject.AllocateCode === checkedRows[0].isallocate){
            $.RMessage.alert("消息","组织分配关系代码异常");
        }else if(configObject.UnAllocateCode === checkedRows[0].isallocate){
          $.RMessage.confirm("消息", "是否确认删除？", function(){
              Ajax.req({
                  url : "${pageContext.request.contextPath}/usermanage/org/delallocaterela.do",
                  params : {
                      ids : orgcodes.join(","),
                      ownid : "<%=ownid%>"
                  },
                  ok : function(text) {
                      $.RMessage.alert("消息",text.msg,refresh);
                  },
                  err : function(text) {
                      $.RMessage.alert("消息",text.msg);
                  }
              });
          });
        }else{
            $.RMessage.alert("消息","组织分配关系代码异常");
        }
    }
</script>
