package com.ceying.common.enums;

public enum ExceptionCodeEnum implements BaseEnum<ExceptionCodeEnum, String> {
    //scyp-system
    SYS0001("SYS0001","该融资提供方给该企业额度信息已存在"),
    SYS0002("SYS0002","操作成功！"),
    SYS0003("SYS0003","不存在此用户"),
    SYS0004("SYS0004","保存登录记录失败"),
    SYS0005("SYS0005","更新登录记录失败"),
    SYS0006("SYS0006","密码错误"),
    SYS0007("SYS0007","获取租户信息失败"),
    SYS0008("SYS0008","已存在相同手机号的有效用户，请确认"),
    SYS0009("SYS0009","新增用户失败"),
    SYS0010("SYS0010","更新用户失败"),
    SYS0011("SYS0011","获取用户信息失败"),
    SYS0012("SYS0012","用户不能重复禁用"),
    SYS0013("SYS0013","用户注销失败"),
    SYS0014("SYS0014","用户不能重复激活"),
    SYS0015("SYS0015","用户激活失败"),
    SYS0016("SYS0016","密码长度至少为8位"),
    SYS0017("SYS0017","密码必须包含大，小写字母，数字和特殊符号四项中的至少三项"),
    SYS0018("SYS0018","输入的密码为空"),
    SYS0019("SYS0019","新旧密码重复"),
    SYS0020("SYS0020","获取用户信息失败"),
    SYS0021("SYS0021","用户密码重置失败"),
    SYS0022("SYS0022","用户权限新增失败"),
    SYS0023("SYS0023","用户权限删除失败"),
    SYS0024("SYS0024","用户权限修改失败"),
    SYS0025("SYS0025","用户已注销"),
    SYS0026("SYS0026","用户密码输错次数已达上限，用户被禁用"),
    SYS0027("SYS0027","用户密码输错次数已达上限，锁定用户失败"),
    SYS0028("SYS0028","菜单{0}存在子菜单，请先删除子菜单"),
    SYS0029("SYS0029","已移至最底部"),
    SYS0030("SYS0030","已移至最顶部"),
    SYS0031("SYS0031","没有指定上级菜单"),
    SYS0032("SYS0032","没有菜单名"),
    SYS0033("SYS0033","没有菜单编号"),
    SYS0034("SYS0034","没有分类编号"),
    SYS0035("SYS0035","该菜单已存在"),
    SYS0036("SYS0036","菜单编码为空或不存在"),
    SYS0037("SYS0037","组织机构编码不能为空"),
    SYS0038("SYS0038","组织机构编码已经存在"),
    SYS0039("SYS0039","组织下存在下级组织，不允许删除"),
    SYS0040("SYS0040","组织下存在用户"),
    SYS0041("SYS0041","已经存在优先行"),
    SYS0042("SYS0042","3年内不允许更换优先银行"),
    SYS0043("SYS0043","组织名称已存在"),
    SYS0044("SYS0044","组织下存在交易账户，无法初始化"),
    SYS0045("SYS0045","组织下存在燃料账户，无法初始化"),
    SYS0046("SYS0046","银行与核心企业下的供应商已建立关系，请取消关系后重试"),
    SYS0047("SYS0047","所选组织级别应低于上级组织的组织级别"),
    SYS0048("SYS0048","租户英文名称只能包含数字和英文"),
    SYS0049("SYS0049","套餐编码已存在"),
    SYS0050("SYS0050","用户名错误"),
    SYS0051("SYS0051","名称为{0}的计划任务已经存在，请修改后保存"),
    SYS0052("SYS0052","任务开启失败"),
    SYS0053("SYS0053","日历更新失败"),
    SYS0054("SYS0054","时间点格式输入不对"),
    SYS0055("SYS0055","间隔天数不能超过31天"),
    SYS0056("SYS0056","间隔天数不能超过31天"),
    SYS0057("SYS0057","你选择的时间设置不存在，请查看"),
    SYS0058("SYS0058","任务 {0} 正在运行，请稍候再试"),
    SYS0059("SYS0059","{0}"),
    SYS0060("SYS0060","任务不存在"),
    SYS0061("SYS0061","任务{0}已经启动，不允许再启动"),
    SYS0062("SYS0062","任务{0}已经暂停，不允许再暂停"),
    SYS0063("SYS0063","任务{0}时间设置不符合要求"),
    SYS0064("SYS0064","任务调用函数{0}入参个数与数据库配置不符,请检查数据库表配置"),
    SYS0065("SYS0065","计划信息中的日期区间格式不对，请重新设置"),
    //scyp-biz

    BIZ0001("BIZ0001","平台给该企业额度信息已存在"),
    BIZ0002("BIZ0002","{0}"),
    BIZ0003("BIZ0003","该专户账号已存在"),
    BIZ0004("BIZ0004","业务类型已存在对应账户"),
    BIZ0005("BIZ0005","没有对应的优先行信息"),
    BIZ0006("BIZ0006","发票日期应小于当前日期"),
    BIZ0007("BIZ0007","发票号重复，无法新增"),
    BIZ0008("BIZ0008","融资到期日不能小于保理到期日"),
    BIZ0009("BIZ0009","应付日期剩余时长过短，无法进行此操作"),
    BIZ0010("BIZ0010","保理到期日不能小于应付日期"),
    BIZ0011("BIZ0011","进入签约流程，不能进行该操作!"),
    BIZ0012("BIZ0012","应付账款导入数据不能超过一万条"),
    BIZ0013("BIZ0013","应付账款不存在"),
    BIZ0014("BIZ0014","该笔应付账款已作废"),
    BIZ0015("BIZ0015","核心企业把供应商拉入黑名单"),
    BIZ0016("BIZ0016","抱歉，目前不满足撤销条件！"),
    BIZ0017("BIZ0017","应付账款否决或撤销后，需编辑后才能再次发布"),
    BIZ0018("BIZ0018","抱歉，您无权进行该操作！"),
    BIZ0019("BIZ0019","应付账款发布后还未复核时才能撤销"),
    BIZ0020("BIZ0020","申请融资大于核心企业的可用额度"),
    BIZ0021("BIZ0021","放款日期不在有效范围"),
    BIZ0022("BIZ0022","三方协议已经平台确认放款"),
    BIZ0023 ("BIZ0023","该供应商没有在该融资提供方开保理专户"),
    BIZ0024("BIZ0024","该核心企业没有平台给核心企业额度"),
    BIZ0025("BIZ0025","三方协议已经平台确认还款"),
    BIZ0026("BIZ0026","三方协议尚未放款"),
    BIZ0027("BIZ0027","三方协议平台未确认放款"),
    BIZ0028("BIZ0028","平台已经确认拒绝放款"),
    BIZ0029("BIZ0029","三方协议已还款，请勿重复操作！"),
    BIZ0030("BIZ0030","该三方协议银行尚未拒绝放款"),
    BIZ0031("BIZ0031","所选结算账户查询出错"),
    BIZ0032("BIZ0032","三方协议模板不存在"),
    BIZ0033("BIZ0033","该供应商未在融资提供方设立保理专户账户"),
    BIZ0034("BIZ0034","{0}：签名验签失败"),
    BIZ0035("BIZ0035","该应付账款融资期限过期，请重新选择"),
    BIZ0036("BIZ0036","该核心企业没有设置平台给核心企业额度"),
    BIZ0037("BIZ0037","核心企业额度不足，请重新选择"),
    BIZ0038("BIZ0038","三方协议模板不存在，请联系报价融资提供方进行维护"),
    BIZ0039("BIZ0039","文件上传出错"),
    BIZ0040("BIZ0040","该三方协议无法撤销"),
    BIZ0041("BIZ0041","文件上传出错,文件不是excel格式"),
    BIZ0042("BIZ0042","应付账款导入数据不能超过一万条"),
    BIZ0043("BIZ0043","文件上传出错,文件为空"),
    BIZ0044("BIZ0044","供应商未维护组织信息"),
    BIZ0045("BIZ0045","输入参数有误"),
    //余额不足，提示充值专用
    BIZ0046("BIZ0046","{0}"),
    BIZ0047("BIZ0047","该优先报价银行有效期过期,请重新发起融资意愿"),
    BIZ0048("BIZ0048","供应商已对该笔应付账款发起三方协议，报价自动作废"),
    BIZ0049("BIZ0049","交易账户禁止提现"),
    BIZ0050("BIZ0050","此种类型三方协议模板已存在"),
    BIZ0051("BIZ0051","核心企业未维护组织信息"),
    BIZ0052("BIZ0052","融资提供方未维护组织信息"),
    BIZ0053("BIZ0053","该组织未维护组织信息"),
    //scyp-common
    COM0001("COM0001","{0}：该记录在数据库中已存在，不允许重复插入"),
    COM0002("COM0002","{0}：该记录在数据库中已被引用，请删除引用记录后再试"),
    COM0003("COM0003","{0}：操作数据库失败，请检查后再试"),
    COM0004("COM0004","{0}：必填选项不能为空"),
    COM0005("COM0005","{0}：插入数据库失败，缺失父项记录"),
    COM0006("COM0006","通用接口insertSelectiveStrictly插入数据失败"),
    COM0007("COM0007","通用接口updateByPrimaryKeySelectiveStrictly更新数据失败"),
    COM0008("COM0008","通用接口deleteByPrimaryKeyStrictly删除数据失败"),
    COM0009("COM0009","通用接口deleteStrictly删除数据失败"),
    COM0010("COM0010","通用接口deleteByExampleStrictly删除数据失败"),
    COM0011("COM0011","通用接口updateByExampleSelectiveStrictly更新数据失败"),
    //scyp-key
    KEY0001("KEY0001","当前key序列号已存在"),
    KEY0002("KEY0002","当前key非已入库状态，无法被修改"),
    KEY0003("KEY0003","当前key序列号不存在"),
    KEY0004("KEY0004","当前key不能被初始化"),
    KEY0005("KEY0005","收货日期不能大于当前日期"),
    KEY0006("KEY0006","无效确认书签名"),
    KEY0007("KEY0007","未能找到相应确认书记录"),
    KEY0008("KEY0008","KEY领用部分失败，部分所选KEY为不可领用状态"),
    KEY0009("KEY0009","KEY领用失败，所选KEY为不可领用状态"),
    KEY0010("KEY0010","KEY盘存失败，目前盘存只支持“报废”操作"),
    KEY0011("KEY0011","该key未激活"),
    KEY0012("KEY0012","该key已初始化，不能再次初始化"),
    KEY0013("KEY0013","该key未正常领用"),
    KEY0014("KEY0014","该KEY不属于当前组织"),
    KEY0015("KEY0015","数据错误，请重试"),
    KEY0016("KEY0016","请确保插入正确的见证Key"),
    KEY0017("KEY0017","请回到确认企业信息页，输入工商登记号"),
    KEY0018("KEY0018","当前操作用户非该确认书见证人!"),
    KEY0019("KEY0019","未能正确获得电子签名使用确认书!"),
    KEY0020("KEY0020","该用户非正确角色，或已与Key绑定！请确认该用户角色，且目前无Key绑定！"),
    KEY0021("KEY0021","非见证人签名！"),
    KEY0022("KEY0022","确认书签名非法！"),
    KEY0023("KEY0023","见证机构类别异常！"),
    KEY0024("KEY0024","见证机构名称异常！"),
    KEY0025("KEY0025","申请初始化KEY的组织机构不存在！"),
    KEY0026("KEY0026","用户会话为已失效"),

    //scyp-addition
    ADD0001("ADD0001","{0}：签名验签失败"),
    ADD0002("ADD0002","本部门申请节点已经送审，无法申请"),
    ADD0003("ADD0003","该用户无法发起申请流程"),
    ADD0004("ADD0004","开票申请额度大于最大可开票额度");

    String key;
    String value;

    private ExceptionCodeEnum(String key, String value) {
        this.key=key;
        this.value=value;
    }

    @Override
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }

    @Override
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString(){
        return this.key+"："+this.getValue();
    }
}
