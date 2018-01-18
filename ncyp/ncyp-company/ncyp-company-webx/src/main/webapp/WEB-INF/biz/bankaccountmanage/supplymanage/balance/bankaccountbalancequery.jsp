<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String formUrl = request.getContextPath() + "/supplybkaccountmanage/bankaccountbalance/getbalance.do";
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="bankaccountbalancequery">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                    <jsp:param name="id" value="orgid"/>
                    <jsp:param name="title" value="组织" />
                    <jsp:param name="multiSelect" value="true"/>
                    <jsp:param name="showText" value="true"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/bank.jsp">
                    <jsp:param name="id" value="bankid"/>
                    <jsp:param name="title" value="银行"/>
                    <jsp:param name="multiSelect" value="true"/>
                    <jsp:param name="showText" value="true"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否包含下级组织" id="isincsub" name="isincsub"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/user.jsp">
                    <jsp:param name="id" value="userid"/>
                    <jsp:param name="title" value="消息通知人"/>
                    <jsp:param name="multiSelect" value="true"/>
                    <jsp:param name="showText" value="true"/>
                    <jsp:param name="check" value="required" />
                </jsp:include>
            </r:panelItem>
        </r:tinyPanel>
    </form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    var saveFn = function(){
        $("#bankaccountbalancequery").RValidate({
            'success': function(){
                var params = $("#bankaccountbalancequery").AllSerialize();
                $("body").doMask();
                Ajax.req({
                    url: "<%=formUrl%>",
                    params: params,
                    ok: function(text) {
                        $("body").removeMask();
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $("body").removeMask();
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#bankaccountbalancequery").RValidate("validate");
    }
</script>