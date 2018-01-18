package com.ceying.chx.front.base.service.impl;

import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.front.base.config.SysConstant;
import com.ceying.chx.front.base.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 功能说明: 字典实现类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:35<br>
 */
@Service
public class DictionaryServiceImpl implements DictionaryService{

    @Autowired
    RestTemplate restTemplate;
    @Override
    public
    RespJson selectParam(HttpServletRequest request, Integer keyno) {
        Map<String,Object> hashMap  = new HashMap<String,Object>();
        hashMap.put("keyno",keyno);
        RespJson respJson = restTemplate.getForObject("http://"+ SysConstant.BIZ_SERVICE_NAME+"/biz/dictionary/param?keyno={keyno}", RespJson.class,hashMap);
        return respJson;
    }
}
