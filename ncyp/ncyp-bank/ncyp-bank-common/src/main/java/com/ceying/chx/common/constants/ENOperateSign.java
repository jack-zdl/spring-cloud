package com.ceying.chx.common.constants;

import java.util.Map;
import java.util.TreeMap;

/**
 * 功能说明:比较关系操作符号  <br>
 * 生成时间: 2016/4/14. <br>
 * 开发人员: Jiujee
 * 系统版本: 2.0 <br>
 */
public enum ENOperateSign {

    /**
     * "=":1
     */
    EQUAL("1"),
    /**
     * "<>":2
     */
    NOTEQUAL("2"),
    /**
     * ">":3
     */
    MORE("3"),
    /**
     * "<":4
     */
    LESS("4"),
    /**
     * ">=":5
     */
    MOREOREQUAL("5"),
    /**
     * "<=":6
     */
    LESSOREQUAL("6"),
    /**
     * 空:7
     */
    ISNULL("7"),
    /**
     * 非空:8
     */
    NOTNULL("8"),
    /**
     * 包含:9
     */
    INCLUDE("9"),
    /**
     * 不包含:10
     */
    EXCLUDE("10"),
    /**
     * 前X天:11
     */
    DAYSBEFORE("11"),
    /**
     * 后X天:12
     */
    DAYSAFTER("12"),
    /**
     *
     */
    LIKE("13");

    private static final Map<String, ENOperateSign> map = new TreeMap<String, ENOperateSign>();

    private static final Map<String, String> mapLabel = new TreeMap<String, String>();

    static {
        map.put(EQUAL.getValue(), EQUAL);
        map.put(NOTEQUAL.getValue(), NOTEQUAL);
        map.put(MORE.getValue(), MORE);
        map.put(LESS.getValue(), LESS);
        map.put(MOREOREQUAL.getValue(), MOREOREQUAL);
        map.put(LESSOREQUAL.getValue(), LESSOREQUAL);
        map.put(ISNULL.getValue(), ISNULL);
        map.put(NOTNULL.getValue(), NOTNULL);
        map.put(INCLUDE.getValue(), INCLUDE);
        map.put(EXCLUDE.getValue(), EXCLUDE);
        map.put(DAYSBEFORE.getValue(), DAYSBEFORE);
        map.put(DAYSAFTER.getValue(), DAYSAFTER);
        map.put(LIKE.getValue(), LIKE);

        mapLabel.put(EQUAL.getValue(), "=");
        mapLabel.put(NOTEQUAL.getValue(), "<>");
        mapLabel.put(MORE.getValue(), ">");
        mapLabel.put(LESS.getValue(), "<");
        mapLabel.put(MOREOREQUAL.getValue(), ">=");
        mapLabel.put(LESSOREQUAL.getValue(), "<=");
        mapLabel.put(ISNULL.getValue(), "空");
        mapLabel.put(NOTNULL.getValue(), "非空");
        mapLabel.put(INCLUDE.getValue(), "包含");
        mapLabel.put(EXCLUDE.getValue(), "不包含");
        mapLabel.put(DAYSBEFORE.getValue(), "前X天");
        mapLabel.put(DAYSAFTER.getValue(), "前X天");
        mapLabel.put(LIKE.getValue(), "模糊");

    }

    /**
     * 定义私有变量
     */
    private String operateSign;

    /**
     * 构造函数，枚举类型只能为私有
     * @param operateSign
     */
    ENOperateSign(String operateSign) {
        this.operateSign = operateSign;
    }

    /**
     * 获取value
     * @return 字符串
     */
    public String getValue() {
        return operateSign;
    }

    /**
     * 获取枚举中文名称
     * @return 字符串
     */
    public String getLabel()
    {
        return mapLabel.get(this.operateSign);
    }
}
