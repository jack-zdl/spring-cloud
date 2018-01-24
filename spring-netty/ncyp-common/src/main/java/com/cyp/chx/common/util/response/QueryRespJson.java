package com.cyp.chx.common.util.response;

import java.util.List;

/**
 * 功能说明: 提供给页面查询使用的类<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 16:03<br>
 */
public class QueryRespJson {

    /**
     * 页面数目
     */
    private  String page;

    /**
     * 作为返回前端的状态码
     */
    private List rows;

    /**
     * 返回数据总条数
     */
    private Integer total;

    /**
     * 返回总页数
     */
    private  Integer totalpage;

    public
    String getPage() {
        return page;
    }

    public
    QueryRespJson setPage(String page) {
        this.page = page;
        return this;
    }

    public
    List getRows() {
        return rows;
    }

    public
    QueryRespJson setRows(List rows) {
        this.rows = rows;
        return this;
    }

    public
    Integer getTotal() {
        return total;
    }

    public
    QueryRespJson setTotal(Integer total) {
        this.total = total;
        return this;
    }

    public
    Integer getTotalpage() {
        return totalpage;
    }

    public
    QueryRespJson setTotalpage(Integer totalpage) {
        this.totalpage = totalpage;
        return this;
    }

}
