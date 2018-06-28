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
public enum DataCacheKeyEnum implements BaseEnum<DataCacheKeyEnum, String>{

	/**
	 * 租户：tenants
	 */
	TENANTS("tenants","租户"),
	 /**
     * 币种：currencies
     */
    CURRENCIES("currencies","币种"),
    CURRENCIESCODEKEY("currenciescodekey","币种"),



    /**
     * 银行：banks
     */
    BANKS("banks","银行"),
    BANKIDS("bankids","银行"),
    BANKNAME("bankname","银行"),

    /**
     * 日历：calendars
     */
    CALENDARS("calendars","日历"),
    CALENDARSMAP("calendarsmap","日历"),

    /**
     * 核心企业个性化设置：corecompanyindividuation
     */
    CORECOMPANYINDIVIDUATION("corecompanyindividuation","核心企业个性化设置"),

    /**
     * 银行个性化设置：bankindividuation
     */
    BANKINDIVIDUATION("bankindividuation","银行个性化设置"),

    /**
     * 供应商支持业务类型：supplierbusinesstype
     */
    SUPPLIERBUSINESSTYPE("supplierbusinesstype",""),


    /**
     * 账户分组：accountgroup
     */
    ACCOUNTGROUP("accountgroup",""),

    /**
     * 银行账户：accounts
     */
    ACCOUNTS("accounts",""),
    ACCOUNTSNUMBERKEY("accountsnumberkey",""),
    ACCOUNTSLIST("accountslist",""),

    /**
     *银联账号规则:chinapaybankaccountrule
     */
    CHINAPAYBANKACCOUNTRULE("chinapaybankaccountrule",""),
    /**
     * 银行名称智能匹配:banksmartmatch
     */
    BANKSMARTMATCH("banksmartmatch",""),
    /**
     * 单据对象：noteobjects
     */
    NOTEOBJECTS("noteobjects",""),
    /**
     * 开户银行：banklocations
     */
    BANKLOCATIONS("banklocations",""),
    /**
     * 国别：countries
     */
    COUNTRIES("countries",""),
    /**
     * 区域：areas
     */
    AREAS("areas",""),
    /**
     * 交易类型：paytypes
     */
    PAYTYPES("paytypes",""),
    /**
     * 交易对手账户：counterpartyaccounts
     */
    COUNTERPARTYACCOUNTS("counterpartyaccounts",""),
    /**
     * 交易对手：counterparties
     */
    COUNTERPARTIES("counterparties",""),
    /**
     * 结算方式：settlementmodes
     */
    SETTLEMENTMODES("settlementmodes",""),
    /**
     * 联行号为键值的缓存信息
     */
    CNAPS("cnaps",""),
    /**
     * 开户银行联行名缓存
     */
    CNAPSBANKLOCATION_NAME("cnapsbanklocation_name",""),
    /**
     * 开户银行默认联行号缓存
     */
    CNAPSBANKLOCATION_DEFAULT("cnapsbanklocation_default",""),
    /**
     * 开户银行普通联行号缓存
     */
    CNAPSBANKLOCATION_COMMON("cnapsbanklocation_common",""),
    /**
     * 开户银行总行缓存
     */
    CNAPSBANKLOCATION_MAIN("cnapsbanklocation_main",""),

    /**
     * 报销配置：ReimburseService
     */
    REIMBURSESERVICE("ReimburseService",""),
    /**
     * 结算方式直联配置：settlementmodedirectcfg_modebankcurr
     */
    SETTLEMENTMODEDIRECTCFG_MODEBANKCURR("settlementmodedirectcfg_modebankcurr",""),
    /**
     * 直联渠道
     */
    DIRECTCHANNELS("directchannels",""),
    /**
     * 直联渠道指令
     */
    DIRECTCHANNELCMDS("directchannelcmds",""),
    /**
     * 直联跨行系统
     */
    DIRECTINTERBANKSYSTEMS("directinterbanksystems",""),

    /**
     * 直联支付状态码
     */
    DIRECTPAYSTATES("directpaystates",""),

    /**
     * 外部系统
     */
    OUTSYSTEM("outsystem",""),
    OUTSYSTEMCODE("outsystemcode",""),
    OUTSYSTEMNAME("outsystemname",""),
    OUTSYSTEMCODETOID("outsystemcodetoid",""),
    OUTSYSTEMCODETONAME("outsystemcodetoname",""),

    /**
     * 组织
     */
    ORGANIZATION("organization",""),
    ORGANIZATIONID("organizationid",""),
    ORGANIZATIONPATH("organizationpath",""),
    ORGANIZATIONNAME("organizationname",""),
    ORGANIZATIONAll("organizationall",""),


    /**
     * 组织关系
     */
    ORGANIZATIONRELATION("organizationrelation",""),

    /**
     * 大合同利率
     */
    BIGCONTRACTRATE("bigcontractrate",""),
    /**
     * 对接规则
     */
    DTSRULEDETAIL("dtsruledetail",""),
    EXTSYSTEMCONF("extsystemconf",""),
    CHANNELSERVICECONF("channelserviceconf",""),
    RULEANALYSIS("ruleanalysis",""),

    /**
     * 线路指令
     */
    ACCESSCMD("accesscmd",""),

    /**
     * t_sr_dtsextobjects表
     */
    DTSEXTMAINDATA("dtsextmaindata",""),
    /**
     * 申诉类型
     */
    APPEALTYPE("appealtype",""),

    /**
     * 系统参数
     */
    SYSPARAM("sysparam",""),

    /**
     * 系统参数值
     */
    PARAMVALBYDEF("paramvalbydef",""),

    /**
     * 系统参数定义
     */
    PARAMDEFBYCODE("paramdefbycode",""),

    /**
     * DtsExtDataLookup表
     */
    LOOKUP("lookup",""),

    DTS_BUSINESS_DETAIL("dtsobjbusinessdetail",""),

    DTS_ACCESS_CMD_SCHEMA("dtsaccesscmdaccountsscheme",""),

    GATEWAY("gateway",""),

    GATEWAY_CONFIG("gatewayconfig",""),

    SYSTEM_CONFIG("systemconfig","");

    // 定义私有变量
    private String key;
    
    private String value;



    @Override
    public String getKey() {
        return key;
    }

    @Override
    public String getValue() {
        return value;
    }

    /**
    *  构造函数，枚举类型只能为私有
    * @Param:
    * @return:
    * @Author: zhangdl
    * @Date: 2018/4/8
    */
    DataCacheKeyEnum(String key,String value) {
        this.key = key;
        this.value = value;
    }

    private static final Map<String, DataCacheKeyEnum> map = new TreeMap<String, DataCacheKeyEnum>();

    static {
        map.put(CURRENCIES.getKey(), CURRENCIES);
        map.put(BANKS.getKey(), BANKS);
        map.put(BANKIDS.getKey(), BANKIDS);
        map.put(BANKNAME.getKey(), BANKNAME);
        map.put(ACCOUNTGROUP.getKey(), ACCOUNTGROUP);
        map.put(ACCOUNTS.getKey(), ACCOUNTS);
        map.put(ACCOUNTSNUMBERKEY.getKey(), ACCOUNTSNUMBERKEY);
        map.put(NOTEOBJECTS.getKey(), NOTEOBJECTS);
        map.put(SETTLEMENTMODES.getKey(), SETTLEMENTMODES);
        map.put(BANKLOCATIONS.getKey(),BANKLOCATIONS);
        map.put(COUNTRIES.getKey(), COUNTRIES);
        map.put(AREAS.getKey(), AREAS);
        map.put(PAYTYPES.getKey(), PAYTYPES);
        map.put(COUNTERPARTYACCOUNTS.getKey(), COUNTERPARTYACCOUNTS);
        map.put(COUNTERPARTIES.getKey(), COUNTERPARTIES);

        map.put(CALENDARS.getKey(), CALENDARS);
        map.put(CORECOMPANYINDIVIDUATION.getKey(), CORECOMPANYINDIVIDUATION);
        map.put(BANKINDIVIDUATION.getKey(),BANKINDIVIDUATION);
        map.put(SUPPLIERBUSINESSTYPE.getKey(),SUPPLIERBUSINESSTYPE);
        //----------------------联行号匹配缓存部分--------------------------开始
        map.put(CNAPSBANKLOCATION_NAME.getKey(), CNAPSBANKLOCATION_NAME);
        map.put(CNAPSBANKLOCATION_DEFAULT.getKey(), CNAPSBANKLOCATION_DEFAULT);
        map.put(CNAPSBANKLOCATION_COMMON.getKey(), CNAPSBANKLOCATION_COMMON);
        map.put(CNAPSBANKLOCATION_MAIN.getKey(), CNAPSBANKLOCATION_MAIN);
        //----------------------联行号匹配缓存部分--------------------------结束
        
        map.put(SETTLEMENTMODEDIRECTCFG_MODEBANKCURR.getKey(), SETTLEMENTMODEDIRECTCFG_MODEBANKCURR);
        map.put(DIRECTCHANNELS.getKey(), DIRECTCHANNELS);
        map.put(DIRECTCHANNELCMDS.getKey(), DIRECTCHANNELCMDS);
        map.put(DIRECTINTERBANKSYSTEMS.getKey(), DIRECTINTERBANKSYSTEMS);
        map.put(DIRECTPAYSTATES.getKey(), DIRECTPAYSTATES);
        map.put(OUTSYSTEM.getKey(), OUTSYSTEM);
        map.put(OUTSYSTEMCODE.getKey(), OUTSYSTEMCODE);
        map.put(OUTSYSTEMNAME.getKey(), OUTSYSTEMNAME);
        map.put(OUTSYSTEMCODETOID.getKey(), OUTSYSTEMCODETOID);
        map.put(OUTSYSTEMCODETONAME.getKey(), OUTSYSTEMCODETONAME);
        map.put(ORGANIZATION.getKey(), ORGANIZATION);
        map.put(ORGANIZATIONID.getKey(), ORGANIZATIONID);
        map.put(ORGANIZATIONNAME.getKey(), ORGANIZATIONNAME);
        map.put(ORGANIZATIONPATH.getKey(), ORGANIZATIONPATH);
        map.put(DTSRULEDETAIL.getKey(), DTSRULEDETAIL);
        map.put(RULEANALYSIS.getKey(), RULEANALYSIS);
        map.put(EXTSYSTEMCONF.getKey(), EXTSYSTEMCONF);
        map.put(CHANNELSERVICECONF.getKey(), CHANNELSERVICECONF);
        map.put(ACCESSCMD.getKey(), ACCESSCMD);
        map.put(DTSEXTMAINDATA.getKey(), DTSEXTMAINDATA);
        map.put(LOOKUP.getKey(), LOOKUP);
        map.put(DTS_BUSINESS_DETAIL.getKey(), DTS_BUSINESS_DETAIL);
        map.put(GATEWAY.getKey(), GATEWAY);
        map.put(SYSTEM_CONFIG.getKey(), SYSTEM_CONFIG);
        map.put(APPEALTYPE.getKey(), APPEALTYPE);
    }

}
