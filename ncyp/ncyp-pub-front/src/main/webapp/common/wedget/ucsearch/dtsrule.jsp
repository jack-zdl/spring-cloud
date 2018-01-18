<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!--导入导出规则-->
<%
    String id=(request.getParameter("id")==null)?(""):(request.getParameter("id"));
    String typename = (request.getParameter("typename")==null)?(""):(request.getParameter("typename"));
    String BFn=(request.getParameter("BFn")==null)?(""):(request.getParameter("BFn"));
    String SelFn=(request.getParameter("SelFn")==null)?(""):(request.getParameter("SelFn"));
    String linkageParam=(request.getParameter("linkageParam")==null)?(""):(request.getParameter("linkageParam"));
    //是否启用公用的BFn，1表示启用 0表示不用,默认启用。对于一些复杂的处理过程，通用的BFn无法处理，要在页面中进行定义
    String IsUseBFn=(request.getParameter("IsUseBFn")==null)?("1"):(request.getParameter("IsUseBFn"));
    String check=(request.getParameter("check")==null)?(""):(request.getParameter("check"));
    String listWidth = request.getParameter("listWidth")==null ? "" : request.getParameter("listWidth");
%>
<r:comboGrid
        valueField="urid"  displayField="codename"    multiSelect="${param.multiSelect}"
        filterField="name"
        id="${param.id}" name="${param.id}"
        listWidth="<%=listWidth%>"
        title="${param.title}"
        forceLoad="true"
        beforeSelect="${param.BFn}"
        afterSelect="${param.SelFn}"
        colModel="[{title:'代码-名称',field:'codename',width:120}]"
        width="${param.width}"
        check="${param.check}"
        disabled="${param.disabled}"
        selectable="${param.selectable}"
        readonly="${param.readonly}"
        dataUrl="${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_IO_OBJRULE_SEARCH&typename=<%=typename%>"
        />
<script type="text/javascript">
    <%
        if(!BFn.equals("")&&IsUseBFn.equals("1")){
     %>
    var <%=BFn%>=function(){
        <%
        if(!id.equals("")&&(!linkageParam.equals(""))){
        %>
        $('<%=id%>').RComboGrid("setBaseParams",<%=linkageParam %>);
        <%
        }
        %>
    }<%
}
%>
</script>