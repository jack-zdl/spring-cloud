package com.ceying.biz.query;

import com.ceying.common.constant.CacheKeyConstant;
import com.ceying.common.util.annotation.CacheConver;

import java.util.Date;

/**
 * @author: lidf
 * @date: 2018/4/23
 * @description:
 * @version: 2.0
 */
public class FinanceApplicationQuery {

    private Date applydate;
    private String payableno;

    @CacheConver(cacheType = CacheKeyConstant.ORGNAMEMAP)
    private String supplierid;

    private String signaturecontent;
    private String urid;
    private String templatecode;
    private String templatecontent;
    private String templatename;


    public Date getApplydate() {
        return applydate;
    }

    public void setApplydate(Date applydate) {
        this.applydate = applydate;
    }

    public String getPayableno() {
        return payableno;
    }

    public void setPayableno(String payableno) {
        this.payableno = payableno;
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid;
    }

    public String getSignaturecontent() {
        return signaturecontent;
    }

    public void setSignaturecontent(String signaturecontent) {
        this.signaturecontent = signaturecontent;
    }

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public String getTemplatecode() {
        return templatecode;
    }

    public void setTemplatecode(String templatecode) {
        this.templatecode = templatecode;
    }

    public String getTemplatecontent() {
        return templatecontent;
    }

    public void setTemplatecontent(String templatecontent) {
        this.templatecontent = templatecontent;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
    }
}
