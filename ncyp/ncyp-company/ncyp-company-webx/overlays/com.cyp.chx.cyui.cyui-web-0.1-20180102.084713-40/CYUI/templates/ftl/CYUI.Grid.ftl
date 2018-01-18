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
<#macro grid id="" width="" height="" emptyMsg="" dataUrl=""  selectModel="" autoload="" baseParams=""  hasRowNumber="" hasTips="" onLoadsuccess="" onLoadfailure="" onLoadError="" onBeforesend="" onRowClick="" onRowDbClick="" onSelectAll="" onRowSelect="" onRowDeselect="" sumFieldColumn="" sumBigMoney=""  crossPageSelect="" uniqueKey="" multiSelect="" onContextMenu="" onCalcSum="" colModel="" colNames="" isDefine="" method="" afterRowInsert="">

 <div class="page-content" id="${id}-r">
    <div class="row">
        <div class="col-xs-12">
            <table id="${id}"></table>
            <div id="${id}-grid-pager"></div>
        </div>
    </div>
</div>
   			
<#-- 组件初始化 -->
 <script type="text/javascript">
	$(function() {
	  $("#${id}").RGrid({
	    dataUrl :"${dataUrl}",
	    width : "${width}",
	    height : "${height}"
	    <#if strValue(colModel)?length != 0>
	    , colModel :[${colModel}]
	    </#if>
	    <#if strValue(colNames)?length != 0>
	    , colNames :[${colNames}]
	    </#if>
	    <#if strValue(onRowDbClick)?length != 0>
	    , onRowDbClick :${onRowDbClick}
	    </#if>
	    <#if strValue(isDefine)?length != 0>
		, isDefine :${isDefine}
		</#if>
		 <#if strValue(multiSelect)?length != 0>
		, multiSelect :${multiSelect}
		</#if>
		<#if strValue(sumFieldColumn)?length != 0>
		, sumFieldColumn :"${sumFieldColumn}"
		</#if>
		<#if strValue(method)?length != 0>
		, method :"${method}"
		</#if>
		<#if strValue(baseParams)?length != 0>
		, baseParams :${baseParams}
		</#if>
        <#if strValue(afterRowInsert)?length != 0>
          , afterRowInsert :${afterRowInsert}
        </#if>
	  });
	});

</script>

</#macro>
