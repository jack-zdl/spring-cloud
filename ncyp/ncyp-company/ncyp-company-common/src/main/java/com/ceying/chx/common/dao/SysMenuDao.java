package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.SysMenuDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Repository
public interface SysMenuDao {

    int deleteByPrimaryKey(@Param("menuCode") String menuCode, @Param("kindCode") String kindCode);

    int insert(SysMenuDto record);
    int updateByExample(SysMenuDto record);

    int insertSelective(SysMenuDto record);

    SysMenuDto selectByPrimaryKey(@Param("menuCode") String menuCode, @Param("kindCode") String kindCode);

    int updateByPrimaryKeySelective(SysMenuDto record);

    int updateByPrimaryKey(SysMenuDto record);
    List<SysMenuDto> queryByParentCode(SysMenuDto SysMenuDto) throws Exception;
    List<SysMenuDto> queryMovedMenu(SysMenuDto SysMenuDto) throws Exception;
    List<SysMenuDto> queryAllByCode(SysMenuDto SysMenuDto) throws Exception;
    List<SysMenuDto> queryPower(@Param("rolecode") String rolecode, @Param("tenant_id") String tenant_id) throws Exception;
    List<SysMenuDto> querySingleMenu(SysMenuDto SysMenuDto) throws Exception;
    List<SysMenuDto> queryUserPower(@Param("userid") String userid, @Param("tenant_id") String tenant_id) throws Exception;

    int countTotalByParCode(SysMenuDto SysMenuDto) throws Exception;


    List<SysMenuDto> packagePower(@Param("packageId") String packageId) throws Exception;

    List<SysMenuDto> packagePowerView(@Param("packageId") String packageId) throws Exception;
}
