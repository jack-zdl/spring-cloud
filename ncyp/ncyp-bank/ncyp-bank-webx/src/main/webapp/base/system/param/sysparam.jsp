<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@page import="com.ceying.chx.common.util.properties.MessageUtil"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />
<%
    String queryuc = "UC_BASE_PARAM_PARAMANAGE_SEARCH";
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
    String userid = currUser.getUserId();
    String dataUrl = request.getContextPath() + "/common/query.do?uc=UC_BASE_PARAM_PARAMANAGE_SEARCH&queryType=2";
%>

<jsp:include page="/common/search.jsp">
    <jsp:param name="queryuc" value="<%=queryuc%>" />
</jsp:include>

<r:button text="修改" iclass="fa-pencil-square-o" visible="<%=userid+\"#sysparam/parammanage/edit\"%>" onClick="editFn" />
<r:win title="修改" id="editModal" width="800" height="300" />

</div>
</div>
</div>

<r:groupGrid id="group-grid" uniqueKey="urid" pid="parentid" dataUrl="<%=dataUrl%>" width="60"
             colModel="{title:'参数分组',text:'groups'},
             {title:'参数名称',text:'name'},
             {title:'参数值',text:'value'},
             {title:'是否集团控制',text:'isglobalcontrol'},
             {title:'描述',text:'description'}" />

</div>
</div>
</div><!-- /.main-container -->

</body>
</html>

<script type="text/javascript">
    var closeWinFn = function(){
        $("#editModal").modal("hide");
        refresh();
    }
    var refresh = function(){
        exeComQuery();
    }

    var editFn = function(){
        var obj = $('#group-grid').GroupGrid('getParent');
        if(obj.length != 1){
            $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0003")%>");
            return;
        }
        var parentid = obj[0][0];
        var urid = obj[0][1];
        var url = "${pageContext.request.contextPath}/base/system/param/sysparamadd.jsp?type=mod&urid=" + urid;
        $("#editModal").RWin("createWin", url);
    }

</script>
