package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/31<br>
 * <br>
 */
public enum ExceptionTypeEnum {

    /**
     * 违反唯一约束
     */
    UNIQUE_VIOLATION("ORA-00001"),

    /**
     * 违反完整性约束，未找到父项关键字
     */
    INTEGRITY_VIOLATION_NOT_FOUND_PARENT("ORA-02291"),

    /**
     * 违反完整性约束，已找到子记录
     */
    INTEGRITY_VIOLATION_FOUND_CHILD("ORA-02292"),

    /**
     * 无法将NULL插入
     */
    NULL_CANNOT_INSERT("ORA-01400");

    private String value;

    private ExceptionTypeEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    private static final Map<String, ExceptionTypeEnum> map = new TreeMap<String, ExceptionTypeEnum>();

    static {
        map.put(UNIQUE_VIOLATION.getValue(), UNIQUE_VIOLATION);
        map.put(INTEGRITY_VIOLATION_NOT_FOUND_PARENT.getValue(), INTEGRITY_VIOLATION_NOT_FOUND_PARENT);
        map.put(INTEGRITY_VIOLATION_FOUND_CHILD.getValue(), INTEGRITY_VIOLATION_FOUND_CHILD);
        map.put(NULL_CANNOT_INSERT.getValue(), NULL_CANNOT_INSERT);
    }
}
