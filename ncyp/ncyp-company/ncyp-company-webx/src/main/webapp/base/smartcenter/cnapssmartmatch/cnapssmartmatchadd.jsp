<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String editformUrl = request.getContextPath() + "/smartcenter/cnapssmartmatch/edit.do";
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=editformUrl%>" role="form" id="cnapssmartmatchadd">
    <input type="hidden" id="urid" name="urid" value=""/>
    <r:tinyPanel title="基本信息" hasHeader="false"  column = "1" >
        <r:panelItem>
            <jsp:include page="/common/wedget/dictionary/cnapstype.jsp">
                <jsp:param name="id" value="cnapstype"/>
                <jsp:param name="name" value="cnapstype"/>
                <jsp:param name="title" value="联行号类型"/>
                <jsp:param name="width" value="6"/>
            </jsp:include>
        </r:panelItem>
    </r:tinyPanel>
    <table width="100%" height="100%">
        <tr>
            <td align = "center"><r:button text="保存" id="saveid" iclass="bigger-110" bclass="btn btn-warning" onClick="saveFn"  /></td>
            <td align = "center"><r:button text="取消" id="cancelid" iclass="bigger-110" bclass="btn btn-primary" onClick="parent.closeWinFn"/></td>
        </tr>
    </table>
</form>



<script type="text/javascript">
    $(function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_BANK_BANKLOCATIONS_SEARCH",
                    urid:  "<%=urid%>"
                },
                ok: function(text){
                    if(text.rows.length < 1){
                        $.RMessage.alert("消息", text.msg);
                        return;
                    }
                    var entity = text.rows[0];
                    for(var key in entity){
                        var $ele=$(document.getElementsByName(key)[0]);
                        $ele.attr("Value", entity[key]);
                    }
                    $("#cnapssmartmatchadd").RForm({value:text});
                    $("#cnapstype").RCombo("setValue");
                    $("#cnapssmartmatchadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
    })

    var saveFn = function(){
        $("#cnapssmartmatchadd").RValidate({
            'success': function(){
                var action = $("#cnapssmartmatchadd").attr("action");
                var params = $("#cnapssmartmatchadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_BANK_BANKLOCATIONS_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息",  text.msg);
                    }
                })
            }
        });
        $("#cnapssmartmatchadd").RValidate("validate");
    }

</script>