<%--
  User: zhangdl
  Date: 2017/6/19
  Time: 12:58
  version : v1.0
  description : 代办任务 三方协议模板的发布后融资提供方签约否决或同意的统一页面
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.common.system.constants.CommonConstants"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ page import="com.ceying.chx.ats.common.util.WorkFlowUtil" %>
<%@ page import="java.util.*" %>
<jsp:include page="/common/include.jsp" />

<%
    String urid = "";
    if (request.getParameter("instanceId") != null) {
        List tmp = WorkFlowUtil.findBizDetailByInstanceId(request.getParameter("instanceId"));
        if (tmp.size() > 0) {
            urid = tmp.get(0).toString();
        }
    }

    String type = request.getParameter("type");
    boolean modFlag = true;

    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String orgid = currUser.getOrg_id();
    String gridtenantid = currUser.getTenant_id().toString();
    String keynum = currUser.getC_credentials();
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
<form role="form" id="templateapprove" name="templateapprove">
    <input id="urid" type="hidden" name="urid" />
    <input id="rowversion" type="hidden" name="rowversion" />
    <r:tinyPanel title="基本信息" hasHeader="true" >
        <!-- 融资提供方检索
        gridtenantid.equals(CommonConstants.SUPERTENANT)
        是设置是否是新增或者是编辑的判断
        -->
        <r:panelItem>
            <jsp:include  page="/common/wedget/ucsearch/organizationoption.jsp">
                <jsp:param name="id" value="bankid"/>
                <jsp:param name="name" value="bankid"/>
                <jsp:param name="title" value="融资提供方"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>

        </r:panelItem>

        <!-- 企业检索-->
        <r:panelItem>
            <jsp:include  page="/common/wedget/ucsearch/organizationoption.jsp">
                <jsp:param name="id" value="corecompanyid"/>
                <jsp:param name="name" value="corecompanyid"/>
                <jsp:param name="title" value="核心企业"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="businesstype" name="businesstype" valueField="value" displayField="text"
                     dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999086"
                     title="业务类型" check="required" ></r:combo>
        </r:panelItem>

        <r:panelItem>
            <r:textArea   id="description" name="description" title="描述"  readonly="true"/>
        </r:panelItem>

    </r:tinyPanel>

    <r:tinyPanel title="模板内容" hasHeader="true" >
        <div id="templatecontent">
        </div>
    </r:tinyPanel>
</form>

<script type="text/javascript">

    /**
     * 页面刷新后默认执行的函数
     * 将后台获取的数据填入编辑框内
     * @TODO 开始写编辑
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
                    urid:'<%=urid%>'
                },
                ok: function(text) {
                    $("#templateapprove").RForm({value:text});
                    $('#container').REditor('setValue',text.rows[0]["templatecontent"]);
                    $("#bankid").RComboGrid('setValue');
                    $("#bankid").RComboGrid('setReadOnly',true);
                    $("#corecompanyid").RComboGrid('setValue');
                    $("#corecompanyid").RComboGrid('setReadOnly',true);
                    $('#businesstype').attr('value',text.rows[0].businesstype);
                    $("#businesstype").RCombo('setValue');
                    $("#businesstype").RCombo('setReadOnly',true);
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
        };
    }


    $(function () {
        if (parent.workflow) {
            var sign = "";
            parent.workflow.cancelSubmit = function () {
                $('body').removeMask();
            };
            parent.workflow.beforeSubmit = function () {
                var taskid = parent.workflow.taskId;
                var approvetype = "role_apply_approve";
                $('body').doMask('正在处理,请稍候...');

                var result = true;
                Ajax.req({
                    url: "${pageContext.request.contextPath}/tripartiteagreement/template/sendapprovebefore.do",
                    async: false,
                    params: {
                        ids: '<%=urid%>'
                    },
                    ok: function(text) {
                        sign = SignBase64String(text.tatemplate,'<%=keynum%>',false);
                        if (sign == ""){
                            $('body').removeMask();
                            $.RMessage.alert("消息", "未能正确签名！");
                            result = false;
                            return;
                        }

                        if (sign == "[]"){
                            $('body').removeMask();
                            $.RMessage.alert("消息", "请检查是否已生成模板！");
                            result = false;
                            return;
                        }
                        Ajax.req({
                            url: "${pageContext.request.contextPath}/tripartiteagreement/template/checkbeforeapprove.do",
                            async: false,
                            params: {
                                ids: '<%=urid%>',
                                signs: sign
                            },
                            ok: function(text) {
                                if (text["result"] == 'OK'){

                                    result = true;
                                }else{
                                    $('body').removeMask();
                                    $.RMessage.alert("消息", "无效三方协议模板！");
                                    result = false;
                                }
                                return;
                            },
                            err: function(text) {
                                $('body').removeMask();
                                $.RMessage.alert("消息", "网络传输错误！");
                                result = false;
                                return;
                            }
                        });
                    },
                    err: function(text) {
                        $('body').removeMask();
                        $.RMessage.alert("消息", "网络传输错误！");
                        result = false;
                        return;
                    }
                });
                return result;
            };
            parent.workflow.afterSubmit=function(){
                $('body').removeMask();
                $.RMessage.alert("消息", "操作成功！！", refreshCallBack);
            };
            parent.workflow.getBusinessData = function () {
                var nodename = parent.workflow.taskName;

                return {
                    urid: '<%=urid%>',
                    nodename:nodename,
                    curruserid:'<%=userid%>',
                    currorgid:'<%=orgid%>',
                    sign:sign
                };
            };
            parent.workflow.regist({});
        }
    });
    var refreshCallBack = function() {
        parent.parent.location.reload();
    };


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

</body>
</html>
