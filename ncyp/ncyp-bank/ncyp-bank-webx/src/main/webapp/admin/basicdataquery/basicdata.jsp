<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<div class="operate_btn_list clearfix">
      <ul>
        <li>
            <div onclick="currency()">
               <p>币种</p>
               <i class="fa fa-refresh"></i>
            </div>
        </li>
        <li>
            <div onclick="calendar()">
                <p>日历管理</p>
                <i class="fa fa-calendar"></i>
            </div>
        </li>
        <li>
            <div onclick="noteobjects()">
                <p>单据对象</p>
                <i class="fa fa-clone"></i>
            </div>
        </li>
    </ul>
</div>

<script>
    var basicdataCloseWinFn = function(){
        $("#currencyModal").modal("hide");
        $("#calendarModal").modal("hide");
        $("#noteobjectsModal").modal("hide");

    }
    function currency()
    {
        var url = "${pageContext.request.contextPath}/admin/currencies/currencies.jsp";
        $("#currencyModal").RWin("createWin", url);
    }
    function calendar()
    {
        var url = "${pageContext.request.contextPath}/admin/calendars/calendars.jsp";
        $("#calendarModal").RWin("createWin", url);
    }
    function noteobjects()
    {
        var url = "${pageContext.request.contextPath}/admin/noteobjects/noteobjects.jsp";
        $("#noteobjectsModal").RWin("createWin", url);
    }
</script>

</html>
