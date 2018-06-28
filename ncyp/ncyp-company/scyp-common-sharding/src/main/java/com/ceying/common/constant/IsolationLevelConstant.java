package com.ceying.common.constant;

/**
 * @author : Meow
 * @date : 2018-4-3
 * @description : 数据隔离隔离级别
 */
public class IsolationLevelConstant {

    /**
     * 系统管理员级别
     */
    public static final int ROOTlEVEL = 3;
    //本组织
    public static final int ORG = 0;
    //本组织及以下组织
    public static final int  RELATE_ORG = 1;
    //租户
    public static final int  TENANT = 2;
}
