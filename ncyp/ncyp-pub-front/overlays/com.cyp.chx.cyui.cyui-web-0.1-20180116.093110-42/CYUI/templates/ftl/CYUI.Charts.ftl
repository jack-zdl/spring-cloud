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

<#macro charts id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" accept="" tabIndex=""
	value="" iconPos="" iconCls="" type="" check="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="id" default=genId("r-textField") />


										
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
	$("#${id}").RCharts({
	     viewtype:2
	    <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
            ,showTips : true
        </#if>
        <#if strValue(readonly)?length != 0>
            ,readonly : ${readonly}
        </#if>
	});
});
</script>

</#macro>
