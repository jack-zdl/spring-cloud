package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 功能说明: <br>
 * 系统版本: 0.1 <br>
 * 开发人员: xuty
 * 开发时间: 2016/11/14<br>
 * <br>
 */
public enum NoteCodeTypeEnum {
	/**
	 * 账户申请单 ZS
	 */
	ZS("ZS"),

	/**
	 * 账户信息单 ZH
	 */
	ZH("ZH"),

	/**
	 * 资金申请单 SQ
	 */
	SQ("SQ"),

	/**
	 * 差额申请单 CS
	 */
	CS("CS"),

	/**
	 * 抽调获取申请单 CD
	 */
	CD("CD"),

	/**
	 * 资金计划单 JH
	 */
	JH("JH"),

	/**
	 * 资金计划汇总单 HZ
	 */
	HZ("HZ"),

	/**
	 * 资金计划调整单 TZ
	 */
	TZ("TZ"),

	/**
	 * 收款交易单 SJ
	 */
	SJ("SJ"),

	/**
	 * 付款申请单 FS
	 */
	FS("FS"),

	/**
	 * 收款申请单 SS
	 */
	SS("SS"),

	/**
	 * 余额调节表 TJ
	 */
	TJ("TJ"),

	/**
	 * 付款交易单 FJ
	 */
	FJ("FJ"),

	/**
	 * 付款交易单 系统批号PS
	 */
	PS("PS"),

	/**
	 * 清算代码QS
	 */
	QS("QS"),

	/**
	 *对账码
	 */
	AB("AB"),

	/**
	 *流水号
	 */
	AS("AS"),

	/**
	 *支付批号
	 */
	RN("RN"),

	/**
	 * 付款交易拆分号CF
	 */
	CF("CF"),

	/**
	 * 记账批号
	 */
	JZ("JZ"),

	/**
	 * 对账批号
	 */
	DZ("DZ"),

	/**
	 * 余额调节表编号BA("BA"),balanceajust
	 */
	BA("BA"),

	/**
	 * 支票号ZP("ZP"),
	 */
	ZP("ZP"),

	/**
	 * 核对批号("HD"),
	 */
	HD("HD");

	private String noteType;

	NoteCodeTypeEnum(String noteType) {
		this.noteType = noteType;
	}

	public String getValue() {
		return this.noteType;
	}

    private static final Map<String, NoteCodeTypeEnum> map = new TreeMap<String, NoteCodeTypeEnum>();

    static{
        map.put(ZS.getValue(), ZS);
        map.put(ZH.getValue(), ZH);
        map.put(SQ.getValue(), SQ);
        map.put(CS.getValue(), CS);
        map.put(CD.getValue(), CD);
        map.put(JH.getValue(), JH);
        map.put(HZ.getValue(), HZ);
        map.put(TZ.getValue(), TZ);
        map.put(SJ.getValue(), SJ);
        map.put(FS.getValue(), FS);
        map.put(SS.getValue(), SS);
        map.put(TJ.getValue(), TJ);
        map.put(FJ.getValue(), FJ);
        map.put(PS.getValue(), PS);
        map.put(QS.getValue(), QS);
        map.put(AB.getValue(), AB);
        map.put(AS.getValue(), AS);
        map.put(RN.getValue(), RN);
        map.put(CF.getValue(), CF);
        map.put(JZ.getValue(), JZ);
        map.put(DZ.getValue(), DZ);
        map.put(BA.getValue(), BA);
        map.put(ZP.getValue(), ZP);
        map.put(HD.getValue(), HD);
    }
}
