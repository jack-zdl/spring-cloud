<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.ceying.chx.util.framework.SysParameterUtil"%>
<%@page import="com.ceying.chx.sys.service.cache.BizframeParamterCache"%>
<%
String path=request.getScheme()+"://"+ request.getServerName()+":"+ 
            request.getServerPort()+ request.getContextPath()+"/";
boolean isShieldF5=SysParameterUtil.getBoolProperty("shieldF5",false);
boolean isShieldBcakSpace=SysParameterUtil.getBoolProperty("shieldBcakSpace",false);
boolean isShieldRightKey=SysParameterUtil.getBoolProperty("shieldRightKey",false);
boolean isValidateCode=SysParameterUtil.getBoolProperty("login_has_validateCode",false);
boolean isloginMutipleStyle=SysParameterUtil.getBoolProperty("loginMutipleStyle",false);
int     msgPollInterval=SysParameterUtil.getIntProperty("msgPollInterval",3);
int     lockScreenInterval=SysParameterUtil.getIntProperty("lockScreenInterval",30);
int     openMaxTabNum=SysParameterUtil.getIntProperty("openMaxTabNum",6);
String  systemHelpUrl=SysParameterUtil.getProperty("systemHelpUrl","bizframe/jsp/help/bizframe-help.html");
String  menuLoadModel=SysParameterUtil.getProperty("menuLoadModel","tree");
boolean singleTab=SysParameterUtil.getBoolProperty("singleTab",true);
String  logoHeight=SysParameterUtil.getProperty("logoHeight","70");
String  bizEncryptFalg=SysParameterUtil.getProperty("bizEncryptFalg","3DES");
boolean uniqueOrgCode=SysParameterUtil.getBoolProperty("uniqueOrgCode",false);
%>

<script>
var isShieldF5=<%=isShieldF5%>;
var isShieldBcakSpace=<%=isShieldBcakSpace%>;
var isShieldRightKey=<%=isShieldRightKey%>;
var isValidateCode=<%=isValidateCode%>;
var isloginMutipleStyle=<%=isloginMutipleStyle%>;
var basePath='<%=path%>';
var msgPollInterval=<%=msgPollInterval%>;
var lockScreenInterval=<%=lockScreenInterval%>;
var openMaxTabNum=<%=openMaxTabNum%>;
var systemHelpUrl='<%= systemHelpUrl %>';
var menuLoadModel='<%= menuLoadModel.toLowerCase() %>';
var singleTab=<%= singleTab %>;
var logoHeight=<%= logoHeight %>;
var bizEncryptFalg='<%= bizEncryptFalg %>';
var uniqueOrgCode=<%=uniqueOrgCode%>;
</script>