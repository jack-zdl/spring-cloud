package com.ceying.chx.common.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class SysMenuDto implements Serializable {
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
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", menuCode=").append(menuCode);
        sb.append(", kindCode=").append(kindCode);
        sb.append(", transCode=").append(transCode);
        sb.append(", subTransCode=").append(subTransCode);
        sb.append(", menuName=").append(menuName);
        sb.append(", menuArg=").append(menuArg);
        sb.append(", menuIcon=").append(menuIcon);
        sb.append(", menuUrl=").append(menuUrl);
        sb.append(", windowType=").append(windowType);
        sb.append(", windowModel=").append(windowModel);
        sb.append(", tip=").append(tip);
        sb.append(", hotKey=").append(hotKey);
        sb.append(", parentCode=").append(parentCode);
        sb.append(", orderNo=").append(orderNo);
        sb.append(", openFlag=").append(openFlag);
        sb.append(", treeIdx=").append(treeIdx);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}