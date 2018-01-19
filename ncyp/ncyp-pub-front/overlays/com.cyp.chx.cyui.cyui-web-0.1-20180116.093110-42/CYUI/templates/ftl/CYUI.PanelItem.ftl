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
<#macro panelitem class="" id="" colspan="" custom="false" title="" customTitle="" width="auto"  height="auto" isCheckBox="false"  isHide="false"  hideMode="display" fullLine=""   url=""  onClick="">

<#-- 组件DOM结构定义 -->
<div <#if strValue(class)?length != 0> class="${class}" </#if> >
<#nested>
</div>
</#macro>
