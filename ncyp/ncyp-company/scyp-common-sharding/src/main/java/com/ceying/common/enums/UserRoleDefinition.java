/*
 * Copyright (c) 2017 CeYing and/or its affiliates. All rights reserved.
 * CeYing PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package com.ceying.common.enums;

/**
 * Created by 马景锋 on 2017/6/27.
 */
public enum UserRoleDefinition implements BaseEnum<TripartiteAgreementEnum, String>{

    /**
     * 供应商经办岗
     */
    supplierHandler("10000301" , "供应商经办岗"),

    /**
     * 供应商复合岗
     */
    supplierReviewer("10000302", "供应商复合岗"),

    /**
     * 供应商审计岗
     */
    supplierAuditor("10000303" ,"供应商审计岗"),

    /**
     * 核心企业经办岗
     */
    coreCompanyHandler("10000201" , "核心企业经办岗"),

    /**
     * 核心企业复核岗
     */
    coreCompanyReviewer("10000202" ,"核心企业复核岗"),

    /**
     * 核心企业审计岗
     */
    coreCompanyAuditor("10000203","核心企业审计岗"),

    /**
     * 融资提供方经办岗
     */
    bankHandler("10000101" ,"融资提供方经办岗"),

    /**
     * 融资提供方复核岗
     */
    bankReviewer("10000102" , "融资提供方复核岗"),

    /**
     * 融资提供方审计岗
     */
    bankAuditor("10000103","融资提供方审计岗");

    private String key;

    private String value;

    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    UserRoleDefinition(String key, String value) {
        this.key = key;
        this.value = value;
    }
}
