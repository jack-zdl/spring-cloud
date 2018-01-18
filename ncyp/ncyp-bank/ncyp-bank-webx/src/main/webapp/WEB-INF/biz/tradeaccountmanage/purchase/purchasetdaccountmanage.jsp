<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@ page import="com.ceying.chx.biz.constants.ENPurchaseTradeAccountType" %>
<%@ page import="com.ceying.chx.biz.system.constants.ErrorCodeConstants" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String queryuc = "UC_SCS_TA_PURCHASETRADEACCOUNT_TREESEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String condition = "&queryType=2";
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SCS_TA_PURCHASETRADEACCOUNT_TREESEARCH"+condition;
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新建" iclass="fa-gears" visible="<%=userid+\"#purchasetdaccountmanage/tradeaccount/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#purchasetdaccountmanage/tradeaccount/edit\"%>" onClick="editFn" />
<r:button text="激活" iclass="fa-link" visible="<%=userid+\"#purchasetdaccountmanage/tradeaccount/active\"%>" onClick="activeFn" />
<r:button text="冻结" iclass="fa-chain-broken" visible="<%=userid+\"#purchasetdaccountmanage/tradeaccount/freeze\"%>" onClick="freezeFn" />
<r:win title="新建" id="addModal" width="800" height="500" />
<r:win title="修改" id="editModal" width="800" height="500" />

</div>
</div>
</div>

<r:groupGrid id="group-grid" uniqueKey="urid" pid="parentid" dataUrl="<%=dataUrl%>" width="60"
             colModel="{title:'父账户账号',text:'tradeaccountnumber'},
            {title:'父账户名称',text:'tradeaccountname'},
            {title:'子账户账号',text:'subaccountnumber'},
            {title:'子账号名称',text:'subaccountname'},
            {title:'子账号类别',text:'tradeaccounttypename'},
            {title:'子账号支付优先级',text:'paypriorityname'},
            {title:'是否有效',text:'isactive'}" />

</div>
</div>
</div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/groupsearch.js"></script>
<script type="text/javascript">
    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        $("#setModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdaccountadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }
        var parentid = obj[0][0];
        var urid = obj[0][1];
        if("0"==parentid){
            var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdaccountadd.jsp?urid="+urid+"&type=mod";
            $("#editModal").RWin("createWin", url);
        }else{
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_TA_TRADESUBACCOUNT_SEARCH",
                    urid: urid
                },
                ok:function(text){
                    var entity = text.rows[0];
                    var tradeaccounttypevalue = entity['tradeaccounttypevalue'];
                    var type = tradeaccounttypevalue.split("-")[0];
                    //根据不同的子账户类别,进入不同的子账户修改页面
                    if(type == "<%=ENPurchaseTradeAccountType.CASH.getValue()%>") {//现金子账户
                        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdcashsubaccount.jsp?urid="+urid+"&type=mod";
                        $("#editModal").RWin("createWin", url);
                    }else if(type == "<%=ENPurchaseTradeAccountType.BILL.getValue()%>") {//票据子账户
                        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdbillsubaccount.jsp?urid="+urid+"&type=mod";
                        $("#editModal").RWin("createWin", url);
                    }else if(type == "<%=ENPurchaseTradeAccountType.REBATE.getValue()%>") {//返点子账户
                        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdrebatesubaccount.jsp?urid="+urid+"&type=mod";
                        $("#editModal").RWin("createWin", url);
                    }else if(type == "<%=ENPurchaseTradeAccountType.LOAN.getValue()%>"){//赊销子账户
                        var url = "${pageContext.request.contextPath}/scs/tradeaccountmanage/purchase/purchasetdinterestsubaccount.jsp?urid="+urid+"&type=mod";
                        $("#editModal").RWin("createWin", url);
                    }else{
                        $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.TAM0008)%>");
                        return;
                    }
                },
                err:function(text){
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    }


    var activeFn=function(){
        var flag='child';
        var objs = $('#group-grid').GroupGrid('getParent');
        if(objs.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }

        var parentid = objs[0][0];
        if(parentid == '0'){
            flag = 'parent';
        }
        //父账户和子账户不允许同时修改
        if(objs.length > 1){
            for(var i=1; i<objs.length; i++){
                if(flag == 'parent'){
                    if(objs[i][0] != "0"){  //存在选中的节点不全是父节点
                        $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.TAM0009)%>");
                        return;
                    }
                }else{
                    if(objs[i][0] == "0"){  //存在选中的节点不全是子节点
                        $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.TAM0009)%>");
                        return;
                    }
                }
            }
        }

        var pksArray = new Array();
        for(var i=0; i<objs.length; i++){
            pksArray.push(objs[i][1]);
        }
        Ajax.req({
            url:'${pageContext.request.contextPath}/purchasetdaccountmanage/tradeaccount/active.do',
            params:{
                pks: pksArray.join(","),
                flag: flag
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    var freezeFn=function(){
        var flag='child';
        var objs = $('#group-grid').GroupGrid('getParent');
        if(objs.length < 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.PUB0003)%>");
            return;
        }

        var parentid = objs[0][0];
        if(parentid == '0'){
            flag = 'parent';
        }
        //父账户和子账户不允许同时修改
        if(objs.length > 1){
            for(var i=1; i<objs.length; i++){
                if(flag == 'parent'){
                    if(objs[i][0] != "0"){  //存在选中的节点不全是父节点
                        $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.TAM0009)%>");
                        return;
                    }
                }else{
                    if(objs[i][0] == "0"){  //存在选中的节点不全是子节点
                        $.RMessage.alert("消息", "<%=MessageUtil.format(ErrorCodeConstants.TAM0009)%>");
                        return;
                    }
                }
            }
        }

        var pksArray = new Array();
        for(var i=0; i<objs.length; i++){
            pksArray.push(objs[i][1]);
        }
        Ajax.req({
            url:'${pageContext.request.contextPath}/purchasetdaccountmanage/tradeaccount/freeze.do',
            params:{
                pks: pksArray.join(","),
                flag: flag
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

</script>
