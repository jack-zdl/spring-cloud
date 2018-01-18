<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccount/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccount/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="bankaccountadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false" column="3">
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/supplytradeaccount.jsp">
                    <jsp:param name="id" value="tradeaccountsid"/>
                    <jsp:param name="title" value="交易账户" />
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                    <jsp:param name="id" value="orgid"/>
                    <jsp:param name="title" value="组织"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="bankaccountnumber" name="bankaccountnumber" title="银行账号" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="bankaccountname" name="bankaccountname" title="银行账户名称" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/currency.jsp">
                    <jsp:param name="id" value="currencyid"/>
                    <jsp:param name="title" value="币种"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/bank.jsp">
                    <jsp:param name="id" value="bankid"/>
                    <jsp:param name="title" value="银行"/>
                    <jsp:param name="check" value="required" />
                    <jsp:param name="SelFn" value="bankidSelFn" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/banklocation.jsp">
                    <jsp:param name="id" value="banklocationid"/>
                    <jsp:param name="title" value="开户行"/>
                    <jsp:param name="check" value="required" />
                    <jsp:param name="BFn" value="banklocationBF" />
                    <jsp:param name="SelFn" value="banklocationSelFn" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/area.jsp">
                    <jsp:param name="id" value="areaid"/>
                    <jsp:param name="title" value="区域"/>
                    <jsp:param name="check" value="required" />
                    <jsp:param name="SelFn" value="areaidSelFn" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/accountstate.jsp">
                    <jsp:param name="id" value="accountstate"/>
                    <jsp:param name="title" value="账户状态"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:numberField id="miniuptransferamount" moneyFormat="money" name="miniuptransferamount" title="满额上划金额" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:numberField id="minitransferamount" moneyFormat="money" name="minitransferamount" title="最小划拨金额" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:numberField id="reservedbalance" moneyFormat="money" name="reservedbalance" title="留底金额" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否银企直联" groupFor="accounttype" setType="radio" id="isbankdirect" name="isbankdirect"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否票据虚拟户" groupFor="accounttype" setType="radio" id="isbillvirtual" name="isbillvirtual"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否现金虚拟户" groupFor="accounttype" setType="radio" id="iscashvirtual" name="iscashvirtual"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/integerrate.jsp">
                    <jsp:param name="id" value="integerrate"/>
                    <jsp:param name="title" value="取整划拨等级"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效" id="isactive" name="isactive" checked="true"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/accountcategory.jsp">
                    <jsp:param name="id" value="accounttypeid"/>
                    <jsp:param name="title" value="账户性质"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>

        </r:tinyPanel>
        <r:tinyPanel title="可选信息" column="3">
            <r:panelItem>
                <r:textField id="briefnumber" name="briefnumber" title="账户标识"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/deposittype.jsp">
                    <jsp:param name="id" value="deposittype"/>
                    <jsp:param name="title" value="直联账户存款类型"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="accountgroupid" name="accountgroupid" title="账户分组"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="otherglaccount" name="otherglaccount" title="财务系统总账科目"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="otheraccountnumber" name="otheraccountnumber" title="财务系统银行账号"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="withdrawaccountid" name="withdrawaccountid" title="提现账户"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="accountapplyid" name="accountapplyid" title="开户申请单ID"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="openeddate" name="openeddate" title="开户日期" showOpts="yyyy-MM-dd"/>
            </r:panelItem>
            <r:panelItem>
                <r:calendar id="closeddate" name="closeddate" title="销户日期" showOpts="yyyy-MM-dd"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea id="description" name="description" title="描述"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea id="reservedinstruction" name="reservedinstruction" title="留底说明"/>
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
                    uc: "UC_SCS_BA_SUPPLYBANKACCOUNT_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#bankaccountadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    });

    //三种类型账户只能三选一或者都不选
    $(function(){
        $("#isbankdirect").change(function(){
            if($("#isbankdirect").prop("checked")){
                $("#isbillvirtual").prop("checked", false);
                $("#iscashvirtual").prop("checked", false);
            }
        });

        $("#isbillvirtual").change(function(){
            if($("#isbillvirtual").prop("checked")){
                $("#isbankdirect").prop("checked", false);
                $("#iscashvirtual").prop("checked", false);
            }
        });

        $("#iscashvirtual").change(function(){
            if($("#iscashvirtual").prop("checked")){
                $("#isbillvirtual").prop("checked", false);
                $("#isbankdirect").prop("checked", false);
            }
        });
    });

    var saveFn = function(){
        $("#bankaccountadd").RValidate({
            'success': function(){
                var params = $("#bankaccountadd").AllSerialize();
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_SCS_BA_SUPPLYBANKACCOUNT_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#bankaccountadd").RValidate("validate");
    }

    var tradeaccountsidSelFn = function() {
        var tradeaccountsid = $("#tradeaccountsid").RComboGrid("getValue");
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_SCS_TA_SUPPLYTRADEACCOUNT_SEARCH",
                urid: tradeaccountsid
            },
            ok: function(text){
                if(text.rows.length < 1){
                    $.RMessage.alert("消息", text.msg);
                    return;
                }
                var entity = text.rows[0];
                $("#orgid").val();
                $("#orgid").RComboGrid("setValue", entity["orgid"]);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var bankidSelFn = function(){
        $('#banklocationid').attr('value','');
        $('#banklocationid').RComboGrid('setValue');
        $('#areaid').attr('value','');
        $('#areaid').RComboGrid('setValue');
    }

    var areaidSelFn = function(){
        $('#banklocationid').attr('value','');
        $('#banklocationid').RComboGrid('setValue');
    }

    var banklocationBF = function(){
        var bankid = $("#bankid").val();
        var areaid = $("#areaid").val();
        var Json = [{"bankid":bankid,"areaid":areaid}];
        return Json;
    }

    var banklocationSelFn = function(){
        areanameFn($("#banklocationid").val());
    }

    function areanameFn(urid) {
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                urid: urid,
                uc: 'UC_BASE_BANK_BANKLOCATIONS_SEARCH'
            },
            ok: function (text) {
                if(text.rows.length < 1){
                    $.RMessage.alert("消息", text.msg);
                    return;
                }
                var entity = text.rows[0];
                setBankid(entity["bankid"]);
                setAreaid(entity["areaid"]);
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    function setBankid(urid) {
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                urid: urid,
                uc: 'UC_BASE_BANK_BANKS_SEARCH'
            },
            ok: function (text) {
                if(text.rows.length < 1){
                    $.RMessage.alert("消息", text.msg);
                    return;
                }
                var entity = text.rows[0];
                $('#bankid').attr('value',entity["urid"]);
                $('#bankid').RComboGrid('setValue');
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    function setAreaid(urid) {
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                urid: urid,
                uc: 'UC_BASE_BANK_AREA_SEARCH'
            },
            ok: function (text) {
                if(text.rows.length < 1){
                    $.RMessage.alert("消息", text.msg);
                    return;
                }
                var entity = text.rows[0];
                $('#areaid').attr('value',entity["urid"]);
                $('#areaid').RComboGrid('setValue');
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

</script>