package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author: mzq
 * @date: 2018/6/11
 * @description :外部系统服务配置
 * @version: 2.0
 */
public enum OutsystemEnum implements BaseEnum<OutsystemEnum, String> {
    JNSB01("JNSB01","济南社保核心业务系统"),
    JNSB02("JNSB02","济南社保中信银行短信平台"),
    JNSB03("JNSB03","济南社保齐鲁银行短信平台"),
    OA("OA","中兴精密OA");
    String key;
    String value;

    private OutsystemEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public static final Map<String, String> map = new TreeMap<String, String>();
}
