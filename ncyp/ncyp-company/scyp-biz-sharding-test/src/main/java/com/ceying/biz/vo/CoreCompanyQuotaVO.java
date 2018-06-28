package com.ceying.biz.vo;

import com.ceying.common.constant.ConditionTypeConstant;
import com.ceying.common.util.annotation.Condition;

/**
 * @author: mzq
 * @date: 2018/4/24
 * @description :平台给核心企业vo
 * @version: 2.0
 */
public class CoreCompanyQuotaVO {
    //排序字段
    private String sidx;
    //排序类型(降序,升序)
    private String sord;
    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;
    @Condition(type = ConditionTypeConstant.EQUAL)
    private String urid;

    @Condition(type = ConditionTypeConstant.EQUAL)
    private String amountLimits;
    @Condition(type = ConditionTypeConstant.EQUAL)
    private String availableAmount;
    @Condition(type = ConditionTypeConstant.EQUAL)
    private String coreCompanyId;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getAmountLimits() {
        return amountLimits;
    }

    public void setAmountLimits(String amountLimits) {
        this.amountLimits = amountLimits;
    }

    public String getAvailableAmount() {
        return availableAmount;
    }

    public void setAvailableAmount(String availableAmount) {
        this.availableAmount = availableAmount;
    }

    public String getCoreCompanyId() {
        return coreCompanyId;
    }

    public void setCoreCompanyId(String coreCompanyId) {
        this.coreCompanyId = coreCompanyId;
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
