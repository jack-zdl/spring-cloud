<%--
  User: 未知
  modify:zhangdl
  Date: 2017/6/28
  Time: 10:13
  version : v1.1
  description :  组织机构设置页面  的分配组织关系的页面  用于填写一些信息  根据选入的类别的来设置展示不同的内容
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String bank = "1";  //银行编码
    String core =  "2"; //核心企业编码
    String supplier = "3";//供应商编码
    String edit = "edit";
    String opporgid = request.getParameter("opporgid"); //获得对方组织ID
    String ownid = request.getParameter("ownid"); //获得己方组织ID

    String opporgname = "";
    String ownname = "";
    String ua = request.getHeader("User-Agent") ;
    int bType = request.getHeader( "USER-AGENT" ).toLowerCase().indexOf( "msie" );
    if (ua != null) {
        if( ua.indexOf("Firefox") >-1 ){
            opporgname = new String(request.getParameter("opporgname").getBytes("Iso-8859-1"),"UTF-8"); //获得对方组织名称
            ownname = new String( request.getParameter("ownname").getBytes("Iso-8859-1"),"UTF-8");
        }else {
            opporgname = new String(request.getParameter("opporgname").getBytes("Iso-8859-1"),"GBK"); //获得对方组织名称
            ownname = new String(request.getParameter("ownname").getBytes("Iso-8859-1"),"GBK"); //获得己方组织名称
        }
    }
    String type = request.getParameter("type"); //获得是新增还是修改 add edit

    String orgType = request.getParameter("orgType"); //获得是类别是银行还是核心企业
    String cateType = request.getParameter("catetype");
    String dataUrl = request.getContextPath() + "/usermanage/org/addallocaterela.do";
    if(edit.equals(type)){   //判断是编辑还是新增页面
        dataUrl = request.getContextPath() + "/usermanage/org/editallocaterela.do";
    }
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="orgrelationadd">
    <input id="urid" type="hidden" name="urid" />  <!-- 主键 -->
    <input id="rowversion" type="hidden" name="rowversion" />  <!-- 主键 -->

    <input id="category" type="hidden" name="category" value="<%=cateType%>"/>   <!-- 类别 -->
    <input id="rowversion" type="hidden" name="rowversion" /> <!-- 版本 -->
    <input id="ourorgid" type="hidden" name="ourorgid" value="<%=ownid%>"/>      <!-- 己方id -->
    <input id="opporgid" type="hidden" name="opporgid" value="<%=opporgid%>"/>   <!-- 对方id -->
    <r:tinyPanel  hasHeader="false">
        <!--  -->
        <r:panelItem>
            <r:textField  id="ourorgname" name="ourorgname" title="己方组织" check="required:true,maxlength:32" readonly="true" value="<%=ownname%>"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="opporgname" name="opporgname" title="对方组织" check="required:true,maxlength:32" readonly="true" value="<%=opporgname%>"></r:textField>
        </r:panelItem>

        <%if(orgType.equals(bank)){%>
            <r:panelItem>
                <r:combo id="priority" name="priority" valueField="value" displayField="text" width="6"
                         dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999073"
                         title="优先级" check="required"></r:combo>
            </r:panelItem>
        <%}else{%>
                <input id="priority" type="hidden" name="priority"  value=""/>
        <%}%>

        <%if(orgType.equals(supplier)){%>
              <r:panelItem>
              <r:textField  id="corecompanysupplierrate" name="corecompanysupplierrate" title="费率" check="required:true,maxlength:32"></r:textField>
              </r:panelItem>
        <%}else{%>
            <input id="corecompanysupplierrate" type="hidden" name="corecompanysupplierrate"  value=""/>
        <%}%>

        <r:panelItem>
            <r:textArea title="描述" check="maxlength:512" id="description" name="description"/>
        </r:panelItem>
    </r:tinyPanel>
</form>

<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
/**
 * 修改页面
 *
 * @return {[type]} [description]
 */
window.onload = function(){
    if(<%=edit.equals(type)%>){
        Ajax.req({
            url: '${pageContext.request.contextPath}/common/query.do',
            type:"json",
            method:"get",
            params: {
                uc: 'UC_RFP_ORGANIZATION_SEARCH',
                ourorgid : "<%=ownid%>",
                opporgid : "<%=opporgid%>"
            },
            ok: function(text) {
              $("#orgrelationadd").RForm({value:text});
            },
            err : function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
}

    var saveFn = function() {
        $("#orgrelationadd").RValidate({
            'success' : save
        });

        $("#orgrelationadd").RValidate('validate');
    }

    var save = function() {
        var queryParams = $("#orgrelationadd").AllSerialize();
        Ajax.req({
            url : '<%=dataUrl%>',
            params : queryParams,
            ok : function(text) {

                //清除浏览器缓存
                // clearCache(['UC_SYS_ORGANIZATIONCHILE_QUERY','UC_SYS_ORGANIZATION_QUERY']);
                $.RMessage.alert("消息", text.msg, parent.closeWinFn);
            },
            err : function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

</script>
