package com.ceying.chx.biz.base.common.impl;

import com.ceying.chx.biz.base.common.CommonTaTemplateOperationService;
import com.ceying.chx.common.dao.triagreementtemp.TaTemplateOperationsDao;
import com.ceying.chx.common.entity.triagreementtemp.TaTemplateOperationsEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/14 21:07<br>
 */
@Service
public class CommonTaTemplateOperationServiceImpl implements CommonTaTemplateOperationService{

    @Resource
    private TaTemplateOperationsDao taTemplateOperationsDao;

    @Override
    public
    List<TaTemplateOperationsEntity> list() {
        return null;
    }

    @Override
    public
    List<TaTemplateOperationsEntity> list(TaTemplateOperationsEntity param) {
        return null;
    }

    @Override
    public
    TaTemplateOperationsEntity get(String id) {
        return null;
    }

    @Override
    public
    int update(TaTemplateOperationsEntity entity) {
        return 0;
    }

    @Override
    public int remove(String id) {
        return taTemplateOperationsDao.remove(id);
    }

    @Override
    public
    int insert(TaTemplateOperationsEntity entity) {
        return taTemplateOperationsDao.insert(entity);
    }
}
