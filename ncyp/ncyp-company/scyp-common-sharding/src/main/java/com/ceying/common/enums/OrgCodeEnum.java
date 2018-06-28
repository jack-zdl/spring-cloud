package com.ceying.common.enums;

/**
 * 功能说明: <br>
 * 系统版本: 2.0 <br>
 * 开发人员: miaozhenqing
 * 开发时间: 2018/3/12<br>
 * <br>
 */
public enum  OrgCodeEnum implements BaseEnum <OrgCodeEnum, String>{
    HANDLE("01","经办"),
    CHECK("02","复核"),
    VERIFY("03","审核"),

    /**
     * 平台级别
     * terratecate
     */
    TERRACECATE("0","HANDLECATE"),      //平台级别

    /**
     * 银行级别
     */
    BANKCATE("1","BANKCATE"),           //银行级别

    /**
     * 企业级别
     */
    COMPANYCATE("2","COMPANYCATE"),           //核心企业级别


    /**
     * 用户角色code
     */
    TERRACEROLECODE("100000","TERRACEROLECODE"), //平台角色编码
    TERRACEHANDLEROLECODE("10000001","TERRACEHANDLEROLECODE"),  //平台经办角色编码
    TERRACECHECKROLECODE("10000002","TERRACECHECKROLECODE"),   //平台复核角色编码
    TERRACEVERIFYROLECODE("10000003","TERRACECHECKROLECODE"),  //平台审核角色编码

    BANKROLECODE("100001","BANKROLECODE"),                  //银行角色编码
    BANKHANDLEROLECODE("10000101","BANKHANDLEROLECODE"),  //银行经办角色编码
    BANKCHECKROLECODE("10000102","BANKCHECKROLECODE"),   //银行复核角色编码
    BANKVERIFYROLECODE("10000103","BANKVERIFYROLECODE"), //银行审核角色编码

    COMPANYROLECODE("100002","COMPANYROLECODE"),          //企业角色编码
    COMPANYHANDLEROLECODE("10000201","COREHANDLEROLECODE"),        //企业经办角色编码
    COMPANYCHECKROLECODE("10000202","CORECHECKROLECODE"),          //企业复核角色编码
    COMPANYVERIFYROLECODE("10000203","COREVERIFYROLECODE"),      //企业审核角色编码

    SUPPLIERROLECODE("100003","SUPPLIERROLECODE"), //供应商角色编码
    SUPPLIERHANDLEROLECODE("10000301","SUPPLIERHANDLEROLECODE"), //供应商经办角色编码
    SUPPLIERCHECKROLECODE("10000302","SUPPLIERCHECKROLECODE"),   //供应商复核角色编码
    SUPPLIERVERIFYROLECODE("10000303","SUPPLIERVERIFYROLECODE"); //供应商审核角色编码

    String key;
    String value;

    private OrgCodeEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String value) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
