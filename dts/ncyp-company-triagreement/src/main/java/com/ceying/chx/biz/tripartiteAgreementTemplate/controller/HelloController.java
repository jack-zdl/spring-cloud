package com.ceying.chx.biz.tripartiteAgreementTemplate.controller;

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
@RequestMapping("/hello")
public class HelloController {

    @RequestMapping("/test")
    public String index(@RequestParam String name) {
        return "hello "+name+"，this is agreement";
    }

    /**
     * 
     * @param name
     * @return
     */
    @RequestMapping("/mq")
    public String rabbitMessage(@RequestParam String name) {
        return "hello "+name+"，this is agreement";
    }
}
