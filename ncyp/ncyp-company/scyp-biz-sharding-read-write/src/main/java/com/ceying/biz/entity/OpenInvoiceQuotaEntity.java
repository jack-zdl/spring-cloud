package com.ceying.biz.entity;


import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 功能说明: 开票额度实体类
 * 系统版本: 1.0 <br>
 * 开发人员: lidf
 * 开发时间: 2017/12/18<br>
 * <br>
 */
@Table(name = "t_biz_openinvoicequota")
public class OpenInvoiceQuotaEntity extends CommonBaseObject implements Serializable {
    private static final long serialVersionUID = -5504301444875384930L;

    /**
     * 主键ID
     */
    @Id
    private String urid;

    /**
     * 组织机构ID
     */
    private String orgid;

    /**
     * 总金额
     */
    private BigDecimal amount;

    /**
     * 已开票金额
     */
    private BigDecimal usedamount;

    /**
     * 可开票金额
     */

    private BigDecimal availableamount;

    /**
     * 描述
     */
    private String description;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getUsedamount() {
        return usedamount;
    }

    public void setUsedamount(BigDecimal usedamount) {
        this.usedamount = usedamount;
    }

    public BigDecimal getAvailableamount() {
        return availableamount;
    }

    public void setAvailableamount(BigDecimal availableamount) {
        this.availableamount = availableamount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
