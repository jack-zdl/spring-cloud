

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ceying.chx.dto.user.SysUserLoginDto" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags" %>

<%
    String urid = request.getParameter("pks");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/organization/addorupdate.do";
    if (modFlag) {
        dataUrl = request.getContextPath() + "/organization/addorupdate.do";
    }
    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
    String orgid = request.getParameter("pks");
    String userid = currUser.getUserId();
    String gridtenantid = currUser.getTenantId().toString();
%>
<jsp:include page="/common/formhead.jsp"/>
<form role="form" id="sysorgadd">
    <input id="uc" type="hidden" name="uc" value="UC_SYS_ROLE_ADD"/>
    <input id="org_id" type="hidden" name="orgId" value="${param.pks}"/>
    <input id="create_date" type="hidden" name="createdate"/>
    <input id="tenant_id" type="hidden" name="tenantId" value="<%=gridtenantid %>"/>
    <input id="org_code" type="hidden" name="orgCode"/>

    <r:tinyPanel title="基本信息" hasHeader="true">
        <r:panelItem>
            <r:textField id="org_name" name="orgName" title="组织名称" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:combo valueField="value" id="org_cate" name="orgCate"
                     dataUrl="${pageContext.request.contextPath}/dictionary/getCache.do?keyno=9999004"
                     displayField="text" check="required" title="组织分类" afterSelect="showrate"/>
        </r:panelItem>
        <r:panelItem>
            <r:combo valueField="value" id="org_level" name="orgLevel"
                     dataUrl="${pageContext.request.contextPath}/dictionary/getCache.do?keyno=9999005"
                     displayField="text" check="required" title="组织级别"/>
        </r:panelItem>
        <%if ("6000001".equals(orgid)) {%>
        <input id="parentId" type="hidden" name="parentId"/>
        <%} else { %>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                <jsp:param name="id" value="parentId"/>
                <jsp:param name="valueField" value="orgId"/>
                <jsp:param name="displayField" value="codename"/>
                <jsp:param name="title" value="上级组织"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="SelFn" value="parentIdSelFn"/>
            </jsp:include>
        </r:panelItem>
        <%} %>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/organization.jsp">
                <jsp:param name="id" value="manageId"/>
                <jsp:param name="valueField" value="orgId"/>
                <jsp:param name="displayField" value="codename"/>
                <jsp:param name="title" value="主管组织"/>
                <jsp:param name="check" value="required"/>
                <jsp:param name="SelFn" value="parentIdSelFn"/>
            </jsp:include>
        </r:panelItem>
        <r:panelItem>
            <jsp:include page="/common/wedget/ucsearch/area.jsp">
                <jsp:param name="id" value="areaid"/>
                <jsp:param name="valueField" value="urid"/>
                <jsp:param name="displayField" value="codename"/>
                <jsp:param name="title" value="区域"/>
                <jsp:param name="check" value="required"/>
            </jsp:include>
        </r:panelItem>
        <div id="divplatformsupplierrate">
            <r:panelItem>
                <r:numberField id="platformsupplierrate" name="platformsupplierrate" title="平台向供应商收取的费率(%)" moneyFormat="money" check="required"/>
            </r:panelItem>
        </div>
        <div id="divcorecompanyrate">
            <r:panelItem>
                <r:numberField id="corecompanyrate" name="corecompanyrate" title="核心企业向供应商收取的费率(%)" moneyFormat="money" check="required"/>
            </r:panelItem>
        </div>
        <r:panelItem>
            <r:textField id="legalperson" name="legalperson" title="法定代表人" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textField id="address" name="address" title="地址" check="required"/>
        </r:panelItem>
        <r:panelItem>
            <r:textArea title="备注" check="maxlength:512" id="remark" name="remark"/>
        </r:panelItem>
    </r:tinyPanel>

</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    window.onload = function () {
        if (<%=modFlag%>) {
            Ajax.req({
                url: '${pageContext.request.contextPath}/organization/selectByPrimaryKey.do',
                type: "json",
                method: "post",
                params: {
                    orgId: '${param.pks}'
                },
                ok: function (text) {
                    $("#sysorgadd").RForm({value: text});
                    $('#org_cate').attr('value',text.rows[0]["orgCate"]);
                    $('#org_cate').RCombo('setValue');
                    $('#org_level').attr('value',text.rows[0]["orgLevel"]);
                    $('#org_level').RCombo('setValue');
                    $("#areaid").RComboGrid("setValue",text.rows[0]["areaid"]);
                    showEditRate();
                    $("#org_cate").RCombo("setReadOnly",true);
                    $("#parentId").RComboGrid('setValue', '${param.type}');
                    $("#manageId").RComboGrid('setValue', '${param.type}');
                    $("#parentId").RComboGrid("setReadOnly",true);
                    $("#manageId").RComboGrid("setReadOnly",true);
                    var prate = Number($("#platformsupplierrate").val()).mul(100);
                    $("#platformsupplierrate").val(prate);
                    var crate = Number($("#corecompanyrate").val()).mul(100);
                    $("#corecompanyrate").val(crate);
                },
                err: function (text) {
                    $.RMessage.alert("消息", text.msg);
                }
            });


        } else {
            showEditRate();
            var type = "${param.type}";
            type = type.substring(7,8);
            if(type!=""&&type!="undifined"&&type!=null){
                $('#org_cate').attr('value',type);
                $('#org_cate').RCombo('setValue');
                $("#org_cate").RCombo("setReadOnly",true);
                showrate();
            }
            $("#parentId").RComboGrid('setValue', '${param.type}');
            $("#manageId").RComboGrid('setValue', '${param.type}');
            $("#parentId").RComboGrid("setReadOnly",true);
            $("#manageId").RComboGrid("setReadOnly",true);
        }
    }

    var saveFn = function () {
        $("#sysorgadd").RValidate({
            'success': save
        });

        $("#sysorgadd").RValidate('validate');
    }


    var save = function () {
        if (!$("#areaid").val()) {
            $.RMessage.alert("消息", "请选择区域");
        } else if($("#platformsupplierrate").val()<0||$("#platformsupplierrate").val()>2) {
            $.RMessage.alert("消息", "平台向供应商收取的费率不在正确的范围之内");
        } else if($("#corecompanyrate").val()<0||$("#corecompanyrate").val()>2) {
            $.RMessage.alert("消息", "平台付给核心企业的费率不在正确的范围之内");
        } else{
            var prate = FloatDiv($("#platformsupplierrate").val(),100,4);
            $("#platformsupplierrate").val(prate);
            var crate = FloatDiv($("#corecompanyrate").val(),100,4);
            $("#corecompanyrate").val(crate);
            var queryParams = $("#sysorgadd").AllSerialize();
            Ajax.req({
                url: '<%=dataUrl%>',
                params: queryParams,
                ok: function (text) {
                    $.RMessage.alert("消息", text.mes, parent.closeWinFn);
                },
                err: function (text) {
                    $.RMessage.alert("消息", text.mes);
                }
            });
            var tempprate =Number($("#platformsupplierrate").val()).mul(100);
            $("#platformsupplierrate").val(tempprate);
            var tempcrate =Number($("#corecompanyrate").val()).mul(100);
            $("#corecompanyrate").val(tempcrate);
        }


    }

    var parentIdSelFn = function () {
        $('#org_level').attr('value', '');
        $('#org_level').RCombo('setValue');
    }

    var tenantSelFn = function () {
        if (!<%=modFlag%>) {
            $("#org_code").DvTextField('setDefaultValue', $("#tenant_id").val());
        }
    }

    var showrate = function(){
        var selectValue = $("select[name='orgCate']").val();
        if(selectValue=="2"){
            $("#divplatformsupplierrate").hide();
            $("#divcorecompanyrate").show();
            $("#corecompanyrate").val('2');
            $("#platformsupplierrate").val('0');
            var allowkeyvalue = "1,2,3,4";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
        }else if(selectValue=="3"){
            $("#divplatformsupplierrate").show();
            $("#divcorecompanyrate").hide();
            $("#corecompanyrate").val('0');
            $("#platformsupplierrate").val('1');
            var allowkeyvalue = "1,2,3,4";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
        }else if(selectValue=="1"){
            var allowkeyvalue = "1,2";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
            $("#divcorecompanyrate").hide();
            $("#divplatformsupplierrate").hide();
            $("#corecompanyrate").val('0');
            $("#platformsupplierrate").val('0');
        }else{
            if("<%=userid%>"!="admin"){
                var allowkeyvalue = "1,2,3,4";
                $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
            }
            $("#divcorecompanyrate").hide();
            $("#divplatformsupplierrate").hide();
            $("#corecompanyrate").val('0');
            $("#platformsupplierrate").val('0');
        }

        Ajax.req({
            url : "${pageContext.request.contextPath}/organization/orgcate.do",
            params : {
                orgcate : selectValue
            },
            ok : function(text) {
                if(text.rows==null||text.rows==undefined){
                    $.RMessage.alert("消息",text.msg);
                }else{
                    var orgcode = parseInt(text.rows[0]["orgCode"])+1;
                    $("input[name='orgCode']").val(orgcode);
                }

            },
            err : function(text) {
                $.RMessage.alert("消息",text.msg);
            }
        });
    }

    var showEditRate = function(){
        var selectValue = $("select[name='orgCate']").val();
        if(selectValue=="2"){
            $("#divplatformsupplierrate").hide();
            $("#divcorecompanyrate").show();
            var allowkeyvalue = "1,2,3,4";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
        }else if(selectValue=="3"){
            $("#divplatformsupplierrate").show();
            $("#divcorecompanyrate").hide();
            var allowkeyvalue = "1,2,3,4";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
        }else if(selectValue=="1"){
            var allowkeyvalue = "1,2";
            $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
            $("#divcorecompanyrate").hide();
            $("#divplatformsupplierrate").hide();
        }else{
            if("<%=userid%>"!="admin"){
                var allowkeyvalue = "1,2,3,4";
                $("#org_level").RCombo('setParam',{"allowkeyvalue":allowkeyvalue});
            }
            $("#divcorecompanyrate").hide();
            $("#divplatformsupplierrate").hide();
        }

    }

    //除法函数，用来得到精确的除法结果
    //说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果�?
    //调用：accDiv(arg1,arg2)
    //返回值：arg1除以arg2的精确结�?
    function accDiv(arg1,arg2){
        var t1=0,t2=0,r1,r2;
        try{t1=arg1.toString().split(".")[1].length}catch(e){}
        try{t2=arg2.toString().split(".")[1].length}catch(e){}
        with(Math){
            r1=Number(arg1.toString().replace(".",""))
            r2=Number(arg2.toString().replace(".",""))
            return (r1/r2)*pow(10,t2-t1);
        }
    }

    //给Number类型增加�?个div方法，调用起来更加方便�??
    Number.prototype.div = function (arg){
        return accDiv(this, arg);
    }

    //乘法函数，用来得到精确的乘法结果
    //说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果�?
    //调用：accMul(arg1,arg2)
    //返回值：arg1乘以arg2的精确结�?
    function accMul(arg1,arg2)
    {
        var m=0,s1=arg1.toString(),s2=arg2.toString();
        try{m+=s1.split(".")[1].length}catch(e){}
        try{m+=s2.split(".")[1].length}catch(e){}
        return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
    }

    //给Number类型增加�?个mul方法，调用起来更加方便�??
    Number.prototype.mul = function (arg){
        return accMul(arg, this);
    }

    //加法函数，用来得到精确的加法结果
    //说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果�?
    //调用：accAdd(arg1,arg2)
    //返回值：arg1加上arg2的精确结�?
    function accAdd(arg1,arg2){
        var r1,r2,m;
        try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
        try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
        m=Math.pow(10,Math.max(r1,r2))
        return (arg1*m+arg2*m)/m
    }

    //给Number类型增加�?个add方法，调用起来更加方便�??
    Number.prototype.add = function (arg){
        return accAdd(arg,this);
    }


    //减法函数，用来得到精确的加法结果
    //说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果�?
    //调用：accAdd(arg1,arg2)
    //返回值：arg1加上arg2的精确结�?

    function accSub(arg1, arg2) {
        var r1, r2, m, n;
        try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
        try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
        m = Math.pow(10, Math.max(r1, r2));
//last modify by deeka
//动�?�控制精度长�?
        n = (r1 >= r2) ? r1 : r2;
        return ((arg1 * m - arg2 * m) / m).toFixed(n);
    }
    //给Number类型增加�?个sub方法，调用起来更加方便�??
    Number.prototype.sub = function (arg){
        return accSub(arg,this);
    }
</script>
