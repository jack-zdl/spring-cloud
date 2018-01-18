package com.ceying.chx.common.util.stringtools;

import org.apache.commons.lang.StringUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 功能说明:字符串工具类 <br>
 * 生成时间: 2017-03-27 10:48:48 <br>
 * 开发人员: chx
 * 系统版本: 2.0 <br>
 */
public class FString {
    private static final int INDEX_NOT_FOUND = -1;

    /**
     * 检测字符串是否为非空
     */
    public static boolean isNotNullAndNotEmpty(String str) {
        return !FString.isNullOrEmpty(str);
    }

    /**
     * 获取对象的字符串值，若对象为空则返回null
     */
    public static String valueOf(Object obj) {
        return (obj == null) ? null : obj.toString();
    }

    /**
     * 获取对象的字符串值，若对象为空则返回空字符串
     * 此方法可用于url或不能产生null的情况
     */
    public static String valueOfForUrl(Object obj){
        return (obj == null) ? "" : obj.toString();
    }

    /**
     * 去除空格后检测字符串是否为空
     */
    public static boolean isNullOrEmptyIgnoreWhitespace(String str) {
        return str == null || str.trim().isEmpty();
    }

    /**
     * 检测字符串是否为空
     */
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.isEmpty();
    }

    /**
     * 去除字符串头部的指定字符串
     * @param str     待去除头部的字符串
     * @param trimStr 指定去除的字符串
     * @return 去除头部指定字符串后的字符串
     */
    public static String trimStart(String str, String trimStr) {
        String result = str;
        while (result.startsWith(trimStr)) {
            result = result.substring(trimStr.length(), result.length());
        }
        return result;
    }

    /**
     * 去除字符串尾部的指定字符串
     * @param str     待去除尾部的字符串
     * @param trimStr 指定去除的字符串
     * @return 去除尾部指定字符串后的字符串
     */
    public static String trimEnd(String str, String trimStr) {
        String result = str;
        while (result.endsWith(trimStr)) {
            result = result.substring(0, result.length() - trimStr.length());
        }
        return result;
    }

    /**
     * 去除字符串头尾部的指定字符串
     * @param str     待去除头尾部的字符串
     * @param trimStr 指定去除的字符串
     * @return 去除头尾部指定字符串后的字符串
     */
    public static String trim(String str, String trimStr) {
        return trimStart(trimEnd(str, trimStr), trimStr);
    }

    /**
     * 获取日期时间字符串
     * @param date 日期
     * @return 返回格式为：yyyy-MM-dd hh:mm:ss 的字符串
     */
    public static String convertToDateTimeString(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        return simpleDateFormat.format(date);
    }

    /**
     * 获取日期字符串
     * @param date 日期
     * @return 返回格式为：yyyy-MM-dd 的字符串
     */
    public static String convertToDateString(Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
    }

    /**
     * 根据格式化字符串将日期转换为对应格式的字符串
     * @param date   日期
     * @param format 格式化字符串
     */
    public static String convertToString(Date date, String format) {
        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
            return simpleDateFormat.format(date);
        } catch (Exception e) {
            return "";
        }

    }

    /**
     * 转换成用逗号隔开的string
     */
    public static <T extends Collection<?>> String convertToString(T collection, boolean addSingleQuotes) {
        if (collection == null || collection.size() == 0) {

            return null;
        }
        StringBuilder sql = new StringBuilder();
        for (Object id : collection) {
            if (id == null) {
                continue;
            }
            if (addSingleQuotes) {
                sql.append("'").append(id.toString()).append("',");
            } else {
                sql.append(id.toString()).append(",");
            }
        }
        String result = sql.toString();
        result = result.substring(0, result.length() - 1);
        return result;
    }

    /**
     * 把数组转换为一个用逗号分开的字符串 ，以便于用in+String 查询
     */
    public static String converToString(Object[] array) {
        return converToString(array, ',');
    }

    /**
     * 将数组中各项值按指定连接符连接成新字符串
     */
    public static String converToString(Object[] array, char connector) {
        StringBuilder str = new StringBuilder();
        if (array != null && array.length > 0) {
            for (int i = 0; i < array.length; i++) {

                str.append(array[i]).append(connector);
            }
        }
        return str.substring(0, str.length() - 1);
    }

    /**
     * 将数组中各项值按指定连接符连接成新字符串
     * NOTE:此处加上的String参数没有意义，只是为了区分,用于无间隔符连接
     */
    public static String converToString(Object[] array, String noUse) {
        StringBuilder str = new StringBuilder();
        if (array != null && array.length > 0) {
            for (int i = 0; i < array.length; i++) {
                str.append(array[i]);
            }
        }
        return str.substring(0, str.length());
    }

    /**
     * 获取某个字符串所在的位置
     */
    public static int indexOf(String str, String searchStr) {
        if (str == null || searchStr == null) {
            return INDEX_NOT_FOUND;
        }
        return str.indexOf(searchStr);
    }

    /**
     * 替换字符串
     */
    public static String replace(String text, String searchString, String replacement) {
        return replace(text, searchString, replacement, -1);
    }

    /**
     * 替换字符串
     */
    public static String replace(String text, String searchString, String replacement, int max) {
        if (isNullOrEmpty(text) || isNullOrEmpty(searchString) || replacement == null || max == 0) {
            return text;
        }
        int start = 0;
        int end = text.indexOf(searchString, start);
        if (end == INDEX_NOT_FOUND) {
            return text;
        }
        int replLength = searchString.length();
        int increase = replacement.length() - replLength;
        increase = (increase < 0 ? 0 : increase);
        increase *= (max < 0 ? 16 : (max > 64 ? 64 : max));
        StringBuilder buf = new StringBuilder(text.length() + increase);
        while (end != INDEX_NOT_FOUND) {
            buf.append(text.substring(start, end)).append(replacement);
            start = end + replLength;
            if (--max == 0) {
                break;
            }
            end = text.indexOf(searchString, start);
        }
        buf.append(text.substring(start));
        return buf.toString();
    }

    /**
     * 字符串最后一次存在的位置
     */
    public static int lastIndexOf(String str, String searchStr) {
        if (str == null || searchStr == null) {
            return INDEX_NOT_FOUND;
        }
        return str.lastIndexOf(searchStr);
    }
    
    /**
     * 给指定数字前面添加指定的符号知道一定数量
     * @param toLen		填充后的总长度
     * @param inFill	使用的指定填充符
     */
    public static String fill(int num, int toLen, String inFill) {
    	StringBuilder strValue = new StringBuilder(String.valueOf(num));
    	int strLen = String.valueOf(num).length();
    	if (strLen < toLen) {
    		while(toLen-- != strLen) {
    			strValue.insert(0, inFill);
    		}
    	}
    	return strValue.toString();
    }

    /**
     * 查找字符串是否存在
     * @param source:原始字符串
     * @param target:要搜索的字符串
     */
    public static boolean isFind(String source, String target){
        int index = source.indexOf(target);
        if(index == -1){
            return false;
        } else{
            return true;
        }
    }
    
    public static String listToString(List<String> list, String separator){
    	if(list == null && list.size() == 0){
    		return "";
    	}
    	StringBuffer result = new StringBuffer();
    	for(String str : list){
    		result.append(str);
    		result.append(separator);
    	}
    	return result.substring(0, result.length()-separator.length());
    }

    //去空
    public static String getNotNullStringValue(String value){
        return StringUtils.isNotBlank(value)?value:"";
    }

    /**
     * BigDecimal精度处理
     */
    public static BigDecimal setPrecision(BigDecimal amount){
        return amount.setScale(2,BigDecimal.ROUND_DOWN);
    }

    /**
     * 金额相除
     */
    public static BigDecimal divide(BigDecimal amount,BigDecimal bmount){
        return amount.divide(bmount, 2, BigDecimal.ROUND_DOWN);
    }

    /**
     * 金额相乘
     */
    public static BigDecimal multiply(BigDecimal amount,BigDecimal bmount){
        return amount.multiply(bmount).setScale(2,BigDecimal.ROUND_DOWN);
    }

    /**
     * 金额相减
     */
    public static BigDecimal subtract(BigDecimal amount,BigDecimal bmount){
        return amount.subtract(bmount).setScale(2,BigDecimal.ROUND_DOWN);
    }

    /**
     * 金额相加
     */
    public static BigDecimal add(BigDecimal amount,BigDecimal bmount){
        return amount.add(bmount).setScale(2,BigDecimal.ROUND_DOWN);
    }

    /**
     * 费率相除
     */
    public static BigDecimal rateDivide(BigDecimal arate,BigDecimal brate){
        return arate.divide(brate, 4, BigDecimal.ROUND_DOWN);
    }

    /**
     * 费率相乘
     */
    public static BigDecimal rateMultiply(BigDecimal arate,BigDecimal brate){
        return arate.multiply(brate).setScale(4,BigDecimal.ROUND_DOWN);
    }

    /**
     * 费率相减
     */
    public static BigDecimal rateSubtract(BigDecimal arate,BigDecimal brate){
        return arate.subtract(brate).setScale(4,BigDecimal.ROUND_DOWN);
    }

    /**
     * 费率相加
     */
    public static BigDecimal rateAdd(BigDecimal arate,BigDecimal brate){
        return arate.add(brate).setScale(4,BigDecimal.ROUND_DOWN);
    }

    /**
     * 取两个string数组的交集(当数组中有重复数据时，map设置key时会把重复的值丢掉)
     * @param arr1
     * @param arr2
     * @return
     */
    public static String[] StringIntersection(String[] arr1,String[] arr2){
        Map<String,Boolean> map = new HashMap<String,Boolean>();
        List<String> list = new LinkedList<String>();
        //取出str1数组的值存放到map集合中，将值作为key，所以的value都设置为false
        for (String str1:arr1){
            if (!map.containsKey(str1)){
                map.put(str1,Boolean.FALSE);
            }
        }
        //取出str2数组的值循环判断是否有重复的key，如果有就将value设置为true
        for (String str2:arr2){
            if (map.containsKey(str2)){
                map.put(str2,Boolean.TRUE);
            }
        }
        //取出map中所有value为true的key值，存放到list中
        for (Map.Entry<String,Boolean> entry:map.entrySet()){
            if (entry.getValue().equals(Boolean.TRUE)){
                list.add(entry.getKey());
            }
        }
        //声明String数组存储交集
        String[] result={};
        return list.toArray(result);
    }

    /**
     * 清除数组中的指定元素
     * @param arr
     * @param spElement
     * @return
     */
    public static  String[] clearSpElement (String[] arr,String spElement){
        //统计0的个数
        int count = 0;  //定义一个变量记录0的个数
        for(int i = 0 ; i<arr.length ; i++){
            if(spElement.equals(arr[i])){
                count++;
            }
        }

        //创建一个新的数组
        String[] newArr = new String[arr.length-count];

        int index  =0 ; //新数组使用的索引值
        //把非的数据存储到新数组中。
        for(int i = 0; i<arr.length ; i++){
            if(!spElement.equals(arr[i])){
                newArr[index] = arr[i];
                index++;
            }
        }
        return newArr;
    }


}
