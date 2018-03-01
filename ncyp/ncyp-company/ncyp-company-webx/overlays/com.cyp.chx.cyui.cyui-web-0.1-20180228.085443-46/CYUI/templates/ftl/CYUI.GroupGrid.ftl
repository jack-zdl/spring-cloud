<#--
 # 版本：1.0
 # 系统名称: CYUI
 # 作者：chx
 # 邮箱：chx
 # 软件版权: ceyingfintech
 # 修改记录:
 # 修改日期             修改人员         修改说明
 # ========   =======  ============================================
 # 
 # ========   =======  ============================================
-->
<#macro groupGrid id="" width="" height="" emptyMsg="" dataUrl=""  selectModel="" autoload="" baseParams="" hasRowNumber="" hasTips="" onLoadsuccess="" onLoadfailure="" onLoadError="" onBeforesend="" onRowClick="" onRowDbClick="" onSelectAll="" onRowSelect="" onRowDeselect="" sumFiledColumn="" sumBigMoney="" crossPageSelect="" uniqueKey="" onContextMenu="" onCalcSum="" colModel="" colNames="" isDefine="" pid="">

<div>
    <div id="${id}">

    </div>
</div>				
    
<#-- 组件初始化 -->
 <script type="text/javascript">
	$(function() {
	  $("#${id}").GroupGrid({
	    dataUrl :"${dataUrl}",
	    width : "${width}",
	    height : "${height}",
	    id: "${uniqueKey}",
	    pid: "${pid}",
	    pageSize:5
	    <#if strValue(colModel)?length != 0>
	    , columns :[${colModel}]
	    </#if>
	  });
	});

</script>

</#macro>
