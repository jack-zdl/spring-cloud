<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.ceying.chx.common.constants.UserConstant" %>
<%@page import="com.ceying.chx.dto.user.SysUserLoginDto"%>
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
		
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>分配角色权限</title>

		<meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <jsp:include page="/common/include.jsp" />	
		
	</head>
    <style>
		.btn-noborder{
			border: none;
		}
		.page-content{
			padding: 8px 20px;
		}
		/*modal背景色，原为黑 改为透明*/
		.modal-backdrop{
			/*background-color: transparent;*/
		}
		#treewrap{overflow: auto !important;}
	</style>
<%
	String treetitle = "菜单树";
    String treeinfo = "menu_code,menu_name,parent_code,checked";
    String rolecode = request.getParameter("rolecode");

    SysUserLoginDto currUser  = (SysUserLoginDto) request.getSession().getAttribute(UserConstant.USER_LOGIN_SESSION);
	String userid = currUser.getUserId();
	String tenant_id = request.getParameter("tenant_id");
		
    String dataUrl=request.getContextPath()+"/sysmenu/queryPower.do?queryType=1&treeinfo="+treeinfo+"&treeLevel=0&rolecode="+rolecode+"&tenant_id="+tenant_id;
%>

<body class="no-skin">	
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<div class="main-content">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<div class="col-xs-12">							
							<r:button text="展开" iclass="fa-folder-open-o" onClick="expandAll"></r:button>
							<r:button text="收缩" iclass="fa-folder-o" onClick="closeAll"></r:button>
							<r:button text="提交" iclass="fa-check-square-o" onClick="savePower"></r:button>
							<r:button text="取消" iclass="fa-remove" onClick="closeWinFn"></r:button>
						</div>
					</div>
				</div>
			</div>
			<div class="page-content" id="treeDiv">
				<div class="row">
					<div class="col-xs-12">
						<r:tree id="treeDemo" dataUrl="<%=dataUrl%>" onNodeClick="mytext" selectModel="true" isGridTree="false"></r:tree>
					</div>
				</div>
			</div>
	  </div>
	</div>
</body>		
</html>	
<script type="text/javascript">
       
function mytext(){
	var objvalue =  $('#treeDemo').RTree("getValue");
}

var closeWinFn = function(){
    parent.closepowerWinFn();
}		

var checknodes = [];
/** 
*删除数组指定下标或指定对象 
*/ 
function removeArray(array,obj){
	for(var i =0;i <array.length;i++){ 
		var temp = array[i]['id']; 		  
		if(temp == obj){ 
			for(var j = i;j <array.length;j++){ 
				array[j]=array[j+1]; 
			} 
			array.length = array.length-1; 
		} 
	} 
	return array;
} 

function delCheckNodeFn(nodes,checknodes,delchecknodes) 
{   
	for (var j = 0; j < checknodes.length; j++) {
		var checknodesid = checknodes[j]['id']||null;
		for (var i = 0; i < nodes.length; i++) {
	   		var nodesid = nodes[i]['id']||null;
	     	if(nodesid!=null&&checknodesid!=null){	 
			 	if(nodesid==checknodesid){
			   		removeArray(delchecknodes,nodesid);
	          		break;
				}    
			}		
	 	}
    }
    return delchecknodes;
}

function addCheckNodeFn(nodes,checknodes,addchecknodes) 
{ 
    for (var i = 0; i < nodes.length; i++) {
    	var nodesid = nodes[i]['id']||null;
		for (var j = 0; j < checknodes.length; j++) {
	     	var checknodesid = checknodes[j]['id']||null;
			if(nodesid!=null&&checknodesid!=null){	    		
		    	if(nodesid==checknodesid){
		    		removeArray(addchecknodes,nodesid);  							
		    		break;
				}
			}    		
		}
 	}
    return addchecknodes;
}

function savePower(){
	
	var strs = [];
 	var nodes = $('#treeDemo').RTree('getValue');
		 
	var delchecknodes = []; 
	var addchecknodes = [];
	 
	delchecknodes = checknodes.concat();
	addchecknodes = nodes.concat();
		  
 	addchecknodes = addCheckNodeFn(nodes,checknodes,addchecknodes);
	delchecknodes = delCheckNodeFn(nodes,checknodes,delchecknodes);
     
    for(var k = 0, w = delchecknodes.length; k < w; k++){
   		strs.push(delchecknodes[k]['pid']+'$'+delchecknodes[k]['id']+'$1'+'$0'+'|'+'false'+'|'+delchecknodes[k]['leaf']+'|'+'true'+'|'+'false');
   		strs.push(delchecknodes[k]['id']+'$'+delchecknodes[k]['id']+'$1'+'$0'+'|'+'false'+'|'+delchecknodes[k]['leaf']+'|'+'true'+'|'+'false');
    }

    for(var k = 0, w = addchecknodes.length; k < w; k++){
    	strs.push(addchecknodes[k]['pid']+'$'+addchecknodes[k]['id']+'$1'+'$0'+'|'+'true'+'|'+addchecknodes[k]['leaf']+'|'+'true'+'|'+'false');
    	strs.push(addchecknodes[k]['id']+'$'+addchecknodes[k]['id']+'$1'+'$0'+'|'+'true'+'|'+addchecknodes[k]['leaf']+'|'+'true'+'|'+'false');
    }
    var params = strs.join(',');
    if(params==null||params==''){
    	$.RMessage.alert("消息","请选择需要授权的权限！");
    	return;
    }
    Ajax.req({
 		url: '${pageContext.request.contextPath}/sysrole/allocatepower.do',
        type:"json",
        params: {
            role_code:'${param.rolecode}',
            right_flag: '1',
            rights:params
        },
        ok: function(text) {
           	$.RMessage.alert("消息",text.mes,closeWinFn);
	  	},
	  	err: function(text) {
	  		$.RMessage.alert("消息",text.mes);
	      }
    });
}

function expandAll(){
    checknodes=[];
    $('#treeDemo').RTree('expand');
    checknodes = $('#treeDemo').RTree('getValue');
}

function closeAll(){
	$('#treeDemo').RTree('close');
}

window.onload = function(){
	expandAll();
}

</script>							