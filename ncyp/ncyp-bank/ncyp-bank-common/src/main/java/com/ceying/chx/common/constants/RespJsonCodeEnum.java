package com.ceying.chx.common.constants;

/**
 * 功能说明: RespJson状态码枚举类 <b
 *          <p>name ： 状态码的中文含义</p>
 *           <p>code ： 状态码</p>
 *           <p>code : 000000= 00 业务码 00 子业务码 00 状态码</p>
 *           <P>10 系统码 00 网络码 xx状态码 (100001网络不通)</P><br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/12 0:10<br>
 */
public enum RespJsonCodeEnum {

    /**
     * 100001系统网络不通
     */
    SYSNETWORKBLOCKED("系统网络不通",100001),
    /**
     *
     */
    ISACTIVE("0",1);

    /**
     * 状态码中文名称
     */
    private String name;

    /**
     * 状态码
     */
    private Integer code;

    /**
     * 获得状态码中文名称
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * 获得状态码
     * @return
     */
    public Integer getValue() {
        return code;
    }

    /**
     * @param name 状态码中文名称
     * @param value 状态码
     */
    RespJsonCodeEnum(String name, Integer value) {
        this.name = name;
        this.code = value;
    }
}
