package com.ceying.biz.entity;


import com.ceying.common.base.CommonBaseObject;

import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 预警消息实体类
 */
@Table(name = "t_biz_warningmessages")
public class WarningMessagesEntity extends CommonBaseObject implements Serializable{

	private static final long serialVersionUID = 5465750433276840130L;

	/**
	 * 主键ID
	 */
	private String urid;

	/**
	 * 预警规则
	 */
	private String warningruleid;

	/**
	 * 预警日期
	 */
	private Date warningdate;

	/**
	 * 消息
	 */
	private String messages;

	/**
	 * 预警来源id
	 */
	private String sourceid;

	/**
	 * 预警来源code
	 */
	private String sourcecode;

	/**
	 * 消息通知人
	 */
	private String userid;

	/**
	 * 是否撤销
	 */
	private String isannul;

	/**
	 * 获得主键id
	 * @return
	 */
	public
	String getUrid() {
		return urid;
	}

	/**
	 * 设置主键id
	 * @param urid
	 * @return
	 */
	public WarningMessagesEntity setUrid(String urid) {
		this.urid = urid;
		return this;
	}

	/**
	 * 获得预警规则
	 * @return
	 */
	public
	String getWarningruleid() {
		return warningruleid;
	}

	/**
	 * 设置预警规则
	 * @param warningruleid
	 * @return
	 */
	public WarningMessagesEntity setWarningruleid(String warningruleid) {
		this.warningruleid = warningruleid;
		return this;
	}

	/**
	 * 获得预警时间
	 * @return
	 */
	public
	Date getWarningdate() {
		return warningdate;
	}

	/**
	 * 设置预警日期
	 * @param warningdate
	 * @return
	 */
	public WarningMessagesEntity setWarningdate(Date warningdate) {
		this.warningdate = warningdate;
		return this;
	}

	/**
	 * 获得消息
	 * @return
	 */
	public
	String getMessages() {
		return messages;
	}

	/**
	 * 设置消息
	 * @param messages
	 * @return
	 */
	public WarningMessagesEntity setMessages(String messages) {
		this.messages = messages;
		return this;
	}

	/**
	 * 获得预警来源id
	 * @return
	 */
	public
	String getSourceid() {
		return sourceid;
	}

	/**
	 * 设置预警来源id
	 * @param sourceid
	 * @return
	 */
	public WarningMessagesEntity setSourceid(String sourceid) {
		this.sourceid = sourceid;
		return this;
	}

	/**
	 * 获得预警code
	 * @return
	 */
	public
	String getSourcecode() {
		return sourcecode;
	}

	/**
	 * 设置预警code
	 * @param sourcecode
	 * @return
	 */
	public WarningMessagesEntity setSourcecode(String sourcecode) {
		this.sourcecode = sourcecode;
		return this;
	}

	/**
	 * 获得消息通知人
	 * @return
	 */
	public
	String getUserid() {
		return userid;
	}

	/**
	 * 设置消息通知人
	 * @param userid
	 * @return
	 */
	public WarningMessagesEntity setUserid(String userid) {
		this.userid = userid;
		return this;
	}

	/**
	 * 获得是否撤销
	 * @return
	 */
	public
	String getIsannul() {
		return isannul;
	}

    /* 设置是否撤销
	 * @param isnull
	 * @return
     */
	public WarningMessagesEntity setIsannul(String isannul) {
		this.isannul = isannul;
		return this;
	}

	public
    WarningMessagesEntity() {
	}

	public
    WarningMessagesEntity(String createdby, Date createdon, Integer rowversion, String urid, String warningruleid, Date warningdate, String messages, String sourceid, String sourcecode, String userid, String isannul) {
		super(createdby, createdon, rowversion);
		this.urid = urid;
		this.warningruleid = warningruleid;
		this.warningdate = warningdate;
		this.messages = messages;
		this.sourceid = sourceid;
		this.sourcecode = sourcecode;
		this.userid = userid;
		this.isannul = isannul;
	}

	@Override
	public
	String toString() {
		return "WarningMessages{" +
				"createdby='" + createdby + '\'' +
				", createdon=" + createdon +
				", lastmodifiedby='" + lastmodifiedby + '\'' +
				", lastmodifiedon=" + lastmodifiedon +
				", rowversion=" + rowversion +
				", urid='" + urid + '\'' +
				", warningruleid='" + warningruleid + '\'' +
				", warningdate=" + warningdate +
				", messages='" + messages + '\'' +
				", sourceid='" + sourceid + '\'' +
				", sourcecode='" + sourcecode + '\'' +
				", userid='" + userid + '\'' +
				", isnull=" + isannul +
				'}';
	}

}
