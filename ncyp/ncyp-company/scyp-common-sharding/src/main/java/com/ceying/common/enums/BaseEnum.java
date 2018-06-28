package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/2/1<br>
 * <br>
 */
public interface BaseEnum<E extends Enum<?>, T> {
    public T getKey();
    public String getValue();
    //public String name();

}
