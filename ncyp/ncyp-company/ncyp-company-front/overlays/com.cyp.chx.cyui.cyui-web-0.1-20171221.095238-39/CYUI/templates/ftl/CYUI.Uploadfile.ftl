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

<#macro uploadfile id="" style="" class="" title="" disabled="" readonly="" name="" width="" height="" accept="" tabIndex=""
  value="" iconPos="" iconCls="" type="" check="" dataUrl="" addUrl="" fileTypeExts="" fileSizeLimit="" queueSizeLimit=""  uploadSuccess="" uploadError="" showfileList="" autoUpload="">

<#-- 参数校验，如果值不存在或者为""，则设置为默认值  -->
<@validateAndSet name="id" default=genId("r-uploadfile") />
<@validateAndSet name="queueSizeLimit" default="5" />
<@validateAndSet name="width" default="12" />

<div class="each_input_wrap cypfintechcolumn">

    <div class="col-xs-${12-width?number}">
       
    </div>
    <div class="col-xs-${width}">
        <div class="uploadBox" id="${id}"></div>
    </div>
</div>


                    
<#-- 组件初始化 -->
<script type="text/javascript">
$(function() {
        $('#${id}').RUploadfile({
              dataUrl:'${dataUrl}',
              addUrl:'${addUrl}',
              fileTypeExts:'${fileTypeExts}',//文件类型
              fileSizeLimit:'${fileSizeLimit}MB',//每个文件的大小
              queueSizeLimit:${queueSizeLimit}//一次性最多传文件数目
              <#if strValue(uploadSuccess)?length != 0>
                   ,uploadSuccess : ${uploadSuccess}
              </#if>
              <#if strValue(uploadError)?length != 0>
                   ,uploadError : ${uploadError}
              </#if>
              <#if strValue(showfileList)?length != 0>
                   ,showfileList : ${showfileList}
              </#if>
              <#if strValue(autoUpload)?length != 0>
                   ,autoUpload : ${autoUpload}
              </#if>
        })
});
</script>

</#macro>
