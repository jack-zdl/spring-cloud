<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%@ taglib prefix="r" uri="http://ceying.cypfintech.com/cyui-tags"%>
		
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>上级菜单</title>

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
 
    String treequeryuc = "UC_SYS_MENU_SEARCH";
	String treetitle = "菜单树";
    String treeinfo = "menu_code,menu_name,parent_code,null";
    String dataUrl=request.getContextPath()+"/common/query.do?uc="+treequeryuc+"&queryType=1&treeinfo="+treeinfo+"&treeLevel=0";		

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
							<r:button text="提交" iclass="fa-check-square-o" onClick="mytext"></r:button>
							<r:button text="取消" iclass="fa-remove" onClick="cancelFn"></r:button>
						
						</div>
					</div>
				</div>
			</div>
			
			<div class="page-content" id="treeDiv">
				<div class="row">
					<div class="col-xs-12">
						  <r:tree id="treeDemo" dataUrl="<%=dataUrl%>" isGridTree="false"></r:tree>
					</div>
				</div>
			</div>
			

	  </div>
		</div><!-- /.main-container -->
	</body>		
</html>	
<script type="text/javascript">
       
function mytext(){
	var parent_name =  $('#treeDemo').RTree("getName");
    var parent_code = $('#treeDemo').RTree("getValue")
    $(parent.document.getElementById("parent_name")).val(parent_name);
    $(parent.document.getElementById("parent_code")).val(parent_code);
    cancelFn();
}
				
//树的外层div高度
setTimeout(setTreeH, 200);
function setTreeH(){
		var w_height=$(window).height();
		var otherDivHeight=0;
		$("#treeDiv").prevAll('div').each(function(index, el) {
		   otherDivHeight+=$(this).outerHeight(true);
		});
		$("#treewrap").css('border', '1px solid #ccc');
		w_height-=(otherDivHeight+$("#treeDiv").outerHeight(false));
		$("#treeDiv").height(w_height);
		$("#treewrap").height($("#treeDiv").height());
}

function closeAll(){
	  $('#treeDemo').RTree('close');
}

function expandAll(){
		$('#treeDemo').RTree('expand');
}
var cancelFn = function(){
    parent.closeMenuTreeModalWinFn();
}
</script>							