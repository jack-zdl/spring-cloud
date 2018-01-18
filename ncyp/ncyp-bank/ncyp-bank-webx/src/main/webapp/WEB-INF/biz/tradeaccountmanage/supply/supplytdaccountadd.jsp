<%@ page import="com.ceying.chx.biz.utils.properties.MessageUtil" %>
<%@ page import="com.ceying.chx.biz.utils.stringtools.FString" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<%
    String urid = request.getParameter("urid");
    String type = request.getParameter("type");
    boolean modFlag = FString.isNotNullAndNotEmpty(urid) && "mod".equals(type);
    String dataUrl = request.getContextPath() + "/supplytdaccountmanage/tradeaccount/add.do";
    if(modFlag){
        dataUrl = request.getContextPath() + "/supplytdaccountmanage/tradeaccount/edit.do";
    }
%>

<jsp:include page="/common/formhead.jsp"/>
	<form role="form" id="tradeaccountadd">
     	<input type="hidden" id="urid" name="urid" value="<%=urid%>"/>
    	<r:tinyPanel title="基本信息"> 								
			<r:panelItem>
	 			<r:textField id="accountnumber" name="accountnumber" title="交易账号" check="required"/>
	     	</r:panelItem>     
	    	<r:panelItem>
               	<r:textField id="accountname" name="accountname" title="交易账户名称" check="required"/>
		   	</r:panelItem>
	     	<r:panelItem>
               	<jsp:include page="/common/wedget/ucsearch/organization.jsp">
                   	<jsp:param name="id" value="orgid"/>
                  	<jsp:param name="title" value="所属机构"/>
                  	<jsp:param name="check" value="required"/>
           		</jsp:include>
		   	</r:panelItem>         
		</r:tinyPanel>
		<r:tinyPanel title="联系人信息"> 								
			<r:panelItem>
              	<r:textField id="contactname" name="contactname" title="联系人名称" />
	    	</r:panelItem>
		   	<r:panelItem>
               	<r:textField id="cellphone" name="cellphone" title="联系人手机号" check="cellphone"/>
		   	</r:panelItem>
	     	<r:panelItem>
           		<jsp:include page="/common/wedget/dictionary/certtype.jsp">
                  	<jsp:param name="id" value="certtype"/>
               		<jsp:param name="title" value="证件类型"/>
               	</jsp:include>
		   	</r:panelItem>
	     	<r:panelItem>
               	<r:textField id="certnumber" name="certnumber" title="证件号码" />
	     	</r:panelItem>
	     	<r:panelItem>
               	<r:textField id="email" name="email" title="联系人邮箱" check="email"/>
	    	</r:panelItem>
		   	<r:panelItem>
               	<r:textField id="address" name="address" title="联系人地址" />
	     	</r:panelItem>
		</r:tinyPanel>
	</form>
<jsp:include page="/common/formbottom.jsp"/>

<script type="text/javascript">
    $(function(){
        if(<%=modFlag%>){
            Ajax.req({
                url: "${pageContext.request.contextPath}/common/query.do",
                type: "json",
                method: "get",
                params: {
                    uc: "UC_SCS_TA_SUPPLYTRADEACCOUNT_SEARCH",
                    urid: "<%=urid%>"
                },
                ok: function(text){
                    $("#tradeaccountadd").RForm({value:text});
                },
                err: function(text){
                    $.RMessage.alert("消息", text);
                }
            });
        }
    })

    var saveFn = function(){
        $("#tradeaccountadd").RValidate({
            'success': function(){
                var params = $("#tradeaccountadd").serialize();
                var cellphone=$("#cellphone").val();
                var certnumber=$("#certnumber").val();
                var email=$("#email").val();
                //验证手机号
//                var regax=/^1(3|4|5|7|8)[0-9]{9}$/;
//                if(cellphone.trim()!=''&&cellphone.trim()!=null){
//                    if(regax.test(cellphone)!=true){
//                        $.RMessage.alert("消息","请输入正确的手机号！");
//                        return;
//                    }
//                }
                //验证身份证
                var regax=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                if(certnumber!=''&&certnumber!=null){
                    if(regax.test(certnumber)!=true){
                        $.RMessage.alert("消息","请输入正确的身份证号！");
                        return;
                    }
                }
                //验证邮箱
//                regax=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
//                if(email!=''&&email!=null){
//                    if(regax.test(email)!=true){
//                        $.RMessage.alert("消息","请输入正确的邮箱！");
//                        return;
//                    }
//                }
                Ajax.req({
                    url: "<%=dataUrl%>",
                    params: params,
                    ok: function(text) {
                        $.RMessage.alert("消息", text.msg, parent.closeWinFn);
                    },
                    err: function(text){
                        $.RMessage.alert("消息", text.msg);
                    }
                })
            }
        });
        $("#tradeaccountadd").RValidate("validate");
    }

</script>