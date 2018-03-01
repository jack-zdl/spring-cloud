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

<#macro calendar id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" tabIndex=""
	iconPos="" showOpts="" check="" compare="" textAlign="left">

<@validateAndSet name="id" default=genId("r-calendar") />
<@validateAndSet name="textAlign" default="left" />

<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4"  style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" for="${id}">${title}</label>
    </div>
    <div class="col-xs-8">
            <input class="Wdate Wdatebg" id="${id}" name="${name}" type="text" check="${check}"/>
    </div>
</div>
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
	$("#${id}").RCalendar({
	<#if strValue(showOpts)?length != 0>
          dateFmt : '${showOpts}'
    </#if>
     <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
        ,showTips : true
    </#if>
        <#if strValue(readonly)?length != 0>
            ,readonly : ${readonly}
        </#if>
    <#if strValue(compare)?length != 0>
            ,compare : '${compare}'
    </#if>
	});
});
</script>

</#macro>
