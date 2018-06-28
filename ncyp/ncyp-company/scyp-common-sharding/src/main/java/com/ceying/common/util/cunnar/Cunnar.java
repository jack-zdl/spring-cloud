package com.ceying.common.util.cunnar;

import com.cunnar.domain.AccessToken;
import com.cunnar.domain.FileInfo;
import com.cunnar.exception.ErrorResultException;
import com.cunnar.module.Account;
import com.cunnar.module.File;
import com.cunnar.module.Oauth;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by jiang on 2018/4/4.
 */
public class Cunnar {

    protected static final Logger logger = Logger.getLogger(Cunnar.class);

    /**
     * 文本文件哈希存证（非具体文件，而是JSON字符串，出证时需将相应文本串存为纯文本文件）
     * @param fileName  文件名（暂用电子签名声明书、三方协议编号作文件名，扩展名为.txt）
     * @param filePlainText 文件文本内容（实为电子签名声明书、三方协议内容含签名的JSON字符串）
     * @return
     * @throws ErrorResultException
     */
    public static String FileHashUpload(String fileName, String filePlainText) throws ErrorResultException {
        String filename = fileName + ".txt";


        try {
            String userId = Account.createAccountById("cypfintech");
            AccessToken accessToken = Oauth.getAccessToken(userId);

            String hash = DigestUtils.sha256Hex(filePlainText); // sha256
            FileInfo fileInfo = new FileInfo(filename, filePlainText.length(), hash);
            fileInfo.setHashType(3);        // sha256
            String result = File.createHash(accessToken, fileInfo);
            return result;
        } catch (ErrorResultException e) {
            logger.error("美亚存证出错! ERROR: " + e.getErrorResult());
            throw e;
        } catch (Exception e){
            logger.error("美亚存证出错! ERROR！");
            throw e;
        }
    }

    public static String FileHashCertify(String fileName, String filePlainText) throws ErrorResultException, IOException {
        String filename = fileName + ".txt";

        try {
            String userId = Account.createAccountById("cypfintech");
            AccessToken accessToken = Oauth.getAccessToken(userId);

            FileInfo info = new FileInfo(String.valueOf(System.currentTimeMillis()), filename, filePlainText.length(), DigestUtils.sha256Hex(filePlainText));
            String fileId = File.create(accessToken, info);

            long uploadLength = File.getFileUploadLength(accessToken, fileId);
            if (uploadLength < filePlainText.length()){
                InputStream is = new ByteArrayInputStream(filePlainText.getBytes());
                try {
                    is.skip(uploadLength);
                } catch (IOException e) {
                    e.printStackTrace();
                    logger.error("取证上传文件出错!");
                    throw e;
                }
                File.uploadStream(accessToken, fileId, uploadLength, is);
            }
            String result = File.getFileCertify(accessToken, fileId, 2);
            return result;
        } catch (ErrorResultException e) {
            logger.error("取证出错! ERROR: " + e.getErrorResult());
            throw e;
        }
    }

}
