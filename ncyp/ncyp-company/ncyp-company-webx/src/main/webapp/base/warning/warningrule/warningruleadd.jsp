<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.constants.*" %>
<%@ page import="com.ceying.chx.common.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.common.utils.stringtools.FString" %>
<%@ page import="com.ceying.chx.common.constants.ENNoticeMode" %>
<%@ page import="com.ceying.chx.common.constants.ENNoticeObject" %>
<%@ page import="com.ceying.chx.common.constants.ENNoticeObjectSource" %>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
	String urid = request.getParameter("urid");
	String type = request.getParameter("type");
	boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
	String dataUrl = null;
	if(modFlag){
		dataUrl = request.getContextPath() + "/warning/warningrule/edit.do";
	} else{
		dataUrl = request.getContextPath() + "/warning/warningrule/add.do";
	}
%>

<jsp:include page="/common/formhead.jsp" />
<form role="form" id="warningruleadd1">
	<input type="hidden" id="urid" name="urid" value=""/>
	<input type="hidden" id="msgid" name="msgid" value=""/>
	<input type="hidden" id="noticeid" name="noticeid" value=""/>
	<r:tinyPanel title="基本信息" hasHeader="false">
		<r:panelItem>
			<r:textField id="name" name="name" title="规则名称" check="required"/>
		</r:panelItem>

		<r:panelItem>
			<jsp:include page="/common/wedget/ucsearch/warningobject.jsp">
				<jsp:param name="id" value="warningobjid"/>
				<jsp:param name="title" value="预警对象"/>
				<jsp:param name="check" value="required"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem>
			<r:checkbox title="是否有效" id="isactive" name="isactive"/>
		</r:panelItem>

		<r:panelItem>
			<r:checkbox title="重复预警" id="isrepeatwarning" name="isrepeatwarning"/>
		</r:panelItem>
	</r:tinyPanel>
</form>
	<r:tinyPanel title="预警条件">
		<jsp:include page="/base/warning/warningrule/warningcondition.jsp">
			<jsp:param name="warningObjectId" value="$('#warningobjid').val()"/>
		</jsp:include>
	</r:tinyPanel>
<form role="form" id="warningruleadd2">
	<r:tinyPanel title="消息模板">
		<r:panelItem>
			<r:textField id="subject" name="subject" title="主题" check="required"/>
		</r:panelItem>
		<r:panelItem>
			<r:textArea  id="msgbody" name="msgbody" height="5" title="消息模板" check="required"/>
		</r:panelItem>
	</r:tinyPanel>
</form>
	<jsp:include page="/base/warning/warningrule/msgtemplate.jsp">
		<jsp:param name="warningObjectId" value="$('#warningobjid').val()"/>
	</jsp:include>

<form role="form" id="warningruleadd3">
	<r:tinyPanel title="通知方式">
		<r:panelItem>
			<%-- <jsp:include page="/common/wedget/dictionary/noticemode.jsp">
               <jsp:param name="id" value="noticemode"/>
               <jsp:param name="title" value="消息通知方式"/>
               <jsp:param name="check" value="required"/>
           </jsp:include> --%>
			<r:combo selectable="true" valueField="value" title="通知方式"
					 id="noticemode" name="noticemode" check="required"
					 displayField="text" defaultValue="" afterSelect="noticemodeSelFn"
					 staticData="[{'text':'预警消息','value':'1'},{'text':'短信','value':'4'}]"/>
		</r:panelItem>

		<r:panelItem>
			<jsp:include page="/common/wedget/dictionary/noticeobject.jsp">
				<jsp:param name="id" value="noticeobject"/>
				<jsp:param name="title" value="消息通知对象"/>
				<jsp:param name="check" value="required"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem>
			<r:radio title="来源于单据" id="noticeobjectsource" name="noticeobjectsource" value="1" onchange="changeNoticeObjectSource(1)" checked="true" groupFor="noticeobjectsource"/>
		</r:panelItem>

		<r:panelItem>
			<r:radio title="固定配置" id="noticeobjectsource2" name="noticeobjectsource" value="2" onchange="changeNoticeObjectSource(2)" groupFor="noticeobjectsource"/>
		</r:panelItem>

		<r:panelItem classes="systemuser_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="orgids1"/>
				<jsp:param name="title" value="组织"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="systemuser_custom">
			<jsp:include page="/common/wedget/ucsearch/organization.jsp">
				<jsp:param name="id" value="orgids2"/>
				<jsp:param name="title" value="组织"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="systemuser_bill">
			<jsp:include page="/common/wedget/ucsearch/role.jsp">
				<jsp:param name="id" value="roleids1"/>
				<jsp:param name="title" value="角色"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="systemuser_custom">
			<jsp:include page="/common/wedget/ucsearch/role.jsp">
				<jsp:param name="id" value="roleids2"/>
				<jsp:param name="title" value="角色"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="systemuser_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="userids1"/>
				<jsp:param name="title" value="用户"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="systemuser_custom">
			<jsp:include page="/common/wedget/ucsearch/user.jsp">
				<jsp:param name="id" value="userids2"/>
				<jsp:param name="title" value="用户"/>
				<jsp:param name="width" value="6"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="cellphones1"/>
				<jsp:param name="title" value="手机号"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_custom">
			<r:textArea  id="cellphones2" name="cellphones2" title="手机号"/>
		</r:panelItem>

		<r:panelItem classes="cellphone_bill">
			<jsp:include page="/common/wedget/ucsearch/smscategory.jsp">
				<jsp:param name="id" value="smscategoryid1"/>
				<jsp:param name="title" value="短信类别"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_custom">
			<jsp:include page="/common/wedget/ucsearch/smscategory.jsp">
				<jsp:param name="id" value="smscategoryid2"/>
				<jsp:param name="title" value="短信类别"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_bill">
			<jsp:include page="/common/wedget/ucsearch/outsystem.jsp">
				<jsp:param name="id" value="outsystemid1"/>
				<jsp:param name="title" value="发送平台"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_custom">
			<jsp:include page="/common/wedget/ucsearch/outsystem.jsp">
				<jsp:param name="id" value="outsystemid2"/>
				<jsp:param name="title" value="发送平台"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="srcnotecode1"/>
				<jsp:param name="title" value="来源单据号"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_custom">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="srcnotecode2"/>
				<jsp:param name="title" value="来源单据号"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="srcbatchno1"/>
				<jsp:param name="title" value="来源批号"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="cellphone_custom">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="srcbatchno2"/>
				<jsp:param name="title" value="来源批号"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="others_bill">
			<jsp:include page="/common/wedget/ucsearch/warningobjattribute.jsp">
				<jsp:param name="id" value="mailaddress1"/>
				<jsp:param name="title" value="邮件地址"/>
			</jsp:include>
		</r:panelItem>

		<r:panelItem classes="others_custom">
			<r:textArea  id="mailaddress2" name="mailaddress2" title="邮件地址"/>
		</r:panelItem>
	</r:tinyPanel>
</form>
<jsp:include page="/common/formbottom.jsp" />
<script type="text/javascript">

    $(function(){
        $("#orgids1").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#userids1").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#cellphones1").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#srcnotecode1").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#srcnotecode2").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#srcbatchno1").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#srcbatchno2").RComboGrid('beforeSelect',getNoticeModeAttribute);
        $("#mailaddress1").RComboGrid('beforeSelect',getNoticeModeAttribute);
		/* $("#noticemode").RCombo('afterSelect', noticemodeSelFn); */
        $("#noticeobject").RCombo('afterSelect', noticeobjectSelFn);

        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_WARNINGRULE_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#warningruleadd1").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
            //查询预警规则消息模板信息并填充
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_WARNINGRULE_MSGTEMPLATE_SEARCH",
                    warningruleid: "<%=urid%>"
                },
                ok: function(text){
                    var entity = text.rows[0];
                    $("#msgid").val(entity["urid"]);
                    $("#subject").val(entity["subject"]);
                    $("#msgbody").val(entity["msgbody"]);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });

            //查询预警规则通知方式并填充
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_BASE_WARNINGRULE_NOTICEMODE_SEARCH",
                    warningruleid: "<%=urid%>"
                },
                ok: function(text){
                    var entity = text.rows[0];
                    $("#noticeid").val(entity["urid"]);
                    for(var key in entity){
                        var $ele=$(document.getElementsByName(key)[0]);
                        $ele.attr("Value", entity[key]);
                    }
                    $("#noticemode").RCombo("setValue");
                    $("#noticeobject").RCombo("setValue");
                    if(entity["noticeobjectsource"] == "1"){
                        $("input[id=noticeobjectsource]").prop("checked",true);
                        $("#orgids1").RComboGrid("setValue",entity["orgids"]);
                        $("#roleids1").RComboGrid("setValue",entity["roleids"]);
                        $("#userids1").RComboGrid("setValue",entity["userids"]);
                        $("#cellphones1").RComboGrid("setValue",entity["cellphones"]);
                        $("#smscategoryid1").RComboGrid("setValue",entity["smscategoryid"]);
                        $("#outsystemid1").RComboGrid("setValue",entity["outsystemid"]);
                        $("#srcnotecode1").RComboGrid("setValue",entity["srcnotecode"]);
                        $("#srcbatchno1").RComboGrid("setValue",entity["srcbatchno"]);
                        $("#mailaddress1").RComboGrid("setValue",entity["mailaddress"]);
                    }else{
                        $("input[id=noticeobjectsource2]").prop("checked",true);
                        $("#orgids2").RComboGrid("setValue",entity["orgids"]);
                        $("#roleids2").RComboGrid("setValue",entity["roleids"]);
                        $("#userids2").RComboGrid("setValue",entity["userids"]);
                        $("#cellphones2").val(entity["cellphones"]);
                        $("#smscategoryid2").RComboGrid("setValue",entity["smscategoryid"]);
                        $("#outsystemid2").RComboGrid("setValue",entity["outsystemid"]);
                        $("#srcnotecode2").RComboGrid("setValue",entity["srcnotecode"]);
                        $("#srcbatchno2").RComboGrid("setValue",entity["srcbatchno"]);
                        $("#mailaddress2").RComboGrid(entity["mailaddress"]);
                    }
                    changeEvent(entity["noticemodevalue"], entity["noticeobjectvalue"], entity["noticeobjectsource"]);
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }else{
            //隐藏通知方式的对方用户和邮箱
            hideAll();
        }
    })

    var saveFn = function(){
        $("#warningruleadd1").RValidate();
        $("#warningruleadd2").RValidate();
        $("#warningruleadd3").RValidate();

        var result1 = $("#warningruleadd1").RValidate('validate');
        var result2 = $("#warningruleadd2").RValidate('validate');
        var result3 = $("#warningruleadd3").RValidate('validate');
        var result4 = $("#warningConditionTab").EditableGrid('toValidate');
        var result5 = $("#msgTemplateTab").EditableGrid('toValidate');

        if(result1 & result2 & result3 & result4 & result5){
            save();
		}
    }

    var save = function(){
        //通知方式信息
        var noticemode = $("#noticemode").val();
        var noticeobject = $("#noticeobject").val();
        var noticeobjectsource = "<%=ENNoticeObjectSource.BILL.getValue()%>";
        var temp = document.getElementsByName("noticeobjectsource");
        for (var i = 0; i < temp.length; i++) {
            if (temp[i].checked) {
                noticeobjectsource = i + 1;
            }
        }

        if (noticemode == "<%=ENNoticeMode.WARNINGMSG.getValue()%>") {
            var check = checkNoticeUsers(noticeobjectsource);
            if (check == 0) {
                $.RMessage.alert("消息", "至少选择一类通知用户！");
                return false;
            }
        } else if (noticemode == "<%=ENNoticeMode.SHORTMSG.getValue()%>") {
            if (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>" && noticeobject == "<%=ENNoticeObject.SYSTEMUSER.getValue()%>") {
                var check = checkNoticeUsers(noticeobjectsource);
                if (check == 0) {
                    $.RMessage.alert("消息", "至少选择一类通知用户或者手机号！");
                    return false;
                }
            }
        }

        //构建字段集合字符串
        var contextfields = $('#msgTemplateTab').EditableGrid('getAllValue');
        var context = "";
        for (var j = 0; j < contextfields.length; j++) {
            if ((contextfields[j].msgtext == null || contextfields[j].msgtext == "" || contextfields[j].msgtext == undefined)
                || (contextfields[j].warningobjattrid == null || contextfields[j].warningobjattrid == "" || contextfields[j].warningobjattrid == undefined)) {
                $.RMessage.alert("消息", "消息模板属性第" + (j + 1) + "行数据不完整！");
                return false;
            }
            context += contextfields[j].msgtext + "," + contextfields[j].warningobjattrid;
            if (j != contextfields.length - 1) {
                context += "|";
            }
        }

        var warningConditionAddDatas = $('#warningConditionTab').EditableGrid('getAddValue');
        var warningConditionEditDatas = $('#warningConditionTab').EditableGrid('getEditValue');
        var warningConditionDelIds = $('#warningConditionTab').EditableGrid('getDelArray');


        Ajax.req({
            url: "<%=dataUrl%>",
            params: {
                urid: "${param.urid}",
                msgid:$("#msgid").val(),
                noticeid:$("#noticeid").val(),
                name: $("#name").val(),
                warningobjid: $("#warningobjid").val(),
                isactive: $("#isactive").is(":checked") ? '1' : '0',
                isrepeatwarning: $("#isrepeatwarning").is(":checked") ? '1' : '0',
                noticemode: $("#noticemode").val(),
                noticeobject: $("#noticeobject").val(),
                noticeobjectsource: noticeobjectsource,
                orgids: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#orgids1").val() : $("#orgids2").val(),
                roleids: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#roleids1").val() : $("#roleids2").val(),
                userids: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#userids1").val() : $("#userids2").val(),
                mailaddress: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#mailaddress1").val() : $("#mailaddress2").val(),
                cellphones: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#cellphones1").val() : $("#cellphones2").val(),
                smscategoryid: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#smscategoryid1").val() : $("#smscategoryid2").val(),
                outsystemid: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#outsystemid1").val() : $("#outsystemid2").val(),
                srcnotecode: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#srcnotecode1").val() : $("#srcnotecode2").val(),
                srcbatchno: (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") ? $("#srcbatchno1").val() : $("#srcbatchno2").val(),
                subject:$("#subject").val(),
                msgbody:$("#msgbody").val(),
                contextfields: context,
                warningConditionAddDatas: JSON.stringify(warningConditionAddDatas),
                warningConditionEditDatas: JSON.stringify(warningConditionEditDatas),
                warningConditionDelIds: warningConditionDelIds.join(",")
            },
            ok: function(text) {
                $.RMessage.alert("消息", text.msg, parent.closeWinFn);
            },
            err: function(text){
                $.RMessage.alert("消息", text.msg);
            }
        })
    }

    //检验通知方式的对象是否至少选择一个
    function checkNoticeUsers(noticeobjectsource) {
        if ($("#noticeobject").val() == "<%=ENNoticeObject.OTHERS.getValue()%>") {
            return 1;
        }
        var orgids;
        var roleids;
        var userids;
        var cellphones;
        if (noticeobjectsource == "<%=ENNoticeObjectSource.BILL.getValue()%>") {
            orgids = $("#orgids1").val();
            roleids = $("#roleids1").val();
            userids = $("#userids1").val();
            cellphones = $("#cellphones1").val();
            if ((orgids == null || orgids == "" || orgids == undefined) && (roleids == null || roleids == "" || roleids == undefined) && (userids == null || userids == "" || userids == undefined) && (cellphones == null || cellphones == "" || cellphones == undefined)) {
                return 0;
            }
        }else {
            orgids = $("#orgids2").val();
            roleids = $("#roleids2").val();
            userids = $("#userids2").val();
            if ((orgids == null || orgids == "" || orgids == undefined) && (roleids == null || roleids == "" || roleids == undefined) && (userids == null || userids == "" || userids == undefined)) {
                return 0;
            }
        }

        return 1;
    }

    //通知方式属性前置事件，根据选择的预警对象过滤可选的属性值
    function getNoticeModeAttribute(){
        var warningobjid = $("#warningobjid").RComboGrid("getValue");
        var Json = [{"warningobjid":warningobjid,"attricategory":"3"}];
        return Json;

    }
    //通知方式后置事件，选择后改变展示的属性
    function noticemodeSelFn(){
        resetNoticeInfo();
        var noticeobjectsource;
        var temp = document.getElementsByName("noticeobjectsource");
        for (var i = 0; i < temp.length; i++) {
            if (temp[i].checked) {
                noticeobjectsource = i+1;
            }
        }
        var noticemode = $("#noticemode").val();
        var noticeobject = $("#noticeobject").val();
        changeEvent(noticemode, noticeobject, noticeobjectsource);
    }

    //通知对象后置事件，选择后改变展示的属性
    function noticeobjectSelFn(){
        resetNoticeInfo();
        var noticeobjectsource;
        var temp = document.getElementsByName("noticeobjectsource");
        for (var i = 0; i < temp.length; i++) {
            if (temp[i].checked) {
                noticeobjectsource = i+1;
            }
        }
        var noticeobject = $("#noticeobject").val();
        var noticemode = $("#noticemode").val();
        changeEvent(noticemode, noticeobject, noticeobjectsource);
    }

    //选择通知对象源时，显示隐藏信息
    function changeNoticeObjectSource(value) {
        resetNoticeInfo();
        var noticemode = $("#noticemode").val();
        var noticeobject = $("#noticeobject").val();
        var noticeobjectsource = value;
        changeEvent(noticemode, noticeobject, noticeobjectsource);
    }
    //根据通知方式和通知对象以及来源控制显示的字段
    function changeEvent(noticemode, noticeobject, noticeobjectsource) {
        if (noticemode == <%=ENNoticeMode.WARNINGMSG.getValue()%>) {//通知方式：预警消息
            if (noticeobject == <%=ENNoticeObject.SYSTEMUSER.getValue()%>) {//通知对象：系统用户
                if (noticeobjectsource == <%=ENNoticeObjectSource.BILL.getValue()%>) {//来源于单据
                    showSystemUserBill();
                } else if (noticeobjectsource == <%=ENNoticeObjectSource.CUSTOM.getValue()%>) {//固定配置
                    showSystemUserCustom();
                }
            } else if (noticeobject == <%=ENNoticeObject.OTHERS.getValue()%>) {//通知对象：其他人员
                if (noticeobjectsource == <%=ENNoticeObjectSource.BILL.getValue()%>) {
                    showOthersBill();
                } else if (noticeobjectsource == <%=ENNoticeObjectSource.CUSTOM.getValue()%>) {
                    showOthersCustom();
                }
            }
        } else if (noticemode == <%=ENNoticeMode.SYSTEMMSG.getValue()%>) {//通知方式：系统消息，暂未处理

        } else if (noticemode == <%=ENNoticeMode.EMAIL.getValue()%>) {//通知方式：邮件，暂未处理

        } else if (noticemode == <%=ENNoticeMode.SHORTMSG.getValue()%>) {//通知方式：短信
            if (noticeobjectsource == <%=ENNoticeObjectSource.BILL.getValue()%>) {//来源于单据
                if (noticeobject == <%=ENNoticeObject.SYSTEMUSER.getValue()%>) {//通知对象：系统用户
                    showSysBillCellphones();
                } else if (noticeobject == <%=ENNoticeObject.OTHERS.getValue()%>) {//通知对象：其他人员
                    showOtherBillCellphones();
                }
            } else if (noticeobjectsource == <%=ENNoticeObjectSource.CUSTOM.getValue()%>) {//固定配置
                showCustomCellphones();
            }

        }
    }

    //清除所有数据
    function resetNoticeInfo() {
        $("#orgids1").RComboGrid('setAllValue', ['','']);
        $("#orgids2").RComboGrid('setAllValue', ['','']);
        $("#roleids1").RComboGrid('setAllValue', ['','']);
        $("#roleids2").RComboGrid('setAllValue', ['','']);
        $("#userids1").RComboGrid('setAllValue', ['','']);
        $("#userids2").RComboGrid('setAllValue', ['','']);
        $("#mailaddress1").RComboGrid('setAllValue', ['','']);
        $("#mailaddress2").val("");
        $("#cellphones1").RComboGrid('setAllValue', ['','']);
        $("#smscategoryid1").RComboGrid('setAllValue', ['','']);
        $("#smscategoryid2").RComboGrid('setAllValue', ['','']);
        $("#outsystemid1").RComboGrid('setAllValue', ['','']);
        $("#outsystemid2").RComboGrid('setAllValue', ['','']);
        $("#srcnotecode1").RComboGrid('setAllValue', ['','']);
        $("#srcnotecode2").RComboGrid('setAllValue', ['','']);
        $("#srcbatchno1").RComboGrid('setAllValue', ['','']);
        $("#srcbatchno2").RComboGrid('setAllValue', ['','']);
        $("#cellphones2").val("");
    }

    //隐藏所有信息,清除必选
    function hideAll() {
        $(".systemuser_bill").hide();
        $(".systemuser_custom").hide();
        $(".others_bill").hide();
        $(".others_custom").hide();
        $(".cellphone_bill").hide();
        $(".cellphone_custom").hide();
    }

    //显示系统用户-来源单据的信息
    function showSystemUserBill() {
        hideAll();
        $(".systemuser_bill").show();
    }
    //显示系统用户-自定义配置的信息
    function showSystemUserCustom() {
        hideAll();
        $(".systemuser_custom").show();
    }

    //显示其他人员-来源单据的信息
    function showOthersBill() {
        hideAll();
        $(".others_bill").show();
    }

    //显示其他人员-自定义配置的信息
    function showOthersCustom() {
        hideAll();
        $(".others_custom").show();
    }
    //短信时：显示固定配置手机号
    function showCustomCellphones() {
        hideAll();
        $(".cellphone_custom").show();
    }
    //短信时：显示单据配置手机号,系统用户
    function showSysBillCellphones() {
        hideAll();
        $(".systemuser_bill").show();
        $(".cellphone_bill").show();
    }
    //短信时：显示单据配置手机号,其他用户
    function showOtherBillCellphones() {
        hideAll();
        $(".cellphone_bill").show();
    }
</script>