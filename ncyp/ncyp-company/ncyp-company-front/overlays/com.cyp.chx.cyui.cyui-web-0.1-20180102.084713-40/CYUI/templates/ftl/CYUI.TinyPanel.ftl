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
<#macro tinypanel id="" column="" class="" style="" hasHeader="true"  title="" width="auto"  leftwidth="" height="auto" iconCls="" collapsible="true" collapsed="false" autoscroll="true"
 onCollapse="" onExpand=""  onError="" isShow="true">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("f-tinypanel") />
<@validateAndSet name="collapsed" default="false" />
<@validateAndSet name="hasHeader" default="true" />
<@validateAndSet name="collapsible" default="true" />
<@validateAndSet name="column" default="2" />
<@validateAndSet name="isShow" default="true" />

<#-- 临时变量 -->
<@validateAndSet name="_collapsed" default=boolValue(collapsed)&&boolValue(collapsible) />

<#-- 组件DOM结构定义 -->

<#-- 组件初始化 -->
<#if !boolValue(hasHeader)>
<div class="input-list clearfix" style="display:<#if boolValue(isShow)>block<#else>none</#if>" colunm="${column}">
	<#nested>
</div>
<#else>
<div class="module_info" style="display:<#if boolValue(isShow)>block<#else>none</#if>" colunm="${column}">
        <div class="module_title"><i class="fa fa-pencil-square-o col3" aria-hidden="true"></i>${title}</div>
        <div class="module_info_input clearfix">
             <#nested>
        </div>
</div> 
</#if> 

</#macro>
