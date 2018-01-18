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

<#macro textField id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" accept="" tabIndex=""
    value="" iconPos="" iconCls="" type="" check="" textAlign="left" afterInput="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="id" default=genId("r-textField") />
<@validateAndSet name="textAlign" default="left" />
<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" for="${id}">${title}</label>
    </div>
    <div class="col-xs-8">
        <input class="each_input" type="text" placeholder="请输入..." id="${id}" name="${name}" check="${check}" value="${value}"/>
    </div>
</div>
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
    $("#${id}").RTextField({
         viewtype:2
        <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
            ,showTips : true
        </#if>
        <#if strValue(readonly)?length != 0>
            ,readonly : ${readonly}
        </#if>
         <#if strValue(afterInput)?length != 0>
            ,afterInput : ${afterInput}
        </#if>
    });
});
</script>

</#macro>
