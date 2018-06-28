package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.enums.ProtocolEnum;
import com.ceying.common.util.annotation.CacheConver;
import com.ceying.common.util.annotation.EnumConver;

/**
 * 功能说明:  协议模板query  <br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间:2018/6/6 14:59<br>
 * <br>
 */
public class ProtocolQuery {
    private String urid;

    @EnumConver(enumType =ProtocolEnum.class )
    private String type;

    private String id;
    @EnumConver(enumType = ProtocolEnum.class)
    private String protocoltype;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String bankid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String coreid;
    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;

    private String description;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProtocoltype() {
        return protocoltype;
    }

    public void setProtocoltype(String protocoltype) {
        this.protocoltype = protocoltype;
    }

    public String getBankid() {
        return bankid;
    }

    public void setBankid(String bankid) {
        this.bankid = bankid;
    }

    public String getCoreid() {
        return coreid;
    }

    public void setCoreid(String coreid) {
        this.coreid = coreid;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProtocolQuery(String urid, String type, String id, String protocoltype, String bankid, String coreid, String supplierid, String description) {
        this.urid = urid;
        this.type = type;
        this.id = id;
        this.protocoltype = protocoltype;
        this.bankid = bankid;
        this.coreid = coreid;
        this.supplierid = supplierid;
        this.description = description;
    }

    public ProtocolQuery() {
    }
}
