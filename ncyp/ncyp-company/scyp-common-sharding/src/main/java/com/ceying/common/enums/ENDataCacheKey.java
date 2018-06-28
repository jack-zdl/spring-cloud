package com.ceying.common.enums;

import java.util.Map;
import java.util.TreeMap;

/**
 * 功能说明: 系统基础数据缓存对象<br>
 * 系统版本: 0.1 <br>
 * 开发人员: chx
 * 开发时间: 2016/10/21<br>
 * <br>
 */
public enum ENDataCacheKey {

	/**
	 * 租户：tenants
	 */
	TENANTS("tenants"),
	 /**
     * 币种：currencies
     */
    CURRENCIES("currencies"),
    CURRENCIESCODEKEY("currenciescodekey"),



    /**
     * 银行：banks
     */
    BANKS("banks"),
    BANKIDS("bankids"),
    BANKNAME("bankname"),

    /**
     * 日历：calendars
     */
    CALENDARS("calendars"),
    CALENDARSMAP("calendarsmap"),

    /**
     * 核心企业个性化设置：corecompanyindividuation
     */
    CORECOMPANYINDIVIDUATION("corecompanyindividuation"),

    /**
     * 银行个性化设置：bankindividuation
     */
    BANKINDIVIDUATION("bankindividuation"),

    /**
     * 供应商支持业务类型：supplierbusinesstype
     */
    SUPPLIERBUSINESSTYPE("supplierbusinesstype"),


    /**
     * 账户分组：accountgroup
     */
    ACCOUNTGROUP("accountgroup"),

    /**
     * 银行账户：accounts
     */
    ACCOUNTS("accounts"),
    ACCOUNTSNUMBERKEY("accountsnumberkey"),
    ACCOUNTSLIST("accountslist"),

    /**
     *银联账号规则:chinapaybankaccountrule
     */
    CHINAPAYBANKACCOUNTRULE("chinapaybankaccountrule"),
    /**
     * 银行名称智能匹配:banksmartmatch
     */
    BANKSMARTMATCH("banksmartmatch"),
    /**
     * 单据对象：noteobjects
     */
    NOTEOBJECTS("noteobjects"),
    /**
     * 开户银行：banklocations
     */
    BANKLOCATIONS("banklocations"),
    /**
     * 国别：countries
     */
    COUNTRIES("countries"),
    /**
     * 区域：areas
     */
    AREAS("areas"),
    /**
     * 交易类型：paytypes
     */
    PAYTYPES("paytypes"),
    /**
     * 交易对手账户：counterpartyaccounts
     */
    COUNTERPARTYACCOUNTS("counterpartyaccounts"),
    /**
     * 交易对手：counterparties
     */
    COUNTERPARTIES("counterparties"),
    /**
     * 结算方式：settlementmodes
     */
    SETTLEMENTMODES("settlementmodes"),
    /**
     * 联行号为键值的缓存信息
     */
    CNAPS("cnaps"),
    /**
     * 开户银行联行名缓存
     */
    CNAPSBANKLOCATION_NAME("cnapsbanklocation_name"),
    /**
     * 开户银行默认联行号缓存
     */
    CNAPSBANKLOCATION_DEFAULT("cnapsbanklocation_default"),
    /**
     * 开户银行普通联行号缓存
     */
    CNAPSBANKLOCATION_COMMON("cnapsbanklocation_common"),
    /**
     * 开户银行总行缓存
     */
    CNAPSBANKLOCATION_MAIN("cnapsbanklocation_main"),
    
    /**
     * 报销配置：ReimburseService
     */
    REIMBURSESERVICE("ReimburseService"),
    /**
     * 结算方式直联配置：settlementmodedirectcfg_modebankcurr
     */
    SETTLEMENTMODEDIRECTCFG_MODEBANKCURR("settlementmodedirectcfg_modebankcurr"),
    /**
     * 直联渠道
     */
    DIRECTCHANNELS("directchannels"),
    /**
     * 直联渠道指令
     */
    DIRECTCHANNELCMDS("directchannelcmds"),
    /**
     * 直联跨行系统
     */
    DIRECTINTERBANKSYSTEMS("directinterbanksystems"),

    /**
     * 直联支付状态码
     */
    DIRECTPAYSTATES("directpaystates"),

    /**
     * 外部系统
     */
    OUTSYSTEM("outsystem"),
    OUTSYSTEMCODE("outsystemcode"),
    OUTSYSTEMNAME("outsystemname"),
    OUTSYSTEMCODETOID("outsystemcodetoid"),
    OUTSYSTEMCODETONAME("outsystemcodetoname"),

    /**
     * 组织
     */
    ORGANIZATION("organization"),
    ORGANIZATIONID("organizationid"),
    ORGANIZATIONPATH("organizationpath"),
    ORGANIZATIONNAME("organizationname"),
    ORGANIZATIONAll("organizationall"),


    /**
     * 组织关系
     */
    ORGANIZATIONRELATION("organizationrelation"),

    /**
     * 大合同利率
     */
    BIGCONTRACTRATE("bigcontractrate"),
    /**
     * 对接规则
     */
    DTSRULEDETAIL("dtsruledetail"),
    EXTSYSTEMCONF("extsystemconf"),
    CHANNELSERVICECONF("channelserviceconf"),
    RULEANALYSIS("ruleanalysis"),

    /**
     * 线路指令
     */
    ACCESSCMD("accesscmd"),

    /**
     * t_sr_dtsextobjects表
     */
    DTSEXTMAINDATA("dtsextmaindata"),
    /**
     * 申诉类型
     */
    APPEALTYPE("appealtype"),

    /**
     * 系统参数
     */
    SYSPARAM("sysparam"),

    /**
     * 系统参数值
     */
    PARAMVALBYDEF("paramvalbydef"),

    /**
     * 系统参数定义
     */
    PARAMDEFBYCODE("paramdefbycode"),

    /**
     * DtsExtDataLookup表
     */
    LOOKUP("lookup"),

    DTS_BUSINESS_DETAIL("dtsobjbusinessdetail"),

    DTS_ACCESS_CMD_SCHEMA("dtsaccesscmdaccountsscheme"),

    GATEWAY("gateway"),

    GATEWAY_CONFIG("gatewayconfig"),

    SYSTEM_CONFIG("systemconfig");




    // 定义私有变量
    private String dataCacheKey;

    // 构造函数，枚举类型只能为私有
    ENDataCacheKey(String dataCacheKey) {
        this.dataCacheKey = dataCacheKey;
    }

    public String getValue() {
        return dataCacheKey;
    }

    private static final Map<String, ENDataCacheKey> map = new TreeMap<String, ENDataCacheKey>();

    static {
        map.put(CURRENCIES.getValue(), CURRENCIES);
        map.put(BANKS.getValue(), BANKS);
        map.put(BANKIDS.getValue(), BANKIDS);
        map.put(BANKNAME.getValue(), BANKNAME);
        map.put(ACCOUNTGROUP.getValue(), ACCOUNTGROUP);
        map.put(ACCOUNTS.getValue(), ACCOUNTS);
        map.put(ACCOUNTSNUMBERKEY.getValue(), ACCOUNTSNUMBERKEY);
        map.put(NOTEOBJECTS.getValue(), NOTEOBJECTS);
        map.put(SETTLEMENTMODES.getValue(), SETTLEMENTMODES);
        map.put(BANKLOCATIONS.getValue(),BANKLOCATIONS);
        map.put(COUNTRIES.getValue(), COUNTRIES);
        map.put(AREAS.getValue(), AREAS);
        map.put(PAYTYPES.getValue(), PAYTYPES);
        map.put(COUNTERPARTYACCOUNTS.getValue(), COUNTERPARTYACCOUNTS);
        map.put(COUNTERPARTIES.getValue(), COUNTERPARTIES);

        map.put(CALENDARS.getValue(), CALENDARS);
        map.put(CORECOMPANYINDIVIDUATION.getValue(), CORECOMPANYINDIVIDUATION);
        map.put(BANKINDIVIDUATION.getValue(),BANKINDIVIDUATION);
        map.put(SUPPLIERBUSINESSTYPE.getValue(),SUPPLIERBUSINESSTYPE);
        //----------------------联行号匹配缓存部分--------------------------开始
        map.put(CNAPSBANKLOCATION_NAME.getValue(), CNAPSBANKLOCATION_NAME);
        map.put(CNAPSBANKLOCATION_DEFAULT.getValue(), CNAPSBANKLOCATION_DEFAULT);
        map.put(CNAPSBANKLOCATION_COMMON.getValue(), CNAPSBANKLOCATION_COMMON);
        map.put(CNAPSBANKLOCATION_MAIN.getValue(), CNAPSBANKLOCATION_MAIN);
        //----------------------联行号匹配缓存部分--------------------------结束
        
        map.put(SETTLEMENTMODEDIRECTCFG_MODEBANKCURR.getValue(), SETTLEMENTMODEDIRECTCFG_MODEBANKCURR);
        map.put(DIRECTCHANNELS.getValue(), DIRECTCHANNELS);
        map.put(DIRECTCHANNELCMDS.getValue(), DIRECTCHANNELCMDS);
        map.put(DIRECTINTERBANKSYSTEMS.getValue(), DIRECTINTERBANKSYSTEMS);
        map.put(DIRECTPAYSTATES.getValue(), DIRECTPAYSTATES);
        map.put(OUTSYSTEM.getValue(), OUTSYSTEM);
        map.put(OUTSYSTEMCODE.getValue(), OUTSYSTEMCODE);
        map.put(OUTSYSTEMNAME.getValue(), OUTSYSTEMNAME);
        map.put(OUTSYSTEMCODETOID.getValue(), OUTSYSTEMCODETOID);
        map.put(OUTSYSTEMCODETONAME.getValue(), OUTSYSTEMCODETONAME);
        map.put(ORGANIZATION.getValue(), ORGANIZATION);
        map.put(ORGANIZATIONID.getValue(), ORGANIZATIONID);
        map.put(ORGANIZATIONNAME.getValue(), ORGANIZATIONNAME);
        map.put(ORGANIZATIONPATH.getValue(), ORGANIZATIONPATH);
        map.put(DTSRULEDETAIL.getValue(), DTSRULEDETAIL);
        map.put(RULEANALYSIS.getValue(), RULEANALYSIS);
        map.put(EXTSYSTEMCONF.getValue(), EXTSYSTEMCONF);
        map.put(CHANNELSERVICECONF.getValue(), CHANNELSERVICECONF);
        map.put(ACCESSCMD.getValue(), ACCESSCMD);
        map.put(DTSEXTMAINDATA.getValue(), DTSEXTMAINDATA);
        map.put(LOOKUP.getValue(), LOOKUP);
        map.put(DTS_BUSINESS_DETAIL.getValue(), DTS_BUSINESS_DETAIL);
        map.put(GATEWAY.getValue(), GATEWAY);
        map.put(SYSTEM_CONFIG.getValue(), SYSTEM_CONFIG);
        map.put(APPEALTYPE.getValue(), APPEALTYPE);
    }

}
