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
<#include "*/CYUI.Tree.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@tree id="${id}" width="${width}" height="${height}"  syncLoad="${syncLoad}" baseParams="${baseParams}" dataUrl="${dataUrl}" selectModel="${selectModel}" rootVisible="${rootVisible}" rootNode="${rootNode}"  onNodeDblClick="${onNodeDblClick}"  staticData="${staticData}" onNodeClick="${onNodeClick}" onNodeSelect="${onNodeSelect}" onNodeUnSelect="${onNodeUnSelect}" onLoadsuccess="${onLoadsuccess}" onLoadfailure="${onLoadfailure}" onLoadError="${onLoadError}" title="${title}" isGridTree="${isGridTree}">
</@tree>
