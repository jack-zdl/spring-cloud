<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String addformUrl = request.getContextPath() + "/smartcenter/banksmartmatch/add.do";
    String editformUrl = request.getContextPath() + "/smartcenter/banksmartmatch/edit.do";
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=addformUrl%>" role="form" id="banksmartmatchadd" isShow = "true">
    <input type="hidden" id="urid" name="urid" value=""/>
    <r:tinyPanel title="基本信息" hasHeader="false" >
        <r:panelItem>
            <r:textField id="bankname" name="bankname" title="银行简称" check="required"/>
        </r:panelItem>

        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/bankoption.jsp">
                <jsp:param name="id" value="bankid"/>
                <jsp:param name="title" value="银行全称"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>
        </r:panelItem>

        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    $(function(){
        if("<%=urid%>" != "" && "${param.type}" == "mod"){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_QUERY_BANKMAPPING",
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
                    $("#banksmartmatchadd").RForm({value:text});
                    $("#bankid").RComboGrid("setValue",entity["bankid"]);
                    $("#banksmartmatchadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    
    var saveFn = function(){
        $("#banksmartmatchadd").RValidate({
            'success': function(){
                var action = $("#banksmartmatchadd").attr("action");
                var params = $("#banksmartmatchadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_QUERY_BANKMAPPING']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0002")%>" + text.msg);
                    }
                })
            }
        });
        $("#banksmartmatchadd").RValidate("validate");
    }
</script>