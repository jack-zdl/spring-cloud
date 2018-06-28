package com.ceying.biz.feign;

import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: lidf
 * @date: 2018/3/29
 * @description:
 * @version: 2.0
 */
@FeignClient(name = "ncyp-company-triagreement")
public interface SystemFeignClient {

    /**
     * 获取优先行
     * @return
     */
    @RequestMapping(value="/biz/AgreementTemplate/add",method = RequestMethod.POST)
    public RespJson agreementTemplateAdd( TripartiteagreementTemplate agreementTemplate);


}
