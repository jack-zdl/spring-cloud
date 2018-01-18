<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp" />

<%
	String dataUrlInfo = request.getContextPath()
		   	+"/admin/system/usermanage/viewuserinfo.jsp?userid="+request.getParameter("userid");
	String dataUrlOrg = request.getContextPath()
			+"/admin/system/usermanage/viewuserinfoorg.jsp?userid="+request.getParameter("userid");
	String dataUrlRole = request.getContextPath()
			+"/admin/system/usermanage/viewuserinforole.jsp?userid="+request.getParameter("userid");
%>

    <r:tabs id="myTab"  index="0">
        <r:tab title="基本信息" url="<%=dataUrlInfo %>" id="userInfo"/>
        <r:tab title="关联组织信息" url="<%=dataUrlOrg %>" id="orgInfo"/>
        <r:tab title="角色名称" url="<%=dataUrlRole %>" id="roleName"/>
    </r:tabs>

<script type="text/javascript">
    $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        if($(e.target).attr('href') == "#userInfo" ) {
            $("#iframe-userInfo").attr("src","<%=dataUrlInfo %>");
            $("#iframe-userInfo").height(getHeight($("#iframe-calendar")));
        }
        if($(e.target).attr('href') == "#orgInfo"){
            $("#iframe-orgInfo").attr("src","<%=dataUrlOrg %>");
            $("#iframe-orgInfo").height(getHeight($("#iframe-orgInfo")));
        }
        if($(e.target).attr('href') == "#roleName"){
            $("#iframe-roleName").attr("src","<%=dataUrlRole %>");
            $("#iframe-roleName").height(getHeight($("#iframe-roleName")));
        }
    });

    function getHeight (jselector) {
        var w_height=$(document).height();
        var otherDivHeight=0;
        var arr=new Array();

        jselector.parents().each(function(index, el) {
            arr[index]=$(el).outerHeight(true);
        });
        for (var i = 0; i < arr.length-2; i++) {
            otherDivHeight+=(arr[i+1]-arr[i]);
        };
        w_height-=(otherDivHeight+5);
        return w_height;
    }
</script>

