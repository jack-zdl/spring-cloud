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
<#include "*/CYUI.TinyPanel.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@tinypanel id="${id}" style="${style}"  column="${column}" class="${class}" title="${title}" hasHeader="${hasHeader}"   width="${width}" leftwidth="${leftwidth}" height="${height}" iconCls="${iconCls}" collapsible="${collapsible}" collapsed="${collapsed}" autoscroll="${autoscroll}"
 onError="${onError}" onCollapse="${onCollapse}" onExpand="${onExpand}" isShow="${isShow}">
	${_nestedContent}
</@tinypanel>
