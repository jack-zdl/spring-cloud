package com.ceying.chx.common.system.constants;

public interface BaseConstants {
    /** 子交易代码,用户注销 */
    public static final String CLOSE = "close";

    /** 子交易代码,激活 */
    public static final String ACTIVE = "active";

	/**
	 * 请求中资源代码变量
	 */
	public static final String REQUEST_RESCODE = "resCode";
	
	/**
	 * 请求中操作代码变量
	 */
	public static final String REQUEST_OPCODE = "opCode";

	/**
	 * 错误码
	 */
	public static final String ERR_CODE = "ERR_CODE";
	
	/**
	 * 错误信息
	 */
    public static final String ERR_MSG = "ERR_MSG";

    /**
     * 校验码
     */
    public static final String ERR_FLAG = "ERR_FLAG";

    /**
     * 大额支付校验信息
     */
    public static final String FLAG_MSG = "FLAG_MSG";

    /**
     * 重复支付校验信息
     */
    public static final String FLAG_MSG_CF = "FLAG_MSG_CF";
    /**
	 * 操作成功
	 */
    public static final String SUCCESS = "PUB0001";
    
    /**
	 * 错误异常信息码
	 */
    public static final String EXCEPTION = "PUB0002";
    
    /**
	 * 交易配置不存在
	 */
    public static final String NOTEXISTRESOCODE = "PUB0005";
    
    /**
	 * 子交易配置不存在
	 */
    public static final String NOTEXISTOPERCODE = "PUB0006";

    /**
     * 用户重复登录
     */
    public static final String USERLOGINAGAIN = "userloginagain";

    /** 子交易代码,新增 */
    public static final String ADD = "add";

	/** 子交易代码,修改 */
    public static final String EDIT = "edit";

	/** 子交易代码,删除 */
    public static final String DEL = "del";

    /** 子交易代码,撤销 */
    public static final String CANCEL = "cancel";

    /** 子交易代码,送审 */
    public static final String SEND = "sendapprove";

    /** 银行设置核心企业优先权开关-开*/
    public static final String START = "start";

    /** 银行设置核心企业优先权开关-关*/
    public static final String STOP = "stop";
    
    /**超级租户SUPERTENANT*/
    public static final String SUPERTENANT = "10000";

    /*登录用户*/
    public static final String USER = "user";

    //默认配置的是UTF-8
    public static final String ENCODING_UTF8 = "UTF-8";

    public static final String ENCODING_GBK = "GBK";

    //全渠道固定值
    public static final String VERSION = "5.0.0";


    //一年天数
    public static final int YEARDAYS = 360;

    public static final String ROOTORGID = "6000001"; //平台的组织ID



}
