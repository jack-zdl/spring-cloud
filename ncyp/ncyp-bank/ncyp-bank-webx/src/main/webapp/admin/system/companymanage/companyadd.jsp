<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = null;
    if(modFlag){
        dataUrl = request.getContextPath() + "/tenantmanage/tenant/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="syscompanyadd" >
    <input id="tenant_id" type="hidden" name="tenant_id" />
    <input id="tenant_type" type="hidden" name="tenant_type" />
    <input id="tenant_status" type="hidden" name="tenant_status" />
    <r:tinyPanel hasHeader="false">
        <r:panelItem>
            <r:textField  id="tenant_code" name="tenant_code" title="企业代码" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="tenant_name" name="tenant_name" title="企业名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="tenant_shortname" name="tenant_shortname" title="企业英文简称"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="tenant_cnshortname" name="tenant_cnshortname" title="企业中文简称"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="telno" name="telno" title="固定电话" check="telephone"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="mobile" name="mobile" title="法人手机号" check="required,cellphone"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="email" name="email" title="法人邮箱" check="required,email"/>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    window.onload = function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: '${pageContext.request.contextPath}/common/query.do',
                type:"json",
                method:"get",
                params: {
                    uc: 'UC_SYS_SYSCOMPANY_SEARCH',
                    tenant_id:'${param.urid}'
                },
                ok: function(text) {
                    $("#syscompanyadd").RForm({value:text});
                    $('#tenant_code').attr("readonly","true");
                    //默认combogrid会赋显示值，所以此处赋隐藏值
                    $('#tenant_type').val(text.rows[0]['tenant_typevalue']);
                    $('#tenant_status').val(text.rows[0]['tenant_statusvalue']);
                },
                err: function(text) {
                    $.RMessage.alert("消息",text);
                }
            });
        }
    };

    var saveFn = function(){
        $("#syscompanyadd").RValidate({
            'success': save
        });
        $("#syscompanyadd").RValidate('validate');
    }

    var save = function(){
        var queryParams = $("#syscompanyadd").AllSerialize();
        Ajax.req({
            url: '<%=dataUrl%>',
            params: queryParams,
            ok: function(text) {
                //清除浏览器缓存
                clearCache(['UC_SYS_SYSCOMPANY_SEARCH']);
                $.RMessage.alert("消息",text.msg,parent.closeWinFn);
            },
            err: function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }
</script>