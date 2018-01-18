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
<#macro button id="" text="" bclass="" iclass="" dataToggle="" dataTarget="" dataRemote="false" visible="" disabled="" onClick="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("f-btn") />

<#if visible==true>

<span>
    <button id="${id}" class="${(strValue(bclass)?length==0)?string('button button-raised button-pill button-small', bclass)}" data-toggle="${(strValue(dataToggle)?length==0)?string('modal', dataToggle)}" data-target="${dataTarget}" data-remote="${dataRemote}">
        <i class="${(strValue(iclass)=='bigger-110')?string('bigger-110', 'ace-icon fa '+iclass+' red2')}"></i>
	      <span>${text}</span>
    </button>
</span>

								
<#-- 组件初始化 -->
<script type="text/javascript">
$(function(){
	$("#${id}").RButton({
	    viewtype:2
        <#if strValue(onClick)?length != 0>
            ,onClick : ${onClick}
        </#if>
         <#if strValue(isShow)?length != 0>
            ,isShow : ${isShow}
        </#if>
	});
});
</script>

</#if>

</#macro>
