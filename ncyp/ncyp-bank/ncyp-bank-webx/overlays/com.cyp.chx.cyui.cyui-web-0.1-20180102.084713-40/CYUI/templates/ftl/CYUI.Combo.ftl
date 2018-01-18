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
<#macro combo id=""  width="" title="" name="" check="" filterTarget="" onBlur="" filterCallback=""
 fieldLabel=""  valueField="" selectFirst="" forceSelection="" displayField="" tabIndex ="" baseParams ="" dataUrl="" defaultValue=""  displayFormat="" staticData="" width=""  disabled="" readonly="" autoload=""  multiSelect="" selectable="" onLoadsuccess="" onError="" onLoadfailure ="" multiSeparator="" afterSelect="" onFilter="" displaySeparate="" beforeSelect="" isCache="" textAlign="left">


<#-- 参数校验，如果值不存在或者为""，则设置为默认值 multiple=""-->
<@validateAndSet name="textAlign" default="left" />

<div class="each_input_wrap cypfintechcolumn">
    <div class="col-xs-4" style="text-align:<#if strValue(textAlign) == left>left<#else>right</#if>">
        <label class="input_title" for="${id}">${title}</label>
    </div>
    <div class="col-xs-8">
        <select id="${id}" name="${name}" style="display: none" check="${check}">
        </select>
    </div>
</div>
<#-- 组件初始化 -->
    <script type="text/javascript">
        $(function() {
            $("#${id}").RCombo({
                viewtype : 2
                <#if strValue(afterSelect)?length != 0>
                    ,afterSelect : ${afterSelect}
                </#if>
                <#if strValue(dataUrl)?length != 0>
                    ,dataUrl : "${dataUrl}"
                </#if>
                <#if strValue(isCache)?length != 0>
                    ,isCache : ${isCache}
                </#if>
                <#if strValue(staticData)?length != 0>
                    ,staticData : "${staticData}"
                </#if>
                <#if strValue(valueField)?length != 0>
                    ,valueField : "${valueField}"
                </#if>
                <#if strValue(displayField)?length != 0>
                    ,displayField : "${displayField}"
                </#if>
                <#if strValue(multiSelect)?length != 0>
                    ,multiSelect : ${multiSelect}
                </#if>
                 <#if strValue(readonly)?length != 0>
                    ,readonly : ${readonly}
                </#if>
                <#if strValue(check)?length != 0 && strValue(check)?index_of("required")!=-1>
                    ,showTips : true
                </#if>
            });
        });
    </script>

</#macro>
