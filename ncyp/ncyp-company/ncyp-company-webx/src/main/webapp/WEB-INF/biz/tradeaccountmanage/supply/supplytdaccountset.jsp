<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<jsp:include page="/common/include.jsp"/>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String urid = request.getParameter("urid");
    SysUserLogin currUser = (SysUserLogin) session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String setformUrl = request.getContextPath() + "/supplytdaccountmanage/tradeaccount/set.do";
    String condition = "tradeaccountid=" + urid;
%>

<html>
<body class="no-skin" style="background:#ccc;">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content" id='query-div'>
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal" action="<%=setformUrl%>" role="form" id="tradeaccountadd">
                            <input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
                            <div class="space-6">

                            </div>
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title">基本信息</h4>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <div class="form-group">
                                            <r:textField id="accountnumber" name="accountnumber" title="交易账号"
                                                         check="required"/>
                                            <r:textField id="accountname" name="accountname" title="交易账户名称"
                                                         check="required"/>
                                            <jsp:include page="/common/wedget/dictionary/tradeaccountcategory.jsp">
                                                <jsp:param name="id" value="accountcategory"/>
                                                <jsp:param name="title" value="账户类别"/>
                                            </jsp:include>
                                            <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                                                <jsp:param name="id" value="orgid"/>
                                                <jsp:param name="title" value="所属机构"/>
                                            </jsp:include>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <r:button text="修改" iclass="fa-pencil-square-o"
                                  visible="<%=userid+\"#supplytdaccountmanage/tradeaccount/edit\"%>" onClick="editFn"/>
                        <r:win title="修改" id="editModal" maxable="true"/>
                        <div id="subaccount" class="tab-pane">
                            <%
                                String dataUrlSubaccount = request.getContextPath() + "/scs/tradeaccountmanage/supply/supplytdsubaccount.jsp?uc=UC_SCS_TA_TRADESUBACCOUNT_SEARCH&tradeaccountid=" + urid;
                            %>
                            <div class="row">
                                <div class="col-sm-12">
                                    <iframe name="iframe-subaccount" id="iframe-subaccount" width="100%" height="100%"
                                            src="" frameborder="0" id="iframe-viewsubaccount" seamless></iframe>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    $(function () {
        $("#iframe-subaccount").attr("src", "<%=dataUrlSubaccount %>");
        $("#iframe-subaccount").height(getHeight($("#iframe-subaccount")));
        if ("<%=urid%>" != null && "${param.type}" == "set") {
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_TA_SUPPLYTRADEACCOUNT_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function (text) {
                    var entity = text.rows[0];
                    for (var key in entity) {
                        var $ele = $(document.getElementsByName(key)[0]);
                        $ele.attr("Value", entity[key]);
                    }
                    $("#accountcategory").RCombo("setValue");
                    $("#orgid").RComboGrid("setValue");
                    $("#certtype").RCombo("setValue");
                },
                err: function (text) {
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    function getHeight(jselector) {
        var w_height = $(document).height();
        var otherDivHeight = 0;
        var arr = new Array();

        jselector.parents().each(function (index, el) {
            arr[index] = $(el).outerHeight(true);
        });
        for (var i = 0; i < arr.length - 2; i++) {
            otherDivHeight += (arr[i + 1] - arr[i]);
        }
        ;
        w_height -= (otherDivHeight + 5);
        return w_height;
    }

    var editFn = function () {
        var rowData = $("#grid-table").RGrid("getSelectedDatas");
        var urid = rowData[0].urid;
        var type = rowData[0].tradeaccounttypevalue;

    }

</script>