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
<#-- 引入模板定义文件 -->
<#include "*/CYUI.ComboGrid.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@comboGrid id="${id}" check="${check}" width="${width}" title="${title}" name="${name}"  valueField="${valueField}" forceSelection="${forceSelection}" displayField="${displayField}" tabIndex ="${tabIndex}" baseParams ="${baseParams}" dataUrl="${dataUrl}"   disabled="${disabled}" readonly="${readonly}" listHeight="${listHeight}" listWidth="${listWidth}" pageSize="${pageSize}"   selectable="${selectable}" onLoadsuccess="${onLoadsuccess}" onError="${onError}" onLoadfailure ="${onLoadfailure}"   afterSelect="${afterSelect}" colModel="${colModel}" forceLoad="${forceLoad}" beforeSelect="${beforeSelect}" filterField="${filterField}" multiSelect="${multiSelect}" dataHandler="${dataHandler}" isWrite="${isWrite}" showText="${showText}" isCache="${isCache}" textAlign="${textAlign}">
</@comboGrid>
