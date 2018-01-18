package com.ceying.chx.common.dto.organization;

import com.ceying.chx.common.entity.OrganizationEntity;

/**
 * 功能说明: 组织dto<br>
 * 系统版本: 2.0 <br>
 * 开发人员: zhangdl <br>
 * 开发时间: 2018/1/15 16:53<br>
 */

public class OrganizationDto extends OrganizationEntity{

    /**
     * 页面需要的id属性
     */
    private String urid;

    /**
     * 前端页面展示
     */
    private String  codename;

    /**
     *
     * @return
     */
    public
    String getUrid() {
        return urid;
    }

    /**
     *
     * @param urid
     * @return
     */
    public
    OrganizationDto setUrid(String urid) {
        this.urid = urid;
        return this;
    }

    /**
     *
     * @return
     */
    public
    String getCodename() {
        return codename;
    }

    /**
     *
     * @param codename
     * @return
     */
    public
    OrganizationDto setCodename(String codename) {
        this.codename = codename;
        return this;
    }
}
