package com.ceying.chx.common.util.response;

/**
 * 功能说明:  定义返回的数据类型 <br>
 *      result  1;求结果 1成功 0 警告 -1 失败 -9 未登录 <br>
 *      code   1; 状态码 当result等于0时，触发的各种警告信息 <br>
 *      msg  ：结果信息 “”后端返还的消息 <br>
 *      data: 数据总条数  返回数据 object 返回的具体数据 <br>
 *      totalCount：int  返回数据总条数<br>
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
     * 返回数据总条数
     */
    private Integer totalCount;

    /**
     * 返回数据
     */
    private  Object data;


    /**
     * 获得请求结果
     * @return int
     */
    public int getResult() {
        return result;
    }

    /**
     * 设置请求结果
     * @param result 请求结果
     */
    public void setResult(int result) {
        this.result = result;
    }

    /**
     * 获得状态码
     * @return integer
     */
    public Integer getCode() {
        return code;
    }

    /**
     * 设置状态码
     * @param code 状态码
     */
    public void setCode(Integer code) {
        this.code = code;
    }

    /**
     * 获得结果信息
     * @return String 结果信息
     */
    public String getMsg() {
        return msg;
    }

    /**
     * 设置结果信息
     * @param msg 结果信息
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * 获得返回数据
     * @return Object 返回数据
     */
    public Object getData() {
        return data;
    }

    /**
     * 设置返回数据
     * @param data 返回数据
     */
    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 获得数据总条数
     * @return int
     */
    public Integer getTotalCount() {
        return totalCount;
    }

    /**
     * 设置数据总条数
     * @param totalCount
     */
    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    @Override
    public
    String toString() {
        return "RespJson{" +
                "result=" + result +
                ", code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                ", totalCount=" + totalCount +
                '}';
    }
}
