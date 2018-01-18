<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.sys.user.SysUserLogin"%>
<%@ page import="com.ceying.chx.util.constants.SessionConstants"%>
<%@ page import="com.ceying.chx.common.constants.ENOperateSign" %>
<%@ page import="com.ceying.chx.common.constants.ENFieldType" %>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.utils.task.JresUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
		String queryuc = "UC_BASE_WARNINGRULE_CONDITION_SEARCH";
		SysUserLogin currUser=(SysUserLogin)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
		String userid = currUser.getUserId();
		String urid = request.getParameter("urid");
		String editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGRULE_CONDITION_SEARCH&queryType=3&warningruleid=1";
		if(urid != null){
			editableDataUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_WARNINGRULE_CONDITION_SEARCH&queryType=3&warningruleid="+urid;
		}
		String warningObjectId = request.getParameter("warningObjectId");
		
		String rootOrgId = JresUtil.getRootOrgId();
%>

	<r:editableGrid id="warningConditionTab" dataUrl="<%=editableDataUrl%>" primaryKey="['urid']" hiddenCol="['urid']" height="150"
                colModel="{title:'顺序号',text:'displayorder',id:'displayorder',type:1,width:'80',check:'required:true'},
                	{title:'左括号',text:'leftbracketvalue',id:'leftbracket',Htext:'text',Hid:'value',type:4,width:'100',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999037'},
                	{
                	title:'预警属性',text:'warningobjattrname',id:'warningobjattrid',Htext:'fieldname',Hid:'urid',check:'required:true',
                	type:5,width:'100',beforeSelect:warningobjattridBFS,afterSelect:warningobjattridAFS,
                	url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH'
                	},
                	{title:'比较关系',text:'operatesignvalue',id:'operatesign',Htext:'text',Hid:'value',check:'required:true',
                	type:4,width:'100',beforeSelect:operatesignBFS,afterSelect:operatesignAFS,
                	url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039'},
                	{title:'值',text:'fieldvaluename',id:'fieldvalue',type:0,width:'400',beforeSelect:fieldvalueBeforeEditable,check:'required:true'},
                	{title:'右括号',text:'rightbracketvalue',id:'rightbracket',Htext:'text',Hid:'value',type:4,width:'100',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999038'},
                	{title:'逻辑关系',text:'logicoperatevalue',id:'logicoperate',Htext:'text',Hid:'value',type:4,width:'80',url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999040'}"/>
			
<script type="text/javascript">

$(function(){
    
    
    
    <%-- function operatesignBFn(val){
    	var fieldtype;
    	var fieldvalue;
    	Ajax.req({
    		async:false,
            url: "${pageContext.request.contextPath}/common/query.do",
            type: "json",
            method: "get",
            params: {
                uc: "UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH",
                urid: val[0]
            },
            ok: function(text){
                if(text == '{"data":[]}'){
                    $.RMessage.alert("消息", "<%=MessageUtil.format("PUB0004")%>");
                    return;
                }
                var entity = text.rows[0];
                fieldtype = entity["fieldtype"];
                fieldvalue = entity["fieldvalue"];
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
    	if(fieldtype == "字符"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "字符串"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'},
			                {text: '模糊', value: '13'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "日期"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '前X天', value: '11'},
			                {text: '后X天', value: '12'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "日期时间"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '前X天', value: '11'},
			                {text: '后X天', value: '12'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "时间"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "整型"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "浮点数"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '>', value: '3'},
			                {text: '<', value: '4'},
			                {text: '>=', value: '5'},
			                {text: '<=', value: '6'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "字典"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'}]
          		},
          		'type':4
    		}
    	}else if(fieldtype == "辅助查询"){
    		return {options:{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039',
				valueField:'value',
				displayField:'text',
				icon:false,
				staticData:[{text: '=', value: '1'},
			                {text: '<>', value: '2'},
			                {text: '空', value: '7'},
			                {text: '非空', value: '8'},
			                {text: '包含', value: '9'},
			                {text: '不包含', value: '10'}]
          		},
          		'type':4
    		}
    	}
    } --%>
    
})



function warningobjattridBFS(){
	var warningObjectId = <%=warningObjectId%>;
	if(warningObjectId != "" && warningObjectId != undefined){
		return [{"warningobjid":warningObjectId,"attricategory":1}];
	}else{
		return [{"attricategory":1}];
	}
	
}

function warningobjattridAFS(val){
	var ID = this.ID;
    var arr = toGetNum(ID);
    $('#operatesign_4_'+arr[1]).RCombo('setValue',['','']);
	Ajax.req({
        url: '${pageContext.request.contextPath}/common/query.do',
        type: 'json',
        params: {
            uc: 'UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH',
            urid: val[0]
        },
        ok: function(text){
            var entity = text.rows[0];
            //行号，字段类型，字段值
            changeFieldValue(arr[1],entity['fieldtype'],entity['fieldvalue']);
        },
        err: function(text){
            $.RMessage.alert("消息", text);
        }
    });
	
}

function changeFieldValue(currid, fieldtype, fieldvalue){
	if(fieldtype == "<%=ENFieldType.DATE.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type':'2',
			'param':{
				dateFmt:'yyyy-MM-dd',
			}
		});
	}else if(fieldtype == "<%=ENFieldType.DATETIME.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type':'2',
			'param':{
				dateFmt:'yyyy-MM-dd HH:mm:ss',
			}
		});
	}else if(fieldtype == "<%=ENFieldType.TIME.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type':'2',
			'param':{
				dateFmt:'HH:mm:ss',
			}
		});
	}else if(fieldtype == "<%=ENFieldType.INTEGER.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type': '3',
			'param':{
				dataFmt:'int',
			}
		});
	}else if(fieldtype == "<%=ENFieldType.FLOAT.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type': '3',
			'param':{
				dataFmt:'float',
			}
		});
	}else if(fieldtype == "<%=ENFieldType.DICTIONARY.getValue()%>"){
		$('#warningConditionTab').EditableGrid('changeType',{
			'id':'fieldvalue_5_'+currid,
			'type': '4',
			'param':{
				dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno='+fieldvalue,
                valueField:'value',
               	displayField:'text',
              	icon:false,
			}
		});
	}else if(fieldtype == "<%=ENFieldType.MINISTRANT.getValue()%>"){
		Ajax.req({
            url: '${pageContext.request.contextPath}/common/query.do',
            type: 'json',
            params: {
                uc: "UC_SYS_SVCMIDSERACH_QUERY",
                type: fieldvalue
            },
            ok: function(text){
            	
                var entity = text.rows[0];
                functionno = entity["functionno"];
                caption = entity["caption"];
                valuecolumn = entity["valuecolumn"];
                captioncolumn = entity["captioncolumn"];
                paramUrl = '${pageContext.request.contextPath}/common/query.do?uc=' + functionno;
                if (functionno == 'UC_SYS_ORGANIZATIONCHILE_QUERY') {
                	paramUrl = '${pageContext.request.contextPath}/common/query.do?uc=' + functionno + '&urid=<%=rootOrgId%>';
                }
                
                $('#warningConditionTab').EditableGrid('changeType',{
        			'id':'fieldvalue_5_'+currid,
        			'type': '5',
        			'param':{
        				idField:valuecolumn,
        				textField:captioncolumn,
        				url:paramUrl,
        				method:'post',
        				pageSize:6,
        				columns:[
        				         {title:caption,field:captioncolumn}
        				],
        				showText:true,
        				icon:false,
        			}
        		});
            },
            err: function(text){
                $.RMessage.alert("消息", text);
            }
        });
	}
}

function operatesignBFS(){
	var ID = this.ID;
    var arr = toGetNum(ID);
    var urid = $("#warningobjattrid_3_" + arr[1]).RComboGrid('getValue');
    var operatesignparams;
    Ajax.req({
    	async:false,
        url: '${pageContext.request.contextPath}/common/query.do',
        type: 'json',
        params: {
            uc: 'UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH',
            urid: urid
        },
        ok: function(text){
            var entity = text.rows[0];
            operatesignparams = getOperateSignParams(entity['fieldtype']);
        },
        err: function(text){
            $.RMessage.alert("消息", text);
        }
    });
    return [{'allowkeyvalue':operatesignparams}];
}

function getOperateSignParams(fieldtype){
	var operatesignparams;
	if(fieldtype == "<%=ENFieldType.CHARACTER.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8,9,10';
	}else if(fieldtype == "<%=ENFieldType.INTEGER.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8,9,10';
	}else if(fieldtype == "<%=ENFieldType.FLOAT.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8,9,10';
	}else if(fieldtype == "<%=ENFieldType.STRING.getValue()%>"){
		operatesignparams = '1,2,7,8,9,10,13';
	}else if(fieldtype == "<%=ENFieldType.DATE.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8,11,12';
	}else if(fieldtype == "<%=ENFieldType.TIME.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8';
	}else if(fieldtype == "<%=ENFieldType.DATETIME.getValue()%>"){
		operatesignparams = '1,2,3,4,5,6,7,8,11,12';
	}else if(fieldtype == "<%=ENFieldType.DICTIONARY.getValue()%>"){
		operatesignparams = '1,2,7,8,9,10';
	}else if(fieldtype == "<%=ENFieldType.MINISTRANT.getValue()%>"){
		operatesignparams = '1,2,7,8,9,10';
	}
	return operatesignparams;
}

function operatesignAFS(val){
	var ID = this.ID;
    var arr = toGetNum(ID);
    var warningobjattrid = $('#warningobjattrid_3_' + arr[1]).RComboGrid('getValue');
    var operatesign = val[0];
    Ajax.req({
    	async:false,
        url: '${pageContext.request.contextPath}/common/query.do',
        type: 'json',
        params: {
            uc: 'UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH',
            urid: warningobjattrid
        },
        ok: function(text){
            var entity = text.rows[0];
            changeFieldValueType(arr[1],entity['fieldtype'],entity['fieldvalue'],operatesign, false, null);
        },
        err: function(text){
            $.RMessage.alert("消息", text);
        }
    });
}

function changeFieldValueType(currid, fieldtype, fieldvalue, operatesign, isfill, val){
	/**
	 * 若比较关系为空或非空则将值输入框设置为不可填的文本框
	 * 其他情况则恢复为原本的输入框样式
	 */
	if(operatesign == "<%=ENOperateSign.ISNULL.getValue()%>" || operatesign == "<%=ENOperateSign.NOTNULL.getValue()%>"){
		if(fieldtype == "<%=ENFieldType.DICTIONARY.getValue()%>"){
			$('#fieldvalue_5_'+currid).RCombo('setAllValue', ['','']);
		}else if(fieldtype == "<%=ENFieldType.MINISTRANT.getValue()%>"){
			$('#fieldvalue_5_'+currid).RComboGrid('setAllValue', ['','']);
		}else{
			$('#fieldvalue_5_'+currid).val('');
		}
		
	}else{
		if (fieldtype == "<%=ENFieldType.DICTIONARY.getValue()%>") {
			/**
			* 字典时
			* 比较关系若为包含不包含，值的控件类型为combo，多选；其他情况单选
			*/
			isMultiSelect = false;
			if(operatesign == "<%=ENOperateSign.EXCLUDE.getValue()%>" || operatesign == "<%=ENOperateSign.INCLUDE.getValue()%>"){
				isMultiSelect = true;
			}
			$('#warningConditionTab').EditableGrid('changeType',{
				'id':'fieldvalue_5_'+currid,
				'type': '4',
				'param':{
					dataUrl:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno='+fieldvalue,
					valueField:'value',
	                displayField:'text',
	                icon:false,
	                multiSelect:isMultiSelect,
				}
			});
			if(isfill){
				$('#fieldvalue_5_'+currid).RCombo('setAllValue', val);
			}
		} else if (fieldtype == "<%=ENFieldType.MINISTRANT.getValue()%>") {
	        /**
	         * 辅助查询时
	         * 比较关系若包含不包含，值的控件类型为combo，多选；其他请款单选
	         */
			isMultiSelect = false;
			if(operatesign == "<%=ENOperateSign.EXCLUDE.getValue()%>" || operatesign == "<%=ENOperateSign.INCLUDE.getValue()%>"){
				isMultiSelect = true;
			}
	         
			Ajax.req({
			    url: '${pageContext.request.contextPath}/common/query.do',
			    type: 'json',
			    params: {
			        uc: "UC_SYS_SVCMIDSERACH_QUERY",
			        type: fieldvalue
			    },
			    ok: function(text){
			    	
			        var entity = text.rows[0];
			        functionno = entity["functionno"];
			        caption = entity["caption"];
			        valuecolumn = entity["valuecolumn"];
			        captioncolumn = entity["captioncolumn"];
			        paramUrl = '${pageContext.request.contextPath}/common/query.do?uc=' + functionno;
			        if (functionno == 'UC_SYS_ORGANIZATIONCHILE_QUERY') {
			        	paramUrl = '${pageContext.request.contextPath}/common/query.do?uc=' + functionno + '&urid=<%=rootOrgId%>';
			        }
			        
			        $('#warningConditionTab').EditableGrid('changeType',{
						'id':'fieldvalue_5_'+currid,
						'type': '5',
						'param':{
							idField:valuecolumn,
							textField:captioncolumn,
							url:paramUrl,
							method:'post',
							pageSize:6,
							columns:[
							         {title:caption,field:captioncolumn}
							],
							showText:true,
							icon:false,
							multiSelect:isMultiSelect,
						}
					});
			        if(isfill){
						$('#fieldvalue_5_'+currid).RComboGrid('setAllValue', val);
					}
			    },
			    err: function(text){
			        $.RMessage.alert("消息", text);
			    }
			});
	         

	    } else if (fieldtype == "<%=ENFieldType.DATE.getValue()%>" || fieldtype == "<%=ENFieldType.DATETIME.getValue()%>" || fieldtype == "<%=ENFieldType.TIME.getValue()%>") {
	        /**
	         * 日期，日期时间和时间时
	         * 比较关系若前X天后X天，值的控件类型为number
	         * 否则，值的控件类型为calendar
	         */
			var calendarFormat;
			if(fieldtype == "<%=ENFieldType.DATE.getValue()%>"){
				calendarFormat = 'yyyy-MM-dd';
			}else if(fieldtype == "<%=ENFieldType.DATETIME.getValue()%>"){
				calendarFormat = 'yyyy-MM-dd HH:mm:ss';
			}else{
				calendarFormat = 'HH:mm:ss';
			}
			if(operatesign == "<%=ENOperateSign.DAYSBEFORE.getValue()%>" || operatesign == "<%=ENOperateSign.DAYSAFTER.getValue()%>"){
				$('#warningConditionTab').EditableGrid('changeType',{
					'id':'fieldvalue_5_'+currid,
					'type': '3',
					'param':{
						dataFmt:'int',
					}
				});
			}else{
				$('#warningConditionTab').EditableGrid('changeType',{
					'id':'fieldvalue_5_'+currid,
					'type':'2',
					'param':{
						dateFmt:calendarFormat,
					}
				});
			}
			if(isfill){
				$('#fieldvalue_5_'+currid).val(val[0]);
			}
	         
	    } else if (fieldtype == "<%=ENFieldType.INTEGER.getValue()%>") {
	        /**
	         * int时
	         * 值的控件类型为number
	         */
	    	$('#warningConditionTab').EditableGrid('changeType',{
				'id':'fieldvalue_5_'+currid,
				'type': '3',
				'param':{
					dataFmt:'int',
				}
			});
	    	if(isfill){
				$('#fieldvalue_5_'+currid).val(val[0]);
			}
	    }
	    else if (fieldtype == "<%=ENFieldType.FLOAT.getValue()%>") {
	        /**
	         * 浮点类型时
	         * 值的控件类型为number
	         */
	    	$('#warningConditionTab').EditableGrid('changeType',{
				'id':'fieldvalue_5_'+currid,
				'type': '3',
				'param':{
					dataFmt:'float',
				}
			});
	    	if(isfill){
				$('#fieldvalue_5_'+currid).val(val[0]);
			}
	    }
	    else {
	    	if(isfill){
				$('#fieldvalue_5_'+currid).val(val[0]);
			}
	    }
	}
}

function fieldvalueBeforeEditable(paramid,val){
	var ID = this.ID || paramid;
    var arr = toGetNum(ID);
    var operatesign = $('#operatesign_4_' + arr[1]).RCombo('getValue');
    var warningobjattrid = $('#warningobjattrid_3_' + arr[1]).RComboGrid('getValue');
    Ajax.req({
    	async:false,
        url: '${pageContext.request.contextPath}/common/query.do',
        type: 'json',
        params: {
            uc: 'UC_BASE_WARNINGOBJECT_ATTRIBUTE_SEARCH',
            urid: warningobjattrid
        },
        ok: function(text){
            var entity = text.rows[0];
            changeFieldValueType(arr[1],entity['fieldtype'],entity['fieldvalue'],operatesign,true,val);
        },
        err: function(text){
            $.RMessage.alert("消息", text);
        }
    });
}



</script>				