<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ page import="com.ceying.chx.util.constants.SessionConstants" %>
<%@page import="com.ceying.chx.biz.system.constants.CommonConstants"%>
<%@page import="com.ceying.chx.base.util.Globals" %>
<%@page import="com.ceying.chx.util.framework.RemoteService"%>
<%@page import="com.ceying.chx.biz.service.cache.SysBaseDataCache" %>
<%@page import="com.ceying.chx.biz.constants.ENDataCacheKey" %>
<%@page import="com.ceying.chx.biz.utils.network.NetworkUtil" %>
<%@page import="com.ceying.chx.dao.sys.user.SysUserLogin" %>
<%@page import="java.util.Map" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page import="net.sf.ehcache.Cache" %>
<%@ page import="com.ceying.chx.biz.utils.cache.EhCacheUtil" %>
<%@ page import="java.util.List" %>
<%
    SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String loginFlag = "1";
	String tenantid = null;
	if(currUser == null){
		loginFlag = "0";
		tenantid = request.getParameter("tenantid");
	}else{
		tenantid = FString.valueOf(currUser.getTenant_id());
	}
	String trustedIp = "";
	if("1".equals(request.getParameter("check"))){
		//取得Cache
		Cache cache = EhCacheUtil.getCache("ReimburseIp");
		List<String> ipList = cache.get(tenantid) == null ? null : (List<String>)cache.get(tenantid).getObjectValue();
		trustedIp = FString.listToString(ipList, ",");
	}else{
		SysBaseDataCache sysBaseDataCache = RemoteService.getSysBaseDataCache();
		Map<String, Object> tenantConfigsMap = sysBaseDataCache.getCacheData(ENDataCacheKey.REIMBURSESERVICE);
		Map<String, Object> tenantsMap = sysBaseDataCache.getCacheData(ENDataCacheKey.TENANTS);

		Map<String, Object> tenantMap = (Map<String, Object>)tenantsMap.get(tenantid);
		String tenantCode = tenantMap.get("tenant_code").toString();
		Map<String, Object> tenantConfigMap = (Map<String, Object>)tenantConfigsMap.get(tenantCode);

		if(tenantConfigMap != null){
			trustedIp = ((Map<String, Object>)tenantConfigMap.get("ATS")).get("TrustedIP").toString();
		}
	}
	String ipFlag = "0";
	String ip = NetworkUtil.getIpAddr(request);
	if(NetworkUtil.checkIp(ip, trustedIp)){
		ipFlag = "1";
	}

    String url = request.getParameter("url");
	url = url.replace("?type=mod","");

%>

<script type="text/javascript">
$(function(){
	/*请求IP不是信任IP*/
	if("<%=ipFlag%>" == "1"){
		if("<%=loginFlag%>" == "0"){
			Ajax.req({
			    url: "${pageContext.request.contextPath}/home/login.do",
			    params: {
			    	username:"JNSB_admin",
			    	password:"666666",
			    	tenantid:"<%=tenantid%>"
			    },
			    ok: function(text) {
			    	window.location.href = "${pageContext.request.contextPath}"+<%=url%>;
			    },
			    err: function(text) {
			        $.RMessage.alert("消息", "操作失败！" + text.msg);
			    }
			});
		}else{
			window.location.href = "${pageContext.request.contextPath}"+<%=url%>;
		}
	}else{
	    if('<%=trustedIp%>' == ''){
            $.RMessage.alert("消息", "未配置合法IP");
		}else{
            $.RMessage.alert("消息", "请求IP不是信任IP");
            console.log("<%=ip%>");
		}
	}
	
})
	
</script>