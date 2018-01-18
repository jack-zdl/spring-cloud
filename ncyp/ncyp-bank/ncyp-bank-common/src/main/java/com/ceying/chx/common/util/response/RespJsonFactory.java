package com.ceying.chx.common.util.response;

import java.util.List;

/**
 * 功能说明: 返回对象的静态工厂类<br>
 * 系统版本: 1.0 <br>
 * 开发人员: zhangdl
 * 开发时间: 2017/11/6 15:48<br>
 * <br>
 */

public class RespJsonFactory {

    private static final String NOTLOGIN = "用户未登录";

    /**
     * 成功只有返回请求结果的方法
     * @return RespJson
     */
    public static RespJson buildSuccess() {
        return buildInfo(RespJson.SUCCESS, null, null, null, null);
    }

    /**
     * 成功返回请求结果和结果信息的方法
     * @param msg 结果信息
     * @return RespJson
     */
    public static RespJson buildSuccess(String msg) {
        return buildInfo(RespJson.SUCCESS, null, msg, null,null);
    }

    /**
     * 警告返回请求结果和结果信息的方法
     * @param msg 结果信息
     * @return RespJson
     */
    public static RespJson buildWarning(String msg) {
        return buildInfo(RespJson.WARNING, null, msg, null,null);
    }

    /**
     * 警告返回请求结果和结果信息的方法
     * @param msg 结果信息
     * @return RespJson
     */
    public static RespJson buildWarning(Integer code,String msg) {
        return buildInfo(RespJson.WARNING, code, msg, null,null);
    }

    /**
     * 成功返回请求结果和结果信息和数据
     * @param msg 结果信息
     * @param data 数据
     * @return  RespJson
     */
    public static RespJson buildSuccess(String msg, Object data) {
        return buildInfo(RespJson.SUCCESS, null, msg, data,null);
    }

    /**
     * 成功返回请求结果和结果信息和数据和总数
     * @param msg 结果信息
     * @param data 数据
     * @param totalCount  数据总条数
     * @return RespJson
     */
    public static RespJson buildSuccess(String msg, Object data,Integer totalCount){
        return buildInfo(RespJson.SUCCESS, null, msg, data,totalCount);
    }


    public static RespJson buildSuccess(Object data) {
        return buildInfo(RespJson.SUCCESS, null, null, data,null);
    }

    /**
     * 请求失败返回结果信息
     * @param msg 结果信息
     * @return RespJson
     */
    public static RespJson buildFailure(String msg) {
        return buildInfo(RespJson.FAIL, null, msg, null,null);
    }

    /**
     * 请求失败返回状态码和信息
     * @param code 状态码
     * @param msg 结果信息
     * @return RespJson
     */
    public static RespJson buildFailure(Integer code,String msg) {
        return buildInfo(RespJson.FAIL, null, msg, null,null);
    }

    public static RespJson buildNotLogin() {
        return buildInfo(RespJson.NOLOGIN, null, NOTLOGIN, null,null);
    }



    /**
     *
     * @param result 结果类型
     * @param code 状态码
     * @param msg 结果信息
     * @param data 数据
     * @param totalCount  数据总条数
     * @return RespJson 返回数据类
     */
    private static RespJson buildInfo(int result, Integer code, String msg, Object data,Integer totalCount) {
        RespJson respJson = new RespJson();
        respJson.setResult(result);
        respJson.setCode(code);
        respJson.setMsg(msg);
        respJson.setData(data);
        return respJson;
    }

    /**
     * 成功返回结果
     * @param page 当前页数
     * @param rows 数据
     * @param total 数据总数
     * @param totalpage 总共页数
     * @return QueryRespJson
     */
    public static QueryRespJson buildSuccess(String page, List rows , Integer total,Integer totalpage) {
        return buildInfo(page, rows, total,totalpage);
    }

    /**
     * 成功返回结果
     * @param text 字典中文名称
     * @param value 字典数字
     * @return QueryRespJson
     */
    public static ParamRespJson buildSuccess(String text, String value) {
        System.out.println("ParamRespJson");
        ParamRespJson  paramRespJson = buildInfo(text, value);
        return paramRespJson;
    }

    /**
     * 返回查询返回结果
     * @param page
     * @param rows
     * @param total
     * @param totalpage
     * @return
     */
    private static QueryRespJson buildInfo(String page, List rows , Integer total,Integer totalpage){
        QueryRespJson queryRespJson = new QueryRespJson();
        queryRespJson.setPage(page);
        queryRespJson.setRows(rows);
        queryRespJson.setTotal(total);
        queryRespJson.setTotalpage(totalpage);
        return queryRespJson;
    }

    /**
     * 返回字典对象
     * @param text
     * @param value
     * @return
     */
    private static ParamRespJson buildInfo(String text,String value){
        ParamRespJson paramRespJson = new ParamRespJson();
        paramRespJson.setText(text);
        paramRespJson.setValue(value);
        return paramRespJson;
    }
}
