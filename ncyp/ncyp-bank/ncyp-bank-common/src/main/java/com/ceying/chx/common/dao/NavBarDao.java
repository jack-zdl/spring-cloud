package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.NavBarDto;
import com.ceying.chx.common.util.MyMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 功能说明: 菜单查询Dao<br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/5<br>
 * <br>
 */
@Repository
public interface NavBarDao extends MyMapper<NavBarDto>{

    /**
     *
     * 指定用户左侧导航栏菜单查询
     * @param params
     * @return
     * @throws Exception
     */
    List<NavBarDto> queryNavBar(Map<String, Object> params) throws Exception;

}
