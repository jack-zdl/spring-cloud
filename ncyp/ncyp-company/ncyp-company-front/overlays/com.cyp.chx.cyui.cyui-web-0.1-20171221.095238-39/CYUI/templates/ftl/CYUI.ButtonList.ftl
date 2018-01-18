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
<#macro buttonList id="" text="" class=""  	onClick="" visible="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("f-ButtonList") />
<@validateAndSet name="minWidth" default="100px" />
<@validateAndSet name="maxWidth" default="200px" />

<#assign _onClick>${strValue(onClick, "")}</#assign>
<@validateAndSet name="_hasOnClick" default=(_onClick?length!=0) />
<#-- 临时变量 -->

<#-- 组件DOM结构定义 -->
${buttonContent}
<#if visible==true>
	<span class="btn_group">
	    <i class="col3">更多操作</i>
	    <i class="fa fa-angle-double-right fa-1_5x col3" aria-hidden="true"></i>
	    <div class="other_btn">
	        <#nested>
	    </div>
	</span>
</#if>
<#-- 组件初始化 -->

</#macro>
