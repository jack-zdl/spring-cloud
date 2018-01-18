<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String addformUrl = request.getContextPath() + "/rule/extdatalookup/add.do";
    String editformUrl = request.getContextPath() + "/rule/extdatalookup/edit.do";
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=addformUrl%>" role="form" id="extdatalookupadd">
    <input type="hidden" id="urid" name="urid" value=""/>
    <r:tinyPanel title="基本信息" hasHeader="false" >
        <r:panelItem>
        	<jsp:include page="/common/wedget/ucsearch/dtsextobject.jsp">
               	<jsp:param name="id" value="dtsextobjectid"/>
               	<jsp:param name="title" value="值对象"/>
                <jsp:param name="check" value="required"/>
         	</jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="externalvalue" name="externalvalue" title="原始值" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效:" id="isactive" name="isactive"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="innervalue" name="innervalue" title="目的值" check="required"/>
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
                    uc: "UC_BASE_IO_EXTDATALOOKUP_SEARCH",
                    urid: "<%=urid%>"
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
                    $("#extdatalookupadd").RForm({value:text});
                    $("#dtsextobjectid").RComboGrid("setValue",entity["dtsextobjectid"]);
                    $("#extdatalookupadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    
    var saveFn = function(){
        $("#extdatalookupadd").RValidate({
            'success': function(){
                var action = $("#extdatalookupadd").attr("action");
                var params = $("#extdatalookupadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_IO_EXTDATALOOKUP_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#extdatalookupadd").RValidate("validate");
    }
</script>