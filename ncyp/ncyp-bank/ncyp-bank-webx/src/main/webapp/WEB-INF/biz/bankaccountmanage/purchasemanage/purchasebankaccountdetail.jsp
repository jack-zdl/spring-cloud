<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String urid = request.getParameter("urid");
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String orgid = currUser.getOrg_id();
    String userid = currUser.getUserId();
    String tenantid= currUser.getTenant_id().toString();
%>


<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="bankaccountadd">
    <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    <r:tinyPanel hasHeader="false" column="3">
        <r:panelItem>
            <r:textField id="tradeaccountsnumber" name="tradeaccountsnumber" title="交易账户" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="bankaccountnumber" name="bankaccountnumber" title="银行账号" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="bankaccountname" name="bankaccountname" title="银行账户名称" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="currencyname" name="currencyname" title="币种" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="bankname" name="bankname" title="银行" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="banklocationname" name="banklocationname" title="开户行" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="areaname" name="areaname" title="区域" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="accountstate" name="accountstate" title="账户状态" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="miniuptransferamount" name="miniuptransferamount" title="满额上划金额" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="minitransferamount" name="minitransferamount" title="最小划拨金额" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="reservedbalance" name="reservedbalance" title="留底金额" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="integerrate" name="integerrate" title="取整划拨等级" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否银企直联" id="isbankdirect" name="isbankdirect" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否票据虚拟户" id="isbillvirtual" name="isbillvirtual" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否现金虚拟户" id="iscashvirtual" name="iscashvirtual" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效" id="isactive" name="isactive" checked="true" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="accounttypename" name="accounttypename" title="账户性质" readonly="true"/>
        </r:panelItem>
    </r:tinyPanel>
    <r:tinyPanel title="可选信息" column="3">
        <r:panelItem>
            <r:textField id="briefnumber" name="briefnumber" title="账户标识" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="deposittype" name="deposittype" title="直联账户存款类型" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="accountgroupname" name="accountgroupname" title="账户分组" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="otherglaccount" name="otherglaccount" title="财务系统总账科目" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="otheraccountnumber" name="otheraccountnumber" title="财务系统银行账号" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="withdrawaccountid" name="withdrawaccountid" title="提现账户" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="accountapplyid" name="accountapplyid" title="开户申请单ID" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="openeddate" name="openeddate" title="开户日期" showOpts="yyyy-MM-dd" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="closeddate" name="closeddate" title="销户日期" showOpts="yyyy-MM-dd" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="description" name="description" title="描述" readonly="true"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="reservedinstruction" name="reservedinstruction" title="留底说明" readonly="true"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_BA_PURCHASEBANKACCOUNT_SEARCH",
                urid: "<%=urid%>"
            },
            ok: function(text){
                if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
                for(var key in entity){
                    var $ele = $(document.getElementsByName(key)[0]);
                    $ele.attr("Value", entity[key]);
                }
                $("#isbankdirect").attr("checked", entity["isbankdirect"] == "√");
                $("#isbillvirtual").attr("checked", entity["isbillvirtual"] == "√");
                $("#iscashvirtual").attr("checked", entity["iscashvirtual"] == "√");
                $("#isactive").attr("checked", entity["isactive"] == "√");
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
    })
</script>
