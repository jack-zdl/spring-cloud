<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<jsp:include page="/common/include.jsp"/>
<%
    String urid = request.getParameter("urid");
%>
    <style>
         #title{
             text-align:center
          }
    .publishinfo{
    color:#9B9B9B;
    text-align:center
    }
    .publishinfo span{
      margin:0 10px
    }
    #noticecontent{
         margin: 10px 50px;
          border-top:5px double #2E90CF;
    padding:10px;
    }
    </style>

<html>
    <body>
        <h3 id="title">

        </h3>
        <div  class="publishinfo">
           <span id="publisher"></span><span id="publishtime"></span>
        </div>

        <div id="noticecontent">

        </div>
    </body>
</html>

<script type="text/javascript">
    $(function(){
        Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_BASE_SET_NOTICES_SEARCH",
                urid: "<%=urid%>"
            },
            ok: function(text){
                if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
                $("#title").html(entity["name"]);
                $('#publisher').html(entity["lastmodifiedby"]);
                $('#publishtime').html(entity["lastmodifiedon"]);
                $('#noticecontent').html(entity["noticecontent"]);
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
    })
</script>