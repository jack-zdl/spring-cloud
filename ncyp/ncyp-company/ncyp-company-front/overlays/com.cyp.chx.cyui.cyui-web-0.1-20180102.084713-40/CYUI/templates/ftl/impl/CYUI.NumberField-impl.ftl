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
<#include "*/CYUI.NumberField.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@numberField id="${id}" style="${style}" class="${class}" 
	title="${title}" disabled="${disabled}" readonly="${readonly}" name="${name}" width="${width}" height="${height}" tabIndex="${tabIndex}"
	iconPos="${iconPos}" iconCls="${iconCls}" 
	decimals="${decimals}" positive="${positive}" moneyFormat="${moneyFormat}" defaultValue="${defaultValue}" afterChange="${afterChange}" check="${check}" textAlign="${textAlign}">
</@numberField>
