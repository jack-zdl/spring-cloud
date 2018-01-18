<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="com.alibaba.fastjson.JSONObject"%>
<%@	page import="com.ceying.chx.dao.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String flagmsg = request.getParameter("flagmsg");
    String ids = request.getParameter("ids");
    String orgids = request.getParameter("orgid");
    String cfzfmsg = new String(request.getParameter("cfzfmsg").getBytes("iso8859-1"),"utf-8");
    String[] cfzfmsgs = cfzfmsg.split("；");
    String queryuc = "UC_SCS_SE_DIRECTSGLBANKPAY_SEARCH";
    JSONObject jsonObject = JSONObject.parseObject(flagmsg);
    String dezf = null;
    String cfzf = null;
    if(jsonObject.containsKey("DEZF")){
        dezf = jsonObject.getString("DEZF");
    }
    String conditions_dezf = "urids="+dezf;
    if(jsonObject.containsKey("CFZF")){
        cfzf = jsonObject.getString("CFZF");
    }

%>
<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>
<r:buttonList>
    <r:button text="确认支付" iclass="fa-plus" onClick="isCheckFn" />
</r:buttonList>
<%
    if(jsonObject.containsKey("DEZF")){
%>
<div style="height: 30px;background-color: #e9eef1" class="gridtitle" id="largePayGridTitle">
    <div style="float:left" class="f-listout-gridtitle">
            <span style="line-height: 30px;margin-left: 20px;font-weight: bolder;font-family: 'Microsoft YaHei' , Tahoma, Arial, Verdana, Sans-Serif;color: #000a28;">
                大额支付
            </span>
    </div>
    <div style="clear: both;"></div>
</div>
<jsp:include page="/common/grid.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
    <jsp:param name="condition" value="<%=conditions_dezf%>" />
</jsp:include>
<%
    }
%>
<%
    if(jsonObject.containsKey("CFZF")){
%>
<div style="height: 30px;background-color: #e9eef1" class="gridtitle" id="largePayGridTitle">
    <div style="float:left" class="f-listout-gridtitle">
            <span style="line-height: 30px;margin-left: 20px;font-weight: bolder;font-family: 'Microsoft YaHei' , Tahoma, Arial, Verdana, Sans-Serif;color: #000a28;">
              重复支付
            </span>
    </div>
    <div style="clear: both;"></div>
</div>
<hr/>
<div style="height: 30px;background-color: #e9eef1" class="gridtitle" id="largePayGridTitle">
    <div style="float:left" class="f-listout-gridtitle">
            <span style="line-height: 30px;margin-left: 20px;font-weight: bolder;font-family: 'Microsoft YaHei' , Tahoma, Arial, Verdana, Sans-Serif;color: #000033;">
              <c:forEach var="cfzfmsg" items="<%= cfzfmsgs %>">
                  <c:out value="${cfzfmsg}" /><br/>
              </c:forEach>
            </span>
    </div>
    <div style="clear: both;"></div>
</div>
<%
    }
%>
<script type="text/javascript">
    var isCheckFn = function(){
       Ajax.req({
         url: "${pageContext.request.contextPath}/smartpayment/paymenttrade/directsglbankpaypay.do",
         params: {
         ids: "<%=ids%>",
         orgid:"<%=orgids%>",
         isconfirmpay:"true"
         },
         ok: function(text) {
         $.RMessage.alert("消息", text.msg, refresh);
         },
         err: function(text) {
         $.RMessage.alert("消息", text.msg,refresh);
         }
         });
    }

    function refresh(){
        parent.$("#ispayModal").modal("hide");
        parent.refresh();
    }


</script>

