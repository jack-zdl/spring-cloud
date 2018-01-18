<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String extobjects = request.getContextPath()+"/base/rule/extobjectconf/extobjects.jsp";
    String exedatalookup = request.getContextPath()+"/base/rule/extobjectconf/extdatalookup.jsp";
%>
    <r:tabs id="myTab"  index="0">
        <r:tab title="内外值转化定义" url="<%=extobjects %>" id="extobjects"/>
        <r:tab title="内外值转化明细" url="<%=exedatalookup %>" id="exedatalookup"/>
    </r:tabs>
</body>
</html>