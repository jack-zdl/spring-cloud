package com.ceying.biz.controller;

import com.ceying.biz.service.TemplateService;
import com.ceying.biz.service.impl.OtherTemplateServiceImpl;
import com.ceying.chx.common.util.response.RespJson;
import org.bouncycastle.pqc.math.linearalgebra.PolynomialRingGF2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/1 17:01<br>
 */

@RestController
@RequestMapping("/template")
public class TemplateController {

    @Autowired
    @Qualifier("otherTemplateServiceImpl")
    private TemplateService otherTemplateServiceImpl;

    @Autowired
    @Qualifier("templateServiceImpl")
    private TemplateService templateServiceImpl;

    @PostMapping(value = "/save")
    public String save() {
        RespJson respJson = otherTemplateServiceImpl.save();
        RespJson respJson1 = templateServiceImpl.save();
        return "hello "+"，this is biz";
    }

}
