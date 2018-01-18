<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/channel/channelmap/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/channel/channelmap/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
    <form role="form" id="channelmapadd">
        <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
        <r:tinyPanel hasHeader="false">
            <r:panelItem>
                <r:textField id="serialno" name="serialno" title="排序号" check="required"/>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/dictionary.jsp">
                    <jsp:param name="id" value="usetype"/>
                    <jsp:param name="title" value="适用类型"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="keyno" value="9999061"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/channelcondition.jsp">
                    <jsp:param name="id" value="channelconmainid"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="title" value="渠道条件"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/ucsearch/channeldefinition.jsp">
                    <jsp:param name="id" value="channeldefid"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="title" value="渠道定义"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <jsp:include page="/common/wedget/dictionary/dictionary.jsp">
                    <jsp:param name="id" value="changestrategy"/>
                    <jsp:param name="title" value="渠道切换策略"/>
                    <jsp:param name="check" value="required"/>
                    <jsp:param name="keyno" value="9999062"/>
                </jsp:include>
            </r:panelItem>
            <r:panelItem>
                <r:checkbox title="是否有效:" id="isactive" name="isactive" checked="true"/>
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
                    uc: "UC_BASE_CHANNEL_CHANNELMAP_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#channelmapadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#channelmapadd").RValidate({
            'success': function(){
                var params = $("#channelmapadd").AllSerialize();
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
        $("#channelmapadd").RValidate("validate");
    }
</script>