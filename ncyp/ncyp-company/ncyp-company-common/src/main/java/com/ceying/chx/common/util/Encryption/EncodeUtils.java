package com.ceying.chx.common.util.Encryption;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

/**
 * 功能说明:编码转换工具类 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/15 22:51<br>
 * <br>
 */

public
class EncodeUtils {

    /**
     * 默认为"UnicodeLittleUnmarked"
     */
    public static final String DEFAULT_CHARSET_NAME = "UnicodeLittleUnmarked";//ReadUtil.readFromAresConfigFile("def_charset_name");

    /**
     * 将十进制数转换为十六进制数

     *
     * @param value
     *            十进制数
     * @return 十六进制数的字符串表示

     */
    public static String parseHex(int value) {
        return Integer.toHexString(value);
    }

    /**
     * 将十进制数转换为八进制数
     *
     * @param value
     *            十进制数
     * @return 八进制数的字符串表示
     */
    public static String parseOctal(int value) {
        return Integer.toOctalString(value);
    }

    /**
     * 将十进制数转换为二进制数
     *
     * @param value
     *            十进制数
     * @return 二进制数的字符串表示
     */
    public static String parseBinary(int value) {
        return Integer.toBinaryString(value);
    }

    /**
     * 将十六进制数转换为十进制数

     *
     * @param value
     *            十六进制数的字符串表示

     * @return 十进制数
     */
    public static int valueOfHex(String value) {
        return Integer.parseInt(value, 16);
    }

    /**
     * 将八进制数转换为十进制数
     *
     * @param value
     *            八进制数的字符串表示
     * @return 十进制数
     */
    public static int valueOfOctal(String value) {
        return Integer.parseInt(value, 8);
    }

    /**
     * 将二进制数转换为十进制数
     *
     * @param value
     *            二进制数的字符串表示
     * @return 十进制数
     */
    public static int valueOfBinary(String value) {
        return Integer.parseInt(value, 2);
    }

    /**
     * 将字节流进行十六进制编码
     *
     * @param bytes
     *            字节流

     * @return 十六进制编码的字符串
     */
    public static String encodeHex(byte[] bytes) {
        if (null == bytes)
            return null;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < bytes.length; i++) {
            String hexStr = Integer.toHexString(0x00ff & bytes[i]);
            if (hexStr.length() < 2) {
                sb.append("0");
            }
            sb.append(hexStr);
        }
        return sb.toString();
    }

    /**
     * 将十六进制编码的字符串进行解码

     *
     * @param str
     *            十六进制编码的字符串
     * @return 字节流

     */
    public static byte[] decodeHex(String str) {
        if (null == str)
            return null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        for (int i = 0; i < str.length(); i += 2) {
            char c1 = str.charAt(i);
            if ((i + 1) >= str.length())
                throw new IllegalArgumentException();
            char c2 = str.charAt(i + 1);
            byte b = 0;
            if ((c1 >= '0') && (c1 <= '9'))
                b += ((c1 - '0') * 16);
            else if ((c1 >= 'a') && (c1 <= 'f'))
                b += ((c1 - 'a' + 10) * 16);
            else if ((c1 >= 'A') && (c1 <= 'F'))
                b += ((c1 - 'A' + 10) * 16);
            else
                throw new IllegalArgumentException();
            if ((c2 >= '0') && (c2 <= '9'))
                b += (c2 - '0');
            else if ((c2 >= 'a') && (c2 <= 'f'))
                b += (c2 - 'a' + 10);
            else if ((c2 >= 'A') && (c2 <= 'F'))
                b += (c2 - 'A' + 10);
            else
                throw new IllegalArgumentException();
            baos.write(b);
        }
        return (baos.toByteArray());
    }

    /**
     * 将字节流进行BASE64编码
     *
     * @param bytes
     *            字节流

     * @return BASE64编码的字符串
     */
//	public static String encodeBASE64(byte[] bytes) {
//		if (null == bytes)
//			return null;
//		BASE64Encoder encoder = new BASE64Encoder();
//		return encoder.encode(bytes);
//	}
//
//	/**
//	 * 将BASE64编码的字符串解码
//	 *
//	 * @param str
//	 *            BASE64编码的字符串
//	 * @return 字节流
//
//	 * @throws IOException
//	 */
//	public static byte[] decodeBASE64(String str) throws IOException {
//		if (null == str)
//			return null;
//		BASE64Decoder decoder = new BASE64Decoder();
//		return decoder.decodeBuffer(str);
//	}

    /**
     * 将字符串转换成Unicode编码字符串

     *
     * @param src
     *            待编码的字符串

     *            编码前字符串的编码，如"GBK"
     * @return 编码后的Unicode字符串

     * @throws UnsupportedEncodingException
     */
    public String convertUnicode(String src, String charsetName)
            throws UnsupportedEncodingException {
        char c;
        String strRet = "";
        int intAsc;
        String strHex;
        src = new String(src.getBytes("ISO-8859-1"), charsetName);
        for (int i = 0; i < src.length(); i++) {
            c = src.charAt(i);
            intAsc = (int) c;
            if (intAsc > 128) {
                strHex = Integer.toHexString(intAsc);
                strRet = strRet + "&#x" + strHex + ";";
            } else {
                strRet = strRet + c;
            }
        }
        return strRet;
    }
}
