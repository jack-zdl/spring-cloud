<%--
  User: zhangdl
  Date: 2017/6/19
  Time: 12:58
  version : v1.0
  description : 三方协议模板管理新增页面  加锁文件
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("pks");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/tripartiteagreement/template/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/tripartiteagreement/template/edit.do";
    }
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String orgid = currUser.getOrg_id();
    String gridtenantid = currUser.getTenant_id().toString();
    String treetenantid = "";
    if(CommonConstants.SUPERTENANT.equals(gridtenantid) == false){  //不是超级租户，进行租户隔离
        treetenantid = gridtenantid;
    }
%>
<style>
    td{
        border: 1px solid black;
    }
    #templatecontent{
        margin: 10px 50px;
        padding:10px;
    }bottom
</style>
<jsp:include page="/common/formhead.jsp" />
<form role="form" id="templateadd" name="templateadd">
    <input id="urid" type="hidden" name="urid" />

    <input id="rowversion" type="hidden" name="rowversion" />

    <r:tinyPanel title="基本信息" hasHeader="true" >
        <!-- 融资提供方检索
        gridtenantid.equals(CommonConstants.SUPERTENANT)
        是设置是否是新增或者是编辑的判断
        -->
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/orgbank.jsp">
                <jsp:param name="id" value="bankid"/>
                <jsp:param name="name" value="bankid"/>
                <jsp:param name="title" value="融资提供方"/>
            </jsp:include>

        </r:panelItem>

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
                     dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999086"
                     title="业务类型" check="required" ></r:combo>
        </r:panelItem>

        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述"  readonly="true"/>
        </r:panelItem>
    </r:tinyPanel>


    <r:tinyPanel title="模板内容" hasHeader="true" >
        <div id="templatecontent">
        </div>
    </r:tinyPanel>

</form>


<script type="text/javascript" src="${pageContext.request.contextPath}/common/templatefiles/templatecontent.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/base/plugin/jquery.serialize-object.min.js" ></script>
<script type="text/javascript">

    /**
     * 页面刷新后默认执行的函数
     * 将后台获取的数据填入编辑框内
     * 初始化三方协议模板编辑区域
     * @DEPRECATED
     * @return {[type]} [description]
     */
    window.onload = function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: '${pageContext.request.contextPath}/common/query.do',
                type:"json",
                method:"get",
                params: {
                    uc: 'UC_RFP_TRIPARTITEAGREEMENTTEMPLATE_SEARCH',
                    urid:'${param.pks}'
                },
                ok: function(text) {
                    $("#templateadd").RForm({value:text});
                    $('#container').REditor('setValue',text.rows[0]["templatecontent"]);
                    $("#bankid").RComboGrid('setValue');
                    $("#bankid").RComboGrid('setReadOnly',true);
                    $('#businesstype').attr('value',text.rows[0].businesstype);
                    $("#businesstype").RCombo('setValue');
                    $("#businesstype").RCombo('setReadOnly',true);
                    $("#corecompanyid").RComboGrid('setValue');
                    $("#corecompanyid").RComboGrid('setReadOnly',true);
                    $("#container").RComboGrid('setValue');
                    $("#container").RComboGrid('setReadOnly',true);
                    var entity = text.rows[0];
                    var templatecontent = entity["templatecontent"];
                    $('#templatecontent').html(templatecontent);

                },
                err: function(text) {
                    alert("消息："+text);
                }
            });
        }else {
            $('#container').REditor('setValue',commonTemplate);
        }
    }

    String.prototype.format = function(args) {
        var result = this;
        if (arguments.length < 1) {
            return result;
        }

        var data = arguments;       //如果模板参数是数组
        if (arguments.length == 1 && typeof (args) == "object") {
            //如果模板参数是对象
            data = args;
        }
        for (var key in data) {
            var value = data[key];
            var rkey = "/\\\{" + key + "}/g";
            if (undefined != value) {
                result = result.replace(eval(rkey), value);
            }
        }
        return result;
    }

</script>
