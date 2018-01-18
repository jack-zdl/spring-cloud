package com.ceying.chx.common.util;

import java.util.UUID;
/**
 * 功能说明: 用于生成主键ID<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 15:51<br>
 * <br>
 */

public class PrimaryKeyUtils {
    /**
     * uuid
     *
     * @return
     */
    public static String uniqueId() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().trim().replaceAll("-", "");
    }
}
