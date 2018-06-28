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
<#macro radio id="" style="" title="" class="" name="" tabIndex="" value="" label="" onchange="" checked="false" textAlign="left" groupFor="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("f-radio") />
<@validateAndSet name="width" default="auto" />
<@validateAndSet name="tabIndex" default="0" />
<@validateAndSet name="textAlign" default="left" />
<#-- 临时变量 -->
<@validateAndSet name="_hasName" default=name?length!=0 />

<#-- 组件DOM结构定义 -->
<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>"><label class="input_title" for="${id}">${title}</label></div>
    <div class="col-xs-8">
    <#if strValue(groupFor)?length != 0>
       <label class="rdo_wrap" for="${id}" groupFor="group1"></label>
	   <input type="radio" name="${name}" id="${id}" onchange="${onchange}">
    <#else>
       <label class="rdo_wrap" for="${id}" ></label>
	   <input type="radio" name="${name}" id="${id}" onchange="${onchange}">
    </#if>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $("#${id}").Rradio({
                viewtype : 2
                <#if strValue(readonly)?length != 0>
                    ,readonly : ${readonly}
                </#if>
                <#if strValue(checked)?length != 0>
                    ,checked : ${checked}
                </#if>
         });
    });
</script>
</#macro>
