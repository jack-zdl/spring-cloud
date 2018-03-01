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
<#macro SimpleGrid id="" width="" height="" emptyMsg="" dataUrl=""  selectModel="" autoload="" baseParams="" hasRowNumber="" hasTips="" onLoadsuccess="" onLoadfailure="" onLoadError="" onBeforesend="" onRowClick="" onRowDbClick="" onSelectAll="" onRowSelect="" onRowDeselect="" sumFiledColumn="" sumBigMoney="" crossPageSelect="" uniqueKey="" onContextMenu="" onCalcSum="" colModel="" colNames="" isDefine="" saveFn="" initialize="" hiddenCol="" primaryKey="" operateFn="">

 <div class="simple" id="${id}"> 
       <div class="simple_title">
          <table width="100%"></table>
        </div> 
        <div class="simple_data">
          <table width="100%"></table>
        </div>      
	      <div class="simple_page">           
	      </div>
    </div>				
    
<#-- 组件初始化 -->
 <script type="text/javascript">
	$(function() {
	  $("#${id}").SimpleGrid({
	    dataUrl :"${dataUrl}",
	    height : "${height}",
	    pageSize:100
	    <#if strValue(operateFn)?length != 0>
	    , operateFn :[${operateFn}]
	    </#if>
	    <#if strValue(colModel)?length != 0>
	    , columns :[${colModel}]
	    </#if>
	    <#if strValue(primaryKey)?length != 0>
	    , primaryKey :[${primaryKey}]
	    </#if>
	  });
	});

</script>

</#macro>
