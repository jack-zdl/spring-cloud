<%
String basePath=request.getScheme()+"://"
	+ request.getServerName()+":"
	+ request.getServerPort()
	+ request.getContextPath()+"/";

response.setHeader("Cache-Control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //
%>
<base href="<%=basePath%>" />