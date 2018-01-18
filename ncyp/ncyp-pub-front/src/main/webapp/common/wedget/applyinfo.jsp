<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%@include file="/common/include.jsp" %>
<%
  /**
   * 申请查看
   * */
  String InstanceId=(request.getParameter("InstanceId")==null)?(""):(request.getParameter("InstanceId"));
  String isCanApprovestr=(request.getParameter("isCanApprove")==null)?(""):(request.getParameter("isCanApprove"));
  Boolean isCanApprove=false;
  String pagetitle=(request.getParameter("pagetitle")==null)?(""):(request.getParameter("pagetitle"));
  if(isCanApprovestr.equals("true")){
    isCanApprove=true;
  }
  String basePath = request.getContextPath();
  String url=(request.getParameter("url")==null)?(""):(request.getParameter("url"));
  String urid = request.getParameter("urid");
  String dataSystemtask=basePath+url+"?urid="+urid;
  String wf_graphicPage_url= basePath+"/workflow/client/common/processGraphic.jsp?instanceId="+InstanceId;
  String wf_remarkPage_url= basePath+"/workflow/client/common/processTraceInfo.jsp?instanceId="+InstanceId;
  %>

<r:tabs id="myTab" fit="modal"  index="0"  height="1000">
    <r:tab title="基本信息"  id="systemtask" url="<%=dataSystemtask %>">
       <%-- <iframe id="wf_process_graphic1" src="<%=dataSystemtask %>" frameborder="0" style="border:2px;padding:0px;margin:0px;width:100%;">
        </iframe>--%>
    </r:tab>
    <%if (!isCanApprove && InstanceId != null) {%>
    <r:tab title="流程图"  id="runscheduler">
        <iframe id="wf_process_graphic1" src="<%=wf_graphicPage_url %>" frameborder="0" style="border:2px;padding:0px;margin:0px;width:100%;">
        </iframe>
    </r:tab>
    <r:tab title="流程流转"  id="runhistory">
        <iframe id="wf_process_graphic1" src="<%=wf_remarkPage_url %>" frameborder="0" style="border:2px;padding:0px;margin:0px;width:100%;">
        </iframe>
    </r:tab>
    <%}%>

</r:tabs>
<script>

    $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        if( $(e.target).attr('href') == "#systemtask" ) {
            $("#iframe-systemtask").attr("src","<%=dataSystemtask %>");
            $("#iframe-systemtask").height(getHeight($("#iframe-systemtask")));
        }
        if($(e.target).attr('href') == "#runscheduler"){
            $("#iframe-runscheduler").attr("src","<%=wf_graphicPage_url %>");
            $("#iframe-runscheduler").height(getHeight($("#wf_process_graphic")));
        }
        if($(e.target).attr('href') == "#runhistory"){
            $("#iframe-runhistory").attr("src","<%=wf_remarkPage_url %>");
            $("#iframe-runhistory").height(getHeight($("#iframe-runhistory")));
        }
    });
    $(function(){
        $("#wf_process_graphic1").height(600);
        $("#runhistory1").height(600);
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


