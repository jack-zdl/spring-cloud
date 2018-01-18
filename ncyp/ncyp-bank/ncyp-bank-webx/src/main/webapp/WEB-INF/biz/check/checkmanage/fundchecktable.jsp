<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String fundchecksingle = request.getContextPath()+"/scs/check/checkmanage/fundcheck/fundchecksingle.jsp";
    String fundcheckbatch = request.getContextPath()+"/scs/check/checkmanage/fundcheck/fundcheckbatch.jsp";
%>
    <r:tabs id="myTab"  index="0">
        <r:tab title="资金单笔核对" url="<%=fundchecksingle %>" id="fundchecksingle"/>
        <r:tab title="资金多笔核对" url="<%=fundcheckbatch %>" id="fundcheckbatch"/>
    </r:tabs>
</body>
</html>