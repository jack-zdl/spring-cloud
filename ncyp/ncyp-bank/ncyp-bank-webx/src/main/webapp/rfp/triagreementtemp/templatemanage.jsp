<%--
  User: zhangdl
  Date: 2017/6/19
  Time: 12:58
  version : v1.0
  description : 三方协议模板管理页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@page import="com.ceying.chx.common.constants.UserConstant"%>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.common.constants.TaTemplateEnum"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String orgId = currUser.getOrgId();
    String userid = currUser.getUserId();
    String gridtenantid = currUser.getTenantId().toString();
    String condition = null;
    if(gridtenantid.equals(CommonConstants.SUPERTENANT)) {
        condition = "";
    } else {
        condition = "gridtenantid="+gridtenantid;
    }
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="rows" value="[
    ]" />
    <jsp:param name="girdId" value="orgGrid" />
    <jsp:param name="defaultQuery" value="{id : 'orgCode',name : 'orgCode',title:'组织编码'}" />
</jsp:include>



<r:button text="新增" iclass="fa-plus" onClick="add" />
<r:button text="修改" iclass="fa-pencil-square-o" onClick="edit"/>
<r:button text="删除" iclass="fa-remove" onClick="del"/>
<r:button text="发布" iclass="fa-arrow-right"  onClick="send"/>
<r:button text="撤销" iclass="fa-arrow-left" onClick="cancel"/>


<r:win title="新增三方协议模板" id="addModal" maxable="true"/>
<r:win title="修改三方协议模板" id="editModal" maxable="true"/>
<r:win title="查看详情" id="viewModal" maxable="true"/>
<%
String TAG="/front/template/selectList.do";
%>
<r:grid id="templateGrid" dataUrl="<%=TAG%>"
        colModel="   {name : 'tatemplateCode',index : 'tatemplateCode',sortable:false},
                    {name : 'bankId',index : 'bankId',sortable:false},
                    {name : 'corecompanyId',index : 'corecompanyId',sortable:false},
                    {name : 'isactive',index : 'isactive',sortable:false},
                    {name : 'lastOperateflag',index : 'lastOperateflag',sortable:false}"
        colNames="'三方协议模板编号','融资提供方名称','核心企业名称','是否有效','状态'" multiSelect="true"></r:grid>

<script type="text/javascript">

    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        exeComQuery();
    }

    var refresh = function(){
        exeComQuery();
    }

    /**
     * 点击新增按钮的触发事件
     * @return {[type]} [description]
     */
    var add = function(){
        var url = "${pageContext.request.contextPath}/rfp/triagreementtemp/templateadd.jsp?type=add";
        $("#addModal").RWin('createWin',url);
    }


    /**
     * 点击修改按钮的触发事件
     * @return {[type]} [description]
     */
    var edit = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }
        if(rowDatas[0].lastoperateflag=="<%=TaTemplateEnum.BANKSEND.getName()%>"||rowDatas[0].lastoperateflag=="<%=TaTemplateEnum.BANKCHECKAGREE.getName()%>"||rowDatas[0].lastoperateflag=="<%=TaTemplateEnum.BANKAUDITINGAGREE.getName()%>"||rowDatas[0].lastoperateflag=="<%=TaTemplateEnum.CORECOMPANYHANDLEAGREE.getName()%>"||rowDatas[0].lastoperateflag=="<%=TaTemplateEnum.CORECOMPANYCHECKAGREE.getName()%>")  {
            $.RMessage.alert("消息", "编号为"+rowDatas[0].tatemplatecode+"的三方协议模板已成功发布，无法修改");
            return;
        }
        var url = "${pageContext.request.contextPath}/rfp/triagreementtemp/templateadd.jsp?type=mod&pks="+rowDatas[0].urid;
        $("#editModal").RWin('createWin',url);
    }


    var view = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }

        var url = "${pageContext.request.contextPath}/rfp/triagreementtemp/templateview.jsp?type=mod&pks="+rowDatas[0].urid;
        $("#viewModal").RWin('createWin',url);
    }

    /**
     * 点击删除按钮触发事件
     * 默认的表格的id是#grid-table
     * @return {[type]} [description]
     */
    var del = function(){
        var rowDatas = $("#grid-table").RGrid("getSelectedDatas");
        if(rowDatas==""){
            $.RMessage.alert("消息","请选择记录进行操作！");
            return;
        }
        var rolecodes = new Array();
        for(var j=0;j<rowDatas.length;j++){
            if(rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.BEFORESEND.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.BANKCANCEL.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.BANKCHECKREJECT.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.BANKAUDITINGREJECT.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.CORECOMPANYHANDLEREJECT.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.CORECOMPANYCHECKREJECT.getName()%>"&&rowDatas[j].lastoperateflag!="<%=TaTemplateEnum.CORECOMPANYAUDITINGREJECT.getName()%>")  {
                $.RMessage.alert("消息", "编号为"+rowDatas[j].tatemplatecode+"的三方协议模板已成功发布，无法删除");
                return;
            }
            rolecodes.push(rowDatas[j].urid);
        }
        $.RMessage.confirm("消息", "是否确认删除", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/tripartiteagreement/template/del.do",
                params: {ids:rolecodes.join(",")},
                ok: function(text) {
                    clearCache(['UC_RFP_TRIPARTITEAGREEMENTTEMPLATE_SEARCH']);
                    $.RMessage.alert("消息",text.msg,refresh);
                },
                err: function(text) {
                    $.RMesmsage.alert("消息",text.msg);
                }
            });
        });
    }

    var onRowDbClick = function(urid, data){
        var url = "${pageContext.request.contextPath}/rfp/triagreementtemp/templateview.jsp?type=mod&pks="+data.urid;
        $("#viewModal").RWin('createWin',url);
    }

    /**
     * 发布
     * @return {[type]} [description]
     */
    var send = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            if(rowData[i].lastoperateflag=="<%=TaTemplateEnum.BANKCHECKREJECT.getName()%>"||rowData[i].lastoperateflag=="<%=TaTemplateEnum.BANKAUDITINGREJECT.getName()%>"||rowData[i].lastoperateflag=="<%=TaTemplateEnum.CORECOMPANYHANDLEREJECT.getName()%>"||rowData[i].lastoperateflag=="<%=TaTemplateEnum.CORECOMPANYCHECKREJECT.getName()%>"||rowData[i].lastoperateflag=="<%=TaTemplateEnum.CORECOMPANYAUDITINGREJECT.getName()%>")  {
                $.RMessage.alert("消息", "编号为"+rowData[i].tatemplatecode+"的三方协议模板已被否决，需要重新编辑才能发布");
                return;
            }else
            if(rowData[i].lastoperateflag!="<%=TaTemplateEnum.BEFORESEND.getName()%>")  {
                $.RMessage.alert("消息", "编号为"+rowData[i].tatemplatecode+"的三方协议模板已成功发布，请勿重复操作");
                return;
            }
            pksArray.push(rowData[i].urid);
        }

        Ajax.req({
            url: "${pageContext.request.contextPath}/tripartiteagreement/template/sendbefore.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                //var sign = SignBase64String(text.tatemplate,'',false);暂时注释，用字符串代替
                var sign = SignBase64String(text.tatemplate,'asdfadadafasdadafdfadfadasdfa',false);
                Ajax.req({
                    url: "${pageContext.request.contextPath}/tripartiteagreement/template/send.do",
                    params: {
                        ids: pksArray.join(","),
                        signs: sign
                    },
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, refresh);
                    },
                    err: function(text) {
                        $.RMessage.alert("消息", text.msg);
                    }
                });
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });


    }

    /**
     * 撤销操作
     * @return {[type]} [description]
     */
    var cancel = function(){
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        if(rowData.length < 1){
            $.RMessage.alert("消息", "请选择至少一条操作记录");
            return;
        }
        var pksArray = new Array();
        for(var i=0; i<rowData.length; i++){
            if(rowData[i].lastoperateflag=="<%=TaTemplateEnum.BEFORESEND.getName()%>")  {
                $.RMessage.alert("消息", "编号为"+rowData[i].tatemplatecode+"的三方协议模板未发布，不能撤销");
                return;
            }
            pksArray.push(rowData[i].urid);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/tripartiteagreement/template/sendbefore.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                <%--var sign = SignBase64String(text.tatemplate,'<%=keynum%>',false);--%>
                var sign = SignBase64String(text.tatemplate,'asdfadadafasdadafdfadfadasdfa',false);
                Ajax.req({
                    url: "${pageContext.request.contextPath}/tripartiteagreement/template/cancel.do",
                    params: {
                        ids: pksArray.join(","),
                        signs: sign
                    },
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, refresh);
                    },
                    err: function(text) {
                        $.RMessage.alert("消息", text.msg);
                    }
                });
            },
            err: function(text) {

                $.RMessage.alert("消息", text.msg);
            }
        });

    }

</script>
