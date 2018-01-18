<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/channel/channeldefinition/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/channel/channeldefinition/edit.do";
    }
    SysUserLogin currUser = (SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String tenant_id= currUser.getTenant_id().toString();
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="channeldefinitionadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <input type="hidden" id="tenant_id" name="tenant_id" value="<%=tenant_id%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="code" name="code" title="代码" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="name" name="name" title="名称" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/accountcategory.jsp">
                    <jsp:param name="id" value="accounttypeid"/>
                    <jsp:param name="title" value="账户用途"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="SelFn" value="accountcategorySelFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/settlementmode.jsp">
                    <jsp:param name="id" value="settlementmodeid"/>
                    <jsp:param name="title" value="结算方式"/>
                    <jsp:param name="check" value="required"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/dictionary.jsp">
                    <jsp:param name="id" value="multiactdeal"/>
                    <jsp:param name="title" value="多账户处理方式"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="keyno" value="9999058"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/dictionary.jsp">
                    <jsp:param name="id" value="orglimit"/>
                    <jsp:param name="title" value="限定组织"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="keyno" value="9999059"/>
                    <jsp:param name="SelFn" value="orglimitSelFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                    <jsp:param name="id" value="orgid"/>
                    <jsp:param name="title" value="组织"/>
                    <jsp:param name="readonly" value="true"/>
                    <jsp:param name="SelFn" value="bank_org_SelFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/dictionary.jsp">
                    <jsp:param name="id" value="banklimit"/>
                    <jsp:param name="title" value="限定银行"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="keyno" value="9999060"/>
                    <jsp:param name="SelFn" value="banklimitSelFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/bank.jsp">
                    <jsp:param name="id" value="bankid"/>
                    <jsp:param name="title" value="银行"/>
                    <jsp:param name="readonly" value="true"/>
                    <jsp:param name="SelFn" value="bank_org_SelFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/supplybankaccount.jsp">
                    <jsp:param name="id" value="accountid"/>
                    <jsp:param name="title" value="银行账户"/>
                    <jsp:param name="readonly" value="true"/>
                    <jsp:param name="BFn" value="channelbankaccountBFn"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="加急标志:" id="fastflag" name="fastflag" checked="false"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea id="description" name="description" title="描述"/>
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
                    uc: "UC_BASE_CHANNEL_CHANNELDEFINITION_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#channeldefinitionadd").RForm({value:text});
                    $('#code').attr("readonly","true");
                    if($("#orglimit").val() == 2){
                        $("#orgid").RComboGrid('setReadOnly',false);
                        $("#orgid").RComboGrid('setCheck','required:true');
                    };
                    if($("#banklimit").val() == 2){
                        $("#bankid").RComboGrid('setReadOnly',false);
                        $("#bankid").RComboGrid('setCheck','required:true');
                        if($("#orglimit").val() == 2){
                            $("#accountid").RComboGrid('setReadOnly',false);
                            $("#accountid").RComboGrid('setCheck','required:true');
                        };
                    };
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#channeldefinitionadd").RValidate({
            'success': function(){
                var params = $("#channeldefinitionadd").AllSerialize();
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
        $("#channeldefinitionadd").RValidate("validate");
    }

    var orglimitSelFn = function(){
        if($("#orglimit").val() == 2){
            $("#orgid").RComboGrid('setReadOnly',false);
            $("#orgid").RComboGrid('setCheck','required:true');
            if($("#banklimit").val() == 2 && $("#accounttypeid").val()){
                $("#accountid").RComboGrid('setReadOnly',false);
                $("#accountid").RComboGrid('setCheck','required:true');
            }
        } else {
            $("#orgid").attr('value',' ');
            $("#orgid").RComboGrid('setValue');
            $("#orgid").RComboGrid('setReadOnly',true);
            $("#orgid").RComboGrid('setCheck','');
            $("#accountid").attr('value',' ');
            $("#accountid").RComboGrid('setValue');
            $("#accountid").RComboGrid('setReadOnly',true);
            $("#accountid").RComboGrid('setCheck','');
        }
    }

    var banklimitSelFn = function(){
        if($("#banklimit").val() == 2){
            $("#bankid").RComboGrid('setReadOnly',false);
            $("#bankid").RComboGrid('setCheck','required:true');
            if($("#orglimit").val() == 2 && $("#accounttypeid").val()){
                $("#accountid").RComboGrid('setReadOnly',false);
                $("#accountid").RComboGrid('setCheck','required:true');
            }
        } else {
            $("#bankid").attr('value',' ');
            $("#bankid").RComboGrid('setValue');
            $("#bankid").RComboGrid('setReadOnly',true);
            $("#bankid").RComboGrid('setCheck','');
            $("#accountid").attr('value',' ');
            $("#accountid").RComboGrid('setValue');
            $("#accountid").RComboGrid('setReadOnly',true);
            $("#accountid").RComboGrid('setCheck','');
        }
    }

    var accountcategorySelFn = function(){
        if($("#orglimit").val() == 2 && $("#banklimit").val() == 2){
            $("#accountid").RComboGrid('setReadOnly',false);
            $("#accountid").RComboGrid('setCheck','required:true');
        }
    }

    var bank_org_SelFn = function(){
        $("#accountid").attr('value',' ');
        $("#accountid").RComboGrid('setValue');
    }

    var channelbankaccountBFn = function(){
        var accounttypeid = $("#accounttypeid").val();
        var bankid = $("#bankid").val()
        var orgid = $("#orgid").val();
        var Json = [{"bankid":bankid,"accounttypeid":accounttypeid,"orgid":orgid}];
        return Json;
    }

</script>