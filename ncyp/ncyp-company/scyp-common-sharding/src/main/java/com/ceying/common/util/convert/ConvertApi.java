package com.ceying.common.util.convert;

import com.alibaba.fastjson.JSONObject;
import com.ceying.common.feign.SysBaseDataCacheFeignClient;
import com.ceying.common.util.cache.CacheManage;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : Cheese
 * @date : 2018/4/2
 * @description : 注解翻译接口
 */
@Service
public interface ConvertApi {
    /***
     * @description 注解翻译，获取配置注解的属性，并调用翻译方法
     *
     * @author Cheese
     * @date 2018/4/4
     * @param [list]
     * @return com.alibaba.fastjson.JSONObject
     */
    JSONObject convertByAnnotation(List<?> list);

    String getDicOptionToJsonByKeynoByEnum(String keyno, String keyvalue) throws ClassNotFoundException;
}
