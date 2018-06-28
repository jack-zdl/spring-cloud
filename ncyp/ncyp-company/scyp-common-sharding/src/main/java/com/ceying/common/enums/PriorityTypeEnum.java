package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/2/1<br>
 * <br>
 */
public enum PriorityTypeEnum implements BaseEnum<PriorityTypeEnum, String>{
    PRIORITY("1","优先"),
    NORMAL("2","普通"),
    CLOSEPRIORITY("3","关闭优先权");

    String key;
    String value;

    private PriorityTypeEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String value) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

    /*static Map<String,EnumPriorityType> enumMap=new HashMap<String, EnumPriorityType>();
    static{
        for(EnumPriorityType type: EnumPriorityType.values()){
            enumMap.put(type.getValue(), type);
        }
    }
    public static EnumPriorityType getEnum(String value) {
        return enumMap.get(value);
    }
    @Override
    public String toString(){
        return getValue();
    }*/

}
