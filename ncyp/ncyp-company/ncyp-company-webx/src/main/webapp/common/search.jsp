<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>
<%@ page import="com.ceying.chx.controller.common.CommonQueryController" %>

<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<div class="grid-wrap">

        <%
String rows = request.getParameter("rows");
String girdId = request.getParameter("girdId");
JSONArray js=JSONObject.parseArray(rows);
int n=js.size();
String defaultQuery = request.getParameter("defaultQuery");
JSONObject defQuery=JSONObject.parseObject(defaultQuery);
%>
    <!-- 右侧 -->
        <%
    if(n>0){
%>

    <div class="win_search">
        <div class="search_header">
            <i class="fa fa-search col5" aria-hidden="true"></i>高级查询
            <span class="close_win"><i class="fa fa-times" aria-hidden="true"></i></span>
        </div>
        <form id="queryForm" class="clearfix search_form">
            <r:tinyPanel hasHeader="false" id="queryPanel_T">
                <%
                    for (int i=0;i<js.size();i++){
                        String json=js.get(i).toString();
                        String id=JSONObject.parseObject(json).get("id").toString();
                        String name=JSONObject.parseObject(json).get("name").toString();
                        String title=JSONObject.parseObject(json).get("title").toString();
                        String type=JSONObject.parseObject(json).get("type").toString();
                        if("text".equals(type)){
                %>
                <r:textField id="<%=id%>" name="<%=name%>" title="<%=title%>"></r:textField>
                <%
                }else if("calendar".equals(type)){
                %>
                <r:calendar id="<%=id%>" name="<%=name%>" title='<%=title%>' showOpts="yyyy-MM-dd"></r:calendar>
                <%
                }else if("combo".equals(type)){
                    Object object=JSONObject.parseObject(json).get("url");
                    String url=object.toString();
                %>
                <r:combo id="<%=id%>" name="<%=name%>" valueField="value" displayField="text" dataUrl="<%=url%>" title="<%=title%>"></r:combo>
                <%
                }else if("numb".equals(type)){
                %>
                <r:numberField id="<%=id%>"  name="<%=name%>" title="<%=title%>"></r:numberField>
                <%
                }else if("grid".equals(type)){
                    String valueField=JSONObject.parseObject(json).get("valueField").toString();
                    String displayField=JSONObject.parseObject(json).get("displayField").toString();
                    String colModel = "[{title:'"+title+"',field:'"+displayField+"',width:120}]";
                    String dataUrl=JSONObject.parseObject(json).get("url").toString();
                %>
                <r:comboGrid id="<%=id%>" valueField="<%=valueField%>" displayField="<%=displayField%>" name="<%=name%>"  colModel="<%=colModel%>" dataUrl="<%=dataUrl%>" title="<%=title%>"></r:comboGrid>
                <%
                        }
                    }
                %>
            </r:tinyPanel>
        </form>
        <div class="btn_block">
            <r:button text="查询" id="searchid" iclass="bigger-110" bclass="btn btn-info" onClick="exeComQuery"/>
            <r:button text="重置" id="cancelsearchid" iclass="bigger-110" bclass="btn btn-default" onClick="resetText"/>
        </div>
    </div>
    <div class="win_mask"></div>
        <%
    }
  %>



    <div class="grid_operate clearfix">
            <%
  if(n>0){
 %>
        <div class="search_wrap">
            <div class="total" id="11" style="display: none">
                总笔数: <span></span> 笔 总金额: <span></span> 元
            </div>
            <div class="search_block">
                <input type="text" placeholder="<%=defQuery.get("title")%>" id="search_<%=defQuery.get("id")%>" name="search_<%=defQuery.get("id")%>"><i class="fa fa-search" aria-hidden="true" onClick="exeComSearch('<%=defQuery.get("id")%>')"></i>
            </div>
            <button class="super_search">
                高级查询
            </button>
        </div>
            <%
  }
 %>

        <script type="text/javascript">
            var exeComQuery = function (baseParams) {
                var queryParams = $("#queryForm").serialize();
                queryParams = decodeURIComponent(queryParams);
                if (baseParams != null && baseParams != "") {
                    queryParams = baseParams;
                }
                var qparams = toJson(queryParams);
                $("#<%=girdId%>").RGrid("setGridParam",qparams);

                closeSearch();
            };

            var exeComSearch = function (searchproperty) {
                var searchid = "#search_"+searchproperty;
                var searchpropertyvalue = $(searchid).val();

                var param = searchproperty+"="+searchpropertyvalue;
                var qparams = toJson(decodeURIComponent(param));
                $("#<%=girdId%>").RGrid("setGridParam",qparams);
            };

            function toJson(str){
                var mJson = {};
                var arr	= str.split('&');
                for(var i=0;i<arr.length;i++){
                    var arr2 = arr[i].split('=');
                    mJson[arr2[0]] = arr2[1];
                }

                return mJson;
            }

            function resetText(){
                $("#queryForm input[type=text]").val('');
                $("#queryForm input[type=number]").val('');
                $("#queryForm input[type=hidden]").each(function(){
                    var _this = this;
                    if($(_this).attr('hid')){
                        $(_this).val('');
                    }
                })
                $("#queryForm select").val();
                $("#queryForm select option").attr('selected',false);
            }
        </script>

    <%--<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>

<%--<%@page import="org.apache.commons.lang3.StringUtils"%>--%>
<%--<%@page import="com.ceying.chx.cloud.util.RuiUtil" %>--%>
<%--<%@page import="com.ceying.chx.pub.service.ComRowSet"%>--%>
<%--<%@page import="com.ceying.chx.cloud.web.controller.CommonQueryController"%>--%>
<%--<%@page import="com.ceying.chx.sys.user.SysUserLogin"%>--%>
<%--<%@page import="com.ceying.chx.util.constants.SessionConstants"%>--%>

<%--<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>--%>

<%--<div class="grid-wrap">--%>
	<%----%>
<%--<%--%>

    <%--SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);--%>
    <%--String orgid =  currUser.getOrg_id();--%>
    <%--String tenant_id = currUser.getTenant_id().toString();--%>

    <%--String queryuc = request.getParameter("queryuc");--%>
    <%--int inputsize = 9;--%>
    <%--try{--%>
        <%--inputsize =Integer.parseInt(request.getParameter("inputsize"));--%>
    <%--}catch(Exception e){--%>
        <%--inputsize = 9;--%>
    <%--}--%>

    <%--StringBuilder defaultValue = new StringBuilder();--%>

    <%--//获取系统查询天数--%>
    <%--int querydays = 30;--%>
    <%--String checkdays = "1";--%>
    <%--String querydaysUnique = StringUtils.defaultIfBlank(request.getParameter("querydays"), "");--%>
    <%--if(checkdays!=null&&checkdays!=""){--%>
        <%--querydays = Integer.parseInt(checkdays);--%>
    <%--}--%>
    <%--if(querydaysUnique!=null&&querydaysUnique!=""){--%>
        <%--querydays = Integer.parseInt(querydaysUnique);--%>
    <%--}--%>

    <%--ComRowSet inputConfig = CommonQueryController.getInputConfig(queryuc, "1","");--%>

    <%--String searchproperty = "";--%>
    <%--String searchtitle = "";--%>
                        <%----%>
    <%--int n = inputConfig.getRowCount();--%>
    <%--if (n > inputsize) {--%>
        <%--n = inputsize;--%>
    <%--}--%>
    <%--int rows = 0;--%>
    <%--String includeflag = "";--%>
    <%----%>
    <%--String querycondition = request.getParameter("condition");--%>
    <%--if(querycondition!=null&&!"".equals(querycondition)){--%>
    	<%--querycondition = "&"+querycondition;--%>
    <%--}else{--%>
    	<%--querycondition="";--%>
    <%--}--%>
    <%--String sumFieldColumn = request.getParameter("sumFieldColumn");--%>
<%--%>--%>
<%--<!-- 右侧 -->--%>
<%--<%--%>
    <%--if(n>0){--%>
<%--%>--%>
	<%----%>
	<%--<div class="win_search">--%>
        <%--<div class="search_header">--%>
            <%--<i class="fa fa-search col5" aria-hidden="true"></i>高级查询--%>
            <%--<span class="close_win"><i class="fa fa-times" aria-hidden="true"></i></span>--%>
        <%--</div>--%>
        <%--<form id="queryForm" class="clearfix search_form">  --%>
        	   <%--<r:tinyPanel hasHeader="false">--%>
                    <%--<%--%>
                        <%----%>
                        <%--for (int i = 0; i < n; i++) {--%>
                            <%--String organCheckBoxFlag="false";//将相应的查询条件设置为多选标志位（false为不是多选，true为是多选），主要针对于组织--%>
                            <%--String property = inputConfig.getValue(i, "property");--%>
                            <%--String viewtype = inputConfig.getValue(i, "viewtype");--%>
                            <%--String isdefault = inputConfig.getValue(i, "isdefault");--%>
                            <%--String defaultvalue = inputConfig.getValue(i, "value");--%>
                            <%--String condition = inputConfig.getValue(i, "condition");--%>
                            <%--if(i==0){--%>
                              <%--searchproperty = property;--%>
                              <%--searchtitle = inputConfig.getValue(i,"explain");--%>
                            <%--}--%>
                    <%--%>--%>
                    <%--<%--%>
                        <%--if ("D".equals(viewtype)) {--%>
                            <%--if ("1".equals(isdefault)) {--%>
                                <%--if ("start".equals(defaultvalue)) {--%>
                                    <%--String propertyend = StringUtils.removeEnd(property,"start")+"end";--%>
                                    <%--request.setAttribute("propertyend",propertyend);--%>
                    <%--%>--%>
                    <%--<r:calendar id="<%=property%>" name="<%=property%>" title='<%=inputConfig.getValue(i,\"explain\")%>' showOpts="yyyy-MM-dd"></r:calendar>--%>
                    <%--<%--%>
                    <%--}--%>
                    <%--else {--%>
                        <%--String propertystart = StringUtils.removeEnd(property,"end")+"start";--%>
                        <%--request.setAttribute("propertystart",propertystart);--%>
                    <%--%>--%>
                    <%--<r:calendar id="<%=property%>" name="<%=property%>" title='<%=inputConfig.getValue(i,\"explain\")%>' showOpts="yyyy-MM-dd"></r:calendar>--%>
                    <%--<%--%>
                        <%--}--%>
                    <%--}--%>
                    <%--else {--%>
                    <%--%>--%>
                    <%--<r:calendar id="<%=property%>" name="<%=property%>" title='<%=inputConfig.getValue(i,\"explain\")%>' showOpts="yyyy-MM-dd"></r:calendar>--%>
                    <%--<%--%>
                        <%--}--%>
                    <%--}--%>
                    <%--else if ("N".equals(viewtype)) {--%>
                        <%--String dicname = inputConfig.getValue(i, "dicname");--%>
                    <%--%>--%>

                    <%--<r:combo id="<%=property%>" name="<%=property%>" valueField="value" displayField="text" staticData="<%=RuiUtil.getDicOptionToJson(dicname)%>" title="<%=inputConfig.getValue(i,\"explain\")%>"></r:combo>--%>

                    <%--<%--%>
                    <%--}  else if("F".equals(viewtype)){--%>
                    <%--%>--%>
                    <%--<r:numberField id="<%=property%>"  name="<%=property%>" title="<%=inputConfig.getValue(i,\"explain\")%>"></r:numberField>--%>
                    <%--<%--%>
                    <%--} else if ("M".equals(viewtype)) {--%>
                        <%--String searchType = inputConfig.getValue(i, "midsearchname");--%>
                        <%--Boolean issupertenant = true;--%>
                        <%--if(!"10000".equals(tenant_id)&&"systenant".equals(searchType)){--%>
                            <%--issupertenant = false;--%>

                        <%--}--%>

                        <%--if(issupertenant){--%>
                            <%--ComRowSet info = CommonQueryController.getMidSearch(searchType);--%>
                            <%--String filterField = info.getValue(0, "C_SEARCHCOLUMN");--%>
                            <%--String displayField = info.getValue(0, "C_CAPTIONCOLUMN");--%>
                            <%--String valueField = info.getValue(0, "C_VALUECOLUMN");--%>
                            <%--String colModel = "[{title:'代码-名称',field:'"+displayField+"',width:120}]";--%>
                            <%--StringBuilder comboGridUrl = new StringBuilder();--%>
                            <%--comboGridUrl.append(request.getContextPath()+"/common/queryComboGrid.do?searchType=").append(searchType);--%>

                            <%--if ("organization".equals(searchType)) {--%>
                                <%--comboGridUrl.append("&urid=").append(orgid);--%>
                            <%--}--%>
                            <%--comboGridUrl.append(querycondition);--%>
                    <%--%>--%>

                    <%--<r:comboGrid id="<%=property%>" valueField="<%=valueField%>" displayField="<%=displayField%>" name="<%=property%>"  colModel="<%=colModel%>" dataUrl="<%=comboGridUrl.toString()%>" title="<%=inputConfig.getValue(i, \"explain\")%>"></r:comboGrid>--%>

                    <%--<%--%>
                        <%--}--%>
                    <%--}--%>
                    <%--else {--%>
                    <%--%>--%>
                    <%--<r:textField id="<%=property%>" name="<%=property%>" title="<%=inputConfig.getValue(i, \"explain\")%>"></r:textField>--%>
                    <%--<%--%>
                            <%--if ("1".equals(isdefault)) {--%>
                                <%--defaultValue.append("$I('"+property+"').FTextField('setValue','").append(defaultvalue+"');");--%>
                            <%--}--%>
                        <%--}--%>
                    <%--%>--%>
                    <%--<%--%>
                        <%--}--%>
                    <%--%>	              	--%>
            <%--</r:tinyPanel>--%>
        <%--</form>--%>
        <%--<div class="btn_block">--%>
        	<%--<r:button text="查询" id="searchid" iclass="bigger-110" bclass="btn btn-info" onClick="exeComQuery"/>--%>
          <%--<r:button text="重置" id="cancelsearchid" iclass="bigger-110" bclass="btn btn-default" onClick="resetText"/>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="win_mask"></div>--%>
  <%--<%--%>
    <%--}--%>
  <%--%>  --%>
	<%----%>


    <%--<div class="grid_operate clearfix">--%>
 <%--<%--%>
  <%--if(n>0){--%>
 <%--%>--%>
     <%--<div class="search_wrap">--%>
         <%--<div class="total" id="<%=sumFieldColumn%>" style="display: none">--%>
             <%--总笔数: <span></span> 笔 总金额: <span></span> 元--%>
         <%--</div>--%>
         <%--<div class="search_block">--%>
             <%--<input type="text" placeholder="<%=searchtitle%>" id="search_<%=searchproperty%>" name="search_<%=searchproperty%>"><i class="fa fa-search" aria-hidden="true" onClick="exeComSearch('<%=searchproperty%>')"></i>--%>
         <%--</div>--%>
         <%--<button class="super_search">--%>
             <%--高级查询--%>
         <%--</button>--%>
     <%--</div>--%>
 <%--<%--%>
  <%--}--%>
 <%--%> --%>
        <%----%>
	<%--<script type="text/javascript">--%>
    <%--var exeComQuery = function (baseParams) {--%>
        <%--var queryParams = $("#queryForm").serialize();--%>
        <%--queryParams = decodeURIComponent(queryParams);--%>
        <%--if (baseParams != null && baseParams != "") {--%>
            <%--queryParams = baseParams;--%>
        <%--}--%>
        <%--var qparams = toJson(queryParams);--%>
        <%--$("#grid-table").RGrid("setGridParam",qparams);--%>
        <%----%>
        <%--closeSearch();--%>
    <%--};--%>

    <%--var exeComSearch = function (searchproperty) {--%>
        <%--var searchid = "#search_"+searchproperty;--%>
        <%--var searchpropertyvalue = $(searchid).val();--%>
        <%----%>
        <%--var param = searchproperty+"="+searchpropertyvalue;--%>
        <%--var qparams = toJson(decodeURIComponent(param));--%>
        <%--$("#grid-table").RGrid("setGridParam",qparams);--%>
    <%--};--%>
    <%----%>
    <%--function toJson(str){--%>
        <%--var mJson = {};--%>
        <%--var arr	= str.split('&');--%>
        <%--for(var i=0;i<arr.length;i++){--%>
            <%--var arr2 = arr[i].split('=');--%>
            <%--mJson[arr2[0]] = arr2[1];--%>
        <%--}--%>

        <%--return mJson;--%>
    <%--}--%>

    <%--function resetText(){--%>
        <%--$("#queryForm input[type=text]").val('');--%>
        <%--$("#queryForm input[type=number]").val('');--%>
        <%--$("#queryForm input[type=hidden]").each(function(){--%>
            <%--var _this = this;--%>
            <%--if($(_this).attr('hid')){--%>
                <%--$(_this).val('');--%>
            <%--}--%>
        <%--})--%>
        <%--$("#queryForm select").val();--%>
        <%--$("#queryForm select option").attr('selected',false);--%>
    <%--}--%>
<%--</script>--%>