package com.ceying.biz.entity;


import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Table;
import java.io.Serializable;

/**
 * 功能说明: T_biz_TIMESTAMP
 * 系统版本: 1.0 <br>
 * 开发人员: yangxh
 * 开发时间: 2018/3/6<br>
 * <br>
 */
@Table(name ="t_biz_timestamp")
public class TimestampEntity extends CommonBaseObject implements Serializable {


    private static final long serialVersionUID = 6812573471392423014L;


    private String urid;
    private byte[] timestamp;
    private String id;

    public String getUrid() {
        return urid;
    }

    public void setUrid(String urid) {
        this.urid = urid;
    }

    public byte[] getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(byte[] timestamp) {
        this.timestamp = timestamp;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
