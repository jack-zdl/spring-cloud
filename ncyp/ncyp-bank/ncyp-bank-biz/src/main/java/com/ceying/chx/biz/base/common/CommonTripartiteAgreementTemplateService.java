package com.ceying.chx.biz.base.common;

import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import com.ceying.chx.common.service.CurdService;

import java.util.List;
import java.util.Map;

/**
 * 功能说明: 基础三方协议模板方法接口<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 11:09<br>
 */
public interface CommonTripartiteAgreementTemplateService extends CurdService<TripartiteagreementTemplateEntity> {

    /**
     * 根据三方协议模板参数返回所有符合的条件的三方协议模板
     * @param orgId 组织id
     * @return 三方协议模板集合
     */
    public List<TripartiteagreementTemplateEntity> selectListByOrgId(String orgId);

    /**
     *  根据参数查询到三方协议模板总数
     * @param param
     * @return
     */
    public int totalCount(Map param) throws Exception;

}
