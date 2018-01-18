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
<#macro numberField id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" tabIndex="" iconPos="" iconCls="" positive="" decimals="" moneyFormat="" defaultValue="" check="" afterChange="" textAlign="left">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="textAlign" default="left" />
<@validateAndSet name="id" default=genId("r-numberField") />
<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" id="${id}_label" for="${id}">${title}</label>
    </div>
    <div class="col-xs-8">
        <input class="each_input" type="number" id="${id}" name="${name}" check="${check}" style="ime-mode:disabled" />
    </div>
</div>
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
	$("#${id}").RNumberField({
	    viewtype : 2
	   <#if strValue(moneyFormat)?length != 0>
			,numFmt : "${moneyFormat}"
	   </#if>
	    <#if strValue(readonly)?length != 0>
			,readonly : ${readonly}
	   </#if>
	   <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>

		,showTips : true
	   </#if>
	});
	
	$("#${id}").keydown(function (e) {
		// Allow: backspace, delete, tab, escape, enter and .
		if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
			// Allow: Ctrl+A
			(e.keyCode == 65 && e.ctrlKey === true) ||
			// Allow: Ctrl+C
			(e.keyCode == 67 && e.ctrlKey === true) ||
			 // Allow: Ctrl+X
			(e.keyCode == 88 && e.ctrlKey === true) ||
			 // Allow: home, end, left, right
			(e.keyCode >= 35 && e.keyCode <= 39)) {
			// let it happen, don't do anything
				return;
		}
		// Ensure that it is a number and stop the keypress
		if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
			e.preventDefault();
		}
	}); 
});
</script>

</#macro>