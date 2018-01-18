<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.biz.utils.properties.MessageUtil"%>
<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@ page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%
    String queryuc = "UC_SCS_SE_COUNTERPARTY_TREE_SEARCH";
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String tenantid = currUser.getTenant_id().toString();
    String dataUrl = request.getContextPath()+"/common/query.do?uc=UC_SCS_SE_COUNTERPARTY_TREE_SEARCH&queryType=2";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="新建" iclass="fa-plus" visible="<%=userid+\"#settlementsetting/counterparty/add\"%>" onClick="addFn" />
<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#settlementsetting/counterparty/edit\"%>" onClick="editFn" />
<r:button text="删除" iclass="fa-remove" visible="<%=userid+\"#settlementsetting/counterparty/del\"%>" onClick="delFn" />
<r:button text="生效" iclass="fa-gears" visible="<%=userid+\"#settlementsetting/counterparty/validate\"%>" onClick="validateFn" />
<r:button text="失效" iclass="fa-gears" visible="<%=userid+\"#settlementsetting/counterparty/invalidate\"%>" onClick="invalidateFn" />
<r:button text="下载交易对手模板" iclass="fa-download" visible="<%=userid+\"#settlementsetting/counterparty/downloadtemplate\"%>" onClick="downloadtemplateFn" />
<r:button text="交易对手导入" iclass="fa-upload" visible="<%=userid+\"#settlementsetting/counterparty/importData\"%>" onClick="importdataFn" />
<r:win title="新建" id="addModal" maxable="true" />
<r:win title="修改" id="editModal" maxable="true" />
<r:win title="交易对手导入" id="importModal" maxable="true" />

</div>
</div>
</div>

<r:groupGrid id="group-grid" uniqueKey="urid" pid="parentid" dataUrl="<%=dataUrl%>" width="60"
             colModel="{title:'组织名称',text:'orgname'},
            {title:'代码',text:'code'},
            {title:'名称',text:'name'},
            {title:'交易对手类别',text:'category'},
            {title:'数据来源',text:'source'},
            {title:'是否有效',text:'isactive'},
            {title:'对接系统代码',text:'othercode'},
            {title:'开户银行名称',text:'banklocations'},
            {title:'银行户名',text:'accountname'},
            {title:'银行账号',text:'accountnumber'},
            {title:'证件类型',text:'certtype'},
            {title:'证件号码',text:'certnumber'}" />

</div>
</div>
</div><!-- /.main-container -->

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/js/groupsearch.js"></script>
<script type="text/javascript">
    var closeWinFn = function(){
        $("#addModal").modal("hide");
        $("#editModal").modal("hide");
        $("#importModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var addFn = function(){
        var url = "${pageContext.request.contextPath}/scs/settlement/settlementsetting/counterparty/counterpartyadd.jsp?type=add";
        $("#addModal").RWin("createWin", url);
    }

    var editFn = function(){
    	var obj = $('#group-grid').GroupGrid('getParent');
    	if(obj.length != 1){
            $.RMessage.alert("消息","请选择一条记录进行操作！");
            return;
        }
    	var parentid=$('#group-grid').GroupGrid('getParent')[0][0];
        var urid = $('#group-grid').GroupGrid('getParent')[0][1];
        var url = "${pageContext.request.contextPath}/scs/settlement/settlementsetting/counterparty/counterpartyadd.jsp?type=mod&urid=" + urid;
        $("#editModal").RWin("createWin", url);
    }
    
    var delFn = function(){
    	var obj = $('#group-grid').GroupGrid('getParent');
    	if(obj.length < 1 ){
            $.RMessage.alert("消息","请选择至少一条记录进行操作！");
            return;
        }
    	var pksArray = new Array();
    	for(var i=0;i<obj.length;i++){
            pksArray.push($('#group-grid').GroupGrid('getParent')[i][1]);
    	}
    	$.RMessage.confirm("消息", "是否确认删除", function(){
        	Ajax.req({
                url: "${pageContext.request.contextPath}/settlementsetting/counterparty/del.do",
                params: {
                	ids: pksArray.join(",")
                },
                ok: function(text) {
                	clearCache(['UC_SCS_SE_COUNTERPARTY_SEARCH']);
                    $.RMessage.alert("消息", text.msg, refresh);
                },
                err: function(text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        });
    }
    
    var validateFn = function(){
    	var obj = $('#group-grid').GroupGrid('getParent');
    	if(obj.length < 1 ){
            $.RMessage.alert("消息","请选择至少一条记录进行操作！");
            return;
        }
    	var pksArray = new Array();
    	for(var i=0;i<obj.length;i++){
            pksArray.push($('#group-grid').GroupGrid('getParent')[i][1]);
    	}
        Ajax.req({
            url: "${pageContext.request.contextPath}/settlementsetting/counterparty/validate.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
            	clearCache(['UC_SCS_SE_COUNTERPARTY_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var invalidateFn = function(){
    	var obj = $('#group-grid').GroupGrid('getParent');
    	if(obj.length < 1 ){
            $.RMessage.alert("消息","请选择至少一条记录进行操作！");
            return;
        }
    	var pksArray = new Array();
    	for(var i=0;i<obj.length;i++){
            pksArray.push($('#group-grid').GroupGrid('getParent')[i][1]);
    	}
        Ajax.req({
            url: "${pageContext.request.contextPath}/settlementsetting/counterparty/invalidate.do",
            params: {
                ids: pksArray.join(",")
            },
            ok: function(text) {
            	clearCache(['UC_SCS_SE_COUNTERPARTY_SEARCH']);
                $.RMessage.alert("消息", text.msg, refresh);
            },
            err: function(text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var downloadtemplateFn = function () {
        window.open("${pageContext.request.contextPath}/fileDownload?filePath=/template/counterparty.xls");
    }

    var importdataFn = function () {
        var url = "${pageContext.request.contextPath}/scs/settlement/settlementsetting/counterparty/counterpartyimport.jsp";
        $("#importModal").RWin("createWin", url);
    }

</script>
