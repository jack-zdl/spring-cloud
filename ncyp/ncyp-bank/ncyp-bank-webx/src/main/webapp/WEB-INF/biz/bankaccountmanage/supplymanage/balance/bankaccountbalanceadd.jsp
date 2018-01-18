<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccountbalance/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccountbalance/edit.do";
    }
%>
<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="bankaccountbalanceadd">
    <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/supplybankaccount.jsp">
                <jsp:param name="id" value="bankaccountid"/>
                <jsp:param name="title" value="银行账户" />
                <jsp:param name="check" value="required" />
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:calendar id="reportdate" name="reportdate" title="余额日期" showOpts="yyyy-MM-dd" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="closingbalance" name="closingbalance" moneyFormat="money" title="当前余额" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="blockedbalance" name="blockedbalance" moneyFormat="money" title="冻结余额" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="reservedbalance" name="reservedbalance" moneyFormat="money" title="留底金额" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="enterprisebalance" name="enterprisebalance" moneyFormat="money" title="企业可用余额" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:numberField id="bankbalance" name="bankbalance" moneyFormat="money" title="银行可用余额" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_BA_SUPPLYBANKACCOUNTBALANCE_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#bankaccountbalanceadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#bankaccountbalanceadd").RValidate({
            'success': function(){
                var params = $("#bankaccountbalanceadd").AllSerialize();
                Ajax.req({
                    url: "<%=dataUrl%>",
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
        $("#bankaccountbalanceadd").RValidate("validate");
    }
</script>