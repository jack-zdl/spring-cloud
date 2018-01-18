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

<#macro editor id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" accept="" tabIndex=""
	value="" iconPos="" iconCls="" type="" check="" textAlign="left">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="id" default=genId("r-editor") />

<div class="each_input_wrap cypfintechcolumn">
  	
		<label class="col-xs-4 input_title" for="name" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">${title}</label>
		<div class="col-xs-8">
			<div id="${id}" name="${name}">
	    	</div>
		</div>
	
</div>
										
<#-- 组件初始化 -->
<script type="text/javascript">
    $(function(){
        $("#${id}").REditor({
    	       panelHeight:400
    	   });
    });

</script>
</#macro>
