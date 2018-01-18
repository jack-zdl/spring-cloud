package com.ceying.chx.common.entity;

import java.io.Serializable;

public class TdictionaryEntity implements Serializable {

    private static final long serialVersionUID = 3083255454761601738L;

    private String cSysname;

    private Integer lKeyno;

    private String cKeyvalue;

    private String cCaption;

    private String cModify;

    private String cMemo;

    private String cEnglish;

    private Integer lOrder;

    public String getcSysname() {
        return cSysname;
    }

    public void setcSysname(String cSysname) {
        this.cSysname = cSysname == null ? null : cSysname.trim();
    }

    public Integer getlKeyno() {
        return lKeyno;
    }

    public void setlKeyno(Integer lKeyno) {
        this.lKeyno = lKeyno;
    }

    public String getcKeyvalue() {
        return cKeyvalue;
    }

    public void setcKeyvalue(String cKeyvalue) {
        this.cKeyvalue = cKeyvalue == null ? null : cKeyvalue.trim();
    }

    public String getcCaption() {
        return cCaption;
    }

    public void setcCaption(String cCaption) {
        this.cCaption = cCaption == null ? null : cCaption.trim();
    }

    public String getcModify() {
        return cModify;
    }

    public void setcModify(String cModify) {
        this.cModify = cModify == null ? null : cModify.trim();
    }

    public String getcMemo() {
        return cMemo;
    }

    public void setcMemo(String cMemo) {
        this.cMemo = cMemo == null ? null : cMemo.trim();
    }

    public String getcEnglish() {
        return cEnglish;
    }

    public void setcEnglish(String cEnglish) {
        this.cEnglish = cEnglish == null ? null : cEnglish.trim();
    }

    public Integer getlOrder() {
        return lOrder;
    }

    public void setlOrder(Integer lOrder) {
        this.lOrder = lOrder;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", cSysname=").append(cSysname);
        sb.append(", lKeyno=").append(lKeyno);
        sb.append(", cKeyvalue=").append(cKeyvalue);
        sb.append(", cCaption=").append(cCaption);
        sb.append(", cModify=").append(cModify);
        sb.append(", cMemo=").append(cMemo);
        sb.append(", cEnglish=").append(cEnglish);
        sb.append(", lOrder=").append(lOrder);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}