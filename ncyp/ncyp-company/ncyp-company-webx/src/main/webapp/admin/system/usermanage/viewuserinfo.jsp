<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>

<jsp:include page="/common/formhead.jsp" />
	<form role="form" id="form-x">
		<r:tinyPanel hasHeader="false">
			<r:panelItem>
				<r:textField  id="userId" name="userId" title="用户编号" readonly="true"></r:textField>
			</r:panelItem>
            <r:panelItem>
                <r:textField  id="userName" name="userName" title="用户姓名" readonly="true"></r:textField>
            </r:panelItem>
			<r:panelItem>
				<r:textField  id="orgName" name="orgName" title="所属组织" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="userStatus_show" name="userStatus_show" title="用户状态" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="user_type" name="user_type" title="用户类别" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="rolenames" name="rolenames" title="所属角色" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="orgnames" name="orgnames" title="关联组织" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="remark" name="remark" title="备注" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="createDate" name="createDate" title="创建时间" readonly="true"></r:textField>
			</r:panelItem>
			<r:panelItem>
				<r:textField  id="modifyDate" name="modifyDate" title="修改时间" readonly="true"></r:textField>
			</r:panelItem>
		</r:tinyPanel>
	</form>
							

<script type="text/javascript">
if('${param.userid}'!=""){
    Ajax.req({
        url: '${pageContext.request.contextPath}/sysuser/page.do',
        type:"json",
        method:"post",
        params: {
            userId:'${param.userid}'
        },
        ok: function(text) {	
        	if(text.rows.length < 1){
                $.RMessage.alert("消息", text.mes);
                return;
            }
            var entity = text.rows[0];            
			for (var key in entity) {
				var $ele=$(document.getElementsByName(key)[0]);
				$ele.val(entity[key]);
				$ele.trigger('chosen:updated');//更新选项
                $("#orgName").val(entity.sysOrganizationDto.orgName);
			}							
        },
        err: function(text) {
             $.RMessage.alert("消息",text.mes);
        }
    });
   
};
</script>