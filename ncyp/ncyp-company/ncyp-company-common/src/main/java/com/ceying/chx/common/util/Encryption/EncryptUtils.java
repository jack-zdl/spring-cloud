package com.ceying.chx.common.util.Encryption;

import javax.crypto.*;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 功能说明: 加密工具类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2017/11/15 22:50<br>
 * <br>
 */

public
class EncryptUtils {

    private static final String DES = "DESede";//ReadUtil.readFromAresConfigFile("def_des");
    private static final String MD5 = "MD5";
    private static final String KEY_FILE_NAME = "deskey.dat";

    /**
     * MD5加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String md5Encrypt(final String src)
            throws UnsupportedEncodingException {
        return encrypt(MD5, src);
    }

    /**
     * MD5加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @param charsetName 编码类型
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String md5Encrypt(final String src, final String charsetName)
            throws UnsupportedEncodingException {
        return encrypt(MD5, src, charsetName);
    }

    /**
     * SHA加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String shaEncrypt(final String src)
            throws UnsupportedEncodingException {
        return encrypt("SHA", src);
    }

    /**
     * SHA-256加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String sha256Encrypt(final String src)
            throws UnsupportedEncodingException {
        return encrypt("SHA-256", src);
    }

    /**
     * SHA-512加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String sha512Encrypt(final String src)
            throws UnsupportedEncodingException {
        return encrypt("SHA-512", src);
    }

    /**
     * 生成DES算法密钥
     *
     * @return 密钥
     */
    synchronized public static
    SecretKey genDESKey() {
        SecretKey key = null;
        if ((new File(KEY_FILE_NAME)).exists() == false) {
            try {
                KeyGenerator keygen = KeyGenerator.getInstance(DES);
                keygen.init(112);
                key = keygen.generateKey();
                ObjectOutputStream out = new ObjectOutputStream(
                        new FileOutputStream(KEY_FILE_NAME));
                out.writeObject(key);
                out.close();
            } catch (NoSuchAlgorithmException e) {
                throw new SecurityException(e.getMessage());
            } catch (IOException e) {
                throw new SecurityException(e.getMessage());
            }
        } else {
            try {
                ObjectInputStream in = new ObjectInputStream(
                        new FileInputStream(KEY_FILE_NAME));
                key = (SecretKey) in.readObject();
                in.close();
            } catch (IOException e) {
                throw new SecurityException(e.getMessage());
            } catch (ClassNotFoundException e) {
                throw new SecurityException(e.getMessage());
            }
        }
        return key;
    }

    /**
     * 3DES加密,返回十六进制编码字符串
     *
     * @param src 待加密的字符串
     * @param key 密钥
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    public static String desEncrypt(final String src, final SecretKey key)
            throws UnsupportedEncodingException {
        return encrypt(DES, src, key);
    }

    /**
     * 3DES解密,返回字符串
     *
     * @param src 待解密的十六进制编码字符串
     * @param key 密钥
     * @return 解密后的字符串
     * @throws IOException
     */
    public static String desDecrypt(final String src, final SecretKey key)
            throws IOException {
        return decrypt(DES, src, key);
    }

    /**
     * 对字节流进行不可逆加密
     *
     * @param algorithm 加密模式
     * @param obj       待加密的字节流
     * @return 加密后的字节流
     */
    private static byte[] encrypt(String algorithm, byte[] obj) {
        if (null == obj)
            return null;
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            return md.digest(obj);
        } catch (NoSuchAlgorithmException e) {
            throw new SecurityException(e.getMessage());
        }
    }

    /**
     * 对字符串进行不可逆加密
     *
     * @param algorithm 加密模式
     * @param src       待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    private static String encrypt(String algorithm, String src)
            throws UnsupportedEncodingException {
        return encrypt(algorithm, src, EncodeUtils.DEFAULT_CHARSET_NAME);
    }

    /**
     * 对字符串进行不可逆加密
     *
     * @param algorithm 加密模式
     * @param src       待加密的字符串
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    private static String encrypt(String algorithm, String src, String charsetName)
            throws UnsupportedEncodingException {
        if (null == src)
            return null;
        byte[] bytes = src.getBytes(charsetName);
        byte[] encodeBtyes = encrypt(algorithm, bytes);
        return EncodeUtils.encodeHex(encodeBtyes);
    }

    /**
     * 对字节流进行可逆加密
     *
     * @param algorithm 加密模式
     * @param obj       待加密的字节流
     * @param key       密钥
     * @return 加密后的字节流
     */
    private static byte[] encrypt(String algorithm, byte[] obj, Key key) {
        if (null == obj)
            return null;
        try {
            Cipher cipher = null;
            if (algorithm.equals(DES)) {
                cipher = Cipher.getInstance(algorithm);
            }
            else {
                throw new SecurityException("系统不支持" + algorithm + "加密算法");
            }
            cipher.init(Cipher.ENCRYPT_MODE, key);
            return cipher.doFinal(obj);
        } catch (NoSuchAlgorithmException e) {
            throw new SecurityException(e.getMessage());
        } catch (NoSuchPaddingException e) {
            throw new SecurityException(e.getMessage());
        } catch (InvalidKeyException e) {
            throw new SecurityException(e.getMessage());
        } catch (IllegalStateException e) {
            throw new SecurityException(e.getMessage());
        } catch (IllegalBlockSizeException e) {
            throw new SecurityException(e.getMessage());
        } catch (BadPaddingException e) {
            throw new SecurityException(e.getMessage());
        }
    }

    /**
     * 对字符串进行可逆加密
     *
     * @param algorithm 加密模式
     * @param src       待加密的字符串
     * @param key       密钥
     * @return 加密后的十六进制编码字符串
     * @throws UnsupportedEncodingException
     */
    private static String encrypt(String algorithm, String src, Key key)
            throws UnsupportedEncodingException {
        if (null == src)
            return null;
        byte[] bytes = src.getBytes(EncodeUtils.DEFAULT_CHARSET_NAME);
        byte[] encodeBtyes = encrypt(algorithm, bytes, key);
        return EncodeUtils.encodeHex(encodeBtyes);
    }

    /**
     * 对字节流进行可逆解密
     *
     * @param algorithm 加密模式
     * @param obj       待解密的字节流
     * @param key       密钥
     * @return 解密后的字节流
     */
    private static byte[] decrypt(String algorithm, byte[] obj, Key key) {
        if (null == obj)
            return null;
        try {
            Cipher cipher = null;
            if (algorithm.equals(DES)) {
                cipher = Cipher.getInstance(algorithm);
            }
            else {
                throw new SecurityException("系统不支持" + algorithm + "加密算法");
            }
            cipher.init(Cipher.DECRYPT_MODE, key);
            return cipher.doFinal(obj);
        } catch (NoSuchAlgorithmException e) {
            throw new SecurityException(e.getMessage());
        } catch (NoSuchPaddingException e) {
            throw new SecurityException(e.getMessage());
        } catch (InvalidKeyException e) {
            throw new SecurityException(e.getMessage());
        } catch (IllegalStateException e) {
            throw new SecurityException(e.getMessage());
        } catch (IllegalBlockSizeException e) {
            throw new SecurityException(e.getMessage());
        } catch (BadPaddingException e) {
            throw new SecurityException(e.getMessage());
        }
    }

    /**
     * 对字符串进行可逆解密
     *
     * @param algorithm 加密模式
     * @param src       待解密的十六进制编码字符串
     * @param key       密钥
     * @return 解密后的字符串
     * @throws IOException
     */
    private static String decrypt(String algorithm, String src, Key key)
            throws IOException {
        if (null == src)
            return null;
        byte[] bytes = EncodeUtils.decodeHex(src);
        byte[] decodeBtyes = decrypt(algorithm, bytes, key);
        return new String(decodeBtyes, EncodeUtils.DEFAULT_CHARSET_NAME);
    }

    /**
     * 对字符串加密
     *
     * @param algorithm 加密模式（目前支持"DESede|MD5"）
     * @param src       字符串明文
     * @return
     */
    public static String encryptString(String algorithm, String src) {
        if (algorithm.equals(DES)) {
            SecretKey key = genDESKey();
            try {
                return desEncrypt(src, key);
            } catch (UnsupportedEncodingException e) {
                throw new SecurityException(e.getMessage());
            }
        } else if (algorithm.equals(MD5)) {
            try {
                return md5Encrypt(src);
            } catch (UnsupportedEncodingException e) {
                throw new SecurityException(e.getMessage());
            }
        } else {
            throw new SecurityException("系统不支持" + algorithm + "加密算法");
        }
    }

    /**
     * 对字符串解密
     *
     * @param algorithm 解密模式（目前支持"DESede"）
     * @param obj       字符串密文
     * @return
     */
    public static String decryptString(String algorithm, String obj) {
        if (algorithm.equals(DES)) {
            SecretKey key = genDESKey();
            try {
                return desDecrypt(obj, key);
            } catch (IOException e) {
                throw new SecurityException(e.getMessage());
            }
        } else {
            throw new SecurityException("系统不支持" + algorithm + "解密算法");
        }
    }

    public static void main(String[] arg) throws IOException {
        String srcStr = "admin111111";
        System.out.println("DES--->" + encryptString("DESede", srcStr));
        System.out.println("MD5--->" + encryptString("MD5", srcStr));
        System.out.println("SRC--->" + decryptString("DESede", encryptString("DESede", srcStr)));
    }
}
