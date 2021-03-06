<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String formUrl = request.getContextPath() + "/purchasetdaccountmanage/tradesubaccount/edit.do";
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="tradesubaccountadd">
    <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    <r:tinyPanel title="基本信息">
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/purchasetradeaccount.jsp">
                <jsp:param name="id" value="tradeaccountid"/>
                <jsp:param name="title" value="父账户"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/tradeaccounttype.jsp">
                <jsp:param name="id" value="tradeaccounttypeid"/>
                <jsp:param name="title" value="账户类别"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="subaccountnumber" name="subaccountnumber" title="子账号" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="subaccountname" name="subaccountname" title="子账号名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/paypriority.jsp">
                <jsp:param name="id" value="paypriority"/>
                <jsp:param name="title" value="子账户优先级"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="amountlimits" name="amountlimits" moneyFormat="money" title="赊销总额度"/>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/isinterest.jsp">
                <jsp:param name="id" value="isinterest"/>
                <jsp:param name="title" value="赊销方式"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="usedamount" name="usedamount" moneyFormat="money" title="已用额度" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="initdate" name="initdate" title="初始日期" showOpts="yyyy-MM-dd"/>
        </r:panelItem>
    </r:tinyPanel>

    <r:tinyPanel title="返点计息">
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/interestratescheme.jsp">
                <jsp:param name="id" value="rateprogramid"/>
                <jsp:param name="title" value="利率方案"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/interestperiodtype.jsp">
                <jsp:param name="id" value="interestperiodtype"/>
                <jsp:param name="title" value="计息周期"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="rate" name="rate" title="利率" />
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="interestsettlementdate" name="interestsettlementdate" title="结息日" />
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="ratespread" name="ratespread" title="浮动" />
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="lastinterestrundate" name="lastinterestrundate" title="最后结息日" showOpts="yyyy-MM-dd"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    $(function(){
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_TA_TRADESUBACCOUNT_SEARCH",
                urid: "<%=urid%>"
            },
            ok: function(text){
                $("#tradesubaccountadd").RForm({value:text});
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
    })

    var saveFn = function(){
        $("#tradesubaccountadd").RValidate({
            'success': function(){
                var params = $("#tradesubaccountadd").AllSerialize();
                Ajax.req({
                    url: "<%=formUrl%>",
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#tradesubaccountadd").RValidate("validate");
    }

</script>