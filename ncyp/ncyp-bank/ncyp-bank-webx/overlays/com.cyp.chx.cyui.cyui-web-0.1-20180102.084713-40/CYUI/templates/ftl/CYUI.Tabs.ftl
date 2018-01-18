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

<#macro tabs id="" title="" dataUrl="" width="" height="" fit="" index="" onTabClick="" onTabDbClick="" onTabDeselect="" onTabSelect="">


<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
	<@validateAndSet name="id" default=genId("r-tabs") />
	<@validateAndSet name="index" default="0" />
	<#-- <@validateAndSet name="width" default="auto" />
	<@validateAndSet name="height" default="f-tabs-normal-tab" /> -->

<#-- 临时变量 -->
	<@validateAndSet name="_width" default="${sizeValue(width, 'auto')}" />
	<@validateAndSet name="_height" default="${sizeValue(height, '350')}" />
	<#-- <#local _tabWidth></#local> -->

<#-- 组件DOM结构定义 -->

<div class="tabbable" id="${id}">
	<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" >
		<#list _subTagParams as tab>
			<#local _realId>${strValue(tab['id'], id+'-gen-'+tab_index)}</#local>
			<#local _realTitle>${strValue(tab['title'], _realId)}</#local>
			<#local _realUrl>${strValue(tab['url'], _realId)}</#local>
			<#-- <#local _realicon>${strValue(tab['tabheadericon'],'')}</#local> -->
			<li>
				<a data-toggle="tab" href="#${_realId}">${_realTitle}</a>
			</li>
		</#list>
	</ul>
	
	
	<div class="tab-content">
	
	
	 <#if strValue(fit)== "modal">
	      <#list _parsedElements as tabContent>
	      <#local _realId>${strValue(valueInList(_subTagParams, tabContent_index)['id'], id+'-gen-'+tabContent_index)}</#local>
                <div id="${_realId}" class="tab-pane">
						<div class="row">
							<div class="col-xs-12">
								${tabContent}
							</div>
						</div>
				
                </div>
		</#list>  
	<#else>
		<#list _subTagParams as tab>
			<#local _realId>${strValue(tab['id'], id+'-gen-'+tab_index)}</#local>
			<#local _realTitle>${strValue(tab['title'], _realId)}</#local>
			<#local _realUrl>${strValue(tab['url'], _realId)}</#local>
			<#local _realHeight>${sizeValue(tab['height'], _tabHeight)}</#local>
			<#-- <#local _realicon>${strValue(tab['tabheadericon'],'')}</#local> -->
			<div id="${_realId}" class="tab-pane">
				<div class="row">
					<div class="col-xs-12 tab_con">
						
					</div>
				</div>
			</div>
		</#list>
			  
     </#if>		
	</div>
	
	      
			
</div>
								
<#-- 组件初始化 -->
<script type="text/javascript">
$(function(){
    var iframeInfo = [];   
	<#list _subTagParams as tab>
	    iframeInfo.push({"id":"${strValue(tab['id'])}","url":"${strValue(tab['url'])}"});
	</#list>
	$("#${id}").RTabs({active:${index},iframeInfo:iframeInfo});
});
</script>


</#macro>
