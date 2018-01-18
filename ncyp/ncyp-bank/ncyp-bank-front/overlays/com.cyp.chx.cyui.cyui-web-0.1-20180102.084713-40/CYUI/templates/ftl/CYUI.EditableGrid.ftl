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
<#macro editableGrid id="" width="" height="" emptyMsg="" dataUrl=""  selectModel="" autoload="" baseParams="" hasRowNumber="" hasTips="" onLoadsuccess="" onLoadfailure="" onLoadError="" onBeforesend="" onRowClick="" onRowDbClick="" onSelectAll="" onRowSelect="" onRowDeselect="" sumFiledColumn="" sumBigMoney="" crossPageSelect="" uniqueKey="" onContextMenu="" onCalcSum="" colModel="" colNames="" isDefine="" saveFn="" initialize="" hiddenCol="" primaryKey="">

<div id="${id}" style="width:100%;border:1px solid #E1E1E1">
</div>
					
<#-- 组件初始化 -->
 <script type="text/javascript">
	$(function() {
	  $("#${id}").EditableGrid({
	    dataUrl :"${dataUrl}",
	    <#if strValue(saveFn)?length != 0>
	    saveFn: ${saveFn},
       </#if>
	    initialize:[${initialize}],
	    pageSize:100
	    <#if strValue(colModel)?length != 0>
	    , columns :[${colModel}]
	    </#if>
	    <#if strValue(height)?length != 0>
        , height :"${height}"
        </#if>
        <#if strValue(hiddenCol)?length != 0>
        , hiddenCol :${hiddenCol}
        </#if>
        <#if strValue(primaryKey)?length != 0>
        , primaryKey :${primaryKey}
        </#if>
	  });
	});

</script>


</#macro>
