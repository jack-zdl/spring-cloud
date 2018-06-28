package com.ceying.biz.vo;


import com.ceying.common.util.annotation.Condition;

/**
 * 三方协议模板管理的VO类
 * 可以直接在front上使用
 * @TODO 验证三方协议模板的新增或者修改的参数（对象）是否符合要求
 * @author zhangdl
 * @version v1.0
 * @date 2017/6/20 10:31
 */
public class TripartiteagreementTemplateVo {


    /**
     * 三方协议模板ID
     */
    @Condition
    private String urid;

    /**
     * 融资提供方ID
     */
    @Condition
    private String bankid;

    /**
     * 核心企业ID
     */
    @Condition
    private String corecompanyid;

    /**
     * 有效无效
     */
    @Condition
    private String isactive;

    /**
     * 修改版本
     */
    private Integer rowversion;

    /**
     * 描述
     */
    private String description;

    /**
     * 模板内容
     */
    private String container;

    /**
     * 业务类型
     */
    @Condition
    private String businesstype;

    /**
     * 合同编号
     */
    @Condition
    private String tatemplatecode;

    /**
     * 操作标志
     */
    @Condition
    private String lastoperateflag;

    //页码
    private Integer page=1;
    //行数
    private Integer rows=50;


    /**
     *  得到三方协议模板ID
     * @return
     */
    public
    String getUrid() {
        return urid;
    }

    /**
     *  设置三方协议模板ID
     * @param urid
     */
    public
    void setUrid(String urid) {
        this.urid = urid;
    }

    /**
     *
     * @return 得到融资提供方ID
     */
    public String getBankid() {
        return bankid;
    }

    /**
     * 设置融资提供方ID
     * @param bankid
     */
    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    /**
     * 得到核心企业ID
     * @return
     */
    public String getCorecompanyid() {
        return corecompanyid;
    }

    /**
     * 设置核心企业ID
     * @param corecompanyid
     */
    public void setCorecompanyid(String corecompanyid) {
        this.corecompanyid = corecompanyid;
    }


    /**
     * 得到是否有效
     * @return
     */
    public String getIsactive() {
        return isactive;
    }

    /**
     * 设置是否有效
     * @param isactive
     */
    public void setIsactive(String isactive) {
        this.isactive = isactive;
    }

    /**
     * 得到版本号
     * @return
     */
    public
    Integer getRowversion() {
        return rowversion;
    }

    /**
     * 设置版本号
     * @param rowversion
     */
    public
    void setRowversion(Integer rowversion) {
        this.rowversion = rowversion;
    }

    /**
     * 得到描述
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置描述
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }


    public String getcontainer() {
        return container;
    }


    public void setcontainer(String container) {
        this.container = container;
    }


    public String getBusinesstype() {return businesstype;}

    public void setBusinesstype(String businesstype) {this.businesstype = businesstype;}

    public String getTatemplatecode() {return tatemplatecode;}

    public void setTatemplatecode(String tatemplatecode) {this.tatemplatecode = tatemplatecode;}

    public String getLastoperateflag() {
        return lastoperateflag;
    }

    public void setLastoperateflag(String lastoperateflag) {
        this.lastoperateflag = lastoperateflag;
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

    /**
     * 无参构造函数
     */
    public TripartiteagreementTemplateVo() {
    }



    public
    String toString() {
        return "TripartiteagreementTemplateVo{" +
                "urid='" + urid + '\'' +
                ", bankid='" + bankid + '\'' +
                ", corecompanyid='" + corecompanyid + '\'' +
                ", isactive='" + isactive + '\'' +
                ", rowversion=" + rowversion +
                ", description='" + description + '\'' +
                ", businesstype='" + businesstype + '\'' +
                ", container=" + container +
                '}';
    }
}
