package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :任务运行历史状态
 * @version: 2.0
 */
public enum TaskschedulersRunStateEnum implements BaseEnum<TaskschedulersRunStateEnum, String>{
    START("1","启用"),
    PAUSE("2","暂停"),
    FAILURE("3","失败");
    String key;
    String value;

    private TaskschedulersRunStateEnum(String key, String value) {
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
}
