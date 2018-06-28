package com.ceying.biz.vo;

/**
 * @author: mzq
 * @date: 2018/5/22
 * @description :单据对象vo
 * @version: 2.0
 */
public class NoteObjectVO {
    //排序字段
    private String sidx;
    //排序类型(降序,升序)
    private String sord;
    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;

    private String isactive;

    public String getIsactive() {
        return isactive;
    }

    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
