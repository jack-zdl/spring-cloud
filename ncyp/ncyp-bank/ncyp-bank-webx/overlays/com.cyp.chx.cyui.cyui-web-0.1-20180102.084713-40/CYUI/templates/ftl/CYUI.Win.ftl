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
<#macro win  id="" pageUrl="" isIframe="" width="" height="" buttons="" title="" modal="" buttonAlign="" dragable="" maxable="" onSetHtml="" onResize="" onClose="" onShow="" maximized="" hasCloseBtn="">

<@validateAndSet name="id" default=genId("f-win") />


	<!-- Modal -->
	<div class="modal fade bs-example-modal-lg" id="${id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<span class="modal-title" id="myModalLabel">${title}</span>
				</div>
				<div class="modal-body" style="padding:0px;">
					<div class="row">
						<div class="col-sm-12">
							<iframe name="iframe-child" width="100%" height="100%" src="${pageUrl}" frameborder="0" id="iframe-${id}" seamless></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.modal -->
          
<#-- 组件初始化 -->
<script type="text/javascript">
   $(function(){	
        $("#${id}").RWin({
            title :"${title}"
            <#if strValue(width)?length != 0>
                , width :${width}
            </#if>
            <#if strValue(height)?length != 0>
                , height :${height}
            </#if>           
            <#if strValue(isIframe)?length != 0>
                ,isIframe:${isIframe}
            </#if>
            <#if strValue(pageUrl)?length != 0>
                ,pageUrl:"${pageUrl}"
            </#if>
            <#if strValue(modal)?length != 0>
                ,modal:${modal}
            </#if>            
            <#if strValue(dragable)?length != 0>
                ,dragable:${dragable}
            </#if>
            <#if strValue(maxable)?length != 0>
                ,maxable:${maxable}
            </#if>
            <#if strValue(onSetHtml)?length != 0>
                ,onSetHtml:${onSetHtml}
            </#if>
            <#if strValue(onResize)?length != 0>
                ,onResize:${onResize}
            </#if>
            <#if strValue(onClose)?length != 0>
                ,onClose:${onClose}
            </#if>
            <#if strValue(maximized)?length != 0>
                ,maximized:${maximized}
            </#if>
            <#if strValue(onShow)?length != 0>
                ,onShow:${onShow}
            </#if>
            <#if strValue(hasCloseBtn)?length != 0>
                ,hasCloseBtn:${hasCloseBtn}
            </#if>
       });
   
    });

</script>

</#macro>
