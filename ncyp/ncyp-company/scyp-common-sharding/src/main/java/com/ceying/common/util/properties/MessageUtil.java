package com.ceying.common.util.properties;

import com.ceying.common.enums.ExceptionCodeEnum;
import com.ceying.common.enums.ExceptionTypeEnum;
import com.ceying.common.exception.ServiceException;
import com.ceying.common.util.bean.SpringUtil;
import com.ceying.common.util.response.BaseReturnResult;
import com.ceying.common.util.stringtools.FString;
import com.ceying.eagleeye.common.log.MyLogger;

import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.HashMap;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/31<br>
 * <br>
 */
public class MessageUtil {


    static MyLogger myLogger = SpringUtil.getBean(MyLogger.class);

    static HashMap<String,String> ecemap = new HashMap<>();
    static {
        for (ExceptionCodeEnum ece:ExceptionCodeEnum.values()) {
            ecemap.put(ece.getKey(),ece.getValue());
        }
    }

    /**
     * 返回成功
     * @return BaseReturnResult
     */
    public static BaseReturnResult Success() {
        BaseReturnResult baseReturnResult = new BaseReturnResult();
        baseReturnResult.setSuccess(true);
        baseReturnResult.setCode("PUB0001");
        baseReturnResult.setMsg("操作成功！");
        return baseReturnResult;
    }
    /**
     * 返回成功,返回数据
     * @return BaseReturnResult
     */
    public static BaseReturnResult Success(Object data) {
        BaseReturnResult baseReturnResult = new BaseReturnResult();
        baseReturnResult.setSuccess(true);
        baseReturnResult.setCode("PUB0001");
        baseReturnResult.setMsg("操作成功！");
        baseReturnResult.setData(data);
        return baseReturnResult;
    }

    /**
     * 返回成功
     * @return BaseReturnResult
     */
    public static BaseReturnResult Success(String code,String msg) {
        BaseReturnResult baseReturnResult = new BaseReturnResult();
        baseReturnResult.setSuccess(true);
        baseReturnResult.setCode(code);
        baseReturnResult.setMsg(msg);
        return baseReturnResult;
    }

    /**
     * 返回异常
     * @return BaseReturnResult
     */
    public static BaseReturnResult Exception(Exception ex) {
        BaseReturnResult baseReturnResult = new BaseReturnResult();
        baseReturnResult.setSuccess(false);
        String msg = null;
        if(ex instanceof SQLException){
            String errCode = null;
            msg = "数据库异常：";
            String exmsg = ex.getMessage();
            if(FString.isFind(exmsg, ExceptionTypeEnum.UNIQUE_VIOLATION.getValue())){
                msg += ExceptionTypeEnum.UNIQUE_VIOLATION.getValue();
                errCode = ExceptionCodeEnum.COM0001.getKey();
            } else if(FString.isFind(exmsg, ExceptionTypeEnum.INTEGRITY_VIOLATION_NOT_FOUND_PARENT.getValue())){
                msg += ExceptionTypeEnum.INTEGRITY_VIOLATION_NOT_FOUND_PARENT.getValue();
                errCode = ExceptionCodeEnum.COM0005.getKey();
            } else if(FString.isFind(exmsg, ExceptionTypeEnum.INTEGRITY_VIOLATION_FOUND_CHILD.getValue())){
                msg += ExceptionTypeEnum.INTEGRITY_VIOLATION_FOUND_CHILD.getValue();
                errCode = ExceptionCodeEnum.COM0002.getKey();
            } else if(FString.isFind(exmsg, ExceptionTypeEnum.NULL_CANNOT_INSERT.getValue())){
                msg += ExceptionTypeEnum.NULL_CANNOT_INSERT.getValue();
                errCode = ExceptionCodeEnum.COM0004.getKey();
            } else{
                errCode = ExceptionCodeEnum.COM0003.getKey();
            }
            msg += ecemap.get(errCode);
            baseReturnResult.setCode(errCode);
            setBaseMsg(baseReturnResult,msg);
        } else if(ex instanceof ServiceException){
            msg = "";
            ServiceException exception = (ServiceException)ex;
            baseReturnResult.setCode(exception.getErrCode());
            baseReturnResult.setMsg(msg);
            setBaseMsg(baseReturnResult,exception.getErrParams());
        }else {
            msg = "程序运行出错，请联系相关人员";
            baseReturnResult.setCode(ExceptionCodeEnum.BIZ0002.getKey());
            setBaseMsg(baseReturnResult,msg);
        }

        //日志记录
        myLogger.error(baseReturnResult.getMsg(),ex);

        return baseReturnResult;
    }

    public static void setBaseMsg(BaseReturnResult baseReturnResult, Object... message) {
        String pattern = ecemap.get(baseReturnResult.getCode());
        String msg = "操作失败！"+ (baseReturnResult.getMsg()==null?"":baseReturnResult.getMsg());
        if (pattern != null) {
            msg += MessageFormat.format(pattern, message);
        } else {
            msg += MessageFormat.format("{0}", message);
        }
        baseReturnResult.setMsg(msg.replaceAll("\\\"", "\\\'").replaceAll("\n", ""));
    }

}
