package com.ceying.chx.common.constants;

/**
 * 组织管理方面的enum
 * @author zhangdl
 * @version enum v1.0
 * @date 2017/6/30 14:17
 */
public
enum OrgCodeEnum {
    OBJECTCODE("OBJECTCODE","objectcode"),  // 提供给组织关系新增时，需要将组织关系表放入map中，这里提供key
    OPPORGCODE("opporgid","opporgid"),  //对方组织id
    OWNORGCODE("ownorgid","ownorgid"),
    ALLOCATETYPE("allocateType","allocateType"),//分配关系类型

    HANDLE("经办","01"),              //银行供应商等经办
    CHECK("复核","02"),                  //银行。。。复核
    VERIFY("审核","03"),              //银行。。。审核

    /**
     * 平台级别
     * terratecate
     */
    TERRACECATE("HANDLECATE","0"),      //平台级别

    /**
     * 银行级别
     */
    BANKCATE("BANKCATE","1"),           //银行级别

    /**
     * 核心企业级别
     */
    CORECATE("CORECATE","2"),           //核心企业级别

    /**
     * 供应商级别
     */
    SUPPLIERCATE("SUPPLIER","3"),       //供应商级别

    /**
     * 用户角色code
     */
    TERRACEROLECODE("TERRACEROLECODE","100000"), //平台角色编码
    TERRACEHANDLEROLECODE("TERRACEHANDLEROLECODE","10000001"),  //平台经办角色编码
    TERRACECHECKROLECODE("TERRACECHECKROLECODE","10000002"),   //平台复核角色编码
    TERRACEVERIFYROLECODE("TERRACECHECKROLECODE","10000003"),  //平台审核角色编码

    BANKROLECODE("BANKROLECODE","100001"),                  //银行角色编码
    BANKHANDLEROLECODE("BANKHANDLEROLECODE","10000101"),  //银行经办角色编码
    BANKCHECKROLECODE("BANKCHECKROLECODE","10000102"),   //银行复核角色编码
    BANKVERIFYROLECODE("BANKVERIFYROLECODE","10000103"), //银行审核角色编码

    COREROLECODE("COREROLECODE","100002"),          //核心企业角色编码
    COREHANDLEROLECODE("COREHANDLEROLECODE","10000201"),        //核心企业经办角色编码
    CORECHECKROLECODE("CORECHECKROLECODE","10000202"),          //核心企业复核角色编码
    COREVERIFYROLECODE("COREVERIFYROLECODE","10000203"),        //核心企业审核角色编码

    SUPPLIERROLECODE("SUPPLIERROLECODE","100003"), //供应商角色编码
    SUPPLIERHANDLEROLECODE("SUPPLIERHANDLEROLECODE","10000301"), //供应商经办角色编码
    SUPPLIERCHECKROLECODE("SUPPLIERCHECKROLECODE","10000302"),   //供应商复核角色编码
    SUPPLIERVERIFYROLECODE("SUPPLIERVERIFYROLECODE","10000303"), //供应商审核角色编码

    ENUM("ENUMkey", "enumvalue");

    private String name;
    private String value;

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }

    OrgCodeEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }
}
