package com.ceying.biz.dao;

import com.ceying.biz.entity.ProtocolTemplateEntity;
import com.ceying.biz.entity.ProtocolTemplateRelateEntity;
import com.ceying.biz.query.ProtocolQuery;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 功能说明:    <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 11:11<br>
 * <br>
 */
public interface ProtocolTemplateRelateDao extends MyMapper<ProtocolTemplateRelateEntity> {

    public List<ProtocolQuery> listProtocol(@Param("ourorgid")String ourorgid);
}
