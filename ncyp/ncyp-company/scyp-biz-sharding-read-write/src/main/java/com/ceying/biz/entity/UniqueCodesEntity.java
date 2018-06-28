package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author: zhangdl<br>
 * @date: 2018/3/30 10:37<br>
 * @version: 2.0 <br>
 * @description: 唯一码表<br>
 */
@Table(name = "t_biz_uniquecodes")
public class UniqueCodesEntity extends CommonBaseObject implements Serializable {

    @Id
    private String keyname;

    private String keyvalue;
    @Id
    private String orgid;

    public String getKeyname() {
        return keyname;
    }

    public void setKeyname(String keyname) {
        this.keyname = keyname;
    }

    public String getKeyvalue() {
        return keyvalue;
    }

    public void setKeyvalue(String keyvalue) {
        this.keyvalue = keyvalue;
    }

    public String getOrgid() {
        return orgid;
    }

    public void setOrgid(String orgid) {
        this.orgid = orgid;
    }

    @Override
    public String toString() {
        return "BizUniqueCodes{" +
                "createdby='" + createdby + '\'' +
                ", createdon=" + createdon +
                ", lastmodifiedby='" + lastmodifiedby + '\'' +
                ", lastmodifiedon=" + lastmodifiedon +
                ", rowversion=" + rowversion +
                ", keyname='" + keyname + '\'' +
                ", keyvalue='" + keyvalue + '\'' +
                ", orgid='" + orgid + '\'' +
                '}';
    }
}
