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

<#macro textArea id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" accept="" tabIndex=""
    value="" iconPos="" iconCls="" type="" check="" textAlign="left">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="id" default=genId("r-textArea") />
<@validateAndSet name="height" default="10" />
<@validateAndSet name="textAlign" default="left" />

<div class="col-xs-12 each_textarea_wrap">
    <div class="col-xs-<#if strValue(width)== '3'>11<#else>16</#if>" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" for="${id}" >${title}</label>
    </div>
    <div class="col-xs-<#if strValue(width)== '3'>89<#else>84</#if>">
        <textarea class="each_textarea" style="resize:none;height:${height}0px"  <#if strValue(readonly)?length != 0>readonly="${readonly}"</#if> id="${id}" name="${name}" placeholder="请输入..." check="${check}"></textarea>
    </div>
</div>
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
    $("#${id}").RTextArea({
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
