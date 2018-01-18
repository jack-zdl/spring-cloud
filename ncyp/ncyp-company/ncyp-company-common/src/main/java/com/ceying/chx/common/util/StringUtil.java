package com.ceying.chx.common.util;

import com.auth0.jwt.internal.org.apache.commons.lang3.ArrayUtils;
import com.auth0.jwt.internal.org.apache.commons.lang3.StringUtils;

import org.apache.commons.codec.binary.Base64;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>
 * Title: 字符串操作的工具类
 * </p>
 * <p>
 * Description:包含字符串的常用方法，如判断字符串是否为空，是否相等，等等
 * </p>
 * <p>
 * Date: 2016-5-27
 * </p>
 *
 * @author chenxt
 * @author xuesl
 * @version 1.0
 */
public class StringUtil {

  /**
   * 去子字符串，下标溢出也不会出错
   *
   * @param src
   * @param begin
   * @return
   */

  public static String substring(String src, int begin) {
    return substring(src, begin, src.length());
  }

  /**
   * 用base64算法加密字符串
   *
   * @param content 输入字符串
   * @return 返回加密后的字符串
   */
  public static String encodeBase64(String content) {
    Base64 bs = new Base64();
    return new String(bs.encode(content.getBytes()));
  }

  /**
   * 用base64算法解密字符串
   *
   * @param content
   * @return
   */
  public static String decodeBase64(String content) {
    Base64 bs = new Base64();
    try {
      return new String(bs.decode(content.getBytes()), "GBK");
    }
    catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      return null;
    }
  }

  /**
   * 取子字符串，下标溢出也不会出错
   *
   * @param src 输入字符串
   * @param begin 开始位置
   * @param end 结束位置
   * @return
   */
  public static String substring(String src, int begin, int end) {
    if (isNull(src) || src.length() < begin || begin > end) {
      return "";
    }

    if (end > src.length()) {
      return src.substring(begin);
    }
    else {

      return src.substring(begin, end);
    }
  }

  /**
   * 判断字符串是否为空，空格字符串也视为空
   *
   * @param s 判断的字符串
   * @return 为空时返回true
   */
  public static boolean isNull(String s) {
    return StringUtils.isBlank(s);
  }

  /**
   * 判断字符串是否不为空，空格字符串也视为空
   *
   * @param s 判断的字符串
   * @return 不为空时返回true
   */
  public static boolean isNotNull(String s) {
    return !isNull(s);
  }

  /**
   *
   * @param o
   * @param defaultvalue
   * @return
   */
  public static String nvl(String o, String defaultvalue) {
    if (StringUtil.isNull(o)) {
      o = defaultvalue;
    }
    return o;
  }

  /**
   * 判断两个字符串的值是否相等
   *
   * @param s1 字符串1
   * @param s2 字符串2
   * @return 相等则返回true
   */
  public static boolean isEqual(String s1, String s2) {
    if (s1 == null && s2 == null) {
      return true;
    }
    else if (s1 != null) {
      return s1.equals(s2);
    }
    return false;
  }

  /**
   * 从字符串得到整型数组
   *
   * @param str 输入的字符串
   * @param regx 分割字符串的表达式
   * @return 整型数组，如果为空则返回长度为0的数组，不返回null
   */
  public static int[] getIntArrayFromStr(String str, String regx) {
    if (StringUtil.isNull(str)) {
      return new int[0];
    }
    String[] days = str.split(regx);
    Set<String> set = new TreeSet<String>();
    for (int i = 0; i < days.length; i++) {
      if (!StringUtil.isNull(days[i])) {
        set.add(days[i]);
      }
    }
    int[] ret = new int[set.size()];
    int i = 0;
    for (Iterator<String> it = set.iterator(); it.hasNext();) {
      try {
        ret[i] = Integer.parseInt(it.next());
      }
      catch (Exception e) {
        ret[i] = 0;
      }
      i++;
    }
    return ret;
  }

  /**
   *
   * 返回字符串中某个字符串出现的次数
   *
   * @param source 源字符串
   * @param str 匹配的字符串
   * @return
   */
  public static int matchTimes(String source, String str) {
    if (isNull(source)) {
      return 0;
    }
    else {
      int fromIndex = 0;
      int number = 0;
      int index = 0;
      while ((index = source.indexOf(str, fromIndex)) >= 0) {
        number++;
        fromIndex = index + 1;
      }
      return number;
    }
  }

  /**
   *
   * 判断字符串是否为纯数字类型
   *
   * @param str 源字符串
   * @return
   */
  public static boolean checkNum(String str) {

    boolean result = false;
    String regex = "^[0123456789]+$";
    if (str.matches(regex)) {
      result = true;// 是数值

    }
    else {
      result = false;

    }

    return result;
  }

  /**
   * 连接字符串，用指定的分隔符分隔
   *
   * @param array
   * @param split
   * @return
   */
  public static String join(Object[] array, String split) {
    StringBuilder sb = new StringBuilder();
    if (!ArrayUtils.isEmpty(array)) {
      for (int i = 0; i < array.length; i++) {
        if (array[i] == null) {
          continue;
        }
        if (i != 0) {
          sb.append(split);
        }
        sb.append(array[i]);
      }
    }
    return sb.toString();

  }

  /**
   * 连接字符串，用指定的分隔符分隔
   *
   * @param list
   * @param split
   * @return
   */
  @SuppressWarnings("rawtypes")
  public static String join(List list, String split) {
    if (list == null || list.size() == 0) {
      return "";
    }
    return join(list.toArray(), split);
  }

  /**
   * 添加字符串，用分隔符分隔
   *
   * @param src
   * @param toAdd
   * @param split
   * @return
   */
  public static String push(String src, String toAdd, String split) {
    if (StringUtil.isNull(src)) {
      if (!StringUtil.isNull(toAdd)) {
        return toAdd;
      }
      else {
        return "";
      }
    }
    else {
      if (StringUtil.isNull(toAdd)) {
        toAdd = "";
      }
      return src + split + toAdd;
    }
  }

  /**
   * 返回大写的数字
   *
   * @param number 输入数字
   * @return
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public static String number2Chinese(int number) {
    String[] unit = { "", "十", "百", "千", "万", "十万", "百万", "千万", "亿" };
    String[] bignumber = { "", "一", "二", "三", "四", "五", "六", "七", "八", "九" };
    int i = 0;
    List list = new ArrayList();
    while (true) {
      int tail = number % 10;

      if (tail == 1 && (i == 1)) {
        list.add(unit[i]);
      }
      if (tail == 0) {
        list.add("零");
      }
      else {
        list.add(bignumber[tail] + unit[i]);
      }
      number = number / 10;
      i++;
      if (number == 0) {
        break;
      }
    }
    String ret = "";
    for (int j = list.size() - 1; j >= 0; j--) {
      if (!"零".equals(list.get(j)) || ("零".equals(list.get(j)) && !ret.endsWith("零"))) {
        ret += list.get(j).toString();
      }

    }
    return ret;
  }

  /**
   * 截取长字符串，尾随指定字符
   *
   * @param value 原字符串
   * @param count 截取长度
   * @param append 尾随字符
   * @return
   */
  public static String getSubStr(String value, String count, String append) {
    StringBuffer sb = new StringBuffer();
    if (value.length() > Integer.parseInt(count)) {
      sb.append(value.substring(0, Integer.parseInt(count)));
      sb.append(append);
    }
    else {
      sb.append(value);
    }
    return sb.toString();
  }

  /**
   * 把数字转换格式输出
   *
   * @param digit
   * @return
   */
  public static String getdigitalview(int digit) {
    String view = "###,##0.";
    if (digit < 1) {
      return view + "00";
    }
    for (int i = 1; i <= digit; i++) {
      view = view + "0";
    }
    return view;
  }

  /**
   * 格式化浮点数
   *
   * @param format 格式 如"##.##"
   * @param f 要格式化的浮点数
   * @return
   */
  public static String formatFloat(String format, double f) {
    StringBuffer formatString = new StringBuffer(format);
    java.text.DecimalFormat df = new java.text.DecimalFormat(formatString.toString());
    return df.format(f);
  }

  /**
   * 大小写不敏感的字符串替换函数
   *
   * @param source
   * @param regex
   * @param replacement
   * @return
   */
  public static String replaceStringCaseInsensitive(String source, String regex, String replacement) {
    StringBuffer result = new StringBuffer();
    Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
    Matcher m = p.matcher(source);
    while (m.find()) {
      m.appendReplacement(result, replacement);
    }
    m.appendTail(result);
    return result.toString();
  }

  /**
   * 大小写不敏感的字符串查找函数
   *
   * @param source
   * @param regex
   * @return pos 0..length-1
   */
  public static int findStringCaseInsensitive(String source, String regex) {
    Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
    Matcher m = p.matcher(source);
    if (m.find()) {
      return m.start();
    }
    return -1;
  }

  /**
   * 对象数组转化为字符串数组
   *
   * @param objectvalue
   * @param toType
   * @return
   */
  public static String[] objectToOtherArray(Object[] objectvalue, String toType) {
    // Object[] 转化 String[]
    // 补充其他类型的互转
    String[] object = null;
    if (objectvalue != null) {
      object = new String[objectvalue.length];
    }
    for (int i = 0; objectvalue != null && i < objectvalue.length; i++) {
      if (toType.equals("s")) {
        object[i] = (String) objectvalue[i];
      }
    }
    return object;
  }

  /**
   * 文件大小格式字符串转换 123->123Bytes 1234->1.2K 12345->12.3K 123456->123.5K 1234567->1.2M 12345678->12.3M
   * 123456789->123.5M
   *
   * @param inputvalue 输入字节数Bytes
   * @return
   */
  public static String getFileSizeFormat(double inputvalue) {
    String outputvalue = "0";
    if (inputvalue >= 1024 * 1024) {
      outputvalue = formatFloat("###,##0.0", inputvalue / (1024 * 1024)) + "M";
    }
    else if (inputvalue >= 1024) {
      outputvalue = formatFloat("###,##0.0", inputvalue / 1024) + "K";
    }
    else {
      outputvalue = formatFloat("###,##0", inputvalue) + "Bytes";
    }
    return outputvalue;
  }

  /**
   * 输出格式的转换
   *
   * @param inputvalue　输入值
   * @param viewtype　显示字段类型
   * @return
   */
  public static String getOutputvalue(String inputvalue, String viewtype) {
    String outputvalue = null;
    // 空值显示为0
    if (StringUtils.isBlank(inputvalue)) {
      inputvalue = "0";
    }
    if (viewtype.trim().equals("I")) {
      outputvalue = formatFloat("###,##0", Double.parseDouble(inputvalue));
    }
    else if (viewtype.trim().equals("F")) {
      outputvalue = formatFloat("###,##0.00", Double.parseDouble(inputvalue));
    }
    else if (viewtype.trim().equals("FK")) { // 除以一千
      outputvalue = formatFloat("###,##0.00000", Double.parseDouble(inputvalue) / 1000);
    }
    else if (viewtype.trim().equals("FW")) { // 除以一万
      outputvalue = formatFloat("###,##0.000000", Double.parseDouble(inputvalue) / 10000);
    }
    else if (viewtype.trim().equals("FM")) { // 除以一百万
      outputvalue = formatFloat("###,##0.00000000", Double.parseDouble(inputvalue) / 1000000);
    }
    else if (viewtype.trim().equals("FY")) { // 除以一亿
      outputvalue = formatFloat("###,##0.0000000000", Double.parseDouble(inputvalue) / 100000000);
    }
    else if (viewtype.trim().equals("FN")) { // 按实际的小数位数显示
        int iDecimalPointIndex = inputvalue.indexOf(".");
        String strDecimalPart = "";
        if (iDecimalPointIndex >= 0) {
            strDecimalPart = inputvalue.substring(iDecimalPointIndex+1, inputvalue.length());
        }
        outputvalue = formatFloat(getdigitalview(strDecimalPart.length()), Double.parseDouble(inputvalue));
    }

    else {
      // 位数显示，4位以上小数不统计(基金净值不作统计)
      int digit = Integer.parseInt(viewtype.trim().substring(1, 2));
      outputvalue = formatFloat(getdigitalview(digit), Double.parseDouble(inputvalue));
    }
    return outputvalue;
  }

  /**
   * <p>
   * 在长字符串指定的长度间隔处增加子字符串.
   * </p>
   * @param value
   * @param length
   * @param str
   * @return
   */
  public static String getConvertStr(String value, int length, String str) {
    StringBuilder sb = new StringBuilder();
    if (value.length() <= length) {
      return value;
    }
    for (int i = 0, n = value.length(); i < n; i = i + length) {
      if (i + length >= n) {
        sb.append(value.substring(i));
      }
      else {
        sb.append(value.substring(i, i + length)).append(str);
      }
    }
    return sb.toString();
  }

  /**
   * 取字符串的字节长度
   *
   * @param value
   * @return
   */
  public static int getStringBytes(String value) {
    try {
      return value.getBytes().length;
    }
    catch (Exception ex) {
      return 0;
    }
  }

  /**
   * 从 Unicode 码转换成编码前的特殊字符串。
   *
   * @param in Unicode编码的字符数组。
   * @param off 转换的起始偏移量。
   * @param len 转换的字符长度。
   * @return 完成转换，返回编码前的特殊字符串。
   */
  public static String fromUnicode(char[] in, int off, int len) {

    char aChar;
    char[] out = new char[len * 2];
    int outLen = 0;
    int end = off + len;

    while (off < end) {
      aChar = in[off++];
      if (aChar == '\\') {
        aChar = in[off++];
        if (aChar == 'u') {
          // Read the xxxx
          int value = 0;
          for (int i = 0; i < 4; i++) {
            aChar = in[off++];
            switch (aChar) {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
              value = (value << 4) + aChar - '0';
              break;
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
              value = (value << 4) + 10 + aChar - 'a';
              break;
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
              value = (value << 4) + 10 + aChar - 'A';
              break;
            default:
              throw new IllegalArgumentException("Malformed \\uxxxx encoding.");
            }
          }
          out[outLen++] = (char) value;
        }
        else {
          if (aChar == 't') {
            aChar = '\t';
          }
          else if (aChar == 'r') {
            aChar = '\r';
          }
          else if (aChar == 'n') {
            aChar = '\n';
          }
          else if (aChar == 'f') {
            aChar = '\f';
          }
          out[outLen++] = aChar;
        }
      }
      else {
        out[outLen++] = aChar;
      }
    }
    return new String(out, 0, outLen);
  }

  /**
   * 调整长度
   *
   * @param curseq
   * @return
   */
  public static String adgustLength(String curseq, int length) {
    while (curseq.length() < length - 1) {
      curseq = "0" + curseq;
    }
    curseq = "1" + curseq;
    return curseq;
  }

  /**
   * Checks if is chinese str.
   *
   * @param value the value
   * @return true, if is chinese str
   */
  public static boolean isChineseStr(String value) {
    if (isNull(value)) {
      return false;
    }
    for (int i = 0, n = value.length(); i < n; i++) {
      if ((int) value.charAt(i) > 256) {
        return true;
      }
    }
    return false;
  }

  /**
   * 判断是否为数字
   *
   * @param value
   * @return
   */
  public static boolean isNumber(String value) {
    try {
      Double.valueOf(value);
      return true;
    }
    catch (Exception e) {
      return false;
    }
  }

  /**
   * 字符串转bool变量
   *
   * @param value 值
   * @return 当value等于1时，返回真，否则返回假
   */
  public static boolean str2boolean(String value) {
    return str2boolean(value, "1");

  }

  /**
   * 字符串转bool变量
   *
   * @param value 值
   * @param truevalue 表示真的字符串值
   * @return 当value等于truevalue时，返回真，否则返回假
   */
  public static boolean str2boolean(String value, String truevalue) {
    if (StringUtil.isNull(truevalue)) {
      truevalue = "1";
    }
    if (truevalue.equalsIgnoreCase(value)) {
      return true;
    }
    return false;
  }

  /**
   * 返回不为null的字符串
   *
   * @param s
   * @return
   */
  public static String getEmpty(String s) {
    if (s == null) {
      s = "";
    }
    return s;
  }

  /**
   * 字符串转整型，不抛出异常
   *
   * @param s
   * @return
   */
  public static Integer parseInt(String s) {
    Integer i = 0;
    if (StringUtil.isNotNull(s)) {
      try {
        i = Integer.valueOf(s);
      }
      catch (Exception e) {

      }
    }
    return i;
  }

  public static void main(String[] args) {
    String str = "aaa我们测";
    String str1 = "&#10;";

    System.out.println(getConvertStr(str, 4, str1));
  }
}
