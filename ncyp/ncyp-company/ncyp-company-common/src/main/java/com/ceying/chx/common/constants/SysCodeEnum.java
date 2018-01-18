package com.ceying.chx.common.constants;

/**
 * 提供给系统使用的枚举类
 * 字典枚举类
 *  <p>有追无追</p>
 *  <p>有效无效</p>
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/6/20 9:55
 */
public
enum SysCodeEnum {

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
     * 有追无追标识
     * 1有追，2无追
     */
    ISRESOURSE("1","2"),

    /**
     * 有效无效标识
     * //1无效，1有效
     */
    ISACTIVE("0","1");

    private String name;
    private String value;

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }

    SysCodeEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }
}
