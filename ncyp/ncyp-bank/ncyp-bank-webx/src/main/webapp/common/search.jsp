<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSONArray" %>

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
