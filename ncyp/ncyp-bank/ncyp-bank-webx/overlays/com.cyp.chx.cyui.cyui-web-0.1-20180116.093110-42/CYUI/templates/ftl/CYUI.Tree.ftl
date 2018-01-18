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

<#macro tree id="" width="" height=""  syncLoad="" baseParams="" dataUrl="" selectModel="" rootVisible="" rootNode=""  onNodeDblClick=""  staticData="" onNodeClick="" onNodeSelect="" onNodeUnSelect="" onLoadsuccess="" onLoadfailure="" onLoadError="" title="" isGridTree="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("r-tree") />
<@validateAndSet name="isGridTree" default="true" />

<#if boolValue(isGridTree)>
<div class="tree_wrap">
   <span class="toggle_tree">
       展<br/>开
   </span>
    <div class="tree_block">
        <ul id="${id}" class="rtree"></ul>
    </div>
</div>
<#else>
    <ul id="${id}" class="rtree"></ul>
</#if>
    	
<#-- 组件初始化 -->
<script type="text/javascript">
        $(function() {
            $("#${id}").RTree({
                width:"${width}",
                height:"${height}"
                <#if strValue(syncLoad)?length != 0>
                ,syncLoad:${syncLoad}
                </#if>
                <#if strValue(baseParams)?length != 0>
                ,baseParams:${baseParams}
                </#if>
                <#if strValue(dataUrl)?length != 0>
                ,dataUrl:"${dataUrl}"
                </#if>
                <#if strValue(selectModel)?length != 0>
                ,selectModel:"${selectModel}"
                </#if>
                <#if strValue(rootVisible)?length != 0>
                ,rootVisible:${rootVisible}
                </#if>
                <#if strValue(rootNode)?length != 0>
                ,rootNode:${rootNode}
                </#if>
                <#if strValue(onNodeDblClick)?length != 0>
                ,onNodeDblClick:${onNodeDblClick}
                </#if>
                <#if strValue(staticData)?length != 0>
                ,staticData:${staticData}
                </#if>
                <#if strValue(onNodeClick)?length != 0>
                ,onNodeClick:${onNodeClick}
                </#if>
                <#if strValue(onNodeSelect)?length != 0>
                ,onNodeSelect:${onNodeSelect}
                </#if>
                <#if strValue(onNodeUnSelect)?length != 0>
                ,onNodeUnSelect:${onNodeUnSelect}
                </#if>
                <#if strValue(onLoadsuccess)?length != 0>
                ,onLoadsuccess:${onLoadsuccess}
                </#if>
                <#if strValue(onLoadfailure)?length != 0>
                ,onLoadfailure:${onLoadfailure}
                </#if>
                <#if strValue(onLoadError)?length != 0>
                ,onLoadError:${onLoadError}
                </#if>
            });
        });
        
        //隐藏展开树
		$("#sidebar-collapse").bind('click',function(){
			if($("#${id} li").css('display') == 'none'){
			   $("#${id} li").css('display','block')
			}else{
			   $("#${id} li").css('display','none')
			}
		})
		
		//树的外层div高度
		<#if strValue(height)?length != 0>
       setTreeH();
       function setTreeH(){
       	   var treeH = $(window).height()-${height};
           $("#treewrap").height(treeH);
       }
    </#if>
       
     
</script>

</#macro>
