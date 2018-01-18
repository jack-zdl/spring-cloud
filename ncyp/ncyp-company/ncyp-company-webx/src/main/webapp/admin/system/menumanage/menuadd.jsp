<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.ceying.chx.util.StringUtil" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String menu_code = request.getParameter("menu_code");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(menu_code)&&"mod".equals(type);
    String dataUrl = request.getContextPath() + "/sysmenu/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/sysmenu/edit.do";
    }
    String delUrl = request.getContextPath()+"/sysmenu/subtransdel.do";
    //String queryuc = "UC_SYS_MENU_SUBTRANS_SEARCH";
    String kind_code = request.getParameter("kind_code");
    String condition = "";
    if(menu_code!=null){
        condition =  "menu_code="+menu_code+"&kind_code="+kind_code;
    }
    String parent_code = request.getParameter("parent_code");
    String parent_name = request.getParameter("parent_name");
    parent_name=StringUtil.isNotNull(parent_name)?parent_name:"";
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String userid = currUser.getUserId();
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="sysmenuadd">
    <input type="hidden" id="tree_idx" name="tree_idx"/>
    <r:tinyPanel hasHeader="false" column="3">
        <r:panelItem>
            <r:textField  id="menu_code" name="menuCode" title="菜单编号" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="menu_name" name="menuName" title="菜单名称" check="required"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <div class="each_input_wrap col-xs-4">
                <div class="col-xs-4" style="text-align:right">
                    <label class="input_title" >上级菜单</label>
                </div>
                <div class="col-xs-8">
                    <div class="input-group col-sm-12">
                        <input class="form-control input-sm"  type="text"  name="parentCodeName" id="parentCodeName" Value ="<%=URLDecoder.decode(parent_name,"UTF-8")%>" readonly="true"/>
                        <input class="form-control input-sm"  type="hidden"  name="parentCode" id="parent_code" Value ="<%=parent_code%>"/>
                        <span class="input-group-addon btn-modal" id="sysmenutree" >
								<i class="fa fa-search bigger-110"></i>
							</span>
                    </div>
                </div>
            </div>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="kind_code" name="kindCode" value="BIZFRAME" title="菜单类别" readonly="true"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="menu_arg" name="menuArg" title="菜单参数"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="menu_icon" name="menuIcon" title="菜单图标"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:combo id="window_type" name="windowType" valueField="value" displayField="text" width="4" dataUrl="${pageContext.request.contextPath}/common/queryDicOption.do?keyno=9999010" title="窗口类型" check="required"></r:combo>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="menu_url" name="menuUrl" title="菜单URL"></r:textField>
        </r:panelItem>
        <r:panelItem>
            <r:textField  id="remark" name="remark" width="4" title="备注"></r:textField>
        </r:panelItem>
    </r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />
<div class="page-content" style="padding: 10px 20px;">
    <r:button id="addSubTrans" text="新建子功能" iconCls="add_icon" disabled="true" onClick="addSubTrans"/>
    <r:button id="modSubTrans" text="修改子功能" iconCls="edit_icon"  disabled="true" onClick="modSubTrans"/>
    <r:button id="delSubTrans" text="删除子功能" iconCls="delete_icon" disabled="true" onClick="delSubTrans"/>
</div>

<r:win title="新建子功能" id="addSubTransModal"  width="800" height="350"></r:win>
<r:win title="修改子功能" id="modSubTransModal"  width="800" height="350"></r:win>

<r:grid id="orgGrid" dataUrl="${pageContext.request.contextPath}/sysmenu/subtrans.do"
        colModel="{name : 'subTransName',index : 'subTransName',sortable:false},
                    {name : 'transCode',index : 'transCode',sortable:false},
                    {name : 'subTransCode',index : 'subTransCode',sortable:false},
                    {name : 'relServ',index : 'relServ',sortable:false},
                    {name : 'remark',index : 'remark',sortable:false}"
        colNames="'子功能名','功能号','子功能号','映射服务','备注'" multiSelect="true"></r:grid>

<script type="text/javascript">
    var condition="<%=condition%>";
    var conditionSub="";
    $(function(){
        initDate();
    })

    var saveFn = function(){
        $("#sysmenuadd").RValidate({
            'success': save
        });
        $("#sysmenuadd").RValidate('validate');
    }

    var save = function(){
        var queryParams = $("#sysmenuadd").AllSerialize();
        Ajax.req({
            url: '<%=dataUrl%>',
            params: queryParams,
            ok: function(text) {
                condition =  "menu_code="+$("#menu_code").val()+"&kind_code="+$("#kind_code").val();
                conditionSub= "menuCode="+$("#menu_code").val();
                $.RMessage.alert("消息",text.mes,parent.closeAdd_EditWinFn);
                exeQuerySub();
            },
            err: function(text) {
                $.RMessage.alert("消息",text.mes);
            }
        });
    }
    $("#sysmenutree").click(function(event) {
        var url = "${pageContext.request.contextPath}/common/sysmenutree.jsp";
        $("#menuTreeModal").RWin('createWin',url);
    });

    var addSubTrans = function(){
        var url = '${pageContext.request.contextPath}/admin/system/menumanage/menusubtransadd.jsp?type=add&menu_code='+$("#menu_code").val()+'&kind_code='+$("#kind_code").val()+'&trans_code='+$("#menu_code").val();
        $("#addSubTransModal").RWin('createWin',url);
    }

    var modSubTrans= function(){
        var rowDatas = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowDatas.length!=1){
            $.RMessage.alert("消息","请选择一条记录进行操作");
        }else{
            var url = '${pageContext.request.contextPath}/admin/system/menumanage/menusubtransadd.jsp?type=mod&sub_trans_code='+rowDatas[0].subTransCode+"&trans_code="+rowDatas[0].transCode;
            $("#modSubTransModal").RWin('createWin',url);
        }
    }

    var delSubTrans = function(){
        var rowDatas = $("#orgGrid").RGrid("getSelectedDatas");
        if(rowDatas.length==0){
            $.RMessage.alert("消息","请选择记录进行操作");
        }else{
            var transcodes = new Array();
            var subtranscodes = new Array();
            for(var j=0;j<rowDatas.length;j++){
                transcodes.push(rowDatas[j].transCode);
                subtranscodes.push(rowDatas[j].subTransCode);
            }
            transcodes= transcodes.join(",");
            subtranscodes= subtranscodes.join(",");
            $.RMessage.confirm("消息","是否确认删除",function(){
                Ajax.req({
                    url: "<%=delUrl%>",
                    params: {"transcodes":transcodes,
                        "subtranscodes":subtranscodes},
                    ok: function(text) {
                        if(text.success=="true"||text.success==true){
                            exeQuerySub();
                            exeComQuery(condition);
                        }else{
                            $.RMessage.alert("消息",text.mes);
                            exeQuerySub();
                        }
                    },
                    err: function(text) {
                        $.RMessage.alert("消息",text.mes);
                    }
                });
            });
        }
    }
    var closeMenuTreeModalWinFn = function(){
        $("#menuTreeModal").modal("hide");
    }
    var closeWinFn = function(){
        $("#addSubTransModal").modal("hide");
        $("#modSubTransModal").modal("hide");
        exeComQuery(condition);
        exeQuerySub();
    }
    var exeComQuery = function (baseParams) {
        var qparams = toJson(baseParams);
        $("#grid-table").RGrid("setGridParam",qparams);
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

    var initDate = function(){
        if(<%=modFlag%>){
            Ajax.req({
                url:'${pageContext.request.contextPath}/sysmenu/singlemenu.do',
                type:"json",
                method:"post",
                params: {
                    menuCode:'${param.menu_code}',
                },
                ok: function(text) {
                    $('#window_type').attr('value',text.rows[0]["windowType"]);
                    $('#window_type').RCombo('setValue');
                    $("#sysmenuadd").RForm({value:text});
                    $("#menu_code").attr("readonly", "true");
                    conditionSub = "menuCode="+$("#menu_code").val()
                    exeQuerySub();
                },
                err: function(text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });
        }
    }
    //子功能查�?
    var exeQuerySub=function(){
        var qparams = toJson(conditionSub);
        jQuery("#orgGrid").setGridParam({postData:qparams}).trigger("reloadGrid");
    }
    function toJson(str){
        var mJson = {};
        var arr	= str.split('&');
        for(var i=0;i<arr.length;i++){
            var arr2 = arr[i].split('=');
            mJson[arr2[0]] = arr2[1];
        }
        return mJson;
    }
</script>