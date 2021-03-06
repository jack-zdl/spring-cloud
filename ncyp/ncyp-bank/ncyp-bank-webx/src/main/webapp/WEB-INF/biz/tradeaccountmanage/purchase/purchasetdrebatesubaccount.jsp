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
            <r:numberField id="initbalance" name="initbalance" moneyFormat="money" title="折扣金额"/>
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