package com.ceying.common.util.cfca;

import cfca.sadk.algorithm.common.PKIException;
import cfca.sadk.algorithm.sm2.SM2PublicKey;
import cfca.sadk.lib.crypto.JCrypto;
import cfca.sadk.lib.crypto.Session;
import cfca.sadk.timestamp.client.TimestampFactory;
import cfca.sadk.timestamp.client.api.Timestamp;
import cfca.sadk.timestamp.client.api.TimestampClient;
import cfca.sadk.timestamp.client.api.TimestampConfig;
import cfca.sadk.timestamp.client.bean.HashAlgorithm;
import cfca.sadk.timestamp.exception.TSAException;
import cfca.sadk.timestamp.exception.TSAPkixStatusInfoException;
import cfca.sadk.util.Base64;
import cfca.sadk.util.Signature;
import cfca.sadk.x509.certificate.X509Cert;
import cfca.sadk.x509.certificate.X509CertVerifier;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;


/**
 * 功能说明: 签名工具类<br>
 * 系统版本: 0.1 <br>
 * 开发人员: chx
 * 开发时间: 2017/3/16<br>
 * <br>
 */
@Configuration
@ConfigurationProperties(prefix = "cfca")
public class CfcaUtils implements ApplicationContextAware {

    private static final Logger log = LoggerFactory.getLogger(CfcaUtils.class);
    private static CfcaUtils instance = null;
    private static ApplicationContext context;
    private String cert;

    public void setApplicationContext(ApplicationContext contex) throws BeansException {
        this.context = contex;
    }
    public static ApplicationContext getContext() {
        return context;
    }

    public static CfcaUtils getInstance(){
        if (instance == null){
            instance = (CfcaUtils) context.getBean("cfcaUtils");
        }
        return instance;
    }

    public String getCertSNFromSM2P7DetachMsg(byte[] base64P7SignedData) throws Exception {
        Signature signKit = null;
        Session session = null;
        X509Cert signX509Cert = null;

        String deviceName = JCrypto.JSOFT_LIB;
        try {
            JCrypto.getInstance().initialize(deviceName, null);
            session = JCrypto.getInstance().openSession(deviceName);
            signKit = new Signature();
        } catch (PKIException e) {
            e.printStackTrace();
            log.error("加密库初始化失败，抛出异常 - " + e.getMessage());
            throw e;
        }

        if (signKit == null || session == null) {
            log.error("加密库初始化失败");
            throw new Exception("加密库初始化失败");
        }

        try {
            signX509Cert = signKit.getSignerX509CertFromP7SignData(base64P7SignedData);
            return signX509Cert.getStringSerialNumber();
        } catch (PKIException e) {
            e.printStackTrace();
            log.error("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            log.error("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            throw e;
        }
    }

    public boolean verifySM2P7DetachMsg(byte[] sourceData, byte[] base64P7SignedData) {
        boolean result = true;
        Signature signKit = null;
        Session session = null;
        byte[] issureCert = null;

        try{
            issureCert = cert.getBytes("UTF-8");
        }catch(UnsupportedEncodingException e){
            e.printStackTrace();
            System.out.println("未能获取颁发者证书，抛出异常 - " + e.getMessage());
            log.error("未能获取颁发者证书，抛出异常 - " + e.getMessage());
            return false;
        }

        System.out.println("验签开始: ");

        String deviceName = JCrypto.JSOFT_LIB;
        try {
            JCrypto.getInstance().initialize(deviceName, null);
            session = JCrypto.getInstance().openSession(deviceName);
            signKit = new Signature();
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("加密库初始化失败，抛出异常 - " + e.getMessage());
            log.error("加密库初始化失败，抛出异常 - " + e.getMessage());
            return false;
        }

        if (signKit == null || session == null) {
            System.out.println("加密库初始化失败 - ");
            log.error("加密库初始化失败");
            return false;
        }

        try {
            result = signKit.p7VerifyMessageDetach(sourceData, base64P7SignedData, session);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("验签异常 - " + e.getMessage());
            log.error("验签异常 - " + e.getMessage());
            return false;
        }

        System.out.println("SM2 P7AttachVerify 加密库初始化及验签结果: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 验签失败，请检查签名结果！");
            return false;
        }

        //获取签名证书
        X509Cert signX509Cert = null;
        SM2PublicKey pubKey = null;
        try {
            signX509Cert = signKit.getSignerX509CertFromP7SignData(base64P7SignedData);
            pubKey = (SM2PublicKey) signX509Cert.getPublicKey();
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            log.error("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            return false;
        }

        //校验证书签名的有效性（可选）
        try {
            X509CertVerifier.updateTrustCertsMap(new X509Cert(issureCert));
            result = X509CertVerifier.validateCertSign(signX509Cert);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("SM2 P7AttachVerify - 验证证书签名出现异常 - " + e.getMessage());
            log.error("SM2 P7AttachVerify - 验证证书签名出现异常 - " + e.getMessage());
            return false;
        }

        System.out.println("SM2 P7AttachVerify 证书签名有效性结果: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 验证证书签名失败，请检查证书有效性！");
            return false;
        }

        //校验证书时间是否有效（可选）
        result = X509CertVerifier.verifyCertDate(signX509Cert);
        System.out.println("X509Cert Date Verify 签名证书时间有效性: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 证书有效时间与签名时间不符，请检查证书有效时间！");
            return false;
        }

        //通过指定的CRL证书吊销列表判定证书的有效性（可选）
        //临时写文件，，正常情况把crl文件的路径传进来就行了，不需要写文件
        String crlFilePath = "tmpCrl.crl";
        byte[] crlData =
                ("MIIFEjCCA/wCAQEwCwYJKoZIhvcNAQELMFgxFzAVBgNVBAMMDkNGQ0EgQ1MgUlNBIENBMTAwLgYDVQQKDCdDaGluYSBGaW5hbmNpYWwgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxCzAJBgNVBAYTAkNOFw0wODEyMTgwNDM0NTZaFw0xODEyMzEwNDM0NTZaMIIDJzAUAgMBAAEXDTE1MDUxODA0MzQ1NlowEwICTiEXDTE1MDUxOTA0MzQ1NlowFAIDAwAAFw0xNTA1MjEwNDM0NTZaMBQCAwCcQBcNMTUwNTIxMDQzNDU2WjAiAgMDAAEXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBATAiAgMAnEEXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBATAiAgMDAAIXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAjAiAgMAnEIXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAjAiAgMDAAMXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAzAiAgMAnEMXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAzAiAgMDAAQXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBDAiAgMAnEQXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBDAiAgMDAAUXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBTAiAgMAnEUXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBTAiAgMDAAYXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBjAiAgMAnEYXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBjAiAgMDAAcXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBzAiAgMAnEcXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBzAiAgMDAAgXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCDAiAgMAnEgXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCDAiAgMDAAkXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCTAiAgMAnEkXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCTAiAgMwABAXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCjAiAgMGGooXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCqBHMEUwIgYDVR0jAQH/BBgwFoAUpMD0zsUqsUHdQrxLECDfnXiquU4wDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAoQwCwYJKoZIhvcNAQELA4IBAQCA7UoUTy53bJqGT22AQHURmRNSwWP2AoDfvYnjFXcJBUfWeBO4RS4PnNHBWzNX61tjV8yGsc+70JiV91zj36Lq+Nnrvz67DcJir6NwpvOrf79sNdKanu9Y3QpaZ1ChE5k7Z8T9jJbrhOHbnLMttjNeIb4KF/regRR6bCMfw/ADOgSOus5qefGyPa128llk73fOPJNXJWnuPNl4auu+Y5K04j4MH4JbEl8SJ0xzPxwrxk6MmhuZ3n7GQXmaAom0t1R536/+ZtB1ZC051rRWumjJ7rCqYSjyO/ZyUT/HLHhvdorhC7I1DbtbuJU4aZz7T6KvW0I/DIxvO9vzSkIOp1mv").getBytes();
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(crlFilePath);
            fileOutputStream.write(Base64.decode(crlData));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            log.error("SM2 P7AttachVerify - CRL文件不存在！ - " + e.getMessage());
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            log.error("SM2 P7AttachVerify - CRL数据写临时文件失败！ - " + e.getMessage());
            return false;
        } finally {
            try {
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            ;
        }

        //使用crl校验
        try {
            result = X509CertVerifier.verifyCertByCRLOutLine(signX509Cert, crlFilePath);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("SM2 P7AttachVerify - 证书撤销列表验证异常 - ！" + e.getMessage());
            log.warn("SM2 P7AttachVerify - 证书撤销列表验证异常 - ！" + e.getMessage());
            return false;
        }

        System.out.println("X509Cert Crl Verify: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 证书在撤销列表中，请检查证书有效性！");
            return false;
        }

        return true;
    }

    public boolean verifySM2P7AttachMsg(byte[] base64P7SignedData) {
        boolean result = true;
        Signature signKit = null;
        Session session = null;

        byte[] issureCert = new byte[0];

        try{
            issureCert = cert.getBytes("UTF-8");
        }catch(UnsupportedEncodingException e){
            e.printStackTrace();
            System.out.println("未能获取颁发者证书，抛出异常 - " + e.getMessage());
            log.error("未能获取颁发者证书，抛出异常 - " + e.getMessage());
            return false;
        }

        System.out.println("验签开始: ");

        String deviceName = JCrypto.JSOFT_LIB;
        try {
            JCrypto.getInstance().initialize(deviceName, null);
            session = JCrypto.getInstance().openSession(deviceName);
            signKit = new Signature();
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("加密库初始化失败，抛出异常 - " + e.getMessage());
            log.error("加密库初始化失败，抛出异常 - " + e.getMessage());
            return false;
        }

        if (signKit == null || session == null) {
            System.out.println("加密库初始化失败 - ");
            log.error("加密库初始化失败");
            return false;
        }
        try {
            result = signKit.p7VerifyMessageAttach(base64P7SignedData, session);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("验签异常 - " + e.getMessage());
            log.error("验签异常 - " + e.getMessage());
            return false;
        }

        System.out.println("SM2 P7AttachVerify 加密库初始化及验签结果: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 验签失败，请检查签名结果！");
            return false;
        }

//        try {
//            String signTimeStamp = signKit.getTimeFromTimeStamp(base64P7SignedData);
//        }catch(PKIException e){
//            e.printStackTrace();
//            log().error("未能从签名数据中获取时间戳！抛出异常 - " + e.getMessage());
//        }

        //获取签名证书
        X509Cert signX509Cert = null;
        SM2PublicKey pubKey = null;
        try {
            signX509Cert = signKit.getSignerX509CertFromP7SignData(base64P7SignedData);
            pubKey = (SM2PublicKey) signX509Cert.getPublicKey();
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            log.error("未能从签名数据中获取签名证书！抛出异常，请检查签名数据！ - " + e.getMessage());
            return false;
        }
        // X509Cert signX509Cert0 = signKit.getSignerCert();
        // byte[] sourceData = signKit.getContentFromP7SignData(base64P7SignedData);
        // byte[] sourceData1 = signKit.getSourceData();
        // byte[] signature = signKit.getSignature();

        //校验证书签名的有效性（可选）
        try {
            X509CertVerifier.updateTrustCertsMap(new X509Cert(issureCert));
            result = X509CertVerifier.validateCertSign(signX509Cert);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("SM2 P7AttachVerify - 验证证书签名出现异常 - " + e.getMessage());
            log.error("SM2 P7AttachVerify - 验证证书签名出现异常 - " + e.getMessage());
            return false;
        }

        System.out.println("SM2 P7AttachVerify 证书签名有效性结果: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 验证证书签名失败，请检查证书有效性！");
            return false;
        }

        //校验证书时间是否有效（可选）
        result = X509CertVerifier.verifyCertDate(signX509Cert);
        System.out.println("X509Cert Date Verify 签名证书时间有效性: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 证书有效时间与签名时间不符，请检查证书有效时间！");
            return false;
        }

        //通过指定的CRL证书吊销列表判定证书的有效性（可选）

        //临时写文件，，正常情况把crl文件的路径传进来就行了，不需要写文件
        String crlFilePath = "tmpCrl.crl";
        byte[] crlData =
                ("MIIFEjCCA/wCAQEwCwYJKoZIhvcNAQELMFgxFzAVBgNVBAMMDkNGQ0EgQ1MgUlNBIENBMTAwLgYDVQQKDCdDaGluYSBGaW5hbmNpYWwgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxCzAJBgNVBAYTAkNOFw0wODEyMTgwNDM0NTZaFw0xODEyMzEwNDM0NTZaMIIDJzAUAgMBAAEXDTE1MDUxODA0MzQ1NlowEwICTiEXDTE1MDUxOTA0MzQ1NlowFAIDAwAAFw0xNTA1MjEwNDM0NTZaMBQCAwCcQBcNMTUwNTIxMDQzNDU2WjAiAgMDAAEXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBATAiAgMAnEEXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBATAiAgMDAAIXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAjAiAgMAnEIXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAjAiAgMDAAMXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAzAiAgMAnEMXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBAzAiAgMDAAQXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBDAiAgMAnEQXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBDAiAgMDAAUXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBTAiAgMAnEUXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBTAiAgMDAAYXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBjAiAgMAnEYXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBjAiAgMDAAcXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBzAiAgMAnEcXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBBzAiAgMDAAgXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCDAiAgMAnEgXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCDAiAgMDAAkXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCTAiAgMAnEkXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCTAiAgMwABAXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCjAiAgMGGooXDTE1MDUyMTA0MzQ1NlowDDAKBgNVHRUEAwoBCqBHMEUwIgYDVR0jAQH/BBgwFoAUpMD0zsUqsUHdQrxLECDfnXiquU4wDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAoQwCwYJKoZIhvcNAQELA4IBAQCA7UoUTy53bJqGT22AQHURmRNSwWP2AoDfvYnjFXcJBUfWeBO4RS4PnNHBWzNX61tjV8yGsc+70JiV91zj36Lq+Nnrvz67DcJir6NwpvOrf79sNdKanu9Y3QpaZ1ChE5k7Z8T9jJbrhOHbnLMttjNeIb4KF/regRR6bCMfw/ADOgSOus5qefGyPa128llk73fOPJNXJWnuPNl4auu+Y5K04j4MH4JbEl8SJ0xzPxwrxk6MmhuZ3n7GQXmaAom0t1R536/+ZtB1ZC051rRWumjJ7rCqYSjyO/ZyUT/HLHhvdorhC7I1DbtbuJU4aZz7T6KvW0I/DIxvO9vzSkIOp1mv").getBytes();
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(crlFilePath);
            fileOutputStream.write(Base64.decode(crlData));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            log.error("SM2 P7AttachVerify - CRL文件不存在！ - " + e.getMessage());
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            log.error("SM2 P7AttachVerify - CRL数据写临时文件失败！ - " + e.getMessage());
            return false;
        } finally {
            try {
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
            ;
        }

        //使用crl校验
        try {
            result = X509CertVerifier.verifyCertByCRLOutLine(signX509Cert, crlFilePath);
        } catch (PKIException e) {
            e.printStackTrace();
            System.out.println("SM2 P7AttachVerify - 证书撤销列表验证异常 - ！" + e.getMessage());
            log.warn("SM2 P7AttachVerify - 证书撤销列表验证异常 - ！" + e.getMessage());
            return false;
        }

        System.out.println("X509Cert Crl Verify: " + result);
        if (!result) {
            log.warn("SM2 P7AttachVerify - 证书在撤销列表中，请检查证书有效性！");
            return false;
        }

        return true;
    }

    /**
     * 验签服务
     */
    @Deprecated
    public static void verifySM2P7AttachMsg_Rest(String tag, String id, String base64P7SignedData) {

        JSONObject json = new JSONObject();
        json.put("tag", tag);
        json.put("id", id);
        json.put("signedData", base64P7SignedData);
        String result = "";
        String strMessage = "";

        BufferedReader reader = null;
        StringBuffer buffer = new StringBuffer();

        try {
            URL sendUrl = new URL("http://localhost:8182/ra/sm2v7attachverify");
            HttpURLConnection conn = (HttpURLConnection) sendUrl.openConnection();

            conn.setRequestMethod("POST");
            conn.setConnectTimeout(5000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setAllowUserInteraction(true);
            conn.setUseCaches(false);
            conn.setRequestProperty("Content-Language", "UTF-8");
            conn.setRequestProperty("Content-Type", "application/json");

            String userpassword = "scott:tiger";
            String encodedAuthorization = new String(Base64.encode(userpassword.getBytes()));
            conn.setRequestProperty("Authorization", "Basic " + encodedAuthorization);
            OutputStream stream = conn.getOutputStream();

            stream.write(json.toJSONString().getBytes());
            stream.flush();
            stream.close();

            InputStream inputStream = conn.getInputStream();
            reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            while ((strMessage = reader.readLine()) != null) {
                buffer.append(strMessage);
            }
            result = buffer.toString();
            reader.close();
            conn.disconnect();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getCert() {
        return cert;
    }

    public void setCert(String cert) {
        this.cert = cert;
    }

    public String reqTimeStampByHTTPS(byte[] sourceData) throws TSAPkixStatusInfoException, TSAException, UnsupportedEncodingException {
        String TsaConfigFilePath="./config/timestamp.properties";//打成jar 之后的文件路径
        File file=new File(TsaConfigFilePath);
        if(!file.exists()){
            TsaConfigFilePath= CfcaUtils.class.getClassLoader().getResource("timestamp.properties").getPath();//tomcat中的文件路径
        }
//        String TsaConfigFilePath = CfcaUtils.class.getClassLoader().getResource("timestamp.properties").getPath();
//        TimestampConfig config = new TimestampConfig(TsaConfigFilePath);
        TimestampConfig config = new TimestampConfig(TsaConfigFilePath);
        TimestampClient client = TimestampFactory.newTimestampClient(config);

        Timestamp timestamp = client.requestTimestamp(HashAlgorithm.SHA256, sourceData);
        log.info("-----------------------------");
        log.info("HTTPS TimeStamp Request:");
        log.info("TimeStamp: " + timestamp.getTimestampTimeText());
        //log().info("时间戳报文: " + Base64.toBase64String(timestamp.getTimestampResponseBytes()));

        return Base64.toBase64String(timestamp.getTimestampResponseBytes());
    }

}
