<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String typename = request.getParameter("typename");
    String dtsrule = request.getContextPath()+"/base/rule/dtsrulemanage/dtsrule.jsp?typename="+typename;
    String dtsruledetail = request.getContextPath()+"/base/rule/dtsrulemanage/dtsruledetail.jsp?typename="+typename;
%>
    <r:tabs id="myTab"  index="0">
        <r:tab title="导入导出规则" url="<%=dtsrule %>" id="dtsrule"/>
        <r:tab title="导入导出规则明细" url="<%=dtsruledetail %>" id="dtsruledetail"/>
    </r:tabs>
</body>
</html>