package com.ceying.common.constant;

import com.ceying.common.enums.BaseEnum;

/**
 * 功能说明: spring cache 的key<br>
 * 系统版本: 2.0 <br>
 * 开发人员: huanghaiyun
 * 开发时间: 2018/3/19<br>
 * <br>
 */
public class CacheKeyConstant {
    public static  final String TOPMEUN="topMenu";
    public static  final String NAVBAR="navBar";
    public static  final String WORKBENCH="workBench";
    public static  final String USERTRANS="userTrans";
    public static  final String ALLUSER="allUser";
    public static  final String ALLROLE="allRole";
    public static  final String ALLROLEUSER="allRoleUser";
    public static  final String ORGNAMEMAP="orgNameMap";
    public static  final String ORGCACHE="orgCache";
    public static  final String USERCACHE="userCache";
    public static  final String ALLSYSPARAM="allSysParam";
    public static  final String USERMAP="userMap";
    public static  final String TENANTMAP="tenantMap";
    public static  final String ALLRELORG="allRelOrg";
    public static  final String TASKCOMMANDPARAMS="taskCommandParams";
    public static  final String TASK="task";
    public static final String CALENDARS = "calendars";
    public static final String  CALENDARSMAP = "calendarsmap";
    public enum CacheKeyEnum implements BaseEnum<CacheKeyEnum, String> {

        SYS_TOPMENU(TOPMEUN,"置顶菜单缓存"),
        SYS_NAVBAR(NAVBAR,"侧边栏菜单缓存"),
        SYS_WORKBENCH(WORKBENCH,"工作台菜单缓存"),
        SYS_USERTRANS(USERTRANS,"用户权限缓存"),
        SYS_ALLUSER(ALLUSER,"用户表缓存"),
        SYS_ALLROLE(ALLROLE,"角色缓存"),
        SYS_ALLROLEUSER(ALLROLEUSER,"角色用户缓存"),
        SYS_ORGNAMEMAP(ORGNAMEMAP,"组织id对应的名称"),
        SYS_ORGCACHE(ORGCACHE,"组织缓存"),
        SYS_USERCACHE(USERCACHE,"用户缓存"),
        SYS_ALLSYSPARAM(ALLSYSPARAM,"系统参数缓存"),
        SYS_USERMAP(USERMAP,"用户id对应的用户名"),
        SYS_TENANTMAP(TENANTMAP,"租户id对应的租户名"),
        SYS_ALLRELORG(ALLRELORG,"关联组织id缓存"),
        SYS_TASKCOMMANDPARAMS(TASKCOMMANDPARAMS,"任务命令参数"),
        SYS_TASK(TASK,"系统任务"),
        SYS_CALENDARS(CALENDARS,"日历"),
        SYS_CALENDARSMAP(CALENDARSMAP,"特殊日历");
        String key;
        String value;
        CacheKeyEnum(String key,String value){
            this.key=key;
            this.value = value;
        }

        @Override
        public final String getKey() {
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
        public String toString() {
            return super.toString();
        }
    }
}
