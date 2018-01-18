package com.ceying.chx.common.enums;



public enum EnumSysParam {
	OUTOFTIMEOFEXPIRATION("银行签约超期天数","SET001"),
	LIGHTPENALTIES("供应商作废轻惩罚扣减服务费比例","SET002"),
	HEAVYPENALTIES("供应商作废重惩罚扣减服务费比例","SET003"),
	TIMEQUOTES("优先行报价时间（小时）","SET004"),
	FUELACCOUNTINITIALBALANCE("燃料账户初始余额","SET005"),
	RECOMMENDEDNUMBER("优先行申请支持行资格推荐核心企业数量","SET006"),
	TOTALFINANCING("优先行申请支持行资格单个核心企业融资总额","SET007"),
	CONFIRMATIONOFVALIDITY("融资确认书有效期","SET008"),
	AUTOMATICLENDINGTIME("三方协议签署后N天自动放款","SET009"),
	FREEZEACCOUNTTIME("应付账款到期后N天冻结核心企业交易账户余额","SET010"),
	CHECKFIELD("应付账款导入防止双花校验字段","SET011"),
	MARGINFREEZERATIO("供应商提交融资意愿保证金冻结比例","SET012"),
	MAXIMUMAMOUNTPAYABLE("供应商第一次先融资后交费允许应付账款最大金额","SET013"),
	ISCREATEAUTOMATICALLY("核心企业应付账款是否审批之后自动创建用户等信息","SET014"),
	DISCOUNTLOWERLIMIT("银行报价折扣下限比例","SET015"),
	NOTALLOWEDWITHDRAWTIME("供应商审批通过N天之内不允许撤销","SET016"),
	NOTALLOWEDPUBLISHTIME("应付账款到期不足N天不允许发布","SET017"),
	AUTOMATICPAYMENTTIME("银行放款后N天自动给付核心企业服务费（冻结状态）","SET018"),
	ACCOUNTSPAYABLERATIO("供应商融资金额不能低于应付账款比例","SET019"),
	ISNEEDSIGN("反向保理额度合同审批是否需要签名","SET020"),
	ACCOUNTSPAYABLEEXPIRATIONTIME("第一个银行报价结束后的日期大于应付账款过期时间+N天，扣保证金","SET021"),
	;

	private String name;//结算系统参数对应的code
	private String code;//结算系统参数对应的code

	EnumSysParam(String name,String code) {
		this.name = name;
		this.code=code;
	}


}
