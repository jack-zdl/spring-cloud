package com.ceying.chx.front.base.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.chx.front.base.service.DictionaryService;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

/**
 * 功能说明:字典的查询 <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:29<br>
 */
@RestController
@RequestMapping("/dictionary")
public class DictionaryController {

    @Resource
    private DictionaryService dictionaryServiceImpl;

    @PostMapping(value = "/param")
    public JSONArray selectParam(HttpServletRequest request, Integer keyno){
        RespJson respJson = dictionaryServiceImpl.selectParam(request,keyno);
        JSONArray jsonArray = (JSONArray) JSON.toJSON(respJson.getData());
        return jsonArray;
    }
}
