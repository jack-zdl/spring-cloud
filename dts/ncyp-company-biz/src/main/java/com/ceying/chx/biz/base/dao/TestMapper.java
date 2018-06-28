package com.ceying.chx.biz.base.dao;

import com.ceying.chx.biz.base.entity.TestEntity;
import org.springframework.stereotype.Component;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/3/13 17:21<br>
 */

//@Component
public interface TestMapper {

    public int save(TestEntity testEntity);

//    public TestEntity select();

}
