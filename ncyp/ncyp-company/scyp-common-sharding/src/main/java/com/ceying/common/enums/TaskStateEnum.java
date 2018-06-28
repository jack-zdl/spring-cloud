package com.ceying.common.enums;

/**
 * @author: mzq
 * @date: 2018/5/4
 * @description :任务相关信息
 * @version: 2.0
 */
public enum TaskStateEnum implements BaseEnum<TaskStateEnum, String>{

    //jobdata 调用的任务信息存储key前缀值
    TASKURID("taskurid","TASKURID"),
    //jobdata 调用的计划任务信息存储key前缀值
    SCHEDULERURID("schedulerurid","SCHEDULERURID"),
    //创建
    TASKTRANSACTIONS_CONTROLFLAGS_NEW("1","新建"),
    //运行中
    TASKTRANSACTIONS_CONTROLFLAGS_RUNNING("4","运行中"),
    //成功运行
    TASKTRANSACTIONS_CONTROLFLAGS_SUCCESS("2","运行成功"),
    //运行失败
    TASKTRANSACTIONS_CONTROLFLAGS_FAILURE("3","运行失败");


    String key;
    String value;

    private TaskStateEnum(String key, String value) {
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
