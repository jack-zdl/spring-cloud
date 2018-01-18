package com.ceying.chx.common.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class SysMenuDto implements Serializable {
    private String userId;
    private String subTransName;
    private String relServ;
    private String menuCode;
    private String parentCodeName;
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

    //查询子菜单所用字段
    private String parentName;

    private String attribute1;

    private String attribute2;
    private List<SysMenuDto> children;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getParentCodeName() {
        return parentCodeName;
    }

    public void setParentCodeName(String parentCodeName) {
        this.parentCodeName = parentCodeName;
    }

    /**
     * 菜单缓存用 不存数据库
     */
    private String roleCode;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getSubTransName() {
        return subTransName;
    }

    public void setSubTransName(String subTransName) {
        this.subTransName = subTransName;
    }

    public String getRelServ() {
        return relServ;
    }

    public void setRelServ(String relServ) {
        this.relServ = relServ;
    }

    public List<SysMenuDto> getChildren() {
        return children;
    }

    public void setChildren(List<SysMenuDto> children) {
        this.children = children;
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

    private static final long serialVersionUID = 1L;

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode == null ? null : menuCode.trim();
    }

    public String getKindCode() {
        return kindCode;
    }

    public void setKindCode(String kindCode) {
        this.kindCode = kindCode == null ? null : kindCode.trim();
    }

    public String getTransCode() {
        return transCode;
    }

    public void setTransCode(String transCode) {
        this.transCode = transCode == null ? null : transCode.trim();
    }

    public String getSubTransCode() {
        return subTransCode;
    }

    public void setSubTransCode(String subTransCode) {
        this.subTransCode = subTransCode == null ? null : subTransCode.trim();
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getMenuArg() {
        return menuArg;
    }

    public void setMenuArg(String menuArg) {
        this.menuArg = menuArg == null ? null : menuArg.trim();
    }

    public String getMenuIcon() {
        return menuIcon;
    }

    public void setMenuIcon(String menuIcon) {
        this.menuIcon = menuIcon == null ? null : menuIcon.trim();
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl == null ? null : menuUrl.trim();
    }

    public String getWindowType() {
        return windowType;
    }

    public void setWindowType(String windowType) {
        this.windowType = windowType == null ? null : windowType.trim();
    }

    public String getWindowModel() {
        return windowModel;
    }

    public void setWindowModel(String windowModel) {
        this.windowModel = windowModel == null ? null : windowModel.trim();
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip == null ? null : tip.trim();
    }

    public String getHotKey() {
        return hotKey;
    }

    public void setHotKey(String hotKey) {
        this.hotKey = hotKey == null ? null : hotKey.trim();
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode == null ? null : parentCode.trim();
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
        this.openFlag = openFlag == null ? null : openFlag.trim();
    }

    public String getTreeIdx() {
        return treeIdx;
    }

    public void setTreeIdx(String treeIdx) {
        this.treeIdx = treeIdx == null ? null : treeIdx.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }



    @Override
    public String toString() {
        return "SysMenuDto{" +
                "menuCode='" + menuCode + '\'' +
                ", kindCode='" + kindCode + '\'' +
                ", transCode='" + transCode + '\'' +
                ", subTransCode='" + subTransCode + '\'' +
                ", menuName='" + menuName + '\'' +
                ", menuArg='" + menuArg + '\'' +
                ", menuIcon='" + menuIcon + '\'' +
                ", menuUrl='" + menuUrl + '\'' +
                ", windowType='" + windowType + '\'' +
                ", windowModel='" + windowModel + '\'' +
                ", tip='" + tip + '\'' +
                ", hotKey='" + hotKey + '\'' +
                ", parentCode='" + parentCode + '\'' +
                ", orderNo=" + orderNo +
                ", openFlag='" + openFlag + '\'' +
                ", treeIdx='" + treeIdx + '\'' +
                ", remark='" + remark + '\'' +
                ", parentName='" + parentName + '\'' +
                ", attribute1='" + attribute1 + '\'' +
                ", attribute2='" + attribute2 + '\'' +
                '}';
    }
}