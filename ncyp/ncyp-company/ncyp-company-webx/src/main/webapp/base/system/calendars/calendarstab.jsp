<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/common/include.jsp" />
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String calendar = request.getContextPath()+"/base/system/calendars/calendars.jsp";
    String calendarSpecial = request.getContextPath()+"/base/system/calendars/calendarspecial.jsp";
%>
    <r:tabs id="myTab"  index="0">
        <r:tab title="日历" url="<%=calendar %>" id="calendar"/>
        <r:tab title="特殊节假日" url="<%=calendarSpecial %>" id="calendarSpecial"/>
    </r:tabs>
</body>
</html>

<script type="text/javascript">
    $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        if( $(e.target).attr('href') == "#calendar" ) {
            $("#iframe-calendar").attr("src","<%=calendar %>");
            $("#iframe-calendar").height(getHeight($("#iframe-calendar")));
        }
        if($(e.target).attr('href') == "#calendarSpecial"){
            $("#iframe-calendarSpecial").attr("src","<%=calendarSpecial %>");
            $("#iframe-calendarSpecial").height(getHeight($("#iframe-calendarSpecial")));
        }
    });

    function getHeight (jselector) {
        var w_height=$(document).height();
        var otherDivHeight=0;
        var arr=new Array();

        jselector.parents().each(function(index, el) {
            arr[index]=$(el).outerHeight(true);
        });
        for (var i = 0; i < arr.length-2; i++) {
            otherDivHeight+=(arr[i+1]-arr[i]);
        };
        w_height-=(otherDivHeight+5);
        return w_height;
    }
</script>

