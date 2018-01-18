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
<#include "*/CYUI.Uploadfile.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@uploadfile id="${id}" style="${style}" class="${class}" 
	title="${title}" disabled="${disabled}" readonly="${readonly}" name="${name}" width="${width}" height="${height}" tabIndex="${tabIndex}"
	accept="${accept}" value="${value}" iconPos="${iconPos}" iconCls="${iconCls}" type="${type}" check="${check}" dataUrl="${dataUrl}" addUrl="${addUrl}" fileTypeExts="${fileTypeExts}" fileSizeLimit="${fileSizeLimit}" queueSizeLimit="${queueSizeLimit}" uploadError="${uploadError}" uploadSuccess="${uploadSuccess}" showfileList="${showfileList}" autoUpload="${autoUpload}">
</@uploadfile>
