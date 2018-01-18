package com.ceying.chx.common.dao.triagreementtemp;


import com.ceying.chx.common.dao.CrudDao;
import com.ceying.chx.common.entity.triagreementtemp.TripartiteagreementTemplateEntity;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: 三方协议模板方法Dao层<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/11 11:11<br>
 */
@Repository
public interface TripartiteagreementTemplateDao extends CrudDao<TripartiteagreementTemplateEntity> , Mapper<TripartiteagreementTemplateEntity> {

    /**
     * 根据三方协议模板参数查询三方协议模板总数
     * @param tripartiteagreementTemplateEntity 三方协议模板实体类
     * @return int 总数
     */
    int selectForSame (TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity);

//    /**
//     * 根据urid删除三方协议模板
//     * @param urid id
//     * @return int  返回操作条数 1=成功 0=失败
//     */
//    int deleteByPrimaryKey(String urid);

//    /**
//     * 新增一条三方协议模板
//     * @param record 三方协议模板
//     * @return int 返回操作条数
//     */
//    int insert(TripartiteagreementTemplateEntity record);

    /**
     * 返回指定的三方协议模板
     * @param record
     * @return 条数
     */
//    int insertSelective(TripartiteagreementTemplateEntity record);

//    TripartiteagreementTemplateEntity selectByPrimaryKey(String urid);

//    int updateByPrimaryKeySelective(TripartiteagreementTemplateEntity record);

    int updateByPrimaryKeyWithBLOBs(TripartiteagreementTemplateEntity record);

//    int updateByPrimaryKey(TripartiteagreementTemplateEntity record);

    /**
     * 查询指定组织的相关的三方协议，bankid或者corecompanyid和平台可以看
     * 这里是只需要组织id,来查询相关三方协议模板
     * @param param 组织ID的map
     * @return List<TripartiteagreementTemplate>
     */
    List<TripartiteagreementTemplateEntity> selectListBySelective(Map param);

    List<TripartiteagreementTemplateEntity> selectBySelective(TripartiteagreementTemplateEntity tripartiteagreementTemplateEntity) throws Exception;

    /**
     * 查询指定组织的相关的三方协议的总数，bankid或者corecompanyid和平台可以看
     * @param param 组织ID的map
     * @return int  总数
     * @throws Exception 异常
     */
    int totalCount (Map param) throws Exception;

}
