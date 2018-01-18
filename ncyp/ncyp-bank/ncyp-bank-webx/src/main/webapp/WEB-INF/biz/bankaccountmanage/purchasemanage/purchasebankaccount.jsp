<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants" %>
<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String queryuc = "UC_SCS_BA_PURCHASEBANKACCOUNT_TREESEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = String.valueOf(currUser.getTenant_id());
    String condition = "&queryType=2";
    if(tenantid.equals(CommonConstants.SUPERTENANT)){
        condition = condition + "&gridtenantid=";
    }else{
        condition = condition + "&gridtenantid=" + tenantid;
    }
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SCS_BA_PURCHASEBANKACCOUNT_TREESEARCH"+condition;
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新建" iclass="fa-gears" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/del\"%>" onClick="delFn" />
<r:button text="激活" iclass="fa-link" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/active\"%>" onClick="activeFn" />
<r:button text="冻结" iclass="fa-chain-broken" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/freeze\"%>" onClick="freezeFn" />
<r:button text="设置默认账户" iclass="fa-university" visible="<%=userid+\"#purchasebkaccountmanage/bankaccount/setdefault\"%>" onClick="setdefaultFn" />
<r:win title="新建" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="详情页面" id="detailModal" maxable="true" />
</div>
</div>
</div>

<r:groupGrid id="group-grid" uniqueKey="urid" pid="parentid" dataUrl="<%=dataUrl%>" width="60"
             colModel="{title:'交易账户名称',text:'tradeaccountname'},
            {title:'交易账号',text:'tradeaccountnumber'},
            {title:'银行账户名称',text:'bankaccountname'},
            {title:'银行账号',text:'bankaccountnumber'},
            {title:'银行名称',text:'bankname'},
            {title:'是否有效',text:'isactive'},
            {title:'是否默认账户',text:'isdefault'}"/>

</div>
</div>
</div><!-- /.main-container -->

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/groupsearch.js"></script>
<script type="text/javascript">
    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/purchasemanage/purchasebankaccountadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length != 1){
            $.RMessage.alert("消息","<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var parentid = obj[0][0];
        var urid = obj[0][1];
        var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/purchasemanage/purchasebankaccountadd.jsp?type=mod&urid=" + urid;
        $("#editModal").RWin("createWin", url);
    }

    var delFn = function() {
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length < 1){
            $.RMessage.alert("消息","<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0;i<obj.length;i++){
            pksArray.push(obj[i][1]);
        }
        $.RMessage.confirm("消息", "是否确认删除！", function(){
            Ajax.req({
                url: "${pageContext.request.contextPath}/purchasebkaccountmanage/bankaccount/del.do",
                params: {
                    ids: pksArray.join(",")
                },
                ok: function(text) {
                    clearCache(['UC_SCS_BA_PURCHASEBANKACCOUNT_SEARCH']);
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        });
    }

    var activeFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0;i<obj.length;i++){
            pksArray.push(obj[i][1]);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/purchasebkaccountmanage/bankaccount/active.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                clearCache(['UC_SCS_BA_PURCHASEBANKACCOUNT_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var freezeFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var pksArray = new Array();
        for(var i=0;i<obj.length;i++){
            pksArray.push(obj[i][1]);
        }
        Ajax.req({
            url: "${pageContext.request.contextPath}/purchasebkaccountmanage/bankaccount/freeze.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
                clearCache(['UC_SCS_BA_PURCHASEBANKACCOUNT_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    var setdefaultFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var parentid = obj[0][0];
        var urid = obj[0][1];
        Ajax.req({
            url: "${pageContext.request.contextPath}/purchasebkaccountmanage/bankaccount/setdefault.do",
            params: {
                urid: urid
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        });
    }

    <%--var onRowDbClick = function(id, data){--%>
        <%--var url = "${pageContext.request.contextPath}/scs/bankaccountmanage/purchasemanage/purchasebankaccountdetail.jsp?urid=" + data["urid"];--%>
        <%--$("#detailModal").RWin("createWin", url);--%>
    <%--}--%>
</script>
