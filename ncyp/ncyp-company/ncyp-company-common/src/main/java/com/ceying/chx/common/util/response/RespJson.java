package com.ceying.chx.common.util.response;

/**
 * 功能说明:  定义返回的数据类型
 *      result  1;结果类型 1成功 0 警告 -1 失败 -9 未登录
 *      code   1;当result等于0时，触发的各种警告信息
 *      msg  ：“”后端返还的消息
 *      data: object 返回的具体数据 <br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 15:47<br>
 * <br>
 */

public class RespJson {

    public static final int SUCCESS = 1;

    public static final int WARNING = 0;

    public static final int FAIL  =  -1;

    public static final int NOLOGIN = -9;

    /**
     * 作为请求结果
     */
    private  int result;

    /**
     * 作为返回前端的状态码
     */
    private  Integer code;

    /**
     * 返回结果信息
     */
    private  String msg;

    /**
     * 返回数据
     */
    private  Object data;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "RespJson{" +
                "result=" + result +
                ", code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
