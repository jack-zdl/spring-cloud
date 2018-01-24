package com.cyp.chx.common.service;

import com.cyp.chx.common.entity.TripartiteagreementTemplateEntity;
import com.cyp.chx.common.util.response.RespJson;

/**
 * 功能说明: common工程下的rpc接口<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/24 21:58<br>
 */
public interface RpcCommonService {
    public RespJson rpcObjectService(TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity);
}
