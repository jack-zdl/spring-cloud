<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.util.constants.SessionConstants" %>
<%@ page import="com.ceying.chx.common.dto.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.common.constants.ENFieldType" %>
<%@ page import="com.ceying.chx.common.constants.ENOperateSign" %>
<%--<%@ page import="com.ceying.chx.common.util.task.JresUtil" %>--%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    SysUserLoginDto currUser=(SysUserLoginDto)session.getAttribute(SessionConstants.ARRT_CURR_USER_LOGIN);
	String userid = currUser.getUserId();
	String channelconmainid = request.getParameter("urid");
//    String rootOrgId = JresUtil.getRootOrgId();
    String rootOrgId ="";
    String dataUrl = request.getContextPath() + "/channel/channelcondition/set.do";
    String edittableUrl = request.getContextPath()+"/common/query.do?uc=UC_BASE_CHANNEL_CHANNELCONDITIONSET_SEARCH&channelconmainid="+channelconmainid;
%>
<jsp:include page="/common/formhead.jsp" />
    <r:editableGrid id="channelConditionSet" dataUrl="<%=edittableUrl%>" height="300"
   		primaryKey="['urid']" hiddenCol="['urid']"
        colModel="{title:'序号',text:'serialno',id:'serialno',type:1,width:50,check:'true'},
            {
                title:'左括号',text:'leftbracketvalue',id:'leftbracket',Htext:'text',Hid:'value',type:4,width:'80',
                url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999037'
            },
            {
                title:'属性',text:'attributebyname',id:'attributeby',Htext:'codename',Hid:'urid',
                type:5,width:200,check:'true',afterSelect:attributebyAFS,
                url:'${pageContext.request.contextPath}/common/query.do?uc=UC_BASE_CHANNEL_CHANNELATTRIBUTES_SEARCH'
            },
            {
                title:'比较关系',text:'operatesignvalue',id:'operatesign',Htext:'text',Hid:'value',type:4,
                width:80,check:'true',beforeSelect:operatesignBFS,afterSelect:operatesignAFS,
                url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999039'
            },
        	{
        	    title:'值',text:'fieldvalue',id:'fieldvalue',type:0,width:100,check:'true',beforeSelect:fieldvalueBFn
        	},
            {
                title:'右括号',text:'rightbracketvalue',id:'rightbracket',Htext:'text',Hid:'value',type:4,width:'80',
                url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999038'
            },
            {
                title:'逻辑关系',text:'logicoperatevalue',id:'logicoperate',Htext:'text',Hid:'value',type:4,width:'80',
                url:'${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999040'
            }"/>
<jsp:include page="/common/formbottom.jsp" />

<script type="text/javascript">

    function attributebyAFS(val){
        var ID = this.ID;
        var arr = toGetNum(ID);
        $('#operatesign_4_'+arr[1]).RCombo('setValue',['','']);
    }

    function operatesignBFS(){
        var ID = this.ID;
        var arr = toGetNum(ID);
        var urid = $("#attributeby_3_"+arr[1]).RComboGrid('getValue');
        var operatesignparams;
        if(urid == ""){
            return operatesignparams;
        }
        Ajax.req({
            async:false,
            url: '${pageContext.request.contextPath}/common/query.do',
            type: 'json',
            params: {
                uc: 'UC_BASE_CHANNEL_CHANNELATTRIBUTES_SEARCH',
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

    function operatesignAFS(val){
        var ID = this.ID;
        var arr = toGetNum(ID);
        var attributeby = $('#attributeby_3_' + arr[1]).RComboGrid('getValue');
        var operatesign = val[0];
        Ajax.req({
            async:false,
            url: '${pageContext.request.contextPath}/common/query.do',
            type: 'json',
            params: {
                uc: 'UC_BASE_CHANNEL_CHANNELATTRIBUTES_SEARCH',
                urid: attributeby
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

    function fieldvalueBFn(paramid,val){
        var ID = this.ID || paramid;
        var arr = toGetNum(ID);
        var operatesign = $('#operatesign_4_' + arr[1]).RCombo('getValue');
        var attributeby = $('#attributeby_3_' + arr[1]).RComboGrid('getValue');
        Ajax.req({
            async:false,
            url: '${pageContext.request.contextPath}/common/query.do',
            type: 'json',
            params: {
                uc: 'UC_BASE_CHANNEL_CHANNELATTRIBUTES_SEARCH',
                urid: attributeby
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
                $('#channelConditionSet').EditableGrid('changeType',{
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

                        $('#channelConditionSet').EditableGrid('changeType',{
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
                    $('#channelConditionSet').EditableGrid('changeType',{
                        'id':'fieldvalue_5_'+currid,
                        'type': '3',
                        'param':{
                            dataFmt:'int',
                        }
                    });
                }else{
                    $('#channelConditionSet').EditableGrid('changeType',{
                        'id':'fieldvalue_5_'+currid,
                        'type':'2',
                        'param':{
                            dateFmt:calendarFormat,
                        }
                    });
                }
                if(isfill&&val[0]&&val[1]&&val[2]){
                    $('#fieldvalue_5_'+currid).val(val[0]+'-'+val[1]+'-'+val[2]);
                }
            } else if (fieldtype == "<%=ENFieldType.INTEGER.getValue()%>") {
                /**
                 * int时
                 * 值的控件类型为number
                 */
                $('#channelConditionSet').EditableGrid('changeType',{
                    'id':'fieldvalue_5_'+currid,
                    'type': '3',
                    'param':{
                        dataFmt:'int',
                    }
                });
                if(isfill){
                    $('#fieldvalue_5_'+currid).val(val[0]);
                }
            } else if (fieldtype == "<%=ENFieldType.FLOAT.getValue()%>") {
                /**
                 * 浮点类型时
                 * 值的控件类型为number
                 */
                $('#channelConditionSet').EditableGrid('changeType',{
                    'id':'fieldvalue_5_'+currid,
                    'type': '3',
                    'param':{
                        dataFmt:'float',
                    }
                });
                if(isfill){
                    $('#fieldvalue_5_'+currid).val(val[0]);
                }
            } else if(isfill){
                $('#fieldvalue_5_'+currid).val(val[0]);
            }
        }
    }

    var saveFn = function(){
        var addDatas = $('#channelConditionSet').EditableGrid('getAddValue');
        var editDatas = $('#channelConditionSet').EditableGrid('getEditValue');
        var delIds = $('#channelConditionSet').EditableGrid('getDelArray');
        $("#channelConditionSet").RValidate({
            'success': function(){
                var params = $("#channelConditionSet").AllSerialize();
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: {
                        addDatas: JSON.stringify(addDatas),
                        editDatas: JSON.stringify(editDatas),
                        delIds: delIds.join(","),
                        channelconmainid: "<%=channelconmainid%>"
                    },
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#channelConditionSet").RValidate("validate");
    }

</script>				