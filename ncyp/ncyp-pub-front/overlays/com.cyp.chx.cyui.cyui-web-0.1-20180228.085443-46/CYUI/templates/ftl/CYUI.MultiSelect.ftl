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
<#macro multiSelect id=""  width="" title="" name="" check=""
 valueField="" forceSelection="" displayField="" tabIndex ="" baseParams ="" dataUrl=""   disabled="" readonly="" listHeight="" listWidth="" pageSize=""   selectable="" onLoadsuccess="" onError="" onLoadfailure =""   onSelect="" colModel="" forceLoad="" onBeforesend="" filterField="" dataHandler="" isWrite="" showText="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("r-multiSelect") />
<@validateAndSet name="width" default="6" />
<@validateAndSet name="readonly" default="false" />
<@validateAndSet name="tabIndex" default="0" />

<div class="each_input_wrap cypfintechcolumn">
        <div class="col-xs-4" style="text-align: right">
            <label class="control-label no-padding-right" for="${id}">${title}</label>
        </div>
        <div class="col-xs-8">
            <input class="col-xs-12" type="hidden" id="${id}" height="30px" width="220px" check="${check}"/>
            <div id="${id}-box" boxFor="${id}"></div>
        </div>
</div>

<#-- 组件初始化 -->
   <script type="text/javascript">
      $(function() {
        
         $("#${id}").RComboGrid({
	          idField : "${valueField}",
              textField :"${displayField}",         
	          method: 'post',
	          pageSize: 6,
	          icon:true,
	          checked:true,
	          multiSelect:true
	          <#if strValue(dataUrl)?length != 0>
               ,url : "${dataUrl}"
             </#if>
	          <#if strValue(colModel)?length != 0>
               ,columns : ${colModel}
              </#if>
             <#if strValue(readonly)?length != 0>
                 ,readonly : ${readonly}
             </#if>
             <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
                 ,showTips : true
             </#if>
             <#if strValue(showText)?length != 0>
                 ,showText : ${showText}
             </#if>
		    });
		    $("#${id}-box").RMultiSelect();
   });
   </script>
</#macro>