package com.ceying.triagreement.service.impl;


import com.ceying.chx.common.util.response.RespJsonFactory;
import com.ceying.triagreement.service.AgreementTemplateService;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplate;
import com.ceying.chx.common.util.response.RespJson;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;

/**
 * 功能说明: 三方协议模板<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/1/2<br>
 * <br>
 */
@Service
public class AgreementTemplateServiceImpl implements AgreementTemplateService {

    @Override
    public RespJson agreementTemplateAdd(HttpServletRequest request, TripartiteagreementTemplate tripartiteagreementTemplate) {
        RespJson respJson = RespJsonFactory.buildSuccess("aaaaa","aaaaa");
        return respJson;
    }
}
