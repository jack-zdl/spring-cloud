package com.ceying.biz.vo;

import com.ceying.biz.config.validate.First;
import com.ceying.biz.config.validate.Four;
import com.ceying.biz.config.validate.Second;
import com.ceying.biz.config.validate.Three;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * first 当新增三方协议时Vo类
 * second 拼接签约模板信息
 * four 还款参数
 * @author: zhangdl<br>
 * @date: 2018/3/28 16:57<br>
 * @version: 2.0 <br>
 */

public class TripartiteAgreementVO {
    /**
    * 三方协议id
    */
    @NotNull(groups = {Three.class, Four.class})
    private String id;
    /**
     * 应付账款信息实体类ID
     */
    @NotNull(groups = {First.class, Second.class})
    @Size(min = 1,groups = {Second.class})
    private String accountspayableid;

    /**
     * 应付账款报价实体类ID
     * 质押的结算账户id
     */
    private String accounturid;

    /**
     * 结算账户ID
     */
    @NotNull(groups = {First.class,Second.class})
    @Size(min = 1,groups = {Second.class})
    private String accountspayablequoteid;

    /**
     * 当前应付账款报价的版本号
     */
    @NotNull(groups = {First.class})
    private String version;

    /**
     * 状态（用来判断是否满足申请融资大于折扣后的金额）
     */
    @NotNull(groups = {First.class})
    private Boolean status;
    /**
     * 签名
     */
    @NotNull(groups = {First.class})
    private String signs;

    /**
     * 模板内容
     */
    @NotNull(groups = {First.class})
    private String context;

    /**
    * 还款日期
    */
    @NotNull(groups = {Four.class})
    private String lending;

    /**
    * 删除附件keys
    */
//    @NotNull(groups = {Four.class})
    private String ids;
    //拒绝类型
    private String rejectType;

    /**
     * 页码
     */
    private Integer page;
    /**
     * 行数
     */
    private Integer rows;

    /**
     * 用户id
     */
    private String orgId;

    /**
     * 融资提供方ID
     */
    private String bankid;

    /**
     * 核心企业ID
     */
    private String corecompanyid;

    /**
     * 供应商ID
     */
    private String supplierid;
    private String sidx;
    private String sord;

    private String financingamount;
    private String payableno;
    private String contractid;
    private Date billdate;
    private Date expiringdate;
    private  String corecompanyname;

    public String getFinancingamount() {
        return financingamount;
    }

    public void setFinancingamount(String financingamount) {
        this.financingamount = financingamount;
    }

    public Date getBilldate() {
        return billdate;
    }

    public void setBilldate(Date billdate) {
        this.billdate = billdate;
    }

    public Date getExpiringdate() {
        return expiringdate;
    }

    public void setExpiringdate(Date expiringdate) {
        this.expiringdate = expiringdate;
    }

    public String getCorecompanyname() {
        return corecompanyname;
    }

    public void setCorecompanyname(String corecompanyname) {
        this.corecompanyname = corecompanyname;
    }

    public String getContractid() {
        return contractid;
    }

    public void setContractid(String contractid) {
        this.contractid = contractid;
    }

    public String getPayableno() {
        return payableno;
    }

    public void setPayableno(String payableno) {
        this.payableno = payableno;
    }

    public
    String getId() {
        return id;
    }

    public
    void setId(String id) {
        this.id = id;
    }

    public
    String getAccountspayableid() {
        return accountspayableid;
    }

    public
    void setAccountspayableid(String accountspayableid) {
        this.accountspayableid = accountspayableid;
    }

    public
    String getAccounturid() {
        return accounturid;
    }

    public
    void setAccounturid(String accounturid) {
        this.accounturid = accounturid;
    }

    public
    String getAccountspayablequoteid() {
        return accountspayablequoteid;
    }

    public
    void setAccountspayablequoteid(String accountspayablequoteid) {
        this.accountspayablequoteid = accountspayablequoteid;
    }

    public
    String getVersion() {
        return version;
    }

    public
    void setVersion(String version) {
        this.version = version;
    }

    public
    Boolean getStatus() {
        return status;
    }

    public
    void setStatus(Boolean status) {
        this.status = status;
    }

    public
    String getSigns() {
        return signs;
    }

    public
    void setSigns(String signs) {
        this.signs = signs;
    }

    public
    String getContext() {
        return context;
    }

    public
    void setContext(String context) {
        this.context = context;
    }

    public
    Integer getPage() {
        return page;
    }

    public
    void setPage(Integer page) {
        this.page = page;
    }

    public
    Integer getRows() {
        return rows;
    }

    public
    void setRows(Integer rows) {
        this.rows = rows;
    }

    public
    String getOrgId() {
        return orgId;
    }

    public
    void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public
    String getLending() {
        return lending;
    }

    public
    void setLending(String lending) {
        this.lending = lending;
    }

    public
    String getIds() {
        return ids;
    }

    public
    void setIds(String ids) {
        this.ids = ids;
    }

    public
    String getRejectType() {
        return rejectType;
    }

    public
    void setRejectType(String rejectType) {
        this.rejectType = rejectType;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getCorecompanyid() {
        return corecompanyid;
    }

    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
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
}
