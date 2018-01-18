package com.test.common;

import com.ceying.chx.biz.base.common.CommonTaTemplateOperationService;
import com.ceying.chx.biz.base.common.CommonTripartiteAgreementTemplateService;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperationsEntity;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import org.junit.Test;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/14 22:20<br>
 */

//@RestController
//@RequestMapping("/test")
public class TestTatemplate {

    @Resource
    private
    CommonTaTemplateOperationService commonTaTemplateOperationServiceImpl;
    @Resource
    private
    CommonTripartiteAgreementTemplateService commonTripartiteAgreementTemplateServiceImpl;

//    @RequestMapping("/template")
    @Test
    public void a(){
        TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = new TripartiteagreementTemplateEntity();
        tripartiteagreementTemplateEntity.setUrid("c2b7047fd80a40efac5bd399885d5c45");
        List<TripartiteagreementTemplateEntity> list = commonTripartiteAgreementTemplateServiceImpl.list(tripartiteagreementTemplateEntity);
        if(list.isEmpty()){
            System.out.println("aaa");
        }else {
            System.out.println("bbb");
        }

    }
}
