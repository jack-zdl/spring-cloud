package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonTripartiteAgreementTemplateService;
import com.ceying.chx.common.dao.triagreementtemp.TripartiteagreementTemplateDao;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PrimitiveIterator;

/**
 * 功能说明: 基础三方协议模板方法实现类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 11:11<br>
 */
@Service
public class CommonTripartiteAgreementTemplateServiceImpl implements CommonTripartiteAgreementTemplateService {

    @Resource
    private TripartiteagreementTemplateDao tripartiteagreementTemplateDao;

    @Override
    public
    List<TripartiteagreementTemplateEntity> selectListByOrgId(String orgId) {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("OrgId",orgId);
        List<TripartiteagreementTemplateEntity> list = tripartiteagreementTemplateDao.selectListBySelective(param);
        return list;
    }

    @Override
    public
    int totalCount(Map param) throws Exception {
        int countTotal = tripartiteagreementTemplateDao.totalCount(param);
        return countTotal;
    }

    @Override
    public List<TripartiteagreementTemplateEntity> list() {
        List<TripartiteagreementTemplateEntity> list = tripartiteagreementTemplateDao.list();
        return list;
    }

    @Override
    public List<TripartiteagreementTemplateEntity> list(TripartiteagreementTemplateEntity param) {
        List<TripartiteagreementTemplateEntity> list = tripartiteagreementTemplateDao.select(param);
        return list;
    }


    @Override
    public TripartiteagreementTemplateEntity get(String id) {
        TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity = tripartiteagreementTemplateDao.get(id);
        return tripartiteagreementTemplateEntity;
    }

    @Override
    public
    int update(TripartiteagreementTemplateEntity entity) {
        return tripartiteagreementTemplateDao.update(entity);
    }

    @Override
    public int remove(String id) {
        return tripartiteagreementTemplateDao.remove(id);
    }

    @Override
    public int insert(TripartiteagreementTemplateEntity entity) {
        return tripartiteagreementTemplateDao.insert(entity);
    }
}
