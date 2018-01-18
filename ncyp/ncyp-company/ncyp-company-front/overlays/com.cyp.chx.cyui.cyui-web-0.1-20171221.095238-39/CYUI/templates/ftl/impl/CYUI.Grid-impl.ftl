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
<#include "*/CYUI.Grid.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@grid id="${id}" width="${width}" height="${height}" emptyMsg="${emptyMsg}" dataUrl="${dataUrl}" selectModel="${selectModel}" autoload="${autoload}" baseParams="${baseParams}" hasRowNumber="${hasRowNumber}" hasTips="${hasTips}" onBeforesend="${onBeforesend}" onLoadsuccess="${onLoadsuccess}" onLoadfailure="${onLoadfailure}" onLoadError="${onLoadError}" onSelectAll="${onSelectAll}" onRowClick="${onRowClick}" onRowDbClick="${onRowDbClick}" onRowSelect="${onRowSelect}" onRowDeselect="${onRowDeselect}" uniqueKey="${uniqueKey}" sumFieldColumn="${sumFieldColumn}" sumBigMoney="${sumBigMoney}" crossPageSelect="${crossPageSelect}" onContextMenu="${onContextMenu}" multiSelect="${multiSelect}" onCalcSum="${onCalcSum}"  colModel="${colModel}" colNames="${colNames}" isDefine="${isDefine}" method="${method}" afterInsertRow="${afterInsertRow}">
</@grid>