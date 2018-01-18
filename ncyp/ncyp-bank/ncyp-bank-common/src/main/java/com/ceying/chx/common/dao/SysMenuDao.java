package com.ceying.chx.common.dao;

import com.ceying.chx.common.dto.SysMenuDto;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 功能说明: 系统菜单Dao层<br>
 * 系统版本: 1.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2017/12/27<br>
 * <br>
 */
@Repository
public interface SysMenuDao {

    /**
     * 删除当前用户的系统菜单
     * @param menuCode 菜单编码
     * @param kindCode 类型编码
     * @return int类型
     */
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

    /**
     * 根据顶层节点查询 用户菜单权限查询  工作台用于查询菜单
     * @param parentCode
     * @param userId
     * @return
     * @throws Exception
     */
    List<SysMenuDto> queryPowerTreesearch(@Param("parentCode") String parentCode, @Param("userId") String userId);
}
