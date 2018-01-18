<%--<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/formhead.jsp"/>
<form  role="form" id="tenantadd" >
    <r:tinyPanel title="基本信息" hasHeader="false">
        <r:panelItem>
            <r:textField id="tenantName" name="tenantName" title="企业全称" check="required"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    var saveFn = function(){
        $("#tenantadd").RValidate({
            'success': function(){
                var params = $("#tenantadd").AllSerialize();
                Ajax.req({
                    url: '${pageContext.request.contextPath}/registermanage/createTenant.do',
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg);
                        parent.closeWinFn();
                        parent.parent.location.reload();
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#tenantadd").RValidate("validate");
    }
</script>