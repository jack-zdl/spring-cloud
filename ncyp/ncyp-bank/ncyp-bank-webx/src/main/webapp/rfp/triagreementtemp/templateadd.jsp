<%--
  User: zhangdl
  Date: 2017/6/19
  Time: 12:58
  version : v1.0
  description : 三方协议模板管理新增页面  加锁文件
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@page import="com.ceying.chx.common.constants.UserConstant"%>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="static com.ceying.chx.common.constants.ServiceNameConstants.TAG" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
    String urid = request.getParameter("pks");
    String type = request.getParameter("type");
    boolean bl=(urid!=null)&&(!"".equals(urid))?true:false;
    boolean modFlag =bl&&"mod".equals(type);
    String dataUrl = TAG+"/template/insert";
    if(modFlag){
        dataUrl = request.getContextPath() + "/tripartiteagreement/template/edit.do";
    }

    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(UserConstant.USER_LOGIN_SESSION);
    String userid = currUser.getUserId();
    String orgid = currUser.getOrgId();
    String gridtenantid = currUser.getTenantId().toString();
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
    String paramUrl  = TAG+"/dictionary/param?keyno=9999086";
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="templateadd" name="templateadd">
    <input id="urid" type="hidden" name="urid" />
    <input id="bankid" type="hidden" name="bankid" value="<%=orgid%>"/>
    <input id="rowversion" type="hidden" name="rowversion" />


    <r:tinyPanel title="新增三方协议模板" hasHeader="false" >

        <!-- 企业检索-->
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/bankviewcorecompany.jsp">
                <jsp:param name="id" value="corecompanyid"/>
                <jsp:param name="name" value="corecompanyid"/>
                <jsp:param name="title" value="核心企业"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="businesstype" name="businesstype" valueField="value" displayField="text"
                     dataUrl="<%=paramUrl%>"
                     title="业务类型" check="required" ></r:combo>
        </r:panelItem>
        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述" />
        </r:panelItem>
    </r:tinyPanel>

    <r:tinyPanel title="模板内容" hasHeader="true" column="1.2">
        <r:panelItem>
            <jsp:include page="/common/editor.jsp" >
                <jsp:param name="id"  value="container" />
                <jsp:param name="name"  value="container" />
            </jsp:include>
        </r:panelItem>
    </r:tinyPanel>

</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">


    /**
     * 页面刷新后默认执行的函数
     * 将后台获取的数据填入编辑框内
     * 初始化三方协议模板编辑区域
     * @DEPRECATED
     * @return {[type]} [description]
     */
    <%--window.onload = function(){--%>

        <%--if(<%=modFlag%>){--%>
            <%--Ajax.req({--%>
                <%--url: '${pageContext.request.contextPath}/common/query.do',--%>
                <%--type:"json",--%>
                <%--method:"get",--%>
                <%--params: {--%>
                    <%--uc: 'UC_RFP_TRIPARTITEAGREEMENTTEMPLATE_SEARCH',--%>
                    <%--urid:'${param.pks}'--%>
                <%--},--%>
                <%--ok: function(text) {--%>

                    <%--$("#templateadd").RForm({value:text});--%>
                    <%--$('#container').REditor('setValue',text.rows[0]["templatecontent"]);--%>
                    <%--if(<%=modFlag%>){--%>
                        <%--$("#bankid").RComboGrid('setValue');--%>
                        <%--$("#bankid").RComboGrid('setReadOnly',true);--%>
                        <%--$('#businesstype').attr('value',text.rows[0].businesstype);--%>
                        <%--$("#businesstype").RCombo('setValue');--%>
                        <%--$("#businesstype").RCombo('setReadOnly',true);--%>
                        <%--$("#corecompanyid").RComboGrid('setValue');--%>
                        <%--$("#corecompanyid").RComboGrid('setReadOnly',true);--%>
                    <%--}--%>
                <%--},--%>
                <%--err: function(text) {--%>
                    <%--alert("消息："+text);--%>
                <%--}--%>
            <%--});--%>
        <%--}else {--%>
            <%--var templatecontent = "";--%>
            <%--Ajax.req({--%>
                <%--url: "${pageContext.request.contextPath}/common/query.do",--%>
                <%--type: "json",--%>
                <%--method: "get",--%>
                <%--params: {--%>
                    <%--uc: "UC_RFP_PLATFORMTEMPLATE_SEARCH",--%>
                    <%--templatecode: "PT1007"--%>
                <%--},--%>
                <%--ok: function(text){--%>
                    <%--var entity = text.rows[0];--%>
                    <%--templatecontent = entity["templatecontent"];--%>
                    <%--$('#container').REditor('setValue',templatecontent);--%>
                <%--},--%>
                <%--err: function(text){--%>
                    <%--$.RMessage.alert("消息", text);--%>
                <%--}--%>
            <%--});--%>

        <%--}--%>
    <%--}--%>

    /**
     * 触发验证
     * 触发保存函数
     * @return {[type]} [description]
     */
    var saveFn = function(){
        $("#templateadd").RValidate({
            'success': save
        });
        $("#templateadd").RValidate('validate');
    }

    /**
     * 使用原生的ajax方法
     * json数据
     * @return {[type]} [description]
     */
    var save = function(){
        var container = $('#container').REditor('getValue'); //.replace(/\{\<.*?\>/g,'{').replace(/\<\/[a-z]*?\>\}/g,'}')
//        var items = container.match(/\{.*?\}/g);
//        for(var i=0;i<items.length;i++){
//            container = container.replace(items[i],items[i].replace(/\<.*?\>/g,'').replace(/\&.*?\;/g,'').replace(/\s+/g,''));
//        }
//        if(items.length<20){
//            $.RMessage.alert("消息", "缺少占位符，请检查模板");
//            return;
//        }
//        for(var i=0;i<items.length;i++){
//            items[i] = items[i].replace(/\<.*?\>/g,'').replace(/\&.*?\;/g,'').replace(/\s+/g,'');
//            if(templateItems.indexOf(items[i])=="-1"){
//                $.RMessage.alert("消息", items[i]+"不是标准占位符，请检查模板");
//                return;
//            }else if(templateItems[i]!=items[i]){
//                $.RMessage.alert("消息", items[i]+"位置不正确，此处占位符应为"+templateItems[i]);
//                return;
//            }
//        }
        /*var flag = verifyItems(container.replace(/\<.*?\>/g,'').replace(/\&.*?\;/g,''),items);

         if(flag=="false"){
         return;
         }*/

        var paramJson = {};
        debugger
        paramJson.urid = $("#urid").val();
        paramJson.isrecourse = $("#isrecourse").val();
        paramJson.bankid = $("#bankid").val();
        paramJson.rowversion = $("#rowversion").val();
        paramJson.corecompanyid = $("#corecompanyid").val();
        paramJson.description = $("#description").val();
        paramJson.container = container;
        paramJson.businesstype = $("#businesstype").RCombo('getValue');
        Ajax.req({
            method: "POST",
            url: '<%=dataUrl%>',
            params:  JSON.stringify(paramJson),     // $('#login').serialize(),
            async: false,
            type: "json",
            headers:"AJAX",
            err: function (request) {
                $("#message").text(request.msg);
            },
            ok: function (data) {
                if(data.result == 1){
                    window.location.href = "${pageContext.request.contextPath}/bizframe/jsp/indexFrame.jsp";
                }else {
                    $("#message").text(data.msg);
                }
            }
        });

        <%--Ajax.req({--%>
            <%--url: '<%=dataUrl%>',--%>
            <%--params: paramJson,--%>
            <%--ok: function (text) {--%>
                <%--$.RMessage.alert("消息", text.msg,parent.closeWinFn);--%>
            <%--},--%>
            <%--err: function (text) {--%>
                <%--$.RMessage.alert("消息", text.msg);--%>
            <%--}--%>
        <%--});--%>
    }

//    var verifyItems = function(context,items){
//        var flag ="true";
//        for(var i=0;i<items.length;i++){
//            items[i] = items[i].replace(/\<.*?\>/g,'').replace(/\&.*?\;/g,'').replace(/\s+/g,'');
//            if(items[i].indexOf("address")!="-1"){
//                var  address = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(address.indexOf("住址") =="-1" ){
//                    alert("缺少地址信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("representative")!="-1"){
//                var  representative = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(representative.indexOf("人") =="-1" ){
//                    alert("缺少法人信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("company")!="-1"){
//                var  company = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(company.indexOf("企业") =="-1" ){
//                    alert("缺少企业信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("account")!="-1"){
//                var  account = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(account.indexOf("账号") =="-1" ){
//                    alert("缺少账号信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("bank")!="-1"){
//                var  bank = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(bank.indexOf("行") =="-1" ){
//                    alert("缺少银行信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("name")!="-1"){
//                var  name = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(name.indexOf("名") =="-1" ){
//                    alert("缺少名称信息");
//                    flag = "false";
//                    return flag;
//                }
//            }else if(items[i].indexOf("signdate")!="-1"){
//                var  signdate = context.substring(context.indexOf(items[i])-5,context.indexOf(items[i]));
//                if(signdate.indexOf("签订日") =="-1" ){
//                    alert("缺少签订日");
//                    flag = "false";
//                    return flag;
//                }
//            }
//        }
//        return flag;
//    }

    var refresh = function(){
        exeComQuery();
    }

    <%--$(function(){--%>
        <%--$("#businesstype").RCombo('afterSelect',templatesel);--%>
    <%--})--%>

    <%--var templatesel = function(){--%>
        <%--var type = $("#businesstype").val();--%>
        <%--var templatecode="";--%>
        <%--if(type=="101"){--%>
            <%--templatecode="PT1008";--%>
        <%--}else if(type=="201"){--%>
            <%--templatecode="PT1007";--%>
        <%--}else if(type=="301"){--%>
            <%--templatecode="PT1009";--%>
        <%--}--%>
        <%--var templatecontent = "";--%>
        <%--Ajax.req({--%>
            <%--url: "${pageContext.request.contextPath}/common/query.do",--%>
            <%--type: "json",--%>
            <%--method: "get",--%>
            <%--params: {--%>
                <%--uc: "UC_RFP_PLATFORMTEMPLATE_SEARCH",--%>
                <%--templatecode: templatecode--%>
            <%--},--%>
            <%--ok: function(text){--%>
                <%--var entity = text.rows[0];--%>
                <%--if(entity==null||entity=="undifined"||entity==""){--%>
                    <%--templatecontent="";--%>
                <%--}else{--%>
                    <%--templatecontent = entity["templatecontent"];--%>
                <%--}--%>

                <%--$('#container').REditor('setValue',templatecontent);--%>
            <%--},--%>
            <%--err: function(text){--%>
                <%--$.RMessage.alert("消息", text);--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
</script>
