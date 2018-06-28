package com.ceying.triagreement.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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

    @RequestMapping("/rest")
    public String rest(@RequestParam String name) {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.getForEntity("url",String.class);
        ResponseEntity<String> response = restTemplate.getForEntity("url",String.class,"didi");
        Map<String,Object> map = new ConcurrentHashMap<>();
        map.put("name","1");
        ResponseEntity<String> resp = restTemplate.getForEntity("url?naem={name}",String.class,map);
        return "hello "+name+"，this is agreement";
    }
}
