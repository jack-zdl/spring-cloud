package com.ceying.chx.biz.base.controller;

import com.alibaba.fastjson.JSONObject;
import com.ceying.chx.biz.base.service.DictionaryService;
import com.ceying.chx.common.util.response.RespJson;
import com.ceying.chx.common.util.response.RespJsonFactory;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 23:41<br>
 */
@RestController
@RequestMapping("/biz/dictionary")
public class DictionaryController {

    @Resource
    private DictionaryService dictionaryServiceImpl;

    @GetMapping(value = "/param")
    public
    RespJson selectParam(HttpServletRequest request,  Integer keyno){
//        if (errors.hasErrors()) {
//            return RespJsonFactory.buildFailure("输入参数有误！");
//        }
        RespJson respJson = dictionaryServiceImpl.selectParam(request,keyno);
        return respJson;
    }
}
