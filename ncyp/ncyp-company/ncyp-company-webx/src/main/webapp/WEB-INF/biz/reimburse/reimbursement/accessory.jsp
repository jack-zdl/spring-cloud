<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/RUI/themes/default/css/accessory.css">

<jsp:include page="/common/include.jsp" />

    <div class="thumbnails_list">
        <ul >
            <%
                List<String> storageIds = (List<String>) request.getAttribute("storageIds");
                Map<String,String> storageToThumbnail = (Map<String, String>) request.getAttribute("storageToThumbnail");
            if(storageToThumbnail!=null&&storageToThumbnail.size()>0){
                Set<String> set = storageToThumbnail.keySet();
                for(String thumbnailid:set){
            %>
            <li><!--对缩略图的展示-->
                <img  id="thumbnail"  onclick="showdetail('<%=storageToThumbnail.get(thumbnailid)%>')"
                      src="${pageContext.request.contextPath}/reimburse/reimbursement/view.do?urid=<%=thumbnailid%>" />
            </li>
            <%
                }
            %>
        </ul>
    </div>
        <!--对大图的展示-->
        <img id="storage" src="${pageContext.request.contextPath}/reimburse/reimbursement/view.do?urid=<%=storageIds.get(0)%>"/>
    <%
    }else{
    %>
        <div>
            <img alt="没有附件" src="${pageContext.request.contextPath}/reimburse/reimbursement/view.do?urid=<%=storageIds.get(0)%>"/>
        </div>
        <%
            }
        %>
</body>
<script type="text/javascript">
    $('.thumbnails_list ul').width($('.thumbnails_list li').length * 80);
    var showdetail= function(storageId){
        var src = "${pageContext.request.contextPath}/reimburse/reimbursement/view.do?urid="+storageId;
        $("#storage").attr("src",src);
    }
</script>
</html>
