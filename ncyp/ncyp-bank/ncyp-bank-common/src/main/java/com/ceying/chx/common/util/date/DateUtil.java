package com.ceying.chx.common.util.date;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 功能说明: 处理时间的工具类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/6 15:50<br>
 */

public class DateUtil {
    public static Date getCurrentDateTime(){
        return new Date();
    }

    /**
     * 时间转换为指定yyyy-MM-dd格式的字符串
     * @param date 时间
     * @return 字符串
     */
    public static String dateToString(Date date){
        if (date !=null){
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    /**
     * 时间转换为指定yyyy-MM-dd HH:mm:ss格式的字符串
     * @param date 时间
     * @return 字符串
     */
    public static String dateTimeToString(Date date){
        if(date != null){
            return  "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
}
