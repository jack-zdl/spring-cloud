package com.ceying.chx.common.util.date;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 功能说明: 处理时间的工具类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 15:50<br>
 * <br>
 */

public class DateUtil {
    public static Date getCurrentDateTime(){
        return new Date();
    }

    /**
     * @description 时间转换为字符串
     * @param date
     * @return
     */
    public static String dateToString(Date date){
        if (date !=null){
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public static String dateTimeToString(Date date){
        if(date != null){
            return  "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
}
