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
<#include "*/CYUI.PanelItem.ftl">

<#-- 模板使用，主要用于JSP等模板引擎使用 -->
<@panelitem  id="${id}"  class="${class}" title="${title}" customTitle="${customTitle}"  isCheckBox="${isCheckBox}" colspan="${colspan}" custom="${custom}" width="${width}" height="${height}" isHide="${isHide}"  hideMode="${hideMode}" fullLine="${fullLine}" url="${url}" onClick="${onClick}" >
	${_nestedContent}
</@panelitem>
