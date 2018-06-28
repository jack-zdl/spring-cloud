package com.ceying.common.enums;

/**
 * 提供给系统使用的枚举类
 * 字典枚举类
 *  <p>有追无追</p>
 *  <p>有效无效</p>
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/6/20 9:55
 */
public enum SysCodeEnum implements BaseEnum<SysCodeEnum, String>{

    /**
     * 用户名称标识
     */
    USERNAME("USERNAME", "username"),  //

    /**
     * 用户ID标识
     */
    USERID("USERID","userId"),

    /**
     * 组织ID标识
     */
    ORGID("ORGID","orgId"),

    /**
     * 租户ID标识
     */
    TENANTID("TENANTID","tenantid"),

    /**
     * 版本标识
     */
    VERSION("VERSION","1"),

    /**
     * 参数标识
     */
    PARAMSCODE("PARAMSCODE","paramsCode"),

    /**
     * 签名信息
     */
    SIGNS("SIGNS","signs"),
    /**
     * 系统自动设置
     */
    SYSAUTOMATICSET("系统自动设置","admin"),

    /**
     * 系统参数
     * 是否根据核心企业服务费自动计算平台服务费
     */
    ISCOUNT("是否根据核心企业服务费自动计算平台服务费","false"),

    /**
     * 有追无追标识
     * 1有追，2无追
     */
    ISRESOURSE("1","2"),

    /**
     * 组织是否是第一次标识
     */
    ISFIRSTFinancenumber("0","1"),

    /**
     * 有效无效标识
     * //0无效，1有效
     */
    ISACTIVE("0","1");

    private String key;
    private String value;

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    SysCodeEnum(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
