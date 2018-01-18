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
<#include "*/CYUI.MultiSelect.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@multiSelect id="${id}" check="${check}" width="${width}" title="${title}" name="${name}"  valueField="${valueField}" forceSelection="${forceSelection}" displayField="${displayField}" tabIndex ="${tabIndex}" baseParams ="${baseParams}" dataUrl="${dataUrl}"   disabled="${disabled}" readonly="${readonly}" listHeight="${listHeight}" listWidth="${listWidth}" pageSize="${pageSize}"   selectable="${selectable}" onLoadsuccess="${onLoadsuccess}" onError="${onError}" onLoadfailure ="${onLoadfailure}"   onSelect="${onSelect}" colModel="${colModel}" forceLoad="${forceLoad}" onBeforesend="${onBeforesend}" filterField="${filterField}" dataHandler="${dataHandler}" isWrite="${isWrite}" showText="${showText}">
</@multiSelect>
