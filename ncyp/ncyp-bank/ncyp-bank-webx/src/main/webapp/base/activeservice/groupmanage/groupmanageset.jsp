<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String dataUrl = request.getContextPath() + "/activeservice/groupmanage/set.do";
%>
<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="groupmanageset">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="name" name="name" title="名称" check="required" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效" id="isactive" name="isactive" readonly="true"/>
            </r:panelItem>
            <r:panelItem>
                <r:textArea  id="description" name="description" title="描述" readonly="true" height="100"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/multipleselect.jsp">
                    <jsp:param name="id" value="orgids"/>
                    <jsp:param name="title" value="组织"/>
                    <jsp:param name="uc" value="UC_SYS_ORGANIZATION_QUERY"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/multipleselect.jsp">
                    <jsp:param name="id" value="roleids"/>
                    <jsp:param name="title" value="角色"/>
                    <jsp:param name="uc" value="UC_BASE_MAIL_GROUPSROLE_SEARCH"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/multipleselect.jsp">
                    <jsp:param name="id" value="userids"/>
                    <jsp:param name="title" value="用户"/>
                    <jsp:param name="uc" value="UC_BASE_MAIL_GROUPSUSER_SEARCH"/>
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
                uc: "UC_BASE_MAIL_GROUPS_SEARCH",
                urid: "<%=urid%>"
            },
            ok: function(text){
                $("#groupmanageset").RForm({value:text});
                Ajax.req({
                     url: "${pageContext.request.contextPath}/activeservice/groupmanage/get.do",
                     type: "json",
                     method: "get",
                     params: {
                         groupsdefid: "<%=urid%>"
                     },
                     ok: function(text){
                         var list=text.listMap;
                         var orgs="";
                         var roles="";
                         var users="";
                         for(var i=0;i<list.length;i++){
                             if(list[i].grouptype=='1'){
                                 orgs+=list[i].recipientsid+",";
                             }else if(list[i].grouptype=='2'){
                                 roles+=list[i].recipientsid+",";
                             }else{
                                 users+=list[i].recipientsid+",";
                             }
                         }
                         orgs = orgs.substring(0,orgs.length-1);
                         roles = roles.substring(0,roles.length-1);
                         users = users.substring(0,users.length-1);
                         //1-组织,2-角色,3-用户
                         if(orgs != ""){
                             $("#orgids").attr('value',orgs);
                             $('#orgids-box').RMultiSelect('setValue');
                         }
                         if(roles != ""){
                             $("#roleids").attr('value',roles);
                             $('#roleids-box').RMultiSelect('setValue');
                         }
                         if(users != ""){
                             $("#userids").attr('value',users);
                             $('#userids-box').RMultiSelect('setValue');
                         }
                     },
                     err: function(text){
                         $.RMessage.alert("消息", text.msg);
                     }
                })
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    })

    var saveFn = function(){
        var orgids = $('#orgids-box').RMultiSelect('getValue');
        var roleids = $('#roleids-box').RMultiSelect('getValue');
        var userids = $('#userids-box').RMultiSelect('getValue');
        $("#groupmanageset").RValidate({
            'success': function(){
                Ajax.req({
                    url: '<%=dataUrl%>',
                    params: {
                        groupsid:'<%=urid%>',
                        orgids:orgids,
                        roleids:roleids,
                        userids:userids
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
        $("#groupmanageset").RValidate("validate");
    }
</script>