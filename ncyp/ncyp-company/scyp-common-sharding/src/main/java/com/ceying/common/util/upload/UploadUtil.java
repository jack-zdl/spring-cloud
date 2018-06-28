package com.ceying.common.util.upload;

import org.springframework.util.ResourceUtils;

import java.io.File;

/**
 * @author : Meow
 * @date : 2018-6-6
 * @description : 获取上传文件地址
 */
public class UploadUtil {
    public static String getUploadLocation() throws Exception{
        File path = new File(ResourceUtils.getURL("classpath:").getPath());
        if(!path.exists()){
            path = new File("");
        }
        File upload = new File(path.getAbsolutePath(),"/file/tmp");
        if(!upload.exists()) {
            upload.mkdirs();
        }
        return upload.getAbsolutePath();
    }
}
