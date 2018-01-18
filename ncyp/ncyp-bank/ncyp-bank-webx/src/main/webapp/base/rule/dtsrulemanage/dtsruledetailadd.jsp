<%@ page import="com.ceying.chx.common.util.properties.MessageUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
<%--<jsp:useBean id="commonQueryController" scope="session" class="com.ceying.chx.cloud.web.controller.CommonQueryController"/>--%>
<%--<%@ page import="com.ceying.chx.pub.service.ComRowSet" %>--%>
<%
    String urid = request.getParameter("urid");
    String addformUrl = request.getContextPath() + "/rule/dtsruledetailmanage/add.do";
    String editformUrl = request.getContextPath() + "/rule/dtsruledetailmanage/edit.do";
    String typename =request.getParameter("typename");
    String queryuc = "UC_BASE_IO_OBJRULEDEF_SEARCH";
    String[] fieldArray = new String[]{};
    String[] valueArray = new String[]{};
//	ComRowSet rowSet = (ComRowSet) commonQueryController.search(queryuc,fieldArray,valueArray);
	
%>

<jsp:include page="/common/formhead.jsp" />
<form action="<%=addformUrl%>" role="form" id="dtsruledetailadd">
    <input type="hidden" id="urid" name="urid" value=""/>
    <r:tinyPanel title="基本信息" hasHeader="false" >
        <r:panelItem>
        	<jsp:include page="/common/wedget/ucsearch/dtsrule.jsp">
               	<jsp:param name="id" value="dtsruleid"/>
               	<jsp:param name="title" value="所属规则"/>
                <jsp:param name="BFn" value="dtsruleBFn"/>
                <jsp:param name="SelFn" value="dtsruleSelFn"/>
                <jsp:param name="check" value="required"/>
         	</jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="defaultvalue" name="defaultvalue" title="默认字段" />
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dfieldname" name="dfieldname" title="目的字段代码" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否必填:" id="isrequired" name="isrequired"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dfielddescript" name="dfielddescript" title="目的字段名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:checkbox title="是否有效:" id="isactive" name="isactive"/>
        </r:panelItem>
        <r:panelItem>
        	<jsp:include page="/common/wedget/dictionary/dfieldtype.jsp">
	       		<jsp:param name="id" value="dfieldtype"/>
	            <jsp:param name="name" value="dfieldtype"/>
	            <jsp:param name="title" value="目的字段类型"/>
	            <jsp:param name="check" value="required"/>
	            <jsp:param name="width" value="6"/>
	        </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="dfieldlength" name="dfieldlength" title="目的字段长度" />
        </r:panelItem>
        <r:panelItem>
            <r:textArea  id="description" name="description" title="描述"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="expression" name="expression" title="转换表达式 " check="required"/>
        </r:panelItem>
        <r:panelItem>
        	<r:combo title="外键表" valueField="tablename" id="foreigntable" displayField="tablename" ></r:combo>
         </r:panelItem>
        <r:panelItem>
            <r:textField id="fromrawfield" name="fromrawfield" title="根据原始元素" afterInput="getforeignfield"/>
        </r:panelItem>
        <r:panelItem>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="getdfield" name="getdfield" title="得到的目的元素" afterInput="getforeignfield"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea id="foreignfield" name="foreignfield" title="外键表达式" />
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">
    $(function(){
        if("<%=urid%>" != "" && "${param.type}" == "mod"){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_IO_OBJRULEDETAIL_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                	if(text.rows.length < 1){
                        $.RMessage.alert("消息", text.msg);
                        return;
                    }
                    var entity = text.rows[0];
                    for(var key in entity){
                        var $ele=$(document.getElementsByName(key)[0]);
                        $ele.attr("Value", entity[key]);
                    }
                    $("#dtsruledetailadd").RForm({value:text});
                    $("#dealway").RCombo("setValue");
                    $("#dfieldtype").RCombo("setValue");
                    $("#dtsruleid").RComboGrid("setValue",entity["dtsruleid"]);
                    $("#dtsruledetailadd").attr("action", "<%=editformUrl%>");
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })
    
    var getforeignfield = function(){
    	var foreigntable = $("#foreigntable").RCombo("getValue");
    	var fromrawfield = $("#fromrawfield").val();
    	var getdfield = $("#getdfield").val();
    	$("#foreignfield").val(foreigntable+"."+fromrawfield+"|"+getdfield);
    }
    
    var dtsruleBFn = function(){
    	 var typename = "<%=typename%>";
         var Json = [{"typename":typename}];
         return Json;
    }
    var dtsruleSelFn = function(){
	  	 Ajax.req({
	         url: "${pageContext.request.contextPath}/common/query.do",
	         type: "json",
	         method: "get",
	         params: {
	             urid: $("#codename").val(),
	             uc: 'UC_BASE_IO_OBJRULE_SEARCH'
	         },
	         ok: function (text) {
	             if(text.rows.length < 1){
	                 $.RMessage.alert("消息", text.msg);
	                 return;
	             }
	             var entity = text.rows[0];
	             getDepandontable(entity["dtsobjdefinitionid"]);
	         },
	         err: function (text) {
	             $.RMessage.alert("消息", text.msg);
	         }
	     });
    }
    
    var getDepandontable = function(urid){
    	Ajax.req({
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                urid: urid,
                uc: 'UC_BASE_IO_OBJRULEDEF_SEARCH'
            },
            ok: function (text) {
            	if(text.rows.length < 1){
            		$.RMessage.alert("消息", text.msg);
            		return;
            	}
            	var entity = text.rows[0];
            	var foreigntable = entity["depandontable"];
            	$("#foreigntable").val(foreigntable);
            	
            	var tables = foreigntable.split(',');
            	var table = new Array(tables.length);
            	for(var i=0;i<tables.length;i++){
            		table[i]={'tablename':tables[i]}
            	}
            	$('#foreigntable').RCombo('changeStaticData',table);
            },
            err: function (text) {
                $.RMessage.alert("消息", text.msg);
            }
        });
    }
    
    var saveFn = function(){
        $("#dtsruledetailadd").RValidate({
            'success': function(){
                var action = $("#dtsruledetailadd").attr("action");
                var params = $("#dtsruledetailadd").AllSerialize();
                params = decodeURIComponent(params);
                Ajax.req({
                    url: action,
                    params: params,
                    ok: function(text) {
                        clearCache(['UC_BASE_IO_OBJRULEDETAIL_SEARCH']);
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#dtsruledetailadd").RValidate("validate");
    }
</script>