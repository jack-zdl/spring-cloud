<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String dataUrl = request.getContextPath() + "/activeservice/rulemanage/set.do";
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="rulemanageset">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:checkbox title="是否有效:" id="isactive" name="isactive" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="code" name="code" title="代码"  check="required" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textField id="name" name="name" title="名称"  check="required" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:comboGrid id="objectsid" name="objectsid" valueField="urid" width="6" displayField="codename" colModel="[{title:'代码-名称',field:'codename',width:120}]" dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_MAIL_OBJECTS_SEARCH" title="邮件对象" selectable="false"  check="required" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea  id="description" name="description"  title="描述" readonly="true" height="100"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/multipleselect.jsp">
                    <jsp:param name="id" value="groupids"/>
                    <jsp:param name="title" value="群组"/>
                    <jsp:param name="uc" value="UC_BASE_MAIL_GROUPS_SEARCH"/>
                </jsp:include>
            </r:panelItem>
        </r:tinyPanel>
    </form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_BASE_MAIL_RULES_SEARCH",
                urid: "<%=urid%>"
            },
            ok: function(text){
                $("#rulemanageset").RForm({value:text});
                Ajax.req({
                     url: "${pageContext.request.contextPath}/activeservice/rulemanage/get.do",
                     type: "json",
                     method: "get",
                     params: {
                         rulesid: "<%=urid%>"
                     },
                     ok: function(text){
                         var list=text.listMap;
                         var groups="";
                         for(var i=0;i<list.length;i++){
                             groups+=list[i].groupsdefid+",";
                         }
                         groups=groups.substring(0,groups.length-1);
                         if(groups != ""){
                             $("#groupids").attr('value',groups);
                             $('#groupids-box').RMultiSelect('setValue');
                         }
                     },
                        err:function(text){
                             $.RMessage.alert("消息", text.msg);
                        }
                });
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    })

    var saveFn = function(){
        var groupids = $('#groupids-box').RMultiSelect('getValue');
        $("#rulemanageset").RValidate({
            'success': function(){
                Ajax.req({
                    url: '<%=dataUrl%>',
                    params: {
                        rulesid:'<%=urid%>',
                        groupids:groupids
                    },
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#rulemanageset").RValidate("validate");
    }

</script>