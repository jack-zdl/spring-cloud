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
<#macro comboGrid id=""  width="" title="" name="" check=""
 valueField="" forceSelection="" displayField="" tabIndex ="" baseParams ="" dataUrl=""   disabled="" readonly="" listHeight="" listWidth="" pageSize=""   selectable="" onLoadsuccess="" onError="" onLoadfailure =""   afterSelect="" colModel="" forceLoad="" beforeSelect="" filterField="" multiSelect="" dataHandler="" isWrite="" showText="" isCache="" textAlign="left">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值 -->
<@validateAndSet name="id" default=genId("r-combo") />
<@validateAndSet name="width" default="6" />
<@validateAndSet name="readonly" default="false" />
<@validateAndSet name="tabIndex" default="0" />
<@validateAndSet name="textAlign" default="left" />

<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" for="${id}">${title}</label>
    </div>
    <div class="col-xs-8">
        <input class="col-sm-12" type="hidden" id="${id}" name="${name}" height="30px" width="<#if strValue(width)==4>185px<#else>220px</#if>" check="${check}"/>
    </div>
</div>
<#-- 组件初始化 -->
   <script type="text/javascript">
        $(function() {
            $("#${id}").RComboGrid({
                idField : "${valueField}",
                textField :"${displayField}"
                <#if strValue(dataUrl)?length != 0>
                    ,url : "${dataUrl}"
                </#if>
                <#if strValue(colModel)?length != 0>
                    ,columns : ${colModel}
                </#if>
                 <#if strValue(beforeSelect)?length != 0>
                    ,beforeSelect : ${beforeSelect}
                </#if>
                 <#if strValue(afterSelect)?length != 0>
                    ,afterSelect : ${afterSelect}
                </#if>
                <#if strValue(isCache)?length != 0>
                    ,isCache : ${isCache}
                </#if>
                <#if strValue(readonly)?length != 0>
                    ,readonly : ${readonly}
                </#if>
                <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
                    ,showTips : true
                </#if>
                <#if strValue(listWidth)?length != 0>
                  ,panelWidth : ${listWidth}
               </#if>
               <#if strValue(isWrite)?length != 0>
                 ,isWrite : ${isWrite}
              </#if>
               <#if strValue(multiSelect)?length != 0>
                  ,multiSelect : ${multiSelect}
               </#if>
                <#if strValue(showText)?length != 0>
                  ,showText : ${showText}
               </#if>

            });
        });
   </script>
</#macro>