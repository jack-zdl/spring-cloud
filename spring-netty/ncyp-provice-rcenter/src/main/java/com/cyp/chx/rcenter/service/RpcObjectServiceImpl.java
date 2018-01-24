package com.cyp.chx.rcenter.service;

import com.cyp.chx.common.entity.TripartiteagreementTemplateEntity;
import com.cyp.chx.common.service.RpcCommonService;
import com.cyp.chx.common.util.response.RespJson;
import com.cyp.chx.common.util.response.RespJsonFactory;
import com.cyp.chx.rcenter.server.RpcService;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/24 22:09<br>
 */

@RpcService(RpcCommonService.class)
public class RpcObjectServiceImpl implements RpcCommonService{
    @Override
    public
    RespJson rpcObjectService(TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity) {
        tripartiteagreementTemplateEntity.setUrid("22222");
        RespJson respJson = RespJsonFactory.buildSuccess("测试成功");
        return respJson;
    }
}
