package com.ceying.biz.query;

import com.ceying.biz.entity.SupplierAccountsEntity;

/**
 * @author: mzq
 * @date: 2018/4/4
 * @description : 保理专户 查询结算银行（质押）
 * @version: 2.0
 */
public class SupplierAccountsTypeQuery extends SupplierAccountsEntity {

    private String banklocationname;
    private String codename;

    public String getBanklocationname() {
        return banklocationname;
    }

    public SupplierAccountsTypeQuery setBanklocationname(String banklocationname) {
        this.banklocationname = banklocationname;
        return this;
    }

    public String getCodename() {
        return codename;
    }

    public SupplierAccountsTypeQuery setCodename(String codename) {
        this.codename = codename;
        return this;
    }
}
