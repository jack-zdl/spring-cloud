package com.ceying.biz.dao;

import com.ceying.biz.entity.SupplierAccountsEntity;
import com.ceying.biz.query.SupplierAccountsQuery;
import com.ceying.biz.query.SupplierAccountsTypeQuery;
import com.ceying.biz.vo.SupplierAccountsVO;
import com.ceying.common.util.mybatis.MyMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author: mzq
 * @date: 2018/4/2
 * @description :供应商专户账户dao层
 * @version: 2.0
 */
@Repository
public interface SupplierAccountsDao extends MyMapper<SupplierAccountsEntity>{
    /*
     * @description 分页查询  供应商专户账户
     * @author mzq
     * @date 2018/4/3
     * @param [supplierAccountsVO]
     * @return java.util.List<com.ceying.biz.entity.SupplierAccountsEntity>
     */
    List<SupplierAccountsQuery> listSupplierAccounts(SupplierAccountsVO supplierAccountsVO)  ;
    /*
     * @description 查询银行供应商已存在账户支持的业务类型
     * @author mzq
     * @date 2018/4/3
     * @param [bankId, supplierId, urid]
     * @return java.lang.String
     */
    String getBusinesstypes(Map map);
    /*
     * @description 查询专户账号是否已存在
     * @author mzq
     * @date 2018/4/3
     * @param [accNum]
     * @return java.util.List<com.ceying.biz.entity.SupplierAccountsEntity>
     */
    List<SupplierAccountsEntity> getByAccountnumber(String accNum);

    /*
     * @description 查询专户账号是否已存在
     * @author mzq
     * @date 2018/4/3
     * @param [accNum]
     * @return java.util.List<com.ceying.biz.entity.SupplierAccountsEntity>
     */
    List<SupplierAccountsTypeQuery> getSupplierAccountsTypeQuery(@Param("type")String type,@Param("orgId") String orgId);

    List<SupplierAccountsTypeQuery> listsettleaccount(SupplierAccountsVO supplierAccountsVO);

    List<SupplierAccountsEntity> listByEntity(SupplierAccountsEntity supplierAccountsEntity);

}
