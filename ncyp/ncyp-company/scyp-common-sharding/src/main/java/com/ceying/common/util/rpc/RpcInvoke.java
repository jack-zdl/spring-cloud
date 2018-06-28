package com.ceying.common.util.rpc;
import com.alibaba.fastjson.JSONObject;
import com.googlecode.jsonrpc4j.JsonRpcClientException;
import com.googlecode.jsonrpc4j.JsonRpcHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;

import java.net.ConnectException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
@ConfigurationProperties(prefix = "ra")
public class RpcInvoke implements ApplicationContextAware {
    private static final Logger log = LoggerFactory.getLogger(RpcInvoke.class);
    private static RpcInvoke instance = null;
    private static ApplicationContext context;

    private boolean enabled;
    private static String rpcAddr;
    private static String fromAddr;
    private static String toAddr;

    public static RpcInvoke getTestInstance(){
        if (instance != null){
            return instance;
        }

        instance = new RpcInvoke();

        instance.setEnabled(true);
        instance.setRpcAddr(rpcAddr);
//        rpcAddr = "http://192.168.2.181:8545";
        instance.setFromAddr(fromAddr);
        instance.setToAddr(toAddr);

        return instance;
    }

    public void setApplicationContext(ApplicationContext contex) throws BeansException {
        this.context = contex;
    }
    public static ApplicationContext getContext() {
        return context;
    }

    public static RpcInvoke getInstance(){
        if (instance == null){
            instance = (RpcInvoke) context.getBean("rpcInvoke");
        }
        return instance;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getRpcAddr() {
        return rpcAddr;
    }

    public void setRpcAddr(String rpcAddr) {
        this.rpcAddr = rpcAddr;
    }

    public String getFromAddr() {
        return fromAddr;
    }

    public void setFromAddr(String fromAddr) {
        this.fromAddr = fromAddr;
    }

    public String getToAddr() {
        return toAddr;
    }

    public void setToAddr(String toAddr) {
        this.toAddr = toAddr;
    }

    /**
     *
     * @param src - byte[] data
     * @return hex string
     */
    public static String bytesToHexString(byte[] src) {
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    /**
     * Convert hex string to byte[]
     *
     * @param hexString the hex string
     * @return byte[]
     */
    public static byte[] hexStringToBytes(String hexString) {
        if (hexString == null || hexString.equals("")) {
            return null;
        }
        hexString = hexString.toUpperCase();
        int length = hexString.length() / 2;
        char[] hexChars = hexString.toCharArray();
        byte[] d = new byte[length];
        for (int i = 0; i < length; i++) {
            int pos = i * 2;
            d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
        }
        return d;
    }

    /**
     * 普通字符串转化为十六进制字符串
     *
     * @param str
     * @return
     */
    public static String str2HexStr(String str) {

        char[] chars = "0123456789ABCDEF".toCharArray();
        StringBuilder sb = new StringBuilder("");
        byte[] bs = str.getBytes();
        int bit;

        for (int i = 0; i < bs.length; i++) {
            bit = (bs[i] & 0x0f0) >> 4;
            sb.append(chars[bit]);
            bit = bs[i] & 0x0f;
            sb.append(chars[bit]);
            sb.append(' ');
        }
        return sb.toString().trim();
    }

    /**
     * 十六进制字符串转化为普通字符串
     *
     * @param hexStr
     * @return
     */
    public static String hexStr2Str(String hexStr) {
        String str = "0123456789ABCDEF";
        hexStr = hexStr.substring(0,2).toLowerCase().equals("0x")? hexStr.substring(2) : hexStr;

        char[] hexs = hexStr.toCharArray();
        byte[] bytes = new byte[hexStr.length() / 2];
        int n;

        for (int i = 0; i < bytes.length; i++) {
            n = str.indexOf(hexs[2 * i]) * 16;
            n += str.indexOf(hexs[2 * i + 1]);
            bytes[i] = (byte) (n & 0xff);
        }
        return new String(bytes);
    }

    /**
     * 调用接口保存数据，注意参数data类型为十六进制字符串
     * @param data
     * @param gas
     * @param fromAddr "a2b2854ae1d126d15c032999cac5c3828fd1f0d2"
     * @param toAddr "1234567890123456789012345678901234567890"
     * @return
     * @throws Exception
     */
    public String sendTransaction(String data, int gas, String fromAddr, String toAddr) throws Exception {
        // 发起交易
        JSONObject json = new JSONObject();
        json.put("from", fromAddr);
        json.put("to", toAddr);
        json.put("gas", gas);
        json.put("gasPrice", 1000000);
        json.put("value", 300);
        json.put("data", data);
//        json.put("nonce", 1);
        Object[] params = new Object[]{json};
        Map<String,String> headers = new HashMap<String,String>();
        headers.put("id", "1");

        String methodName = "eth_sendTransaction";

        JsonRpcHttpClient client = null;
        try {
            client = new JsonRpcHttpClient(new URL(RpcInvoke.getInstance().getRpcAddr()));
        } catch (MalformedURLException e) {
            e.printStackTrace();
            log().error("错误的URL字符串");
            throw e;
        }

        try {
            Object dataReturn = client.invoke(methodName, params, Object.class, headers);
            System.out.println(dataReturn);
            return (String) dataReturn;
        }catch (ConnectException e){
            e.printStackTrace();
            log().error("远程连接意外！");
            throw e;
        }catch (JsonRpcClientException e){
            e.printStackTrace();
            log().error("链上账户意外！");
            throw e;
        }catch (Throwable throwable) {
            throwable.printStackTrace();
            throw new Exception(throwable.getMessage());
        }
    }

    /**
     * 调用接口保存数据，注意参数data类型为十六进制字符串
     * @param data
     * @param gas
     * @return
     * @throws Exception
     */
    public String sendTransaction(String data, int gas) throws Exception {
        return sendTransaction(data,gas,RpcInvoke.getInstance().getFromAddr(), RpcInvoke.getInstance().getToAddr());
    }

    /**
     * 根据hash地址查询数据
     *
     * @param hashAddress
     */
    public String getTransaction(String hashAddress) throws Exception {
        // 查询交易信息
        Object[] params = new Object[]{hashAddress};
        String methodName = "eth_getTransactionByHash";
        Object dataReturn = null;

        JsonRpcHttpClient client = getJsonRpcHttpClient();

        try {
            dataReturn = client.invoke(methodName, params, Object.class);
        }catch (ConnectException e){
            e.printStackTrace();
            log().error("远程连接意外！");
        }catch (Throwable throwable) {
            throwable.printStackTrace();
        }

        if (dataReturn == null){
            Exception e = new Exception("Null result returned from blockchain!");
            e.printStackTrace();
            throw e;
        }

        String valueStr = (String) ((LinkedHashMap) dataReturn).get("value");
        String inputStr = (String) ((LinkedHashMap) dataReturn).get("input");
        return inputStr;
    }

    /**
     *
     * @return
     */
    private JsonRpcHttpClient getJsonRpcHttpClient() {
        JsonRpcHttpClient client = null;
        try {
            client = new JsonRpcHttpClient(new URL(RpcInvoke.getInstance().getRpcAddr()));
        } catch (MalformedURLException e) {
            e.printStackTrace();
            log().error("错误的URL字符串");
        }
        return client;
    }

    /**
     * Convert char to byte
     * @param c char
     * @return byte
     */
    private static byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }

    private static Logger log() {
        return log;
    }

    public static void main(String[] args) throws Exception {
        Base64.Encoder encoder = Base64.getEncoder();

        String tano = "TA10000300000120170805035458";
        String cipherBase64 = "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";
//        String cipherhex = RpcInvoke.bytesToHexString(cipherBase64.getBytes("UTF-8"));

        String keyforJS = "cS90ZC9ZdnhCL3hEeDBRPQ==";
        keyforJS = AESEncrypt.getKeyForJS(tano);

        String providerId = "100003000001";
        String coreId = "100002000003";
        String bankId = "100001000002";

        String cipherKey4Provider = AESEncrypt.encrypt(keyforJS, AESEncrypt.getKey(providerId));
        String cipherKey4Core = AESEncrypt.encrypt(keyforJS, AESEncrypt.getKey(coreId));
        String cipherKey4Bank = AESEncrypt.encrypt(keyforJS, AESEncrypt.getKey(bankId));

        String json = "{\"lbl\":\"CYTA\",\"k1\":\""+ cipherKey4Provider + "\",\"k2\":\"" + cipherKey4Core + "\",\"k3\":\"" + cipherKey4Bank + "\",\"ta\":\"" + cipherBase64 +"\"}";

        // 首先检查区块链连接功能配置是否打开（true）
        if (!RpcInvoke.getTestInstance().isEnabled()){
            return;
        }

        String from = RpcInvoke.getTestInstance().getFromAddr(); // 系统（发送者）的区块链账户地址
        String to = RpcInvoke.getTestInstance().getToAddr(); // 接收者的区块链账户地址

        String data = RpcInvoke.bytesToHexString(json.getBytes());
        String hashAddress = ""; // 这次发送（交易）的哈希值（可以理解成地址）

        try {
            hashAddress = RpcInvoke.getTestInstance().sendTransaction(data, 50000000, from, to);
        }catch (Exception ex){
            ex.printStackTrace();
        }

        System.out.println("HashAddress: " + hashAddress);
        String t3 = "";
//        hashAddress = "0xfb2d8c59d15799ad59d69651d44099dba7de1f1aa2c7622676e7a696378d2596";
        try {
            t3 = RpcInvoke.getTestInstance().getTransaction(hashAddress); // Returns the information about a transaction requested by transaction hash.
        }catch(Exception e){
            e.printStackTrace();
        }

        System.out.println("blockchain data: " + t3);
        byte[] b4 = hexStringToBytes(t3.substring(2)); // remove the prefix - 0x
        String t4 = new String(b4, "UTF-8");
        System.out.println("t4: " + t4);
        String t5 = AESEncrypt.taDecrypt("TA1000000420170730045726",t4);
        System.out.println("returned plain text: " + t5);



//        byte[] x = new byte[1];
//        x[0] = (byte)(200 & 0xFF);
//        String y = bytesToHexString(x);
//        System.out.print(y);
    }


}
