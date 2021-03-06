package com.ceying.chx.common.dto;


import java.io.Serializable;
import java.util.Date;

public class SysTenantDto implements Serializable {

    private static final long serialVersionUID = -8616781924542764948L;
    /** 租户ID */
    private Integer tenantId;

    /** 租户CODE */
    private String tenantCode;

    /** 租户名称 */
    private String tenantName;

    /** 租户英文简称 */
    private String tenantShortname;

    /** 租户中文简称 */
    private String tenantCnshortname;

    /** 0-普通 1-大型 2-集团 */
    private String tenantType;

    /** 0-正常 1-注销 2-禁用 */
    private String tenantStatus;

    /** 固定电话 */
    private String telno;

    /** 地址 */
//    private String address;
//
//    /** 法人 */
//    private String contact;

    /** 法人手机号 */
    private String mobile;

    /** 法人邮箱 */
    private String email;

    /** 备注 */
    private String remark;

    /** 排序 */
    private Integer tenantOrder;

    /** 创建日期 */
    private Date createDate;

    /** 修改日期 */
    private Date modifyDate;

    /** 扩展字段1 */
    private String extField1;

    /** 扩展字段2 */
    private String extField2;

    /** 扩展字段3 */
    private String extField3;

    /** codename*/
    private String codename;

    public String getCodename() {
        return codename;
    }

    public void setCodename(String codename) {
        this.codename = codename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_ID
     *
     * @return the value of TSYS_TENANT.TENANT_ID
     *
     * @mbggenerated
     */
    public Integer getTenantId() {
        return tenantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_ID
     *
     * @param tenantId the value for TSYS_TENANT.TENANT_ID
     *
     * @mbggenerated
     */
    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_CODE
     *
     * @return the value of TSYS_TENANT.TENANT_CODE
     *
     * @mbggenerated
     */
    public String getTenantCode() {
        return tenantCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_CODE
     *
     * @param tenantCode the value for TSYS_TENANT.TENANT_CODE
     *
     * @mbggenerated
     */
    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode == null ? null : tenantCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_NAME
     *
     * @return the value of TSYS_TENANT.TENANT_NAME
     *
     * @mbggenerated
     */
    public String getTenantName() {
        return tenantName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_NAME
     *
     * @param tenantName the value for TSYS_TENANT.TENANT_NAME
     *
     * @mbggenerated
     */
    public void setTenantName(String tenantName) {
        this.tenantName = tenantName == null ? null : tenantName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_SHORTNAME
     *
     * @return the value of TSYS_TENANT.TENANT_SHORTNAME
     *
     * @mbggenerated
     */
    public String getTenantShortname() {
        return tenantShortname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_SHORTNAME
     *
     * @param tenantShortname the value for TSYS_TENANT.TENANT_SHORTNAME
     *
     * @mbggenerated
     */
    public void setTenantShortname(String tenantShortname) {
        this.tenantShortname = tenantShortname == null ? null : tenantShortname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_CNSHORTNAME
     *
     * @return the value of TSYS_TENANT.TENANT_CNSHORTNAME
     *
     * @mbggenerated
     */
    public String getTenantCnshortname() {
        return tenantCnshortname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_CNSHORTNAME
     *
     * @param tenantCnshortname the value for TSYS_TENANT.TENANT_CNSHORTNAME
     *
     * @mbggenerated
     */
    public void setTenantCnshortname(String tenantCnshortname) {
        this.tenantCnshortname = tenantCnshortname == null ? null : tenantCnshortname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_TYPE
     *
     * @return the value of TSYS_TENANT.TENANT_TYPE
     *
     * @mbggenerated
     */
    public String getTenantType() {
        return tenantType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_TYPE
     *
     * @param tenantType the value for TSYS_TENANT.TENANT_TYPE
     *
     * @mbggenerated
     */
    public void setTenantType(String tenantType) {
        this.tenantType = tenantType == null ? null : tenantType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_STATUS
     *
     * @return the value of TSYS_TENANT.TENANT_STATUS
     *
     * @mbggenerated
     */
    public String getTenantStatus() {
        return tenantStatus;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_STATUS
     *
     * @param tenantStatus the value for TSYS_TENANT.TENANT_STATUS
     *
     * @mbggenerated
     */
    public void setTenantStatus(String tenantStatus) {
        this.tenantStatus = tenantStatus == null ? null : tenantStatus.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TELNO
     *
     * @return the value of TSYS_TENANT.TELNO
     *
     * @mbggenerated
     */
    public String getTelno() {
        return telno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TELNO
     *
     * @param telno the value for TSYS_TENANT.TELNO
     *
     * @mbggenerated
     */
    public void setTelno(String telno) {
        this.telno = telno == null ? null : telno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.ADDRESS
     *
     * @return the value of TSYS_TENANT.ADDRESS
     *
     * @mbggenerated
     */
//    public String getAddress() {
//        return address;
//    }
//
//    /**
//     * This method was generated by MyBatis Generator.
//     * This method sets the value of the database column TSYS_TENANT.ADDRESS
//     *
//     * @param address the value for TSYS_TENANT.ADDRESS
//     *
//     * @mbggenerated
//     */
//    public void setAddress(String address) {
//        this.address = address == null ? null : address.trim();
//    }
//
//    /**
//     * This method was generated by MyBatis Generator.
//     * This method returns the value of the database column TSYS_TENANT.CONTACT
//     *
//     * @return the value of TSYS_TENANT.CONTACT
//     *
//     * @mbggenerated
//     */
//    public String getContact() {
//        return contact;
//    }
//
//    /**
//     * This method was generated by MyBatis Generator.
//     * This method sets the value of the database column TSYS_TENANT.CONTACT
//     *
//     * @param contact the value for TSYS_TENANT.CONTACT
//     *
//     * @mbggenerated
//     */
//    public void setContact(String contact) {
//        this.contact = contact == null ? null : contact.trim();
//    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.MOBILE
     *
     * @return the value of TSYS_TENANT.MOBILE
     *
     * @mbggenerated
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.MOBILE
     *
     * @param mobile the value for TSYS_TENANT.MOBILE
     *
     * @mbggenerated
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.EMAIL
     *
     * @return the value of TSYS_TENANT.EMAIL
     *
     * @mbggenerated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.EMAIL
     *
     * @param email the value for TSYS_TENANT.EMAIL
     *
     * @mbggenerated
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.REMARK
     *
     * @return the value of TSYS_TENANT.REMARK
     *
     * @mbggenerated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.REMARK
     *
     * @param remark the value for TSYS_TENANT.REMARK
     *
     * @mbggenerated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.TENANT_ORDER
     *
     * @return the value of TSYS_TENANT.TENANT_ORDER
     *
     * @mbggenerated
     */
    public Integer getTenantOrder() {
        return tenantOrder;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.TENANT_ORDER
     *
     * @param tenantOrder the value for TSYS_TENANT.TENANT_ORDER
     *
     * @mbggenerated
     */
    public void setTenantOrder(Integer tenantOrder) {
        this.tenantOrder = tenantOrder;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.CREATE_DATE
     *
     * @return the value of TSYS_TENANT.CREATE_DATE
     *
     * @mbggenerated
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.CREATE_DATE
     *
     * @param createDate the value for TSYS_TENANT.CREATE_DATE
     *
     * @mbggenerated
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.MODIFY_DATE
     *
     * @return the value of TSYS_TENANT.MODIFY_DATE
     *
     * @mbggenerated
     */
    public Date getModifyDate() {
        return modifyDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.MODIFY_DATE
     *
     * @param modifyDate the value for TSYS_TENANT.MODIFY_DATE
     *
     * @mbggenerated
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.EXT_FIELD_1
     *
     * @return the value of TSYS_TENANT.EXT_FIELD_1
     *
     * @mbggenerated
     */
    public String getExtField1() {
        return extField1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.EXT_FIELD_1
     *
     * @param extField1 the value for TSYS_TENANT.EXT_FIELD_1
     *
     * @mbggenerated
     */
    public void setExtField1(String extField1) {
        this.extField1 = extField1 == null ? null : extField1.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.EXT_FIELD_2
     *
     * @return the value of TSYS_TENANT.EXT_FIELD_2
     *
     * @mbggenerated
     */
    public String getExtField2() {
        return extField2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.EXT_FIELD_2
     *
     * @param extField2 the value for TSYS_TENANT.EXT_FIELD_2
     *
     * @mbggenerated
     */
    public void setExtField2(String extField2) {
        this.extField2 = extField2 == null ? null : extField2.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TSYS_TENANT.EXT_FIELD_3
     *
     * @return the value of TSYS_TENANT.EXT_FIELD_3
     *
     * @mbggenerated
     */
    public String getExtField3() {
        return extField3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TSYS_TENANT.EXT_FIELD_3
     *
     * @param extField3 the value for TSYS_TENANT.EXT_FIELD_3
     *
     * @mbggenerated
     */
    public void setExtField3(String extField3) {
        this.extField3 = extField3 == null ? null : extField3.trim();
    }
}