<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccountdetail/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccountdetail/edit.do";
    }
%>
<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="bankaccountdetailadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false" column="3">
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/supplybankaccount.jsp">
                    <jsp:param name="id" value="bankaccountid"/>
                    <jsp:param name="title" value="银行账户" />
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="tradedatetime" name="tradedatetime" title="交易时间" showOpts="yyyy-MM-dd HH:mm:ss" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="valuedate" name="valuedate" title="起息日期" showOpts="yyyy-MM-dd" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/moneyway.jsp">
                    <jsp:param name="id" value="moneyway"/>
                    <jsp:param name="title" value="交易方向"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:numberField id="amount" name="amount" moneyFormat="money" title="余额" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:numberField id="currentbalance" name="currentbalance" moneyFormat="money" title="当前余额" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="sourceid" name="sourceid" title="来源ID"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="checkcode" name="checkcode" title="对账码"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="purpose" name="purpose" title="用途"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="comments" name="comments" title="备注"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="oppositeaccountnumber" name="oppositeaccountnumber" title="对方账号"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="oppositeaccountname" name="oppositeaccountname" title="对方户名"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/bank.jsp">
                    <jsp:param name="id" value="oppositebank"/>
                    <jsp:param name="title" value="对方银行"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="billcode" name="billcode" title="票据号"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="billtype" name="billtype" title="票据类型"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="outputer" name="outputer" title="导出人"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="outputdate" name="outputdate" title="导出状态确认时间" showOpts="yyyy-MM-dd"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="reconciliationno" name="reconciliationno" title="对账批号"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                    <jsp:param name="id" value="claimorgid"/>
                    <jsp:param name="title" value="认领单位"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="claimant" name="claimant" title="认领人"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="claimdate" name="claimdate" title="认领日期" showOpts="yyyy-MM-dd"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="paymentgenerateinfo" name="paymentgenerateinfo" title="资金交易生成失败原因"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="paymentgeneratedate" name="paymentgeneratedate" title="资金交易生成状态确认日期" showOpts="yyyy-MM-dd"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="bankserialnumber" name="bankserialnumber" title="银行流水号"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="sourcenoteobjectid" name="sourcenoteobjectid" title="来源单据对象"/>
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
                    uc: "UC_SCS_BA_SUPPLYBANKACCOUNTTRANSACTION_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#bankaccountdetailadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#bankaccountdetailadd").RValidate({
            'success': function(){
                var params = $("#bankaccountdetailadd").AllSerialize();
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
        $("#bankaccountdetailadd").RValidate("validate");
    }
</script>