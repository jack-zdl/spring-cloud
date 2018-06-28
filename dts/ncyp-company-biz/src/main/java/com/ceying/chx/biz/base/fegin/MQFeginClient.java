package com.ceying.chx.biz.base.fegin;

import com.ceying.configuration.MQConfiguration1;
import feign.RequestLine;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/12 17:35<br>
 */
@FeignClient(name = "ncyp-company-triagreement",configuration = MQConfiguration1.class)
public interface MQFeginClient {

//    @RequestMapping(value = "/simple/{id}",method = RequestMethod.GET)
//    public String index(@PathVariable String name);
}
