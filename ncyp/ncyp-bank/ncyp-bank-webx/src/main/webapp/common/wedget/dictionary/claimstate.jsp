<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /**
     * 认领状态
     */
    String id=(request.getParameter("id")==null)?(""):(request.getParameter("id"));
    String BFn=(request.getParameter("BFn")==null)?(""):(request.getParameter("BFn"));
    String SelFn=(request.getParameter("SelFn")==null)?(""):(request.getParameter("SelFn"));
    String linkageParam=(request.getParameter("linkageParam")==null)?(""):(request.getParameter("linkageParam"));
    //是否启用公用的BFn，1表示启用 0表示不用,默认启用。对于一些复杂的处理过程，通用的BFn无法处理，要在页面中进行定义
    String IsUseBFn=(request.getParameter("IsUseBFn")==null)?("1"):(request.getParameter("IsUseBFn"));
    String check=(request.getParameter("check")==null)?(""):(request.getParameter("check"));
%>
<r:combo check="<%=check%>" id="<%=id%>" name="<%=id%>" title="${param.title}" autoload="true" width="${param.width}"
         valueField="value" selectFirst="${param.selectFirst}" defaultValue="${param.defaultValue}" displayField="text" readonly="${param.readonly}" selectable="${param.selectable}"
         displayFormat="{displayField}" beforeSelect="<%=BFn %>" afterSelect="<%=SelFn %>"
         dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=1028"/>