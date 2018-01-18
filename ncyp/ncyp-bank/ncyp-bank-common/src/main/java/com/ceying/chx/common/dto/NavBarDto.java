package com.ceying.chx.common.dto;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.math.BigDecimal;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2018/1/5<br>
 * <br>
 */
@Table(name = "tsys_menu")
public class NavBarDto {
    /*menu_code VARCHAR primary key, kind_code VARCHAR, trans_code VARCHAR,
    sub_trans_code VARCHAR, menu_name VARCHAR, menu_arg VARCHAR,
    menu_icon VARCHAR, menu_url VARCHAR, window_type VARCHAR,
    window_model VARCHAR, tip VARCHAR, hot_key VARCHAR,
    parent_code VARCHAR, order_no VARCHAR, open_flag VARCHAR,
    tree_idx VARCHAR, remark VARCHAR*/
    @Id
    @Column(name = "menu_code")
    private String menuCode;
    private String kindCode;
    private String transCode;
    private String subTransCode;
    private String menuName;
    private String menuArg;
    private String menuIcon;

    private String menuUrl;
    private String windowType;
    private String windowModel;
    private String tip;
    private String hotKey;
    private String parentCode;
    private BigDecimal orderNo;

    private String openFlag;
    private String treeIdx;
    private String remark;
    @Transient
    private String parentName;
    @Transient
    private String attribute1;
    @Transient
    private String attribute2;
    @Transient
    private String userId;
    @Transient
    private String id;
    @Transient
    private String name;
    @Transient
    private List<NavBarDto> children;

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getKindCode() {
        return kindCode;
    }

    public void setKindCode(String kindCode) {
        this.kindCode = kindCode;
    }

    public String getTransCode() {
        return transCode;
    }

    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }

    public String getSubTransCode() {
        return subTransCode;
    }

    public void setSubTransCode(String subTransCode) {
        this.subTransCode = subTransCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuArg() {
        return menuArg;
    }

    public void setMenuArg(String menuArg) {
        this.menuArg = menuArg;
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getWindowType() {
        return windowType;
    }

    public void setWindowType(String windowType) {
        this.windowType = windowType;
    }

    public String getWindowModel() {
        return windowModel;
    }

    public void setWindowModel(String windowModel) {
        this.windowModel = windowModel;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getHotKey() {
        return hotKey;
    }

    public void setHotKey(String hotKey) {
        this.hotKey = hotKey;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public BigDecimal getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(BigDecimal orderNo) {
        this.orderNo = orderNo;
    }

    public String getOpenFlag() {
        return openFlag;
    }

    public void setOpenFlag(String openFlag) {
        this.openFlag = openFlag;
    }

    public String getTreeIdx() {
        return treeIdx;
    }

    public void setTreeIdx(String treeIdx) {
        this.treeIdx = treeIdx;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    public List<NavBarDto> getChildren() {
        return children;
    }

    public void setChildren(List<NavBarDto> children) {
        this.children = children;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
