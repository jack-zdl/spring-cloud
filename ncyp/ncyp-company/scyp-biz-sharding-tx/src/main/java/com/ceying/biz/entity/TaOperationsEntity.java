package com.ceying.biz.entity;

import com.ceying.common.base.CommonBaseObject;
import com.ceying.common.util.datetools.DateUtil;
import com.ceying.common.util.sequence.SequenceUtil;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * @author: zhangdl<br>
 * @date: 2018/4/23 10:08<br>
 * @version: 2.0 <br>
 * @description: <br>
 */
@Table(name = "t_biz_taoperations")
public class TaOperationsEntity  extends CommonBaseObject implements Serializable {

    /**
     * 主键ID
     */
    @Id
    private String urid;

    /**
     * 三方协议ID
     */
    private String tripartiteagreementid;

    /** 
    * 签约标识
    */ 
    private String operateFlag;

    /**
     * 签名信息
     */
    private String signature;

    public
    String getUrid() {
        return urid;
    }

    public
    void setUrid(String urid) {
        this.urid = urid;
    }

    public
    String getTripartiteagreementid() {
        return tripartiteagreementid;
    }

    public
    void setTripartiteagreementid(String tripartiteagreementid) {
        this.tripartiteagreementid = tripartiteagreementid;
    }

    public
    String getSignature() {
        return signature;
    }

    public
    void setSignature(String signature) {
        this.signature = signature;
    }

    public
    TaOperationsEntity() {
    }

    public
    String getOperateFlag() {
        return operateFlag;
    }

    public
    void setOperateFlag(String operateFlag) {
        this.operateFlag = operateFlag;
    }

    /**
     * 全参构造函数
     * @param createdby 创建人
     * @param tripartiteagreementid 三方协议ID
     * @param signature 签名信息
     */
    public TaOperationsEntity(String createdby,
                                  String tripartiteagreementid,
                                  String signature) {
        super(createdby, DateUtil.getCurrentDateTime(), 1);
        this.urid = SequenceUtil.UUID();
        this.tripartiteagreementid = tripartiteagreementid;
        this.signature = signature;
    }

    /**
     * 全参构造函数
     * @param createdby 创建人
     * @param tripartiteagreementid 三方协议ID
     * @param signature 签名信息
     */
    public TaOperationsEntity(String createdby,
                              String tripartiteagreementid,
                              String operateFlag,
                              String signature) {
        super(createdby, DateUtil.getCurrentDateTime(), 1);
        this.urid = SequenceUtil.UUID();
        this.tripartiteagreementid = tripartiteagreementid;
        this.operateFlag = operateFlag;
        this.signature = signature;
    }

}
