package com.ceying.common.exception;

/**
 * 功能说明: service通用自定义异常<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhanghj
 * 开发时间: 2018/3/31<br>
 * <br>
 */
public class ServiceException extends Exception{
    private static final long serialVersionUID = -1517561654450651944L;

    private String errCode;         //错误代码，如PUB0001
    private String[] errParams;     //错误参数列表，暂时只支持一个参数{0}传递(2016-12-29)

    public ServiceException(String errCode){    //可变长参数为空时会先匹配固定参数的此方法
        super(errCode); //用错误代码当做message
        this.errCode = errCode;
    }
    public ServiceException(String errCode, String... errParams){
        super(errCode);
        this.errCode = errCode;
        this.errParams = errParams;
    }

    public String getErrCode() {
        return errCode;
    }

    public String[] getErrParams() {
        //有的自定义异常没有参数，赋值空字符串防止异常
        if(errParams == null){
            errParams = new String[]{""};
        }
        return errParams;
    }
}
