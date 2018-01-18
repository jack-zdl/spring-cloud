/*
Navicat MySQL Data Transfer

Source Server         : ncyp
Source Server Version : 50717
Source Host           : 192.168.6.253:3306
Source Database       : ncyp

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-10 16:48:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tsys_kind
-- ----------------------------
DROP TABLE IF EXISTS `tsys_kind`;
CREATE TABLE `tsys_kind` (
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '分类编号',
  `kind_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此类别的分类类型 取数据字典[SYS_BIZ_KIND_TYPE] 0-数据字典 1-系统参数 2-标准字段 3-系统资源 4-系统菜单',
  `kind_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `parent_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '上级编号',
  `mnemonic` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '助记符',
  `tree_idx` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '树索引码',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `lifecycle` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '生命周期',
  `platform` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '平台标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`kind_code`),
  KEY `nk_biz_kind_name` (`kind_name`) USING BTREE,
  KEY `nk_biz_kind_pcode` (`parent_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统分类表';

-- ----------------------------
-- Records of tsys_kind
-- ----------------------------
INSERT INTO `tsys_kind` VALUES ('0001', '0', '数据字典', 'bizroot', '0', '#bizroot#0001#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0002', '1', '系统参数', 'bizroot', '1', '#bizroot#0002#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0003', '2', '标准字段', 'bizroot', '2', '#bizroot#0003#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0004', '3', '系统资源', 'bizroot', '3', '#bizroot#0004#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0005', '4', '系统菜单', 'bizroot', '4', '#bizroot#0005#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('0006', '5', '子系统', 'bizroot', '5', '#bizroot#0006#', '1', null, '1', null);
INSERT INTO `tsys_kind` VALUES ('122', '4', '123', '666', '3s', 'undefined666#122#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('565', '5', '565', '0006', '56222222', 'undefined565#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('666', '4', '666555', '0005', '666555', 'undefined666#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('677', '5', '6777', '0006', 'oo', 'undefined677#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('88888', '5', '88888', '0006', '88888', 'undefined88888#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('BIZFRAME', '5', '基础业务框架', '0006', '123', '#bizroot#0006#BIZFRAME#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('BIZ_DICT', '0', '基础数据字典', '0001', 'bizDict', '#bizroot#0001#BIZ_DICT#', null, null, null, null);
INSERT INTO `tsys_kind` VALUES ('BIZ_PARAM', '1', '基础参数', '0002', 'param', '#bizroot#0002#BIZ_PARAM#', null, '1', '1', null);
INSERT INTO `tsys_kind` VALUES ('WORKFLOW', '5', '工作流', '0006', 'WF', '#bizroot#0006#WORKFLOW#', null, null, null, null);
INSERT INTO `tsys_kind` VALUES ('dfdhggf', '1', 'sdfd', '0002', 'dfd', 'undefineddfdhggf#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('qqq', '3', 'qqq', '0004', 'qqq', 'undefinedqqq#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('test', '1', 'test', '0002', '007', 'undefinedtest#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('test001', '1', 'test0011', '0002', 'test0011', 'undefinedtest001#', null, null, '0', 'test001');
INSERT INTO `tsys_kind` VALUES ('ttt', '3', 'ttt1', '0004', 'ttt1', 'undefinedttt#', null, null, '0', null);
INSERT INTO `tsys_kind` VALUES ('yyy', '0', 'yyy', '0001', 'yyy', 'undefinedyyy#', null, null, '0', null);

-- ----------------------------
-- Table structure for tsys_log
-- ----------------------------
DROP TABLE IF EXISTS `tsys_log`;
CREATE TABLE `tsys_log` (
  `log_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '业务日志编号',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组织编号',
  `org_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '组织名',
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者ID',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者名称',
  `access_date` datetime NOT NULL COMMENT '操作日期',
  `access_time` datetime NOT NULL COMMENT '操作时间',
  `sub_trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '子交易号',
  `trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:交易编号',
  `oper_contents` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '业务操作详细描述',
  `ip_add` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者ip地址',
  `host_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主机名称',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`log_id`),
  KEY `nk_biz_log_org_id` (`org_id`) USING BTREE,
  KEY `nk_biz_log_org_name` (`org_name`) USING BTREE,
  KEY `nk_biz_log_user_id` (`user_id`) USING BTREE,
  KEY `nk_biz_log_user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_log
-- ----------------------------

-- ----------------------------
-- Table structure for tsys_menu
-- ----------------------------
DROP TABLE IF EXISTS `tsys_menu`;
CREATE TABLE `tsys_menu` (
  `menu_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用于表示菜单英文代码,代码与生命周期组成唯一索引 Studio需显示文本输入',
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:分类编号，外键TSYS_KIND.KIND_CODE',
  `trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `menu_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用于表示菜单中文名称 Studio需显示文本输入',
  `menu_arg` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单参数',
  `menu_icon` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '名称之前ICON图标或者菜单的背景图片',
  `menu_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'MENU_URL',
  `window_type` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示点击菜单后展现页面的显示方式 取数据字典[SYS_BIZ_WINDOW_CATE] 0-工作区TAB页 1-弹出窗口',
  `window_model` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示单例窗口\\每次打开新窗口模式',
  `tip` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '对菜单功能的简单描述，鼠标悬停在菜单名称上时可做相应的提示',
  `hot_key` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '快捷键',
  `parent_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示菜单上级节点的引用 Studio需显示节点选择输入',
  `order_no` int(11) DEFAULT NULL COMMENT '用于表示同级菜单下的顺序排列 Studio需显示',
  `open_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该菜单是否默认展开',
  `tree_idx` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示菜单各级之间关系,取各级菜单id前后加''#''号',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menu_code`,`kind_code`),
  KEY `nk_biz_menu_code` (`menu_code`) USING BTREE,
  KEY `nk_biz_menu_name` (`menu_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_menu
-- ----------------------------
INSERT INTO `tsys_menu` VALUES ('BIZFRAME', 'BIZFRAME', 'BIZFRAME', 'BIZFRAME', '企金云平台', null, null, null, '0', null, null, null, 'bizroot', '0', null, '#bizroot#BIZFRAME#', null);
INSERT INTO `tsys_menu` VALUES ('BigContractMgmt', 'BIZFRAME', 'BigContractMgmt', 'BigContractMgmt', '反向保理额度管理', null, null, '/rfp/bigcontract/bigcontractmanage.jsp', '0', null, null, null, 'manageBigContract', '1', null, '#bizroot#BIZFRAME#business#manageBigContract#BigContractMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('KeyInitConfirmState', 'BIZFRAME', 'KeyInitConfirmState', 'KeyInitConfirmState', '电子签名确认书', null, null, '/rfp/keymgmt/keyinitconfirmstate.jsp', '0', null, null, null, 'manageKeys', '5', null, '#bizroot#BIZFRAME#business#manageKeys#KeyInitConfirmState#', null);
INSERT INTO `tsys_menu` VALUES ('SupplierAccountsMgmt', 'BIZFRAME', 'SupplierAccountsMgmt', 'SupplierAccountsMgmt', '保理专户管理', null, null, '/rfp/supplieraccount/supplieraccount.jsp', '0', null, null, null, 'manageSupplierAccount', '1', null, '#bizroot#BIZFRAME#business#manageSupplierAccount#SupplierAccountsMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('WBflowTaskTodo', 'BIZFRAME', 'WBflowTaskTodo', 'WBflowTaskTodo', '其它待办任务', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'workBench', '1', null, '#bizroot#BIZFRAME#workBench#WBflowTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableChx', 'BIZFRAME', 'WBpayableChx', 'WBpayableChx', '应付账款审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '2', null, '#bizroot#BIZFRAME#workBench#WBpayableChx#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntention', 'BIZFRAME', 'WBpayableIntention', 'WBpayableIntention', '融资意愿审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '4', null, '#bizroot#BIZFRAME#workBench#WBpayableIntention#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntentionApply', 'BIZFRAME', 'WBpayableIntentionApply', 'WBpayableIntentionApply', '发起融资意愿', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '6', null, '#bizroot#BIZFRAME#workBench#WBpayableIntentionApply#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableIntentionList', 'BIZFRAME', 'WBpayableIntentionList', 'WBpayableIntentionList', '优先融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', '0', null, null, null, 'workBench', '5', null, '#bizroot#BIZFRAME#workBench#WBpayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBpayableQuote', 'BIZFRAME', 'WBpayableQuote', 'WBpayableQuote', '融资确认审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'workBench', '3', null, '#bizroot#BIZFRAME#workBench#WBpayableQuote#', null);
INSERT INTO `tsys_menu` VALUES ('WBreturnPayableIntentionList', 'BIZFRAME', 'WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '退回融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', '0', null, null, null, 'workBench', '7', null, '#bizroot#BIZFRAME#workBench#WBreturnPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBsupportPayableIntentionList', 'BIZFRAME', 'WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '支持融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', '0', null, null, null, 'workBench', '8', null, '#bizroot#BIZFRAME#workBench#WBsupportPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('WBtripartiteAgreementChxTodo', 'BIZFRAME', 'WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '三方协议待办任务', null, null, '/rfp/agreement/chxtodo.jsp', '0', null, null, null, 'workBench', '9', null, '#bizroot#BIZFRAME#workBench#WBtripartiteAgreementChxTodo#', null);
INSERT INTO `tsys_menu` VALUES ('accountTaskTodo', 'BIZFRAME', 'accountTaskTodo', 'accountTaskTodo', '待办应付账款', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'flowTask', '6', null, '#bizroot#BIZFRAME#flowMenu#flowTask#accountTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayable', 'BIZFRAME', 'accountsPayable', 'accountsPayable', '应付账款', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#accountsPayable#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayableQuery', 'BIZFRAME', 'accountsPayableQuery', 'accountsPayableQuery', '应付账款查询', null, null, '\\admin\\commonquery\\accountspayable.jsp', '0', null, null, null, 'accountsPayable', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#accountsPayable#accountsPayableQuery#', null);
INSERT INTO `tsys_menu` VALUES ('accountsPayableSignature', 'BIZFRAME', 'accountsPayableSignature', 'accountsPayableSignature', '应付账款签名', null, null, null, '0', null, null, null, 'manageSignature', '2', null, '#bizroot#BIZFRAME#business#manageSignature#accountsPayableSignature#', null);
INSERT INTO `tsys_menu` VALUES ('agreement', 'BIZFRAME', 'agreement', 'agreement', '三方协议', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '7', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreement#', null);
INSERT INTO `tsys_menu` VALUES ('agreementQuery', 'BIZFRAME', 'agreementQuery', 'agreementQuery', '三方协议查询', null, null, '\\admin\\commonquery\\agreement.jsp', '0', null, null, null, 'agreement', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreement#agreementQuery#', null);
INSERT INTO `tsys_menu` VALUES ('agreementTemp', 'BIZFRAME', 'agreementTemp', 'agreementTemp', '三方协议模板', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '8', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreementTemp#', null);
INSERT INTO `tsys_menu` VALUES ('agreementTempQuery', 'BIZFRAME', 'agreementTempQuery', 'agreementTempQuery', '三方协议模板查询', null, null, '\\admin\\commonquery\\agreementtemp.jsp', '0', null, null, null, 'agreementTemp', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#agreementTemp#agreementTempQuery#', null);
INSERT INTO `tsys_menu` VALUES ('appeal', 'BIZFRAME', 'appeal', 'appeal', '申诉管理', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '5', null, '#bizroot#BIZFRAME#comprehensiveQuery#appeal#', null);
INSERT INTO `tsys_menu` VALUES ('appealDone', 'BIZFRAME', 'appealDone', 'appealDone', '已完成申诉', null, null, '/rfp/appeal/appealdone.jsp', '0', null, null, null, 'manageAppeal', '4', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealDone#', null);
INSERT INTO `tsys_menu` VALUES ('appealMgmt', 'BIZFRAME', 'appealMgmt', 'appealMgmt', '申诉类型管理', null, null, '/rfp/appeal/appealmanagement.jsp', '0', null, null, null, 'manageAppeal', '1', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('appealQuery', 'BIZFRAME', 'appealQuery', 'appealQuery', '申诉管理查询', null, null, '\\admin\\commonquery\\appeal.jsp', '0', null, null, null, 'appeal', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#appeal#appealQuery#', null);
INSERT INTO `tsys_menu` VALUES ('appealStart', 'BIZFRAME', 'appealStart', 'appealStart', '我发起的申诉', null, null, '/rfp/appeal/appealmanagementforme.jsp', '0', null, null, null, 'manageAppeal', '5', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealStart#', null);
INSERT INTO `tsys_menu` VALUES ('appealTodoTask', 'BIZFRAME', 'appealTodoTask', 'appealTodoTask', '待处理申诉', null, null, '/rfp/appeal/appealtodotaskindex.jsp', '0', null, null, null, 'manageAppeal', '3', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealTodoTask#', null);
INSERT INTO `tsys_menu` VALUES ('appealmsMgmt', 'BIZFRAME', 'appealmsMgmt', 'appealmsMgmt', '申诉信息管理', null, null, '/rfp/appeal/appealdetailmanagement.jsp', '0', null, null, null, 'manageAppeal', '2', null, '#bizroot#BIZFRAME#customService#manageAppeal#appealmsMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('areaMgmt', 'BIZFRAME', 'areaMgmt', 'areaMgmt', '银行辖区管理', null, null, '/rfp/organization/bankjurisdiction/bankarea.jsp', '0', null, null, null, 'manageOrg', '5', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#areaMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('bankInvite', 'BIZFRAME', 'bankInvite', 'bankInvite', '银行邀请信息', null, null, '/rfp/organization/bankinvite/bankinvite.jsp', '0', null, null, null, 'manageServiceBank', '1', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#bankInvite#', null);
INSERT INTO `tsys_menu` VALUES ('bankQuota', 'BIZFRAME', 'bankQuota', 'bankQuota', '银行给核心企业额度', null, null, '/rfp/organization/bankquota/bankquota.jsp', '0', null, null, null, 'manageBank', '6', null, '#bizroot#BIZFRAME#cooperation#manageBank#bankQuota#', null);
INSERT INTO `tsys_menu` VALUES ('bankSupplierRelation', 'BIZFRAME', 'bankSupplierRelation', 'bankSupplierRelation', '银行分配供应商', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=3', '0', null, null, null, 'manageOrgRelation', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#bankSupplierRelation#', null);
INSERT INTO `tsys_menu` VALUES ('bankView', 'BIZFRAME', 'bankView', 'bankView', '合作银行查看', null, null, '/rfp/organization/orgview/orgbank.jsp', '0', null, null, null, 'manageBank', '3', null, '#bizroot#BIZFRAME#cooperation#manageBank#bankView#', null);
INSERT INTO `tsys_menu` VALUES ('baseSet', 'BIZFRAME', 'baseSet', 'baseSet', '基础设置', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '6', null, '#bizroot#BIZFRAME#baseSet#', null);
INSERT INTO `tsys_menu` VALUES ('bigContract', 'BIZFRAME', 'bigContract', 'bigContract', '大合同', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#bigContract#', null);
INSERT INTO `tsys_menu` VALUES ('bigContractQuery', 'BIZFRAME', 'bigContractQuery', 'bigContractQuery', '大合同信息查询', null, null, '\\admin\\commonquery\\bigcontract.jsp', '0', null, null, null, 'bigContract', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#bigContract#bigContractQuery#', null);
INSERT INTO `tsys_menu` VALUES ('bigContractSignature', 'BIZFRAME', 'bigContractSignature', 'bigContractSignature', '反向保理额度签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '3', null, '#bizroot#BIZFRAME#business#manageSignature#bigContractSignature#', null);
INSERT INTO `tsys_menu` VALUES ('bizOrgSet', 'BIZFRAME', 'bizOrgSet', 'bizOrgSet', '组织机构设置', null, null, '/admin/system/orgmanage/orgmanage.jsp', '3', null, null, null, 'manageOrg', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#bizOrgSet#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetCache', 'BIZFRAME', 'bizSetCache', 'bizSetCache', '缓存刷新', null, null, '/admin/cache/cachrefresh.jsp', '3', null, null, null, 'bizSysManager', '1', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetCache#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetLog', 'BIZFRAME', 'bizSetLog', 'bizSetLog', '业务日志设置', null, null, '/admin/businesslog/syslog.jsp', '3', null, null, null, 'bizSysManager', '2', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetLog#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetMenu', 'BIZFRAME', 'bizSetMenu', 'bizSetMenu', '系统菜单设置', null, null, '/admin/system/menumanage/menumanage.jsp', '3', null, null, null, 'bizSysManager', '3', '1', '#bizroot#BIZFRAME#systemsettings#bizSysManager#bizSetMenu#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetOrgRole', 'BIZFRAME', 'bizSetOrgRole', 'bizSetOrgRole', '多岗设置', null, null, '/admin/system/orgrolemanage/orgrolemanage.jsp', '3', null, null, null, 'bizUserManager', '1', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetOrgRole#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetRole', 'BIZFRAME', 'bizSetRole', 'bizSetRole', '角色设置', null, null, '/admin/system/rolemanage/rolemanage.jsp', '3', null, null, null, 'bizUserManager', '2', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetRole#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUser', 'BIZFRAME', 'bizSetUser', 'bizSetUser', '用户设置', null, null, '/admin/system/usermanage/usermanage.jsp', '2', null, null, null, 'bizUserManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUser#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUserKey', 'BIZFRAME', 'bizSetUserKey', 'bizSetUserKey', '用户KEY绑定', null, null, '/rfp/userkey/userbindkey.jsp', '0', null, null, null, 'bizUserManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUserKey#', null);
INSERT INTO `tsys_menu` VALUES ('bizSetUserKeyApply', 'BIZFRAME', 'bizSetUserKeyApply', 'bizSetUserKeyApply', '用户KEY申请', null, null, '/rfp/userkey/userapplykey.jsp', '0', null, null, null, 'bizUserManager', '5', null, '#bizroot#BIZFRAME#userManager#bizUserManager#bizSetUserKeyApply#', null);
INSERT INTO `tsys_menu` VALUES ('bizSysManager', 'BIZFRAME', 'bizSysManager', 'bizSysManager', '系统管理', null, 'systemmanage(s).png', null, '0', null, null, null, 'systemsettings', '2', null, '#bizroot#BIZFRAME#systemsettings#bizSysManager#', null);
INSERT INTO `tsys_menu` VALUES ('bizUserManager', 'BIZFRAME', 'bizUserManager', 'bizUserManager', '用户管理', null, 'user(s).png', null, '0', null, null, null, 'userManager', '4', null, '#bizroot#BIZFRAME#userManager#bizUserManager#', null);
INSERT INTO `tsys_menu` VALUES ('blockchain', 'BIZFRAME', 'blockchain', 'blockchain', '区块链', null, 'blockchain(g).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#blockchain#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainApply', 'BIZFRAME', 'blockchainApply', 'blockchainApply', '申请成为节点', null, null, '/rfp/blockchain/blockchainnodeapply.jsp', '0', null, null, null, 'blockchainManage', '3', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainApply#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainFind', 'BIZFRAME', 'blockchainFind', 'blockchainFind', '区块链取证', null, null, '/rfp/blockchain/blockchainsearch.jsp', '0', null, null, null, 'blockchainManage', '1', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainFind#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainManage', 'BIZFRAME', 'blockchainManage', 'blockchainManage', '区块链', null, 'blockchain(s).png', null, '0', null, null, null, 'blockchain', '4', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainNodeManage', 'BIZFRAME', 'blockchainNodeManage', 'blockchainNodeManage', '节点管理', null, null, '/rfp/blockchain/blockchainnodemanage.jsp', '0', null, null, null, 'blockchainManage', '4', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainNodeManage#', null);
INSERT INTO `tsys_menu` VALUES ('blockchainView', 'BIZFRAME', 'blockchainView', 'blockchainView', '区块链查看', null, null, '/rfp/blockchain/blockchainbrowser.jsp', '0', null, null, null, 'blockchainManage', '2', null, '#bizroot#BIZFRAME#blockchain#blockchainManage#blockchainView#', null);
INSERT INTO `tsys_menu` VALUES ('business', 'BIZFRAME', 'business', 'business', '业务', null, 'business(g).png', null, '0', null, null, null, 'BIZFRAME', '5', null, '#bizroot#BIZFRAME#business#', null);
INSERT INTO `tsys_menu` VALUES ('calendarsManager', 'BIZFRAME', 'calendarsManager', 'calendarsManager', '日历管理', null, null, '/base/system/calendars/calendarstab.jsp', null, null, null, null, 'generalSettings', '1', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#calendarsManager#', null);
INSERT INTO `tsys_menu` VALUES ('checkSignature', 'BIZFRAME', 'checkSignature', 'checkSignature', '我要验签', null, 'signcontract(s).png', '/rfp/keymgmt/signverify.jsp', '0', null, null, null, 'business', '7', null, '#bizroot#BIZFRAME#business#checkSignature#', null);
INSERT INTO `tsys_menu` VALUES ('comprehensiveQuery', 'BIZFRAME', 'comprehensiveQuery', 'comprehensiveQuery', '综合查询', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '17', null, '#bizroot#BIZFRAME#comprehensiveQuery#', null);
INSERT INTO `tsys_menu` VALUES ('cooperation', 'BIZFRAME', 'cooperation', 'cooperation', '合作', null, 'cooperation(g).png', null, '0', null, null, null, 'BIZFRAME', '13', null, '#bizroot#BIZFRAME#cooperation#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyFirstBank', 'BIZFRAME', 'corecompanyFirstBank', 'corecompanyFirstBank', '优先级', null, null, '/rfp/organization/bankquota/bankquota.jsp?priority=1', '0', null, null, null, 'manageCoreCompany', '4', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyFirstBank#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyInvite', 'BIZFRAME', 'corecompanyInvite', 'corecompanyInvite', '邀请', null, null, '/rfp/organization/bankinvite/corecompanyinvite.jsp', '0', null, null, null, 'manageCoreCompany', '2', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyInvite#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyQuota', 'BIZFRAME', 'corecompanyQuota', 'corecompanyQuota', '平台给核心企业额度', null, null, '/rfp/organization/corecompanyquota/corecompanyquota.jsp', '0', null, null, null, 'manageCoreCompany', '7', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyQuota#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanySupportBank', 'BIZFRAME', 'corecompanySupportBank', 'corecompanySupportBank', '支持级', null, null, '/rfp/organization/bankquota/bankquota.jsp?priority=2', '0', null, null, null, 'manageCoreCompany', '5', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanySupportBank#', null);
INSERT INTO `tsys_menu` VALUES ('corecompanyView', 'BIZFRAME', 'corecompanyView', 'corecompanyView', '核心企业查看', null, null, '/rfp/organization/orgview/orgcorecompany.jsp', '0', null, null, null, 'manageCoreCompany', '1', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#corecompanyView#', null);
INSERT INTO `tsys_menu` VALUES ('currencyManage', 'BIZFRAME', 'currencyManage', 'currencyManage', '币种管理', null, null, '/base/system/currency/currency.jsp', null, null, null, null, 'generalSettings', '3', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#currencyManage#', null);
INSERT INTO `tsys_menu` VALUES ('customService', 'BIZFRAME', 'customService', 'customService', '申诉', null, 'service(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#customService#', null);
INSERT INTO `tsys_menu` VALUES ('firstBank', 'BIZFRAME', 'firstBank', 'firstBank', '优先级银行', null, null, '/rfp/organization/banklist/banklist.jsp?priority=1', '0', null, null, null, 'manageServiceBank', '1', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#firstBank#', null);
INSERT INTO `tsys_menu` VALUES ('flowDelegateMgrnew', 'BIZFRAME', 'flowDelegateMgrnew', 'flowDelegateMgrnew', '委托', null, null, '/workflow/client/delegate/delegate.jsp', '0', null, null, null, 'flowTask', '3', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowDelegateMgrnew#', null);
INSERT INTO `tsys_menu` VALUES ('flowDelegateMonitor', 'BIZFRAME', 'flowDelegateMonitor', 'flowDelegateMonitor', '委托监控', null, null, '/admin/workflow/delegate/delegate.jsp', '0', null, null, null, 'flowMonitor', '0', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#flowDelegateMonitor#', null);
INSERT INTO `tsys_menu` VALUES ('flowForm', 'BIZFRAME', 'flowForm', 'flowForm', '表单管理', null, 'formmanage(s).png', null, '0', null, null, null, 'flowMenu', '1', null, '#bizroot#BIZFRAME#flowMenu#flowForm#', null);
INSERT INTO `tsys_menu` VALUES ('flowFormKind', 'BIZFRAME', 'flowFormKind', 'flowFormKind', '表单分类', null, null, '/admin/workflow/processform/processformtype.jsp', '0', null, null, null, 'flowForm', '1', null, '#bizroot#BIZFRAME#flowMenu#flowForm#flowFormKind#', null);
INSERT INTO `tsys_menu` VALUES ('flowFormReg', 'BIZFRAME', 'flowFormReg', 'flowFormReg', '表单设置', null, null, '/admin/workflow/processform/processformreg.jsp', '0', null, null, null, 'flowForm', '2', null, '#bizroot#BIZFRAME#flowMenu#flowForm#flowFormReg#', null);
INSERT INTO `tsys_menu` VALUES ('flowManaDesign', 'BIZFRAME', 'flowManaDesign', 'flowManaDesign', '流程设计', null, null, '/admin/workflow/flowdesign/processdesign.jsp', '0', null, null, null, 'flowManage', '2', null, '#bizroot#BIZFRAME#flowMenu#flowManage#flowManaDesign#', null);
INSERT INTO `tsys_menu` VALUES ('flowManaProcKind', 'BIZFRAME', 'flowManaProcKind', 'flowManaProcKind', '流程类型', null, null, '/admin/workflow/flowmanage/processtype.jsp', '0', null, null, null, 'flowManage', '1', null, '#bizroot#BIZFRAME#flowMenu#flowManage#flowManaProcKind#', null);
INSERT INTO `tsys_menu` VALUES ('flowManage', 'BIZFRAME', 'flowManage', 'flowManage', '工作流设置', null, 'workflowsetting(s).png', null, '0', null, null, null, 'flowMenu', '3', null, '#bizroot#BIZFRAME#flowMenu#flowManage#', null);
INSERT INTO `tsys_menu` VALUES ('flowMenu', 'BIZFRAME', 'flowMenu', 'flowMenu', '工作流', null, 'workflow(g).png', null, '0', null, null, null, 'BIZFRAME', '11', null, '#bizroot#BIZFRAME#flowMenu#', null);
INSERT INTO `tsys_menu` VALUES ('flowMoniInstance', 'BIZFRAME', 'flowMoniInstance', 'flowMoniInstance', '实例监控', null, null, '/admin/workflow/monitor/processinstancemonitor.jsp', '0', null, null, null, 'flowMonitor', '1', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#flowMoniInstance#', null);
INSERT INTO `tsys_menu` VALUES ('flowMonitor', 'BIZFRAME', 'flowMonitor', 'flowMonitor', '工作流监控', null, 'workflowmonitorin(s).png', null, '0', null, null, null, 'flowMenu', '2', null, '#bizroot#BIZFRAME#flowMenu#flowMonitor#', null);
INSERT INTO `tsys_menu` VALUES ('flowMyProcessFinished', 'BIZFRAME', 'flowMyProcessFinished', 'flowMyProcessFinished', '我已完成的请求', null, null, '/workflow/client/myprocess/finished.jsp', null, null, null, null, 'flowTask', '5', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowMyProcessFinished#', null);
INSERT INTO `tsys_menu` VALUES ('flowMyProcessUnfinished', 'BIZFRAME', 'flowMyProcessUnfinished', 'flowMyProcessUnfinished', '我未完成的请求', null, null, '/workflow/client/myprocess/unfinished.jsp', null, null, null, null, 'flowTask', '4', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowMyProcessUnfinished#', null);
INSERT INTO `tsys_menu` VALUES ('flowTask', 'BIZFRAME', 'flowTask', 'flowTask', '工作台', null, 'workbench(s).png', null, '2', null, null, null, 'flowMenu', '1', null, '#bizroot#BIZFRAME#flowMenu#flowTask#', null);
INSERT INTO `tsys_menu` VALUES ('flowTaskHistory', 'BIZFRAME', 'flowTaskHistory', 'flowTaskHistory', '已办任务', null, null, '/workflow/client/hist/doneTask.jsp', '0', null, null, null, 'flowTask', '2', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowTaskHistory#', null);
INSERT INTO `tsys_menu` VALUES ('flowTaskTodo', 'BIZFRAME', 'flowTaskTodo', 'flowTaskTodo', '待办任务', null, null, '/workflow/client/todo/todoTaskSimple.jsp', '0', null, null, null, 'flowTask', '1', null, '#bizroot#BIZFRAME#flowMenu#flowTask#flowTaskTodo#', null);
INSERT INTO `tsys_menu` VALUES ('gasMgmt', 'BIZFRAME', 'gasMgmt', 'gasMgmt', '燃料管理', null, 'fuelmanage(s).png', null, '0', null, null, null, 'baseSet', '2', null, '#bizroot#BIZFRAME#baseSet#gasMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('gasaccount', 'BIZFRAME', 'gasaccount', 'gasaccount', '燃料账户', null, null, '/rfp/gasmgmt/gasaccount.jsp', '0', null, null, null, 'gasMgmt', '2', null, '#bizroot#BIZFRAME#baseSet#gasMgmt#gasaccount#', null);
INSERT INTO `tsys_menu` VALUES ('gastransactions', 'BIZFRAME', 'gastransactions', 'gastransactions', '燃料交易明细', null, null, '/rfp/gasmgmt/gastransactions.jsp', '0', null, null, null, 'gasMgmt', '1', null, '#bizroot#BIZFRAME#business#managePltfFin#gasMgmt#gastransactions#', null);
INSERT INTO `tsys_menu` VALUES ('generalSettings', 'BIZFRAME', 'generalSettings', 'generalSettings', '一般设置', null, 'setting(s).png', null, '0', null, null, null, 'systemsettings', '8', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#', 'test1');
INSERT INTO `tsys_menu` VALUES ('keyInit', 'BIZFRAME', 'keyInit', 'keyInit', 'KEY初始化', null, null, '/rfp/keymgmt/keyinit.jsp', '0', null, null, null, 'manageKeys', '2', null, '#bizroot#BIZFRAME#business#manageKeys#keyInit#', null);
INSERT INTO `tsys_menu` VALUES ('keyInitRecord', 'BIZFRAME', 'keyInitRecord', 'keyInitRecord', 'KEY初始化记录', null, null, '/rfp/keymgmt/keyinitrecord.jsp', '0', null, null, null, 'manageKeys', '3', null, '#bizroot#BIZFRAME#business#manageKeys#keyInitRecord#', null);
INSERT INTO `tsys_menu` VALUES ('keyInventoryMgmt', 'BIZFRAME', 'keyInventoryMgmt', 'keyInventoryMgmt', 'KEY物料管理', null, null, '/rfp/keymgmt/keyinventory.jsp', '0', null, null, null, 'manageKeys', '4', null, '#bizroot#BIZFRAME#business#manageKeys#keyInventoryMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('keyPurchase', 'BIZFRAME', 'keyPurchase', 'keyPurchase', 'KEY申请单', null, null, '/rfp/keymgmt/keypurchase.jsp', '0', null, null, null, 'manageKeys', '4', null, '#bizroot#BIZFRAME#business#manageKeys#keyPurchase#', null);
INSERT INTO `tsys_menu` VALUES ('manageAppeal', 'BIZFRAME', 'manageAppeal', 'manageAppeal', '申诉管理', null, 'appealmanage(s).png', null, '0', null, null, null, 'customService', '5', null, '#bizroot#BIZFRAME#customService#manageAppeal#', null);
INSERT INTO `tsys_menu` VALUES ('manageBank', 'BIZFRAME', 'manageBank', 'manageBank', '合作银行', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '8', null, '#bizroot#BIZFRAME#cooperation#manageBank#', null);
INSERT INTO `tsys_menu` VALUES ('manageBigContract', 'BIZFRAME', 'manageBigContract', 'manageBigContract', '反向保理额度管理', null, 'reversefactoringmanage(s).png', null, '0', null, null, null, 'business', '9', null, '#bizroot#BIZFRAME#business#manageBigContract#', null);
INSERT INTO `tsys_menu` VALUES ('manageCoreCompany', 'BIZFRAME', 'manageCoreCompany', 'manageCoreCompany', '核心企业', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '8', null, '#bizroot#BIZFRAME#cooperation#manageCoreCompany#', null);
INSERT INTO `tsys_menu` VALUES ('manageFuel', 'BIZFRAME', 'manageFuel', 'manageFuel', '燃油管理', null, 'fuelmanage(s).png', '/common/comingsoon.jsp', '0', null, null, null, 'trade', '4', null, '#bizroot#BIZFRAME#trade#manageFuel#', null);
INSERT INTO `tsys_menu` VALUES ('manageIntegral', 'BIZFRAME', 'manageIntegral', 'manageIntegral', '积分管理', null, 'integralmanage(s).png', '/common/comingsoon.jsp', '0', null, null, null, 'trade', '3', null, '#bizroot#BIZFRAME#trade#manageIntegral#', null);
INSERT INTO `tsys_menu` VALUES ('manageKeys', 'BIZFRAME', 'manageKeys', 'manageKeys', 'KEY管理', null, 'keymanage(s).png', null, '0', null, null, null, 'business', '7', null, '#bizroot#BIZFRAME#business#manageKeys#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrg', 'BIZFRAME', 'manageOrg', 'manageOrg', '组织管理', null, 'organizationmanage(s).png', null, '0', null, null, null, 'manageOrgUser', '1', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrgRelation', 'BIZFRAME', 'manageOrgRelation', 'manageOrgRelation', '组织关系设置', null, 'organizationalrelationsetting(s).png', null, '0', null, null, null, 'manageOrgUser', '2', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#', null);
INSERT INTO `tsys_menu` VALUES ('manageOrgUser', 'BIZFRAME', 'manageOrgUser', 'manageOrgUser', '组织', null, 'organization(g).png', null, '0', null, null, null, 'BIZFRAME', '6', null, '#bizroot#BIZFRAME#manageOrgUser#', null);
INSERT INTO `tsys_menu` VALUES ('managePayable', 'BIZFRAME', 'managePayable', 'managePayable', '应付账款', null, 'accountspayable(s).png', null, '0', null, null, null, 'business', '3', null, '#bizroot#BIZFRAME#business#managePayable#', null);
INSERT INTO `tsys_menu` VALUES ('manageProvider', 'BIZFRAME', 'manageProvider', 'manageProvider', '供应商', null, 'client(s).png', null, '0', null, null, null, 'cooperation', '10', null, '#bizroot#BIZFRAME#cooperation#manageProvider#', null);
INSERT INTO `tsys_menu` VALUES ('manageRecable', 'BIZFRAME', 'manageRecable', 'manageRecable', '应收账款管理', null, 'accountspayablemanage(s).png', '/rfp/accountspayable/accountsrecablemanage.jsp', '0', null, null, null, 'business', '5', null, '#bizroot#BIZFRAME#business#manageRecable#', null);
INSERT INTO `tsys_menu` VALUES ('manageServiceBank', 'BIZFRAME', 'manageServiceBank', 'manageServiceBank', '服务银行列表', null, 'clientlist(s).png', null, '0', null, null, null, 'cooperation', '4', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#', null);
INSERT INTO `tsys_menu` VALUES ('manageSignature', 'BIZFRAME', 'manageSignature', 'manageSignature', '签名管理', null, 'signmanage(s).png', null, '0', null, null, null, 'business', '6', null, '#bizroot#BIZFRAME#business#manageSignature#', null);
INSERT INTO `tsys_menu` VALUES ('manageSupplierAccount', 'BIZFRAME', 'manageSupplierAccount', 'manageSupplierAccount', '保理专户管理', null, 'factoringusermanage(s).png', null, '0', null, null, null, 'business', '9', null, '#bizroot#BIZFRAME#business#manageSupplierAccount#', null);
INSERT INTO `tsys_menu` VALUES ('manageTradeContract', 'BIZFRAME', 'manageTradeContract', 'manageTradeContract', '资金交易', null, 'capitaltransaction(s).png', null, '0', null, null, null, 'trade', '1', null, '#bizroot#BIZFRAME#trade#manageTradeContract#', null);
INSERT INTO `tsys_menu` VALUES ('manageTripartiteAgreement', 'BIZFRAME', 'manageTripartiteAgreement', 'manageTripartiteAgreement', '三方协议管理', null, 'tripartiteagreementmanage(s).png', null, '0', null, null, null, 'business', '4', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#', null);
INSERT INTO `tsys_menu` VALUES ('match', 'BIZFRAME', 'match', 'match', '撮合融资意向', null, 'facilitatefinancingintention(s).png', null, '0', null, null, null, 'signature', '2', null, '#bizroot#BIZFRAME#signature#match#', null);
INSERT INTO `tsys_menu` VALUES ('noticesManager', 'BIZFRAME', 'noticesManager', 'noticesManager', '公告管理', null, null, '/base/system/notice/notice.jsp', null, null, null, null, 'generalSettings', '2', null, '#bizroot#BIZFRAME#systemsettings#generalSettings#noticesManager#', null);
INSERT INTO `tsys_menu` VALUES ('orgBankRelation', 'BIZFRAME', 'orgBankRelation', 'orgBankRelation', '核心企业分配银行', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=1', '0', null, null, null, 'manageOrgRelation', '2', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#orgBankRelation#', null);
INSERT INTO `tsys_menu` VALUES ('orgContractMgmt', 'BIZFRAME', 'orgContractMgmt', 'orgContractMgmt', '联系人管理', null, null, '/rfp/organization/orgcontact/organization.jsp', '0', null, null, null, 'manageOrg', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#orgContractMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('orgSupplierRelation', 'BIZFRAME', 'orgSupplierRelation', 'orgSupplierRelation', '核心企业分配供应商', null, null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=2', '0', null, null, null, 'manageOrgRelation', '3', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrgRelation#orgSupplierRelation#', null);
INSERT INTO `tsys_menu` VALUES ('organization', 'BIZFRAME', 'organization', 'organization', '组织机构', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '4', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#', null);
INSERT INTO `tsys_menu` VALUES ('organizationContact', 'BIZFRAME', 'organizationContact', 'organizationContact', '联系人管理', null, null, '\\admin\\commonquery\\organizationcontact.jsp', '0', null, null, null, 'organization', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#organizationContact#', null);
INSERT INTO `tsys_menu` VALUES ('organizationQuery', 'BIZFRAME', 'organizationQuery', 'organizationQuery', '组织机构', null, null, '\\admin\\commonquery\\organization.jsp', '0', null, null, null, 'organization', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#organization#organizationQuery#', null);
INSERT INTO `tsys_menu` VALUES ('payableChx', 'BIZFRAME', 'payableChx', 'payableChx', '应付账款审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '3', null, '#bizroot#BIZFRAME#signature#match#payableChx#', null);
INSERT INTO `tsys_menu` VALUES ('payableExpireList', 'BIZFRAME', 'payableExpireList', 'payableExpireList', '应付账款到期付款清单', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'managePayable', '3', null, '#bizroot#BIZFRAME#business#managePayable#payableExpireList#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntention', 'BIZFRAME', 'payableIntention', 'payableIntention', '融资意向审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#payableIntention#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntentionApply', 'BIZFRAME', 'payableIntentionApply', 'payableIntentionApply', '发起融资意向', null, null, '/rfp/accountspayable/chxtodotask.jsp ', '0', null, null, null, 'match', '7', null, '#bizroot#BIZFRAME#signature#match#payableIntentionApply#', null);
INSERT INTO `tsys_menu` VALUES ('payableIntentionList', 'BIZFRAME', 'payableIntentionList', 'payableIntentionList', '优先融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', '0', null, null, null, 'match', '4', null, '#bizroot#BIZFRAME#signature#match#payableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('payableMgmt', 'BIZFRAME', 'payableMgmt', 'payableMgmt', '应付账款管理', null, null, '/rfp/accountspayable/accountspayablemanage.jsp', '0', null, null, null, 'managePayable', '1', null, '#bizroot#BIZFRAME#business#managePayable#payableMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('payableQuote', 'BIZFRAME', 'payableQuote', 'payableQuote', '融资确认审批', null, null, '/rfp/accountspayable/chxtodotask.jsp', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#payableQuote#', null);
INSERT INTO `tsys_menu` VALUES ('payableQuoteQuery', 'BIZFRAME', 'payableQuoteQuery', 'payableQuoteQuery', '应付账款报价查询', null, null, '/rfp/accountspayable/accountspayablequote.jsp', '0', null, null, null, 'managePayable', '2', null, '#bizroot#BIZFRAME#business#managePayable#payableQuoteQuery#', null);
INSERT INTO `tsys_menu` VALUES ('platformTemplate', 'BIZFRAME', 'platformTemplate', 'platformTemplate', '平台模板', null, 'template(g).png', null, '0', null, null, null, 'BIZFRAME', '11', null, '#bizroot#BIZFRAME#platformTemplate#', null);
INSERT INTO `tsys_menu` VALUES ('platformTemplateManage', 'BIZFRAME', 'platformTemplateManage', 'platformTemplateManage', '平台模板', null, 'terracetemplate(s).png', '/rfp/platformtemplate/platformtemplate.jsp', '0', null, null, null, 'platformTemplate', '1', null, '#bizroot#BIZFRAME#platformTemplate#platformTemplateManage#', null);
INSERT INTO `tsys_menu` VALUES ('recableQuoteQuery', 'BIZFRAME', 'recableQuoteQuery', 'recableQuoteQuery', '应收账款报价查询', null, 'accountspayable(s).png', '/rfp/accountspayable/accountspayablequote.jsp', '0', null, null, null, 'business', '6', null, '#bizroot#BIZFRAME#business#recableQuoteQuery#', null);
INSERT INTO `tsys_menu` VALUES ('regionMgmt', 'BIZFRAME', 'regionMgmt', 'regionMgmt', '区域管理', null, null, '/rfp/organization/area/area.jsp', '0', null, null, null, 'manageOrg', '4', null, '#bizroot#BIZFRAME#manageOrgUser#manageOrg#regionMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('returnPayableIntentionList', 'BIZFRAME', 'returnPayableIntentionList', 'returnPayableIntentionList', '退回融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', '0', null, null, null, 'match', '6', null, '#bizroot#BIZFRAME#signature#match#returnPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('schedule', 'BIZFRAME', 'schedule', 'schedule', '计划任务', null, 'task(s).png', '/base/schedule/taskindex.jsp', '0', null, null, null, 'task', '18', null, '#task#schedule#', null);
INSERT INTO `tsys_menu` VALUES ('signature', 'BIZFRAME', 'signature', 'signature', '签约', null, 'contract(g).png', null, '0', null, null, null, 'BIZFRAME', '12', null, '#bizroot#BIZFRAME#signature#', null);
INSERT INTO `tsys_menu` VALUES ('supplierAccount', 'BIZFRAME', 'supplierAccount', 'supplierAccount', '供应商专户', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '6', null, '#bizroot#BIZFRAME#comprehensiveQuery#supplierAccount#', null);
INSERT INTO `tsys_menu` VALUES ('supplierAccountQuery', 'BIZFRAME', 'supplierAccountQuery', 'supplierAccountQuery', '供应商专户查询', null, null, '\\admin\\commonquery\\supplieraccount.jsp', '0', null, null, null, 'supplierAccount', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#supplierAccount#supplierAccountQuery#', null);
INSERT INTO `tsys_menu` VALUES ('supplierBlackList', 'BIZFRAME', 'supplierBlackList', 'supplierBlackList', '供应商黑名单', null, null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=2', '0', null, null, null, 'manageProvider', '3', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierBlackList#', null);
INSERT INTO `tsys_menu` VALUES ('supplierView', 'BIZFRAME', 'supplierView', 'supplierView', '供应商查看', null, null, '/rfp/organization/orgview/orgsupplier.jsp', '0', null, null, null, 'manageProvider', '1', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierView#', null);
INSERT INTO `tsys_menu` VALUES ('supplierWhiteList', 'BIZFRAME', 'supplierWhiteList', 'supplierWhiteList', '供应商白名单', null, null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=1', '0', null, null, null, 'manageProvider', '2', null, '#bizroot#BIZFRAME#cooperation#manageProvider#supplierWhiteList#', null);
INSERT INTO `tsys_menu` VALUES ('supportBank', 'BIZFRAME', 'supportBank', 'supportBank', '支持银行', null, null, '/rfp/organization/banklist/banklist.jsp?priority=2', '0', null, null, null, 'manageServiceBank', '2', null, '#bizroot#BIZFRAME#cooperation#manageServiceBank#supportBank#', null);
INSERT INTO `tsys_menu` VALUES ('supportPayableIntentionList', 'BIZFRAME', 'supportPayableIntentionList', 'supportPayableIntentionList', '支持融资意愿清单', null, null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', '0', null, null, null, 'match', '5', null, '#bizroot#BIZFRAME#signature#match#supportPayableIntentionList#', null);
INSERT INTO `tsys_menu` VALUES ('syscompany', 'BIZFRAME', 'syscompany', 'syscompany', '企业管理', null, 'companymanage(s).png', null, '0', null, null, null, 'tenant', '5', null, '#bizroot#BIZFRAME#tenant#syscompany#', null);
INSERT INTO `tsys_menu` VALUES ('syscompanyinfo', 'BIZFRAME', 'syscompanyinfo', 'syscompanyinfo', '企业信息', null, null, '/admin/syscompany/syscompanyinfo.jsp', '0', null, null, null, 'syscompany', '1', null, '#bizroot#BIZFRAME#tenant#syscompany#syscompanyinfo#', null);
INSERT INTO `tsys_menu` VALUES ('syscontract', 'BIZFRAME', 'syscontract', 'syscontract', '协议设置', null, null, '/admin/syscompany/syscontractinfo.jsp', null, null, null, null, 'syscompany', '2', null, '#bizroot#BIZFRAME#tenant#syscompany#syscontractinfo#', null);
INSERT INTO `tsys_menu` VALUES ('syspackage', 'BIZFRAME', 'syspackage', 'syspackage', '套餐设置', null, null, '/admin/syscompany/syspackageinfo.jsp', null, null, null, null, 'syscompany', '3', null, '#bizroot#BIZFRAME#tenant#syscompany#syspackageinfo#', null);
INSERT INTO `tsys_menu` VALUES ('systemParam', 'BIZFRAME', 'systemParam', 'systemParam', '系统参数', null, 'systemparameter(s).png', null, '0', null, null, null, 'systemsettings', '7', null, '#bizroot#BIZFRAME#systemsettings#systemParam#', null);
INSERT INTO `tsys_menu` VALUES ('systemParamManage', 'BIZFRAME', 'systemParamManage', 'systemParamManage', '系统参数管理', null, null, '/base/system/param/sysparam.jsp', null, null, null, null, 'systemParam', '1', null, '#bizroot#BIZFRAME#systemsettings#systemParam#systemParamManage#', null);
INSERT INTO `tsys_menu` VALUES ('systemsettings', 'BIZFRAME', 'systemsettings', 'systemsettings', '系统设置', null, 'setting(g).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#systemsettings#', null);
INSERT INTO `tsys_menu` VALUES ('taTemplateSignature', 'BIZFRAME', 'taTemplateSignature', 'taTemplateSignature', '三方协议模板签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '4', null, '#bizroot#BIZFRAME#business#manageSignature#taTemplateSignature#', null);
INSERT INTO `tsys_menu` VALUES ('task', 'BIZFRAME', 'task', 'task', '任务', null, 'task(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#task#', null);
INSERT INTO `tsys_menu` VALUES ('tdrctablelist', 'BIZFRAME', 'tdrctablelist', 'tdrctablelist', '数据权限管理', null, null, '/admin/tsvcmanage/tdrctablelist/tdrctablelist.jsp', '0', null, null, null, 'tsvcmanage', '2', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#tdrctablelist#', null);
INSERT INTO `tsys_menu` VALUES ('tenant', 'BIZFRAME', 'tenant', 'tenant', '企业', null, 'enterprise(g).png', null, '0', null, null, null, 'BIZFRAME', '7', null, '#bizroot#BIZFRAME#tenant#', null);
INSERT INTO `tsys_menu` VALUES ('trade', 'BIZFRAME', 'trade', 'trade', '交易', null, 'transaction(g).png', null, '0', null, null, null, 'BIZFRAME', '14', null, '#bizroot#BIZFRAME#trade#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountBalance', 'BIZFRAME', 'tradeAccountBalance', 'tradeAccountBalance', '交易账户余额', null, null, '/rfp/tradeaccount/transaccountbalance.jsp', '0', null, null, null, 'manageTradeContract', '3', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountBalance#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountDetail', 'BIZFRAME', 'tradeAccountDetail', 'tradeAccountDetail', '交易账户明细', null, null, '/rfp/tradeaccount/transaccountdetail.jsp', '0', null, null, null, 'manageTradeContract', '3', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountDetail#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountMgmt', 'BIZFRAME', 'tradeAccountMgmt', 'tradeAccountMgmt', '交易账户管理', null, null, '/rfp/tradeaccount/tradeaccount.jsp', '0', null, null, null, 'manageTradeContract', '1', null, '#bizroot#BIZFRAME#trade#manageTradeContract#tradeAccountMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccounts', 'BIZFRAME', 'tradeAccounts', 'tradeAccounts', '交易账户', null, 'systemparameter(s).png', null, '0', null, null, null, 'comprehensiveQuery', '3', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#', null);
INSERT INTO `tsys_menu` VALUES ('tradeAccountsQuery', 'BIZFRAME', 'tradeAccountsQuery', 'tradeAccountsQuery', '交易账户查询', null, null, '\\admin\\commonquery\\tradeaccounts.jsp', '0', null, null, null, 'tradeAccounts', '1', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeAccountsQuery#', null);
INSERT INTO `tsys_menu` VALUES ('tradeBalance', 'BIZFRAME', 'tradeBalance', 'tradeBalance', '交易账户余额', null, null, '\\admin\\commonquery\\tradebalance.jsp', '0', null, null, null, 'tradeAccounts', '3', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeBalance#', null);
INSERT INTO `tsys_menu` VALUES ('tradeTransaction', 'BIZFRAME', 'tradeTransaction', 'tradeTransaction', '交易账户明细', null, null, '\\admin\\commonquery\\tradetransaction.jsp', '0', null, null, null, 'tradeAccounts', '2', null, '#bizroot#BIZFRAME#comprehensiveQuery#tradeAccounts#tradeTransaction#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChx', 'BIZFRAME', 'tripartiteAgreementChx', 'tripartiteAgreementChx', '三方协议签约', null, 'tripartiteagreementsign(s).png', null, '0', null, null, null, 'signature', '3', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChxDone', 'BIZFRAME', 'tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '已办任务', null, null, '/rfp/agreement/tripartiteagreementdonetask.jsp', '0', null, null, null, 'tripartiteAgreementChx', '2', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#tripartiteAgreementChxDone#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementChxTodo', 'BIZFRAME', 'tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '待办任务', null, null, '/rfp/agreement/chxtodo.jsp', '0', null, null, null, 'tripartiteAgreementChx', '1', null, '#bizroot#BIZFRAME#signature#tripartiteAgreementChx#tripartiteAgreementChxTodo#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementDone', 'BIZFRAME', 'tripartiteAgreementDone', 'tripartiteAgreementDone', '已完成合约', null, null, '/rfp/agreement/tripartiteagreementdone.jsp', '0', null, null, null, 'manageTripartiteAgreement', '4', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementDone#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementMgmt', 'BIZFRAME', 'tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '发起三方协议', null, null, '/rfp/agreement/tripartiteagreement.jsp', '0', null, null, null, 'manageTripartiteAgreement', '1', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementRunning', 'BIZFRAME', 'tripartiteAgreementRunning', 'tripartiteAgreementRunning', '在途合约', null, null, '/rfp/agreement/tripartiteagreementrunning.jsp', '0', null, null, null, 'manageTripartiteAgreement', '3', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementRunning#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementSignature', 'BIZFRAME', 'tripartiteAgreementSignature', 'tripartiteAgreementSignature', '三方协议签名', null, null, '/common/comingsoon.jsp', '0', null, null, null, 'manageSignature', '1', null, '#bizroot#BIZFRAME#business#manageSignature#tripartiteAgreementSignature#', null);
INSERT INTO `tsys_menu` VALUES ('tripartiteAgreementTempMgmt', 'BIZFRAME', 'tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '三方协议模版管理', null, null, '/rfp/triagreementtemp/templatemanage.jsp', '0', null, null, null, 'manageTripartiteAgreement', '2', null, '#bizroot#BIZFRAME#business#manageTripartiteAgreement#tripartiteAgreementTempMgmt#', null);
INSERT INTO `tsys_menu` VALUES ('tsvcinterface', 'BIZFRAME', 'tsvcinterface', 'tsvcinterface', '通用查询配置', null, null, '/admin/tsvcmanage/tsvcinterface/tsvchsiright.jsp', '0', null, null, null, 'tsvcmanage', '1', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#tsvcinterface#', null);
INSERT INTO `tsys_menu` VALUES ('tsvcmanage', 'BIZFRAME', 'tsvcmanage', 'tsvcmanage', '辅助开发管理', null, 'assistdevelopmanage(s).png', null, '0', null, null, null, 'systemsettings', '6', null, '#bizroot#BIZFRAME#systemsettings#tsvcmanage#', null);
INSERT INTO `tsys_menu` VALUES ('userManager', 'BIZFRAME', 'userManager', 'userManager', '用户', null, 'user(g).png', null, '0', null, null, null, 'BIZFRAME', '3', null, '#bizroot#BIZFRAME#userManager#', null);
INSERT INTO `tsys_menu` VALUES ('warning', 'BIZFRAME', 'warning', 'warning', '预警监控', null, 'warning(s).png', null, '0', null, null, null, 'warningManage', '9', null, '#bizroot#BIZFRAME#warningManage#warning#', null);
INSERT INTO `tsys_menu` VALUES ('warningAnnulMessage', 'BIZFRAME', 'warningAnnulMessage', 'warningAnnulMessage', '预警撤销信息', null, null, '/base/warning/warningmessage/warningannulmessageindex.jsp', '0', null, null, null, 'warning', '4', null, '#bizroot#BIZFRAME#warningManage#warning#warningAnnulMessage#', null);
INSERT INTO `tsys_menu` VALUES ('warningManage', 'BIZFRAME', 'warningManage', 'warningManage', '预警', null, 'warning(g).png', null, '0', null, null, null, 'BIZFRAME', '16', null, '#bizroot#BIZFRAME#warningManage#', null);
INSERT INTO `tsys_menu` VALUES ('warningMessage', 'BIZFRAME', 'warningMessage', 'warningMessage', '预警信息', null, null, '/base/warning/warningmessage/warningmessageindex.jsp', '2', null, null, null, 'warning', '3', null, '#bizroot#BIZFRAME#warningManage#warning#warningMessage#', null);
INSERT INTO `tsys_menu` VALUES ('warningObject', 'BIZFRAME', 'warningObject', 'warningObject', '预警对象', null, null, '/base/warning/warningobject/warningobject.jsp', null, null, null, null, 'warning', '1', null, '#bizroot#BIZFRAME#warningManage#warning#warningObject#', null);
INSERT INTO `tsys_menu` VALUES ('warningRule', 'BIZFRAME', 'warningRule', 'warningRule', '预警规则', null, null, '/base/warning/warningrule/warningrule.jsp', null, null, null, null, 'warning', '2', null, '#bizroot#BIZFRAME#warningManage#warning#warningRule#', null);
INSERT INTO `tsys_menu` VALUES ('workBench', 'BIZFRAME', 'workBench', 'workBench', '工作台', null, 'workbench(w).png', null, '0', null, null, null, 'BIZFRAME', '15', null, '#bizroot#BIZFRAME#workBench#', null);

-- ----------------------------
-- Table structure for tsys_organization
-- ----------------------------
DROP TABLE IF EXISTS `tsys_organization`;
CREATE TABLE `tsys_organization` (
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '组织机构标识',
  `dimension` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '维度',
  `org_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构编码',
  `org_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '组织机构名称',
  `parent_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '上级组织标识',
  `manage_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组管组织标识',
  `position_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '负责岗位标识',
  `org_cate` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '组织分类:0-平台;1-银行;2-核心企业;3-供应商;4-金融机构;5-核心企业供应商',
  `org_level` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '组织级别:0-平台;1-集团;2-总公司;3-分公司;4-支公司',
  `org_order` int(11) DEFAULT NULL COMMENT '组织序号',
  `org_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '组织索引',
  `sso_org_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSO组织编码',
  `sso_parent_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SSO上级组织编码',
  `ext_id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` varchar(4) COLLATE utf8_bin DEFAULT '0' COMMENT 'QA:状态',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `shortorgname` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `platformsupplierrate` decimal(8,4) DEFAULT NULL COMMENT '平台向供应商收取的费率',
  `corecompanyrate` decimal(8,4) DEFAULT NULL COMMENT '平台付给核心企业的费率',
  `areaid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '区域ID',
  `financenumber` int(11) DEFAULT NULL COMMENT '融资次数',
  `address` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `legalperson` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '法人',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `lastmodifiedon` datetime DEFAULT NULL COMMENT '最后操作时间',
  PRIMARY KEY (`org_id`),
  KEY `nk_biz_org_code` (`org_code`) USING BTREE,
  KEY `nk_biz_org_name` (`org_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织表';

-- ----------------------------
-- Records of tsys_organization
-- ----------------------------
INSERT INTO `tsys_organization` VALUES ('0_10000001', '0', '10000001', '策赢集团', '6000001', '6000001', '0_10000001head', '0', '1', '0', '#bizroot#6000001#0_10000001#', null, null, null, null, '0', '10000', null, null, null, null, null, null, null, null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000001', '0', '100001000001', '北京银行总行', '6000001', '6000001', '0_100001000001head', '1', '1', '0', '#bizroot#6000001#0_100001000001#', null, null, null, null, '0', '10000', null, '0.0100', '0.0200', '1100', null, '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000003', '0', '100001000003', '北京银行分行2', '0_100001000001', '0_100001000001', '0_100001000003head', '1', '2', '0', '#bizroot#6000001#0_100001000001#0_100001000003#', null, null, null, null, '0', '10000', null, '0.0100', '0.0200', '1100', null, '111', '111', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000010', '0', '100001000010', '德州银行总行', '6000001', '6000001', '0_100001000010head', '1', '1', '0', '#bizroot#6000001#0_100001000010#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行总行地址', '德州银行总行法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000011', '0', '100001000011', '德州银行1', '0_100001000010', '0_100001000010', '0_100001000011head', '1', '2', '0', '#bizroot#6000001#0_100001000010#0_100001000011#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行1地址', '德州银行1法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000012', '0', '100001000012', '德州银行2', '0_100001000010', '0_100001000010', '0_100001000012head', '1', '2', '0', '#bizroot#6000001#0_100001000010#0_100001000012#', null, null, null, null, '0', '10000', null, '0.0000', '0.0000', '3714', null, '德州银行2地址', '德州银行2法人', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100001000013', '0', '100001000013', '江西银行', '6000001', '6000001', '0_100001000013head', '1', '2', null, '#bizroot#6000001#0_100001000013#', null, null, null, 'test11', null, '10000', null, '0.0000', '0.0000', '3713', null, '2', '2', '2017-11-23 19:21:07', '2017-12-01 17:23:59');
INSERT INTO `tsys_organization` VALUES ('0_100002000001', '0', '100002000001', '北京核心集团', '6000001', '6000001', '0_100002000001head', '2', '1', '0', '#bizroot#6000001#0_100002000001#', null, null, null, null, '0', '10000', null, '0.0000', '0.0200', '1100', null, '11', '1', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100002000002', '0', '100002000002', '北京核心子公司1', '0_100002000001', '0_100002000001', '0_100002000002head', '2', '2', '0', '#bizroot#6000001#0_100002000001#0_100002000002#', null, null, null, null, '0', '10000', null, '0.0000', '0.0111', '1100', '0', '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100002000003', '0', '100002000003', '北京核心子公司2', '0_100002000001', '0_100002000001', '0_100002000003head', '2', '3', null, '#bizroot#6000001#0_100002000001#0_100002000003#', null, null, null, 'test111', null, '10000', null, '0.0000', '0.0200', '3712', null, '北京', '张军', '2017-11-23 08:38:35', '2017-12-01 18:06:29');
INSERT INTO `tsys_organization` VALUES ('0_100003000001', '0', '100003000001', '北京供应商集团', '6000001', '6000001', '0_100003000001head', '3', '1', '0', '#bizroot#6000001#0_100003000001#', null, null, null, null, '0', '10000', null, '0.0100', '0.0000', '1100', '1', '11', '11', null, null);
INSERT INTO `tsys_organization` VALUES ('0_100003000002', '0', '100003000002', '北京供应商2', '6000001', '6000001', '0_100003000002head', '3', '3', null, '#bizroot#6000001#0_100003000002#', null, null, null, '11', null, '10000', null, '0.0150', '0.0000', '3712', null, '11', '11', '2017-11-24 14:53:04', '2017-11-24 14:54:23');
INSERT INTO `tsys_organization` VALUES ('6000001', '0', '001000', '策赢平台', 'bizroot', '6000001', '6000001head', '0', '0', '0', '#bizroot#6000001#', null, null, null, null, '0', '10000', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for tsys_org_user
-- ----------------------------
DROP TABLE IF EXISTS `tsys_org_user`;
CREATE TABLE `tsys_org_user` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:用户代码，外键TSYS_USER.USER_ID',
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '组织机构编号',
  `role_code` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  KEY `nk_biz_orguser_org_id` (`org_id`) USING BTREE,
  KEY `nk_biz_orguser_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_org_user
-- ----------------------------
INSERT INTO `tsys_org_user` VALUES ('100001995', '0_10000001', null, '10000');

-- ----------------------------
-- Table structure for tsys_package
-- ----------------------------
DROP TABLE IF EXISTS `tsys_package`;
CREATE TABLE `tsys_package` (
  `package_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐ID',
  `package_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐编号',
  `package_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `isactive` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否有效',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐表';

-- ----------------------------
-- Records of tsys_package
-- ----------------------------
INSERT INTO `tsys_package` VALUES ('1', '000000', '无限套餐', '0', '2016-09-02 00:00:00', '2017-11-13 16:33:25');
INSERT INTO `tsys_package` VALUES ('1001', '1001', '普通套餐-管理员', '1', '2017-01-18 11:10:07', '2017-11-15 17:49:09');
INSERT INTO `tsys_package` VALUES ('1002', '1002', '普通套餐-员工', '1', '2017-01-18 00:00:00', null);

-- ----------------------------
-- Table structure for tsys_package_detail
-- ----------------------------
DROP TABLE IF EXISTS `tsys_package_detail`;
CREATE TABLE `tsys_package_detail` (
  `package_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐ID',
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '交易编号',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '子交易编号',
  PRIMARY KEY (`package_id`,`trans_code`,`sub_trans_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_package_detail
-- ----------------------------
INSERT INTO `tsys_package_detail` VALUES ('1', 'accountsPayable', 'accountsPayableQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'agreementQuery', 'agreementQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'agreementTempQuery', 'agreementTempQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'appealQuery', 'appealQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'bigContract', 'bigContractQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'agreement');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'agreementTemp');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'appeal');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'bigContract');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'organization');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'supplierAccount');
INSERT INTO `tsys_package_detail` VALUES ('1', 'comprehensiveQuery', 'tradeAccounts');
INSERT INTO `tsys_package_detail` VALUES ('1', 'organization', 'organizationQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'organizationContact', 'organizationContact');
INSERT INTO `tsys_package_detail` VALUES ('1', 'supplierAccountQuery', 'supplierAccountQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeAccountsQuery', 'tradeAccountsQuery');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeBalance', 'tradeBalance');
INSERT INTO `tsys_package_detail` VALUES ('1', 'tradeTransaction', 'tradeTransaction');

-- ----------------------------
-- Table structure for tsys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `tsys_parameter`;
CREATE TABLE `tsys_parameter` (
  `param_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '参数编号',
  `rel_org` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '关联组织',
  `kind_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:分类编号，外键TSYS_KIND.KIND_CODE',
  `param_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '参数名称',
  `param_value` varchar(1024) COLLATE utf8_bin NOT NULL COMMENT '参数值',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:扩展标识',
  `lifecycle` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '生命周期',
  `platform` varchar(8) COLLATE utf8_bin DEFAULT '0' COMMENT '平台标识',
  `param_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '参数说明',
  `param_regex` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '参数正则验证规则',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`param_code`,`rel_org`),
  KEY `nk_biz_param_code` (`param_code`) USING BTREE,
  KEY `nk_biz_param_name` (`param_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统参数表';

-- ----------------------------
-- Records of tsys_parameter
-- ----------------------------
INSERT INTO `tsys_parameter` VALUES ('0007', '0_hangzhouDevelopment', '0002', '系统参数修改', '1', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('1112', '0_000000', 'dfdhggf', 'dasf', 'dfd', null, null, '0', 'dasf', null, null);
INSERT INTO `tsys_parameter` VALUES ('12121212', '0_000000', 'BIZ_PARAM', '12121212', 'true3434545eerrrrrrrwwwww', null, null, null, null, null, null);
INSERT INTO `tsys_parameter` VALUES ('2122323', '0_jjj', '0002', '2323', '34343', null, null, null, 'fsfsf', null, null);
INSERT INTO `tsys_parameter` VALUES ('22222222', '0_000000', 'BIZ_PARAM', '22222', '22222jjj', null, null, null, 'vbvb', null, null);
INSERT INTO `tsys_parameter` VALUES ('2704test', '0_000000', 'BIZ_PARAM', '输入内容不能包含单引号双引号', 'ddddyyyyy', null, null, null, null, '^[^\'\\u0022]*$', null);
INSERT INTO `tsys_parameter` VALUES ('34345', '0_000000', 'test', '54545', 'yyyyyyyyyuuuttttttt', null, null, null, null, null, null);
INSERT INTO `tsys_parameter` VALUES ('454', '0_000000', 'BIZ_PARAM', '4545', '4545', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('45454', '0_000000', 'test', '464654隔', '否发发', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('4546456', '0_t000004', '0002', '465657', 'ryt', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('545454', '0_000000', 'BIZ_PARAM', '454545', '4545454', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('666', '0_qqq', 'BIZ_PARAM', '666', '666', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('7777777', '0_000000', 'BIZ_PARAM', '77777777', '7777', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('87878', '0_000000', 'BIZ_PARAM', '65565', 'false2222', null, null, '0', null, '^false|true$', null);
INSERT INTO `tsys_parameter` VALUES ('adasd', '0_000000', 'test001', 'sa', 'dsf', null, null, '0', 'dsf', null, null);
INSERT INTO `tsys_parameter` VALUES ('bizMarquee', '0_000000', 'BIZ_PARAM', '通知', '<a href=\"http://www.fingard.com.cn\" target=\"_blank\">浙江保融科技有限公司</a>', null, null, null, 'bizMarquee', null, null);
INSERT INTO `tsys_parameter` VALUES ('cacheRefeshInterval', '0_000000', 'BIZ_PARAM', '缓存刷新间隔', '60', null, null, '1', '数值，代表缓存刷新的时间间隔(以秒为单位，默认60秒)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('commonPositionCodeSuffix', '0_000000', 'BIZ_PARAM', '普通岗位编号后缀', 'common', null, null, '1', '字符串，代表新增组织的普通岗位编号后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('commonPositionNameSuffix', '0_000000', 'BIZ_PARAM', '普通岗位名称后缀', '普通岗', null, null, '1', '字符串，代表新增组织的普通岗位名称后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('dasda', '0_qa', 'BIZ_PARAM', 'fdsf', 'fdf', null, null, '0', 'sdfdfg', null, null);
INSERT INTO `tsys_parameter` VALUES ('defaultLogo', '0_000000', 'BIZ_PARAM', '默认主页LOGO', 'logo.png', null, null, '1', '默认主页LOGO', null, null);
INSERT INTO `tsys_parameter` VALUES ('defaultUserPassword', '0_000000', 'BIZ_PARAM', '默认密码', '88888888', null, null, '1', '系统用户默认密码', null, null);
INSERT INTO `tsys_parameter` VALUES ('default_menu_depth', '0_000000', 'BIZ_PARAM', '默认主页菜单深度', '1', null, null, '1', '数值，代表默认主页菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('desktopBg', '0_000000', 'BIZ_PARAM', '桌面背景', 'desktopBg.gif', null, null, '1', '桌面背景', null, null);
INSERT INTO `tsys_parameter` VALUES ('desktopLogo', '0_000000', 'BIZ_PARAM', '桌面LOGO', 'desktopLogo.gif', null, null, '1', '桌面LOGO', null, null);
INSERT INTO `tsys_parameter` VALUES ('desktop_navigation_menu_depth', '0_000000', 'BIZ_PARAM', '桌面顶置导航菜单深度', '1', null, null, '1', '数值，代表桌面顶置导航菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('desktop_start_menu_depth', '0_000000', 'BIZ_PARAM', '桌面开始菜单深度', '1', null, null, '1', '数值，代表桌面开始菜单深度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('dfdfdf', '0_jjj', '0002', 'rerwer', '6', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('dsf', '0_000000', 'test001', 'dsaf', 'fdgg', null, null, '0', 'dswfsd', 'w*', null);
INSERT INTO `tsys_parameter` VALUES ('ererere', '0_000000', 'test', '热热热', '而额外', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('isShowAdminPwd', '0_000000', 'BIZ_PARAM', 'isShowAdminPwd', 'true', null, null, null, '^true|false$', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('lockScreenInterval', '0_000000', 'BIZ_PARAM', '锁屏时间隔', '6', null, null, null, '数值，代表用户无活动锁屏时间隔(以分钟为单位，默认10分钟)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('loginBg', '0_000000', 'BIZ_PARAM', '登陆页面背景', 'login_logo.png', null, null, '1', '登陆页面背景', null, null);
INSERT INTO `tsys_parameter` VALUES ('login_has_validateCode', '9_000000', 'BIZ_PARAM', '验证码', 'false', null, null, '0', null, '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('logoHeight', '0_000000', 'BIZ_PARAM', 'logo高度', '70', null, null, null, '数值，代表页面logo区域高度，默认值70', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('managerPositionCodeSuffix', '0_000000', 'BIZ_PARAM', '负责岗位编号后缀', 'head', null, null, '1', '字符串，代表新增组织的负责岗位编号后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('managerPositionNameSuffix', '0_000000', 'BIZ_PARAM', '负责岗位名称后缀', '主管岗', null, null, '1', '字符串，代表新增组织的负责岗位名称后缀', null, null);
INSERT INTO `tsys_parameter` VALUES ('maxWrongPass', '0_000000', 'BIZ_PARAM', '最大允许密码错误次数', '10', null, null, '1', '数值，表示大允许密码错误次数', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('menuLoadModel', '0_000000', 'BIZ_PARAM', '首页菜单加载模式', 'tree', null, null, '1', '字符串，代表首页菜单加载模式，目前只支持accordion和tree两种模式', '^accordion|tree$', null);
INSERT INTO `tsys_parameter` VALUES ('msgPollInterval', '0_000000', 'BIZ_PARAM', '消息轮询间隔', '1', null, null, null, '数值，代表页面消息轮询间隔(以分钟为单位，默认3分钟)', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('openMaxTabNum', '0_000000', 'BIZ_PARAM', '最大菜单数目', '6', null, null, '1', '数值，代表主页打开的最大菜单数目', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passRepeatCycle', '0_000000', 'BIZ_PARAM', '密码重复周期', '3', '1', null, null, '数值，代表用户密码重复周期(默认值0)。若值为4则表示修改密码时不能和之前的四次重复，0表示随意重复', '^[0-7]d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passUnit', '0_000000', 'BIZ_PARAM', '密码有效时间单位', '2', null, null, '1', '0代表天，1代表周，2代表月，3代表年', '^[0-3]$', null);
INSERT INTO `tsys_parameter` VALUES ('passValidity', '0_000000', 'BIZ_PARAM', '密码有效周期', '3', null, null, null, '数值，表示指定数量个密码有效单位的时间长度', '^[1-9]\\d*$', null);
INSERT INTO `tsys_parameter` VALUES ('passwordLengthMin', '0_000000', 'BIZ_PARAM', '密码最短长度', '8', null, null, '1', '系统用户密码最短长度', null, null);
INSERT INTO `tsys_parameter` VALUES ('shieldBcakSpace', '0_000000', 'BIZ_PARAM', '屏蔽鼠标右键', 'false', null, null, null, '布尔值，页面是否需屏蔽鼠标右键,true代表屏蔽false代表不屏蔽', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('shieldF5', '0_000000', 'BIZ_PARAM', '屏蔽F5按钮', 'false', null, null, null, '布尔值，页面是否需屏蔽F5按钮,true代表屏蔽false代表不屏蔽', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('singleTab', '0_000000', 'BIZ_PARAM', '单一打开菜单', 'true', null, null, '1', '布尔值，页面是否单一打开菜单,true代表单一打开 false代表多窗口打开', '^true|false$', null);
INSERT INTO `tsys_parameter` VALUES ('systemHelpUrl', '0_000000', 'BIZ_PARAM', '系统帮助手册地址', 'bizframe/jsp/help/bizframe-help.html', null, null, '1', '字符串，代表系统帮助手册地址', null, null);
INSERT INTO `tsys_parameter` VALUES ('test', '0_000000', 'BIZ_PARAM', 'test', '11111111111', null, null, '0', null, '^[0-9]{0,10}', null);
INSERT INTO `tsys_parameter` VALUES ('ttt', '0_000000', '0002', 'ttt', 'ttt', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('tttttt', '0_000000', 'BIZ_PARAM', 'tttttt', '1', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('welcomeUrl', '9_000000', 'BIZ_PARAM', '主页8888', 'http://www.baidu.com', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('y1', '0_000000', 'test001', 'y1', 'y3', null, null, '0', null, null, null);
INSERT INTO `tsys_parameter` VALUES ('yyy', '0_000000', '0002', 'yyy', 'yyy', null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for tsys_position
-- ----------------------------
DROP TABLE IF EXISTS `tsys_position`;
CREATE TABLE `tsys_position` (
  `position_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编号',
  `position_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `parent_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '上级岗位编号',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '所属组织',
  `role_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '角色编号',
  `position_path` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位内码',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`position_code`),
  KEY `nk_biz_pos_name` (`position_name`) USING BTREE,
  KEY `nk_biz_pos_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统岗位表';

-- ----------------------------
-- Records of tsys_position
-- ----------------------------
INSERT INTO `tsys_position` VALUES ('0_001001001common', '浙江保融科技上海分公司普通岗', '0_001001001head', '0_001001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#0_001001001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001001head', '浙江保融科技上海分公司主管岗', '0_001001head', '0_001001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002001common', '浙江保融深圳子公司普通岗', '0_001001002001head', '0_001001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#0_001001002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002001head', '浙江保融深圳子公司主管岗', '0_001001002head', '0_001001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002common', '浙江保融广州分公司普通岗', '0_001001002head', '0_001001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001002head', '浙江保融广州分公司主管岗', '0_001001head', '0_001001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001common', '浙江保融科技有限公司普通岗', '0_001001head', '0_001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001001head', '浙江保融科技有限公司主管岗', '0_101common', '0_001001', null, '#bizroot#0_1head#0_101head#0_101common#0_001001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002001common', '浙江财资北京分公司普通岗', '0_001002001head', '0_001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#0_001002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002001head', '浙江财资北京分公司主管岗', '0_001002head', '0_001002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002001common', '浙江财资南京子公司普通岗', '0_001002002001head', '0_001002002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#0_001002002001common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002001head', '浙江财资南京子公司主管岗', '0_001002002head', '0_001002002001', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002common', '浙江财资江苏分公司普通岗', '0_001002002head', '0_001002002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002002head', '浙江财资江苏分公司主管岗', '0_001002head', '0_001002002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002common', '浙江财资科技有限公司普通岗', '0_001002head', '0_001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_001002head', '浙江财资科技有限公司主管岗', '0_101common', '0_001002', null, '#bizroot#0_1head#0_101head#0_101common#0_001002head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_101common', '浙江保融科技有限公司北京分公司普通岗', '0_101head', '0_101', null, '#bizroot#0_1head#0_101head#0_101common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_101head', '浙江保融科技有限公司北京分公司主管岗', '0_1head', '0_101', null, '#bizroot#0_1head#0_101head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_102common', '浙江保融科技有限公司上海分公司普通岗', '0_102head', '0_102', null, '#bizroot#0_1head#0_102head#0_102common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_102head', '浙江保融科技有限公司上海分公司主管岗', '0_1head', '0_102', null, '#bizroot#0_1head#0_102head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_10301common', '浙江保融科技有限公司深圳子公司普通岗', '0_10301head', '0_10301', null, '#bizroot#0_1head#0_103head#0_10301head#0_10301common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_10301head', '浙江保融科技有限公司深圳子公司主管岗', '0_103head', '0_10301', null, '#bizroot#0_1head#0_103head#0_10301head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_103common', '浙江保融科技有限公司广州分公司普通岗', '0_103head', '0_103', null, '#bizroot#0_1head#0_103head#0_103common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_103head', '浙江保融科技有限公司广州分公司主管岗', '0_1head', '0_103', null, '#bizroot#0_1head#0_103head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_1common', '浙江财资科技有限公司普通岗', '0_1head', '0_1', null, '#bizroot#0_1head#0_1common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_1head', '浙江保融科技有限公司主管岗', 'bizroot', '0_1', null, '#bizroot#0_1head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_201common', '浙江财资科技有限公司江苏分公司普通岗', '0_201head', '0_201', null, '#bizroot#0_1head#0_2head#0_201head#0_201common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_201head', '浙江财资科技有限公司江苏分公司主管岗', '0_2head', '0_201', null, '#bizroot#0_1head#0_2head#0_201head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_202common', '浙江财资科技有限公司河南分公司普通岗', '0_202head', '0_202', null, '#bizroot#0_1head#0_2head#0_202head#0_202common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_202head', '浙江财资科技有限公司河南分公司主管岗', '0_2head', '0_202', null, '#bizroot#0_1head#0_2head#0_202head#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_2common', '浙江财资科技有限公司普通岗', '0_2head', '0_2', null, '#bizroot#0_1head#0_2head#0_2common#', null, null, null, null);
INSERT INTO `tsys_position` VALUES ('0_2head', '浙江财资科技有限公司主管岗', '0_1head', '0_2', null, '#bizroot#0_1head#0_2head#', null, null, null, null);

-- ----------------------------
-- Table structure for tsys_pos_user
-- ----------------------------
DROP TABLE IF EXISTS `tsys_pos_user`;
CREATE TABLE `tsys_pos_user` (
  `position_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编号',
  `user_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '用户代码',
  PRIMARY KEY (`user_id`,`position_code`),
  KEY `nk_biz_posuser_pos_code` (`position_code`) USING BTREE,
  KEY `nk_biz_posuser_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='岗位用户关系表';

-- ----------------------------
-- Records of tsys_pos_user
-- ----------------------------

-- ----------------------------
-- Table structure for tsys_role
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role`;
CREATE TABLE `tsys_role` (
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `role_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `parent_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '角色父节点标识',
  `role_path` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '角色索引',
  `role_order` decimal(22,0) DEFAULT '0' COMMENT 'QA:角色命令',
  `create_date` datetime DEFAULT NULL COMMENT 'QA:分配时间',
  `modify_date` datetime DEFAULT NULL COMMENT 'QA:最后修改时间',
  `org_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '组织ID',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`role_code`),
  KEY `nk_biz_role_name` (`role_name`) USING BTREE,
  KEY `nk_biz_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of tsys_role
-- ----------------------------
INSERT INTO `tsys_role` VALUES ('10000001', '平台经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000002', '平台复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000003', '平台审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000101', '银行经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-08-29 17:35:22', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000102', '银行复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-08-29 17:55:20', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000103', '银行审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-08-29 17:52:01', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000104', '银行客户经理', 'admin', null, null, null, '4', '2017-08-28 14:25:17', '2017-10-26 09:42:41', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000105', '银行库管', 'admin', null, null, null, '5', '2017-11-26 11:58:09', '2017-10-26 09:42:22', null, '10000');
INSERT INTO `tsys_role` VALUES ('100001111', '111', 'admin', null, null, null, '1', '2017-11-15 18:39:01', null, null, null);
INSERT INTO `tsys_role` VALUES ('10000121', '1212', 'admin', null, null, null, null, '2017-11-15 18:57:05', null, null, null);
INSERT INTO `tsys_role` VALUES ('100001212121', '121', 'admin', null, null, null, null, '2017-11-15 18:52:34', null, null, null);
INSERT INTO `tsys_role` VALUES ('1000012312', '21312', 'admin', null, null, null, '123123', '2017-11-14 13:36:00', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000123123', '123123', 'admin', null, null, null, '-3', null, '2017-11-16 14:55:28', '6000001', '10427');
INSERT INTO `tsys_role` VALUES ('1000012313', '1231231', 'admin', null, null, null, '211', null, '2017-11-15 15:26:40', '6000001', '10462');
INSERT INTO `tsys_role` VALUES ('10000123132', '123123', null, null, null, null, '112', null, null, null, '10000');
INSERT INTO `tsys_role` VALUES ('100001993', '管理者', 'admin', null, null, null, '2', '2017-11-27 09:44:18', '2017-11-27 11:07:18', '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000201', '核心企业经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000202', '核心企业复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000203', '核心企业审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000301', '供应商经办', 'admin', null, null, null, '1', '2017-06-08 10:09:04', '2017-06-27 16:05:11', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000302', '供应商复核', 'admin', null, null, null, '2', '2017-06-08 10:09:21', '2017-06-27 16:05:25', null, '10000');
INSERT INTO `tsys_role` VALUES ('10000303', '供应商审核', 'admin', null, null, null, '3', '2017-06-08 10:09:35', '2017-06-27 16:05:35', null, '10000');
INSERT INTO `tsys_role` VALUES ('1000032112312', '231123123123', 'admin', null, null, null, '31121', null, '2017-11-10 16:04:34', null, null);
INSERT INTO `tsys_role` VALUES ('1000033', '3333333', 'admin', null, null, null, '333333', '2017-11-15 18:51:46', '2017-11-15 18:51:49', null, null);
INSERT INTO `tsys_role` VALUES ('10000330', '666', 'admin', null, null, null, '6', '2017-11-14 13:37:14', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('10000444444', '123123', 'admin', null, null, null, '1112', '2017-11-17 13:49:12', null, '6000001', '10000');
INSERT INTO `tsys_role` VALUES ('1000098989898', '8989', 'admin', null, null, null, null, '2017-11-15 18:58:36', null, null, null);
INSERT INTO `tsys_role` VALUES ('admin', '后台权限管理员', 'admin', null, null, null, '1', null, '2017-07-28 10:54:03', '6000001', '10000');

-- ----------------------------
-- Table structure for tsys_role_right
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role_right`;
CREATE TABLE `tsys_role_right` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:授权角色,外键:TSYS_ROLE.ROLE_CODE',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `create_date` decimal(22,0) DEFAULT NULL COMMENT '分配时间',
  `begin_date` decimal(22,0) NOT NULL COMMENT '生效时间',
  `end_date` decimal(22,0) NOT NULL COMMENT '失效时间',
  `right_flag` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示该授权的操作授权标志 取数据字典[SYS_BIZ_RIGHT_FLAG] 1-操作 2-授权',
  `right_enable` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该授权的是否禁止标志 取数据字典[SYS_BIZ_RIGHT_ENABLE] 0-禁止 1-可用',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`trans_code`,`sub_trans_code`,`role_code`,`begin_date`,`end_date`,`right_flag`),
  KEY `nk_biz_roleright_role_code` (`role_code`) USING BTREE,
  KEY `nk_biz_roleright_trans_code` (`trans_code`,`sub_trans_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限授权表';

-- ----------------------------
-- Records of tsys_role_right
-- ----------------------------
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BIZFRAME', 'BIZFRAME', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Add', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Adjust', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'BigContractMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Cancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Del', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'Edit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'SendApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'View', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bcSendapprovebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'bigcontractQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filecheck', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('BigContractMgmt', 'filedownload', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableChx', 'WBpayableChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntention', 'WBpayableIntention', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBpayableQuote', 'WBpayableQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountTaskTodo', 'accountTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountTaskTodo', 'accountTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('accountsPayableSignature', 'accountsPayableSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealDone', 'appealDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealMgmt', 'appealMgmtQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealStart', 'appealStart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoArbitrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoDeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealTodoTask', 'appealTodoTask', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'allocateuser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'areaMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'bankjurisdiction', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('areaMgmt', 'unallocateuser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'approveSign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'bankInvite', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankInvite', 'rejectSign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankQuota', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankQuota', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotadel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotadel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaquery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankQuota', 'bankquotaquery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankSupplierRelation', 'bankSupplierRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bankView', 'bankView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('baseSet', 'baseSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('baseSet', 'baseSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bigContractSignature', 'bigContractSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'activate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bigOrgDelAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAllot', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgAllot', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgInitialinfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgcate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizOrgSet', 'bizOrgedits', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'bizSetCache', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'bizSetCache', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'refreshCache', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'refreshCache', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'sys01c001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetCache', 'sys01c001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLog', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLog', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStop', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'bizSetLogStop', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'setlog', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetLog', 'setlog', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuDelete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuDelete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSort', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSort', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranDete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranDete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizSetMenu', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetMenu', 'bizSetMenu', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizSetOrgRole', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetOrgRole', 'bizSetOrgRole', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizRoleRightSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizRoleRightSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRole', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRole', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleDelete', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleDelete', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'bizSetRoleEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'roleUserDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'rolesendapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetRole', 'rolesendapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizCancelUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizGiveUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizModifyPwd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgCancelUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizOrgGiveUR', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizResetPass', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizSetUser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserActivate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'bizUserRightAuth', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userAssigned', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userAssigned', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userModifyMobile', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUser', 'userView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'bizSetUserKey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'bizSetUserKey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'userBindKey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKey', 'userBindKey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSysManager', 'bizSysManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizSysManager', 'bizSysManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('bizUserManager', 'bizUserManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchain', 'blockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainApplyQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainSend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainApply', 'blockchainsend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainFind', 'blockchainFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainManage', 'blockchainManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'blockchainNodeManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'check', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainNodeManage', 'checkbefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchainView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'blockchaingetkey', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('blockchainView', 'getfromblockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('business', 'business', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'base02a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaractive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaractive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaradd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaradd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardisactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendardisactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaredit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendaredit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarsManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarsManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdisactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialdisactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('calendarsManager', 'calendarspecialedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'checkSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('checkSignature', 'content', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('cooperation', 'cooperation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'applySign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyInvite', 'corecompanyInvite', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyQuota', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotadel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyQuota', 'corecompanyquotaedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanySupportBank', 'corecompanySupportBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('corecompanyView', 'corecompanyView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencydel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencydel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('currencyManage', 'currencyedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('customService', 'customService', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'firstBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('firstBank', 'querybanklist', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', 'admin', 'amdin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowForm', 'flowForm', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowForm', 'flowForm', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'flowFormKind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'flowFormKind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormKind', 'workflowFormTypeModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'flowFormReg', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'flowFormReg', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowFormReg', 'workflowFormRegRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcExp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcExp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcFormBind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcFormBind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcImp', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcImp', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcPublish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcPublish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowDesignProcSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowManaDesign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaDesign', 'flowManaDesign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowManaProcKind', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowManaProcKind', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeRemove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeRemove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeSave', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManaProcKind', 'flowProcTypeSave', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManage', 'flowManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowManage', 'flowManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMenu', 'flowMenu', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMenu', 'flowMenu', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMoniInstance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMoniInstance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMonitor', 'flowMonitor', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMonitor', 'flowMonitor', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTask', 'flowTask', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTask', 'flowTask', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskHistory', 'flowTaskHistory', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskHistory', 'flowTaskHistory', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskTodo', 'flowTaskTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('flowTaskTodo', 'flowTaskTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasMgmt', 'gasMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasMgmt', 'gasMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasaccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasaccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gasaccount', 'gasacctedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastranadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastranadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransactions', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransactions', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('gastransactions', 'gastransedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('generalSettings', 'generalSettings', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'certapplydownload', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'checkvalidempty', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'getconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keyInit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInit', 'keypostsign', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getclosedconfirmation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInitRecord', 'keyInitRecord', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'keyinventoryedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'remove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyInventoryMgmt', 'stock', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'apply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'approve', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'confirm', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('keyPurchase', 'keyPurchase', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageAppeal', 'manageAppeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBank', 'manageBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageBigContract', 'manageBigContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageCoreCompany', 'manageCoreCompany', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageFuel', 'manageFuel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageIntegral', 'manageIntegral', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageKeys', 'manageKeys', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrg', 'manageOrg', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgRelation', 'manageOrgRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageOrgUser', 'manageOrgUser', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('managePayable', 'managePayable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageProvider', 'manageProvider', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecable', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageRecable', 'manageRecableRevoke', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageServiceBank', 'manageServiceBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSignature', 'manageSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageSupplierAccount', 'manageSupplierAccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTradeContract', 'manageTradeContract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'approveUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'disapproveUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'examineTest', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'getagreetemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'match', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'matchgetbigcontract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('match', 'querysigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'base02a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'base02a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticeedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticesManager', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('noticesManager', 'noticesManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgBankRelation', 'orgBankRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'orgContractMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationclose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgContractMgmt', 'organizationedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('orgSupplierRelation', 'orgSupplierRelation', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableChx', 'payableChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableExpireList', 'payableExpireList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntention', 'payableIntention', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'payableIntentionApply', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'abandonPriorityUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'payableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'queryUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableIntentionList', 'submitQuoteUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadResults', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableEditRate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableExtend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableImportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayablePublish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'accountsPayableRevoke', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableMgmt', 'payableMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'payableQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuote', 'returnQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('payableQuoteQuery', 'payableQuoteQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplate', 'platformTemplate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplate', 'platformTemplate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformTemplateedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformTemplateedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformtemplateadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'plaformtemplateadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'platformTemplateManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('platformTemplateManage', 'platformTemplateManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('recableQuoteQuery', 'recableQuoteQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('regionMgmt', 'regionMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('regionMgmt', 'regionMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'resubmitQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a004', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'base05a004', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedule', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedule', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduledel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduledel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'scheduleedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulepause', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulepause', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulerun', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulerun', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulestart', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('schedule', 'schedulestart', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('signature', 'signature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierBlackList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierBlackList', 'supplierblacklistpull', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierView', 'supplierView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coreindividuationedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'coremodifyrate', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'pull', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierWhiteList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supplierWhiteList', 'supplierblacklistedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'BankListQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportBank', 'supportBank', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportQueryUrl', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompany', 'syscompany', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompany', 'syscompany', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'syscompanyinfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'syscompanyinfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantEidt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscompanyinfo', 'tenantEidt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontract', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontract', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syscontract', 'syscontractEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageActive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageActive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageClose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageClose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageSet', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageSet', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('syspackage', 'syspackageView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParam', 'systemParam', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParam', 'systemParam', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a001', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a001', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a002', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a002', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a003', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'base03a003', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanagedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanagedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'parammanageedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'systemParamManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemParamManage', 'systemParamManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('systemsettings', 'systemsettings', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('taTemplateSignature', 'taTemplateSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('task', 'task', 'admin', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a006', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a006', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a007', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'sys99a007', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrcownerconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelist', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelist', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tdrctablelist', 'tdrctablelistedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tenant', 'tenant', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'thsirightedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('thsiright', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('trade', 'trade', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountBalance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountBalance', 'tradeAccountappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradeAccountDetail', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountDetail', 'tradetransactionQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountactive', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountactive', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountclose', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountMgmt', 'tradeaccountclose', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taApprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'base', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'gather', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'load', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'taDoneQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000105', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'abolish', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'abolish', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000104', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementRunning', 'withdraw', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateView', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templateView', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'create', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'create', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'getdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'getdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'gethead', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'gethead', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'save', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'save', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'set', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'set', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqladd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqladd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqledit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'sqledit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfacedel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfacedel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcmanage', 'tsvcmanage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcmanage', 'tsvcmanage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqladd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqladd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqldel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqldel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqledit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcsql', 'tsvcsqledit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcinterface', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('userManager', 'userManager', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('userManager', 'userManager', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warning', 'warning', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warning', 'warning', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningAnnulMessage', 'warningAnnulMessage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningAnnulMessage', 'warningAnnulMessage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningManage', 'warningManage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningManage', 'warningManage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'annul', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'annul', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'warningMessage', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningMessage', 'warningMessage', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObject', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObject', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningObject', 'warningObjectEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRule', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRule', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleAdd', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleAdd', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleDel', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleDel', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleEdit', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('warningRule', 'warningRuleEdit', 'admin', 'admin', '0', '0', '0', '2', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000001', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000002', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000003', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000101', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000102', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000103', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000201', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000202', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000203', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000301', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000302', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', '10000303', null, '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', 'admin', 'admin', '0', '0', '0', '1', null, null);
INSERT INTO `tsys_role_right` VALUES ('workBench', 'workBench', 'admin', 'admin', '0', '0', '0', '2', null, null);

-- ----------------------------
-- Table structure for tsys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tsys_role_user`;
CREATE TABLE `tsys_role_user` (
  `user_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `role_code` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'QA:角色编号,外键:TSYS_ROLE.ROLE_CODE',
  `right_flag` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '1-操作角色 2-授权角色',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_code`,`role_code`,`right_flag`),
  KEY `nk_biz_roleuser_ru` (`user_code`,`role_code`) USING BTREE,
  KEY `nk_roleuser_role` (`role_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色用户关系表';

-- ----------------------------
-- Records of tsys_role_user
-- ----------------------------
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000002', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000003', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000101', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100101', '10000102', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('1000000100102', '100001111', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('10000100001301', '10000101', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000100001302', '10000102', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000100001303', '10000103', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000123123132', '100001111', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('100001993', '100001993', '1', '10000');
INSERT INTO `tsys_role_user` VALUES ('10000300000201', '10000301', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000300000202', '10000302', '1', null);
INSERT INTO `tsys_role_user` VALUES ('10000300000203', '10000303', '1', null);
INSERT INTO `tsys_role_user` VALUES ('admin', 'admin', '1', null);
INSERT INTO `tsys_role_user` VALUES ('admin', 'admin', '2', null);

-- ----------------------------
-- Table structure for tsys_subtrans
-- ----------------------------
DROP TABLE IF EXISTS `tsys_subtrans`;
CREATE TABLE `tsys_subtrans` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_TRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '子交易编号',
  `sub_trans_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '子交易名称',
  `rel_serv` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '映射服务',
  `rel_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '00-不控制功能权限/不控制数据权限 01-不控制功能权限/控制数据权限 10-控制功能权限/不控制数据权限 11-控制功能权限/控制数据权限 ',
  `ctrl_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '0-不控制 1-授权控制',
  `login_flag` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '0-否 1-是',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`trans_code`,`sub_trans_code`),
  KEY `nk_biz_sbutrans_sub_code` (`sub_trans_code`) USING BTREE,
  KEY `nk_biz_sbutrans_trans_code` (`trans_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统子交易表';

-- ----------------------------
-- Records of tsys_subtrans
-- ----------------------------
INSERT INTO `tsys_subtrans` VALUES ('BIZFRAME', 'BIZFRAME', '资金管理系统', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Add', '导入', 'bigcontract/add', null, null, '1', '导入保理额度合同', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Adjust', '修改授信额度', 'bigcontract/adjust', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'BigContractMgmt', '反向保理额度管理', null, '/rfp/bigcontract/bigcontractmanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Cancel', '撤销', 'bigcontract/cancel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Del', '删除', 'bigcontract/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'Edit', '修改', 'bigcontract/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'SendApprove', '送审', 'bigcontract/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'View', '查看详情', 'bigcontract/view', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bcCheckbeforeapprove', '校验待签名信息', 'bigcontract/checkbeforeapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bcSendapprovebefore', '查询待签名信息', 'bigcontract/sendapprovebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'bigcontractQuery', '大合同查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'filecheck', '查询附件信息', 'bigcontract/checkfile', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('BigContractMgmt', 'filedownload', '下载附件', 'common/fileDownload', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('KeyInitConfirmState', 'KeyInitConfirmState', '电子签名确认书', null, '/rfp/keymgmt/keyinitconfirmstate.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('KeyInitConfirmState', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountedit', '供应商专户账户编辑', 'supplieraccount/account/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsMgmt', '保理专户管理', null, '/rfp/supplieraccount/supplieraccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsappeal', '供应商专户账户申诉', 'supplieraccount/account/appealadd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'SupplierAccountsdel', '供应商专户账户删除', 'supplieraccount/account/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'supplieraccountQuery', '供应商专户账户查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('SupplierAccountsMgmt', 'supplieraccountadd', '供应商专户账户新增', 'supplieraccount/account/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBflowTaskTodo', 'WBflowTaskTodo', '其它待办任务', null, '/workflow/client/todo/todoTaskSimple.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableChx', 'WBpayableChx', '应付账款审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntention', 'WBpayableIntention', '融资意愿审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntentionApply', 'WBpayableIntentionApply', '发起融资意愿', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableIntentionList', 'WBpayableIntentionList', '优先融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBpayableQuote', 'WBpayableQuote', '融资确认审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBreturnPayableIntentionList', 'WBreturnPayableIntentionList', '退回融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBsupportPayableIntentionList', 'WBsupportPayableIntentionList', '支持融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('WBtripartiteAgreementChxTodo', 'WBtripartiteAgreementChxTodo', '三方协议待办任务', null, '/rfp/agreement/chxtodo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountTaskTodo', 'accountTaskTodo', '待办应付账款', null, '/workflow/client/todo/todoTaskSimple.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayable', 'accountsPayable', '应付账款', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayableQuery', 'accountsPayableQuery', '应付账款查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('accountsPayableSignature', 'accountsPayableSignature', '应付账款签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreement', 'agreement', '三方协议', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementQuery', 'agreementQuery', '三方协议查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementTemp', 'agreementTemp', '三方协议模板', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('agreementTempQuery', 'agreementTempQuery', '三方协议模板查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appeal', 'appeal', '申诉管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealDone', 'appealDone', '已完成申诉', null, '/rfp/appeal/appealdone.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmt', '申诉类型管理', null, '/rfp/appeal/appealmanagement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtActive', '激活申诉', 'appealmgmt/appealmgmt/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtAdd', '新增申诉信息', 'appealmgmt/appealmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtClose', '申诉冻结', 'appealmgmt/appealmgmt/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtEdit', '修改申诉信息', 'appealmgmt/appealmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealMgmt', 'appealMgmtQuery', '申诉信息查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealQuery', 'appealQuery', '申诉管理查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealStart', 'appealEdit', '修改', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealStart', 'appealStart', '我发起的申诉', null, '/rfp/appeal/appealmanagementforme.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoArbitrate', '仲裁申诉信息', 'appealmsmgmt/appealmsmgmt/arbitrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoDeal', '处理申诉信息', 'appealmsmgmt/appealmsmgmt/deal', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoEdit', '编辑申诉信息', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoSave', '保存申诉信息', 'appealopinion/appealopinion/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealTodoTask', 'appealTodoTask', '待处理申诉', null, '/rfp/appeal/appealtodotaskindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmt', '申诉信息管理', null, '/rfp/appeal/appealdetailmanagement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtActive', '激活申诉信息', 'appealmsmgmt/appealmsmgmt/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtAdd', '新增申诉信息', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtClose', '冻结申诉信息', 'appealmsmgmt/appealmsmgmt/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtEdit', '修改申诉信息', 'appealmsmgmt/appealmsmgmt/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtQuery', '申诉信息查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtarbitrate', '申诉信息仲裁', 'appealmsmgmt/appealmsmgmt/arbitrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('appealmsMgmt', 'appealmsMgmtdeal', '处理申诉信息', 'appealmgmt/appealmgmt/deal', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'allocateuser', '分配辖区', 'bankjurisdiction/bankarea/allocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'areaMgmt', '银行辖区管理', null, '/rfp/organization/bankjurisdiction/bankarea.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'bankjurisdiction', '分配辖区', 'bankjurisdiction/bankarea/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('areaMgmt', 'unallocateuser', '取消辖区', 'bankjurisdiction/bankarea/unallocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'approveSign', '同意邀请', 'usermanage/org/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'bankInvite', '银行邀请信息', null, '/rfp/organization/bankinvite/bankinvite.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankInvite', 'rejectSign', '拒绝邀请', 'usermanage/org/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankQuota', '银行给核心企业额度', null, '/rfp/organization/bankquota/bankquota.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaadd', '新增银行给核心企业额度信息', 'bankquota/bankquota/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotadel', '删除银行给核心企业额度信息', 'bankquota/bankquota/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaedit', '修改银行给核心企业额度信息', 'bankquota/bankquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankQuota', 'bankquotaquery', '查询银行给核心企业额度信息', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankSupplierRelation', 'bankSupplierRelation', '银行分配供应商', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=3', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bankView', 'bankView', '合作银行查看', null, '/rfp/organization/orgview/orgbank.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('baseSet', 'baseSet', '基础设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContract', 'bigContract', '大合同', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContractQuery', 'bigContractQuery', '大合同信息查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bigContractSignature', 'bigContractSignature', '反向保理额度签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'activate', '激活用户', 'usermanage/org/activate', null, null, '1', '激活用户', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bigOrgAllocate', '分配', 'usermanage/org/addallocaterela', null, null, '1', '组织机构设置中的组织分配表单中的分配按钮', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bigOrgDelAllocate', '取消', 'usermanage/org/delallocaterela', null, null, '1', '取消', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgAdd', '新增组织机构', 'usermanage/org/add', null, '1', '1', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgAllot', '分配用户组织机构', 'usermanage/org/allocateuser', null, null, '1', null, '0', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgCancel', '取消用户组织机构', 'usermanage/org/unallocateuser', null, null, '1', null, '0', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgDel', '删除组织机构', 'usermanage/org/del', null, '1', '1', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgEdit', '修改组织机构', 'usermanage/org/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgInitialinfo', '初始化基础信息', 'usermanage/org/initialinfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgSet', '组织机构设置', null, '/admin/system/orgmanage/orgmanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgcate', '查询组织编码', 'usermanage/org/orgcate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizOrgSet', 'bizOrgedits', '维护联系人', 'usermanage/org/allocaterela', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'bizSetCache', '缓存刷新', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'refreshCache', '缓存刷新', 'bizSetCache/refreshCache', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetCache', 'sys01c001', '查询CACHE对象', 'UC_SYS_JRESCACHELIST', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLog', '业务日志设置', 'systemmanage/log/setlog', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogFind', '业务日志查看', 'systemmanage/log/view', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogStart', '业务日志开启', 'systemmanage/log/start', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'bizSetLogStop', '业务日志关闭', 'systemmanage/log/stop', null, '0', '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetLog', 'setlog', '业务日志设置', 'systemmanage/log/setlog', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuAdd', '菜单新增', 'systemmanage/menu/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuDelete', '菜单删除', 'systemmanage/menu/del', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuEdit', '菜单编辑', 'systemmanage/menu/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSort', '菜单排序', 'systemmanage/menu/move', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranAdd', '菜单子功能新增', 'systemmanage/menu/subtranadd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranDete', '菜单子功能删除', 'systemmanage/menu/subtrandel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizMenuSubtranEdit', '菜单子功能修改', 'systemmanage/menu/subtranedit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetMenu', 'bizSetMenu', '系统菜单设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizOrgRoleAllocate', '分配角色', 'usermanage/postion/allocaterole', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizOrgRoleUnallocate', '取消分配角色', 'usermanage/postion/unallocaterole', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetOrgRole', 'bizSetOrgRole', '多岗设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizRoleRightSet', '角色分配权限', 'usermanage/role/allocatepower', null, '0', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRole', '角色设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleAdd', '角色添加', 'usermanage/role/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleDelete', '角色删除', 'usermanage/role/del', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'bizSetRoleEdit', '角色修改', 'usermanage/role/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'roleUserAdd', '分配角色用户', 'usermanage/role/allocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'roleUserDel', '取消分配角色用户', 'usermanage/role/unallocateuser', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetRole', 'rolesendapprove', '角色送审', 'usermanage/role/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizCancelUR', '取消分配角色', 'usermanage/user/unallocaterole', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizGiveUR', '分配角色', 'usermanage/user/allocaterole', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizModifyPwd', '修改密码', 'home/modifyPwd', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizOrgCancelUR', '取消分配组织', 'usermanage/user/unallocateorg', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizOrgGiveUR', '分配组织', 'usermanage/user/allocateorg', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizResetPass', '用户清密', 'usermanage/user/reset', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizSetUser', '用户设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserActivate', '激活用户', 'usermanage/user/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserAdd', '用户新增', 'usermanage/user/add', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserModfiy', '用户修改', 'usermanage/user/edit', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserRemove', '用户注销', 'usermanage/user/close', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'bizUserRightAuth', '用户权限授权', 'usermanage/user/allocatepower', null, '1', '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'userModifyMobile', '修改手机号', 'usermanage/user/modifyMobile', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUser', 'userView', '信息查看', 'usermanage/user/view', null, '0', '0', null, '1', null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKey', 'bizSetUserKey', '用户KEY绑定', null, '/rfp/userkey/userbindkey.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKey', 'userBindKey', '绑定KEY', 'userkeymanage/userkey/bind', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSetUserKeyApply', 'bizSetUserKeyApply', '用户KEY申请', null, '/rfp/userkey/userapplykey.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizSysManager', 'bizSysManager', '系统管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('bizUserManager', 'bizUserManager', '用户管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchain', 'blockchain', '区块链', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainAdd', '新增节点', 'blockchainnode/blockchain/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainApply', '申请成为节点', null, '/rfp/blockchain/blockchainnodeapply.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainApplyQuery', '区块链节点查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainCancel', '撤销', 'blockchainnode/blockchain/cancel', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainDel', '删除节点', 'blockchainnode/blockchain/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainEdit', '修改节点', 'blockchainnode/blockchain/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainSend', '发布节点', 'blockchainnode/blockchain/send', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainApply', 'blockchainsend', '送审验签', 'blockchainnode/blockchain/sendbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainFind', 'blockchainFind', '区块链取证', null, '/rfp/blockchain/blockchainsearch.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainManage', 'blockchainManage', '区块链', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'blockchainNodeManage', '节点管理', null, '/rfp/blockchain/blockchainnodemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'check', '流程验签', 'blockchainnode/blockchain/check', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainNodeManage', 'checkbefore', '流程送审', 'blockchainnode/blockchain/checkbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'blockchainView', '区块链查看', null, '/rfp/blockchain/blockchainbrowser.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'blockchaingetkey', '获取三方协议加密密钥', 'tripartiteagreementmanage/tripartiteagreement/getkey', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('blockchainView', 'getfromblockchain', '从区块链获取数据', 'blockchain/getfromblockchain', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('business', 'business', '业务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('caidan', 'caidan', '菜单', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('caidantest3', 'caidantest3', 'test3', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'base02a001', '日历查看', 'UC_BASE_SET_CALENDARS_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'base02a002', '特殊日历查看', 'UC_BASE_SET_CALENDARSPECIAL_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaractive', '日历生效', 'generalset/calendar/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaradd', '日历新增', 'generalset/calendar/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendardel', '日历删除', 'generalset/calendar/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendardisactive', '日历失效', 'generalset/calendar/disactive', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendaredit', '日历修改', 'generalset/calendar/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarsManager', '日历管理', null, '/base/system/calendars/calendarstab.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialactive', '特殊日历生效', 'generalset/calendarspecial/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialadd', '特殊日历新增', 'generalset/calendarspecial/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialdel', '特殊日历删除', 'generalset/calendarspecial/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialdisactive', '特殊日历激活', 'generalset/calendarspecial/disactive', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('calendarsManager', 'calendarspecialedit', '特殊日历修改', 'generalset/calendarspecial/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('checkSignature', 'checkSignature', '我要验签', null, '/rfp/keymgmt/signverify.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('checkSignature', 'content', '复制', 'base/tool/content', null, null, '1', '正文接口', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('comprehensiveQuery', 'comprehensiveQuery', '综合查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('cooperation', 'cooperation', '合作', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyFirstBank', 'bankQuotaEdit', '修改银行给核心企业额度', 'bankquota/bankquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyFirstBank', 'corecompanyFirstBank', '优先级', null, '/rfp/organization/bankquota/bankquota.jsp?priority=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyInvite', 'applySign', '邀请签约', 'usermanage/org/apply', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyInvite', 'corecompanyInvite', '邀请', null, '/rfp/organization/bankinvite/corecompanyinvite.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyQuota', '平台给核心企业额度', null, '/rfp/organization/corecompanyquota/corecompanyquota.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotaadd', '新增平台给核心企业额度', 'corecompanyquota/corecompanyquota/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotadel', '平台给核心企业额度删除', 'corecompanyquota/corecompanyquota/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyQuota', 'corecompanyquotaedit', '平台给核心企业额度修改', 'corecompanyquota/corecompanyquota/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanySupportBank', 'corecompanySupportBank', '支持级', null, '/rfp/organization/bankquota/bankquota.jsp?priority=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('corecompanyView', 'corecompanyView', '核心企业查看', null, '/rfp/organization/orgview/orgcorecompany.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyManage', '币种管理', null, '/base/system/currency/currency.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyadd', '币种新增', 'generalset/currency/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencydel', '币种删除', 'generalset/currency/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('currencyManage', 'currencyedit', '币种修改', 'generalset/currency/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('customService', 'customService', '申诉', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('firstBank', 'firstBank', '优先级银行', null, '/rfp/organization/banklist/banklist.jsp?priority=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('firstBank', 'querybanklist', '优先级银行查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMgrnew', 'flowDelegateMgrnew', '委托', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitor', '委托监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorAdd', '工作流委托关系新增', 'workflow/flowmonitor/delegate/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorDel', '工作流委托流程删除', 'workflow/flowmonitor/delegate/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorSet', '工作流委托流程设置', 'workflow/flowmonitor/delegate/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowDelegateMonitor', 'flowDelegateMonitorStateChange', '工作流委托状态更改', 'workflow/flowmonitor/delegate/changestate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowForm', 'flowForm', '表单管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'flowFormKind', '表单分类', null, '/admin/workflow/processform/processformtype.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeAdd', '表单分类新增', 'workflow/processform/formtype/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeClose', '表单分类收缩', 'workflow/processform/formtype/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeDel', '表单分类删除', 'workflow/processform/formtype/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeExpend', '表单分类展开', 'workflow/processform/formtype/expand', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeModfiy', '表单分类修改', 'workflow/processform/formtype/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormKind', 'workflowFormTypeRefresh', '表单分类刷新', 'workflow/processform/formtype/refresh', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'flowFormReg', '表单设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegAdd', '表单注册新增', 'workflow/processform/formreg/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegEdit', '表单注册修改', 'workflow/processform/formreg/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowFormReg', 'workflowFormRegRemove', '表单注册删除', 'workflow/processform/formreg/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcDesignFind', '流程设计设计查询', 'workflow/flowdesign/processdesign/design', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcExp', '流程设计导出', 'workflow/flowdesign/processdesign/export', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcFormBind', '流程设计表单绑定', 'workflow/flowdesign/processdesign/bindform', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcImp', '流程设计导入', 'workflow/flowdesign/processdesign/import', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcModfiy', '流程设计修改', 'workflow/flowdesign/processdesign/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcPublish', '流程设计发布', 'workflow/flowdesign/processdesign/publish', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcRemove', '流程设计删除', 'workflow/flowdesign/processdesign/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowDesignProcSave', '流程设计保存', 'workflow/flowdesign/processdesign/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaDesign', 'flowManaDesign', '流程设计', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowManaProcKind', '流程类型', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeModfiy', '流程分类修改', 'workflow/flowManaProcKind/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeRemove', '流程分类删除', 'workflow/flowManaProcKind/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManaProcKind', 'flowProcTypeSave', '流程分类保存', 'workflow/flowManaProcKind/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowManage', 'flowManage', '工作流设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMenu', 'flowMenu', '工作流', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMoniInstance', '实例监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceDel', '实例监控删除', 'workflow/flowmonitor/instance/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceResume', '实例监控恢复', 'workflow/flowmonitor/instance/resume', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceSuspend', '实例监控挂起', 'workflow/flowmonitor/instance/suspend', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceTerminate', '实例监控终止', 'workflow/flowmonitor/instance/terminate', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewchange', '查看变更', 'workflow/flowmonitor/instance/viewchange', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewdiagram', '实例图', 'workflow/flowmonitor/instance/viewdiagram', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMoniInstance', 'flowMonitorInstanceViewtrace', '查看留痕', 'workflow/flowmonitor/instance/viewtrace', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMonitor', 'flowMonitor', '工作流监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMyProcessFinished', 'flowMyProcessFinished', '我已完成的请求', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowMyProcessUnfinished', 'flowMyProcessUnfinished', '我未完成的请求', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTask', 'flowTask', '工作台', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTaskHistory', 'flowTaskHistory', '已办任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('flowTaskTodo', 'flowTaskTodo', '待办任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasMgmt', 'gasMgmt', '燃料管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasaccount', '燃料账户', null, '/rfp/gasmgmt/gasaccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasacctadd', '燃料账户新增', 'gasaccount/gasacct/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gasaccount', 'gasacctedit', '燃料账户修改', 'gasaccount/gasacct/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastranadd', '燃料交易明细', 'gastransactions/gastransactions/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastransactions', '燃料交易明细', null, '/rfp/gasmgmt/gastransactions.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('gastransactions', 'gastransedit', '燃料交易修改', 'gastransactions/gastransactions/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('generalSettings', 'generalSettings', '一般设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'certapplydownload', '下载证书', 'keymgmt/certapplydownload', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'checkvalidempty', '检查KEY是否未初始化过且有效', 'keymgmt/checkvalidempty', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'getconfirmation', '获取确认书', 'keymgmt/getconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'keyInit', 'KEY初始化', null, '/rfp/keymgmt/keyinit.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInit', 'keypostsign', '提交确认书签名结果', 'keymgmt/postsign', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'getclosedconfirmation', '获取历史确认书', 'keymgmt/getclosedconfirmation', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'getconfirmationfromblockchain', '从区块链获取历史确认书', 'keymgmt/getconfirmationfromblockchain', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInitRecord', 'keyInitRecord', 'KEY初始化记录', null, '/rfp/keymgmt/keyinitrecord.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyInventoryMgmt', 'KEY物料管理', null, '/rfp/keymgmt/keyinventory.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyinventoryadd', '入库', 'keymgmt/keyinventory/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'keyinventoryedit', '修改', 'keymgmt/keyinventory/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'remove', '出库', 'keymgmt/keyinventory/remove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyInventoryMgmt', 'stock', '盘存', 'keymgmt/keyinventory/stock', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'apply', '补货申请', 'keymgmt/keypurchase/apply', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'approve', '补货批准', 'keymgmt/keypurchase/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'confirm', '到货确认', 'keymgmt/keypurchase/confirm', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('keyPurchase', 'keyPurchase', 'KEY申请单', null, '/rfp/keymgmt/keypurchase.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageAppeal', 'manageAppeal', '申诉管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageBank', 'manageBank', '合作银行', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageBigContract', 'manageBigContract', '反向保理额度管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageCoreCompany', 'manageCoreCompany', '核心企业', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageFuel', 'manageFuel', '燃油管理', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageIntegral', 'manageIntegral', '积分管理', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageKeys', 'manageKeys', 'KEY管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrg', 'manageOrg', '组织管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrgRelation', 'manageOrgRelation', '组织关系设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageOrgUser', 'manageOrgUser', '组织', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('managePayable', 'managePayable', '应付账款', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageProvider', 'manageProvider', '供应商', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageRecable', 'manageRecable', '应收账款管理', null, '/rfp/accountspayable/accountsrecablemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageRecable', 'manageRecableRevoke', '应收账款撤销', 'payablemgmt/accountspayable/revoke', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageServiceBank', 'manageServiceBank', '服务银行列表', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageSignature', 'manageSignature', '签名管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageSupplierAccount', 'manageSupplierAccount', '保理专户管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageTradeContract', 'manageTradeContract', '资金交易', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('manageTripartiteAgreement', 'manageTripartiteAgreement', '三方协议管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'approveUrl', '同意', 'payablemgmt/accountspayable/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'disapproveUrl', '否决', 'payablemgmt/accountspayable/disapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'examineTest', '批量审批', 'accountspayable/examine/test', null, null, '1', '提供给批量审批一个假的接口', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'getagreetemplate', '查询三方协议模板信息', 'tripartiteagreement/template/getagreetemplate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'match', '撮合融资意向', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'matchgetbigcontract', '获取反向保理额度', 'bigcontract/getbigcontract', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('match', 'querysigninfo', '查询签名信息', 'payablemgmt/accountspayable/querysigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'base02a003', '公告查看', 'UC_BASE_SET_NOTICES_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticeadd', '公告新增', 'generalset/notice/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticedel', '公告删除', 'generalset/notice/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticeedit', '公告修改', 'generalset/notice/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('noticesManager', 'noticesManager', '公告管理', null, '/base/system/notice/notice.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgBankRelation', 'orgBankRelation', '核心企业分配银行', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'orgContractMgmt', '联系人管理', null, '/rfp/organization/orgcontact/organization.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationactive', '组织联系人激活', 'orgcontact/orgcontact/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationadd', '组织联系人信息', 'orgcontact/orgcontact/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationclose', '组织联系人冻结', 'orgcontact/orgcontact/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationdel', '组织联系人删除', 'orgcontact/orgcontact/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgContractMgmt', 'organizationedit', '组织联系人修改', 'orgcontact/orgcontact/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('orgSupplierRelation', 'orgSupplierRelation', '核心企业分配供应商', null, '/rfp/organization/orgrelation/orgrelationserach.jsp?type=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organization', 'organization', '组织机构', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organizationContact', 'organizationContact', '联系人管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('organizationQuery', 'organizationQuery', '组织机构', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableChx', 'payableChx', '应付账款审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableExpireList', 'payableExpireList', '应付账款到期付款清单', null, '/common/comingsoon.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntention', 'payableIntention', '融资意向审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionApply', 'payableIntentionApply', '发起融资意向', null, '/rfp/accountspayable/chxtodotask.jsp ', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionApply', 'submitFinancingApplicationUrl', '提交融资意向', 'payablemgmt/accountspayable/submitfinancingapplication', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'abandonPriorityUrl', '放弃优先权', 'payablemgmt/accountspayable/abandonpriority', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'payableIntentionList', '优先融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=203', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'queryUrl', '优先报价任务查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableIntentionList', 'submitQuoteUrl', '报价', 'payablemgmt/accountspayable/submitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableAdd', '应付账款新增', 'payablemgmt/accountspayable/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableApprovesigninfo', '查询应付账款待签名信息', 'payablemgmt/accountspayable/queryapprovesigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDel', '应付账款删除', 'payablemgmt/accountspayable/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDownloadResults', '下载导入失败数据', 'payablemgmt/accountspayable/downloadresults', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableDownloadtemplate', '应付账款模板下载', 'payablemgmt/accountspayable/downloadtemplate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableEdit', '应付账款编辑', 'payablemgmt/accountspayable/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableEditRate', '修改应付账款费率', 'payablemgmt/accountspayable/editrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableExtend', '延长到期日', 'payablemgmt/accountspayable/extend', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableImportdata', '应付账款导入', 'payablemgmt/accountspayable/importdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayablePublish', '应付账款发布', 'payablemgmt/accountspayable/publish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableQuery', '应付账款查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'accountsPayableRevoke', '应付账款撤销', 'payablemgmt/accountspayable/revoke', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableMgmt', 'payableMgmt', '应付账款管理', null, '/rfp/accountspayable/accountspayablemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuote', 'payableQuote', '融资确认审批', null, '/rfp/accountspayable/chxtodotask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuote', 'returnQuote', '提交退回意见', 'payablemgmt/accountspayable/returnquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('payableQuoteQuery', 'payableQuoteQuery', '应付账款报价查询', null, '/rfp/accountspayable/accountspayablequote.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplate', 'platformTemplate', '平台模板', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'plaformTemplateedit', '平台模板修改', 'platformtemplate/platformtemplate/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'plaformtemplateadd', '平台模板新增', 'platformtemplate/platformtemplate/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('platformTemplateManage', 'platformTemplateManage', '平台模板', null, '/rfp/platformtemplate/platformtemplate.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('recableQuoteQuery', 'recableQuoteQuery', '应收账款报价查询', null, '/rfp/accountspayable/accountspayablequote.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('regionMgmt', 'regionMgmt', '区域管理', null, '/rfp/organization/area/area.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('returnPayableIntentionList', 'resubmitQuote', '提交报价', 'payablemgmt/accountspayable/resubmitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('returnPayableIntentionList', 'returnPayableIntentionList', '退回融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?returnflag=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a001', '系统任务查看', 'UC_BASE_SYSTEMTASK_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a002', '运行计划查看', 'UC_BASE_RUNSCHEDULER_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a003', '运行记录查看', 'UC_BASE_RUNHISTORY_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'base05a004', '任务命令查看', 'UC_BASE_TASKCOMMAND_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedule', '计划任务', null, '/base/schedule/taskindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduleadd', '系统任务新增', 'schedule/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduledel', '系统任务删除', 'schedule/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'scheduleedit', '系统任务修改', 'schedule/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulepause', '系统任务暂停', 'schedule/pause', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulerun', '系统任务运行', 'schedule/run', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('schedule', 'schedulestart', '系统任务启动', 'schedule/start', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('signature', 'signature', '签约', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierAccount', 'supplierAccount', '供应商专户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierAccountQuery', 'supplierAccountQuery', '供应商专户查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierBlackList', 'supplierBlackList', '供应商黑名单', null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierBlackList', 'supplierblacklistpull', '拉出黑名单', 'supplierblacklist/supplierblacklist/pull', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierView', 'supplierView', '供应商查看', null, '/rfp/organization/orgview/orgsupplier.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'coreindividuationedit', '核心企业修改供应商保密级别', 'individuation/corecompany/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'coremodifyrate', '修改核心企业费率', 'usermanage/org/modifyrate', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'pull', '拉入黑名单', 'supplierblacklist/supplierblacklist/pull', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'supplierWhiteList', '供应商白名单', null, '/rfp/organization/supplierblacklist/supplierblacklist.jsp?type=1', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supplierWhiteList', 'supplierblacklistedit', '修改供应商费率', 'supplierblacklist/supplierblacklist/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportBank', 'BankListQuery', '支持银行查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportBank', 'supportBank', '支持银行', null, '/rfp/organization/banklist/banklist.jsp?priority=2', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportPayableIntentionList', '支持融资意愿清单', null, '/rfp/accountspayable/chxtodotask.jsp?lastoperationflag=401,402', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportQueryUrl', '支持报价任务查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('supportPayableIntentionList', 'supportSubmitQuote', '支持行报价', '/payablemgmt/accountspayable/submitquote', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'base01a006', '直联渠道代收付用途映射查看', 'UC_BASE_BANK_DIRECTCHANNELPURPOSESMAP_SEARCH', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapadd', '直联代收付用途映射新增', 'sysbank/directchannelpurposesmap/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapdel', '直联渠道代收付用途映射删除', 'sysbank/directchannelpurposesmap/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'purposesmapedit', '直联渠道代收付用途映射新增', 'sysbank/directchannelpurposesmap/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('sysDirectChannelPurposesMap', 'sysDirectChannelPurposesMap', '直联渠道代收付用途映射', null, '/base/system/bank/purpose/directchannelpurposesmap.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompany', 'syscompany', '企业管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'syscompanyinfo', '企业信息', null, '/admin/syscompany/syscompanyinfo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantAdd', '租户新增', 'tenantmanage/tenant/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantDel', '租户删除', 'tenantmanage/tenant/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscompanyinfo', 'tenantEidt', '租户修改', 'tenantmanage/tenant/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontract', '协议设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractAdd', '协议新增', 'tenantmanage/contract/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractDel', '协议删除', 'tenantmanage/contract/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syscontract', 'syscontractEdit', '协议修改', 'tenantmanage/contract/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackage', '套餐设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageActive', '套餐激活', 'tenantmanage/package/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageAdd', '套餐新增', 'tenantmanage/package/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageClose', '套餐冻结', 'tenantmanage/package/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageDel', '套餐删除', 'tenantmanage/package/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageEdit', '套餐修改', 'tenantmanage/package/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageSet', '功能定制', 'tenantmanage/package/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('syspackage', 'syspackageView', '功能查看', 'tenantmanage/package/view', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParam', 'systemParam', '系统参数', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a001', '系统参数查看', 'UC_BASE_PARAM_PARAMANAGE_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a002', '系统参数数值查看', 'UC_BASE_PARAM_PARAMVAL_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'base03a003', '系统参数定义查看', 'UC_BASE_PARAM_PARAMDEF_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanageadd', '系统参数新增', 'sysparam/parammanage/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanagedel', '系统参数删除', 'sysparam/parammanage/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'parammanageedit', '系统参数修改', 'sysparam/parammanage/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemParamManage', 'systemParamManage', '系统参数管理', null, '/base/system/param/sysparam.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('systemsettings', 'systemsettings', '系统设置', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('taTemplateSignature', 'taTemplateSignature', '三方协议模板签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('task', 'task', '任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('taskmanage', 'taskmanage', '任务', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'sys99a006', '数据权限查询', 'UC_SYS_DATARIGHT_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'sys99a007', '配置描述查询', 'UC_SYS_OWNERCONFIG_SEARCH', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigadd', '配置描述新增', 'tsvcmanage/tdrcownerconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigdel', '配置描述删除', 'tsvcmanage/tdrcownerconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrcownerconfigedit', '配置描述修改', 'tsvcmanage/tdrcownerconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelist', '数据权限管理', null, '/admin/tsvcmanage/tdrctablelist/tdrctablelist.jsp	', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistadd', '数据权限新增', 'tsvcmanage/tdrctablelist/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistdel', '数据权限删除', 'tsvcmanage/tdrctablelist/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tdrctablelist', 'tdrctablelistedit', '数据权限修改', 'tsvcmanage/tdrctablelist/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tenant', 'tenant', '企业', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightadd', '功能表定义新增', 'tsvcmanage/thsiright/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightdel', '功能表定义删除', 'tsvcmanage/thsiright/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('thsiright', 'thsirightedit', '功能表定义修改', 'tsvcmanage/thsiright/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('trade', 'trade', '交易', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountBalance', 'tradeAccountBalance', '交易账户余额', null, '/rfp/tradeaccount/transaccountbalance.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountBalance', 'tradeAccountappeal', '申诉', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradeAccountDetail', '交易账户明细', null, '/rfp/tradeaccount/transaccountdetail.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionAdd', '交易账户明细新增', 'tradeaccountmanage/tradetransaction/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionApprove', '交易账户明细送审', 'tradeaccountmanage/tradetransaction/sendapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionApprvebefore', '交易账户送审前置事件', 'tradeaccountmanage/tradetransaction/approvebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionDel', '交易账户明细删除', 'tradeaccountmanage/tradetransaction/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionEdit', '交易账户明细修改', 'tradeaccountmanage/tradetransaction/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountDetail', 'tradetransactionQuery', '交易账户明细查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeAccountMgmt', '交易账户管理', null, '/rfp/tradeaccount/tradeaccount.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountAdd', '交易账户新增', 'tradeaccountmanage/tradeaccount/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountDel', '交易账户删除', 'tradeaccountmanage/tradeaccount/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountEdit', '交易账户修改', 'tradeaccountmanage/tradeaccount/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountQuery', '交易账户查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountactive', '交易账户激活', 'tradeaccountmanage/tradeaccount/active', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountMgmt', 'tradeaccountclose', '交易账户冻结', 'tradeaccountmanage/tradeaccount/close', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccounts', 'tradeAccounts', '交易账户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', '交易账户查询', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeBalance', 'tradeBalance', '交易账户余额', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tradeTransaction', 'tradeTransaction', '交易账户明细', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChx', 'tripartiteAgreementChx', '三方协议签约', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxDone', 'tripartiteAgreementChxDone', '已办任务', null, '/rfp/agreement/tripartiteagreementdonetask.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taApprove', '同意', 'tripartiteagreementmanage/tripartiteagreement/approve', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taDisapprove', '否决', 'tripartiteagreementmanage/tripartiteagreement/disapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'taQuerySigninfo', '查询待签名信息', 'tripartiteagreementmanage/tripartiteagreement/querysigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementChxTodo', 'tripartiteAgreementChxTodo', '待办任务', null, '/rfp/agreement/chxtodo.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'base', '复制', 'base/tool/base', null, null, '1', '将正文转成base', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'gather', '企业还款', 'tripartiteagreementmanage/tripartiteagreement/gather', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'load', '银行放款', 'tripartiteagreementmanage/tripartiteagreement/load', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'taDoneQuery', '查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementDone', '已完成合约', null, '/rfp/agreement/tripartiteagreementdone.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteAgreementappeal', '申诉', 'appealmsmgmt/appealmsmgmt/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementDone', 'tripartiteagreementPrint', '三方协议打印', 'base/tool/test', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'taApplyQuerysigninfo', '查询待签名信息', 'tripartiteagreementmanage/tripartiteagreement/jointsigninfo', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAbolish', '作废融资申请', 'tripartiteagreementmanage/tripartiteagreement/abolish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementAdd', '申请融资', 'tripartiteagreementmanage/tripartiteagreement/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementMgmt', '发起三方协议', null, '/rfp/agreement/tripartiteagreement.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementQuery', '三方协议查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementMgmt', 'tripartiteAgreementWithdraw', '撤销融资申请', 'tripartiteagreementmanage/tripartiteagreement/withdraw', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'abolish', '作废融资申请', 'tripartiteagreementmanage/tripartiteagreement/abolish', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'taRunningQuery', '查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'tripartiteAgreementRunning', '在途合约', null, '/rfp/agreement/tripartiteagreementrunning.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementRunning', 'withdraw', '撤销融资申请', 'tripartiteagreementmanage/tripartiteagreement/withdraw', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementSignature', 'tripartiteAgreementSignature', '三方协议签名', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateAdd', '新增', 'tripartiteagreement/template/add', null, null, '1', '三方协议模板新增', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateCancel', '撤销', 'tripartiteagreement/template/cancel', null, null, '1', '三方协议模板撤销操作', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateDel', '删除', 'tripartiteagreement/template/del', null, null, '1', '三方协议模板删除', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateEdit', '修改', 'tripartiteagreement/template/edit', null, null, '1', '三方协议模板管理的修改功能', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateQuery', '三方协议模板查询', 'common/query', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateSend', '发布', 'tripartiteagreement/template/send', null, null, '1', '三方协议模板发布', null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateSendbefore', '查询待签名信息', 'tripartiteagreement/template/sendbefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templateView', '查看详情', 'tripartiteagreement/template/view', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templatecheckbeforeapprove', '审核校验签名', 'tripartiteagreement/template/checkbeforeapprove', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'templatesendapprovebefore', '校验签名', 'tripartiteagreement/template/sendapprovebefore', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tripartiteAgreementTempMgmt', 'tripartiteAgreementTempMgmt', '三方协议模版管理', null, '/rfp/triagreementtemp/templatemanage.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'create', '生成配置SQL', 'tsvcmanage/tsvcsetsql/create', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'getdata', 'sql语句测试获取数据', 'tsvcmanage/tsvcsql/getdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'gethead', 'sql语句测试获取表头', 'tsvcmanage/tsvcsql/gethead', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'save', '保存SQL', 'tsvcmanage/tsvcsetsql/save', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'set', '配置', 'tsvcmanage/thsiright/set', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'sqladd', '新增sql', 'tsvcmanage/tsvcsql/add', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'sqledit', '修改sql', 'tsvcmanage/tsvcsql/edit', null, null, null, null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterface', '通用查询配置', null, '/admin/tsvcmanage/tsvcinterface/tsvchsiright.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceAdd', '新增', 'tsvcmanage/thsiright/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceDel', '删除', 'tsvcmanage/thsiright/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceEdit', '修改', 'tsvcmanage/thsiright/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceadd', '新增', 'tsvcmanage/tsvcinterface/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfacedel', '删除', 'tsvcmanage/tsvcinterface/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceedit', '修改', 'tsvcmanage/tsvcinterface/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceinitexportdata', '初始化输出', 'tsvcmanage/tsvcinterface/initexportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcinterfaceinitimportdata', '初始化输入', 'tsvcmanage/tsvcinterface/initimportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigadd', '新增', 'tsvcmanage/tsvcviewconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigdel', '删除', 'tsvcmanage/tsvcviewconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfigedit', '修改', 'tsvcmanage/tsvcviewconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcinterface', 'tsvcviewconfiginitexportdata', '查询显示配置', 'tsvcmanage/tsvcviewconfig/initexportdata', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcmanage', 'tsvcmanage', '辅助开发管理', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqladd', '数据源SQL维护新增', 'tsvcmanage/tsvcsql/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqldel', '数据源SQL维护删除', 'tsvcmanage/tsvcsql/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcsql', 'tsvcsqledit', '数据源SQL维护修改', 'tsvcmanage/tsvcsql/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigdel', '查询显示配置删除', 'tsvcmanage/tsvcviewconfig/del', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigeadd', '查询显示配置新增', 'tsvcmanage/tsvcviewconfig/add', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('tsvcviewconfig', 'tsvcviewconfigedit', '查询显示配置修改', 'tsvcmanage/tsvcviewconfig/edit', null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('userManager', 'userManager', '用户', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warning', 'warning', '预警监控', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningAnnulMessage', 'warningAnnulMessage', '预警撤销信息', null, '/base/warning/warningmessage/warningannulmessageindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningManage', 'warningManage', '预警', null, null, null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningMessage', 'annul', '预警信息撤销', 'warning/warningmessage/annul', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningMessage', 'warningMessage', '预警信息', null, '/base/warning/warningmessage/warningmessageindex.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObject', '预警对象', null, '/base/warning/warningobject/warningobject.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectAdd', '预警对象新增', 'warning/warningobject/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectDel', '预警对象删除', 'warning/warningobject/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningObject', 'warningObjectEdit', '预警对象修改', 'warning/warningobject/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRule', '预警规则', null, '/base/warning/warningrule/warningrule.jsp', null, '1', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleAdd', '预警规则新增', 'warning/warningrule/add', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleDel', '预警规则删除', 'warning/warningrule/del', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('warningRule', 'warningRuleEdit', '预警规则修改', 'warning/warningrule/edit', null, null, '0', null, null, null, null);
INSERT INTO `tsys_subtrans` VALUES ('workBench', 'workBench', '工作台', null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for tsys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `tsys_tenant`;
CREATE TABLE `tsys_tenant` (
  `tenant_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '租户ID',
  `tenant_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '租户CODE',
  `tenant_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '租户名称',
  `tenant_shortname` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '租户英文简称',
  `tenant_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '0-普通 1-大型 2-集团',
  `tenant_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '0-正常 1-注销 2-禁用',
  `telno` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '法人手机号',
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '法人邮箱',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `tenant_order` int(8) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `tenant_cnshortname` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户中文简称 ',
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `nk_tsys_company_code` (`tenant_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_tenant
-- ----------------------------
INSERT INTO `tsys_tenant` VALUES ('10000', '10000', '策赢平台', 'CeYing', '2', '0', null, '13682411482', 'chx@163.com', null, null, null, '2017-07-10 13:17:58', null, null, null, '策赢平台');
INSERT INTO `tsys_tenant` VALUES ('10461', '10460', '123', null, '0', '0', null, '13511111111', '11@qq.com', null, null, '2017-11-14 11:09:31', '2017-11-14 11:09:31', null, null, null, null);
INSERT INTO `tsys_tenant` VALUES ('10465', '10464', '243', null, '1', '0', null, '13511111111', '11.@qq.com', null, null, '2017-11-14 11:37:33', '2017-11-16 09:43:12', null, null, null, null);

-- ----------------------------
-- Table structure for tsys_trans
-- ----------------------------
DROP TABLE IF EXISTS `tsys_trans`;
CREATE TABLE `tsys_trans` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号',
  `trans_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '交易名称',
  `kind_code` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '分类编号',
  `model_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模块编号',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`trans_code`),
  KEY `nk_biz_trans_name` (`trans_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统交易表';

-- ----------------------------
-- Records of tsys_trans
-- ----------------------------
INSERT INTO `tsys_trans` VALUES ('BIZFRAME', '企金云平台', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('BigContractMgmt', '反向保理额度管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('KeyInitConfirmState', '电子签名确认书', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('SupplierAccountsMgmt', '保理专户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBflowTaskTodo', '其它待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableChx', '应付账款审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntention', '融资意愿审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntentionApply', '发起融资意愿', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableIntentionList', '优先融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBpayableQuote', '融资确认审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBreturnPayableIntentionList', '退回融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBsupportPayableIntentionList', '支持融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('WBtripartiteAgreementChxTodo', '三方协议待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountTaskTodo', '待办应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayable', '应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayableQuery', '应付账款查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('accountsPayableSignature', '应付账款签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreement', '三方协议', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementQuery', '三方协议查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementTemp', '三方协议模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('agreementTempQuery', '三方协议模板查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appeal', '申诉管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealDone', '已完成申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealMgmt', '申诉类型管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealQuery', '申诉管理查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealStart', '我发起的申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealTodoTask', '待处理申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('appealmsMgmt', '申诉信息管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('areaMgmt', '银行辖区管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankInvite', '银行邀请信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankQuota', '银行给核心企业额度', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankSupplierRelation', '银行分配供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bankView', '合作银行查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('baseSet', '基础设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContract', '大合同', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContractQuery', '大合同信息查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bigContractSignature', '反向保理额度签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizOrgSet', '组织机构设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetCache', '缓存刷新', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetLog', '业务日志设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetMenu', '系统菜单设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetOrgRole', '多岗设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetRole', '角色设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUser', '用户设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUserKey', '用户KEY绑定', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSetUserKeyApply', '用户KEY申请', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizSysManager', '系统管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('bizUserManager', '用户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchain', '区块链', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainApply', '申请成为节点', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainFind', '区块链取证', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainManage', '区块链', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainNodeManage', '节点管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('blockchainView', '区块链查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('business', '业务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('caidan', '菜单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('calendarsManager', '日历管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('checkSignature', '我要验签', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('comprehensiveQuery', '综合查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('cooperation', '合作', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyFirstBank', '优先级', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyInvite', '邀请', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyQuota', '平台给核心企业额度', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanySupportBank', '支持级', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('corecompanyView', '核心企业查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('currencyManage', '币种管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('customService', '申诉', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('firstBank', '优先级银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowDelegateMgrnew', '委托', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowDelegateMonitor', '委托监控', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowForm', '表单管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowFormKind', '表单分类', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowFormReg', '表单设置', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManaDesign', '流程设计', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManaProcKind', '流程类型', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowManage', '工作流设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMenu', '工作流', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMoniInstance', '实例监控', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMonitor', '工作流监控', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMyProcessFinished', '我已完成的请求', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowMyProcessUnfinished', '我未完成的请求', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTask', '工作台', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTaskHistory', '已办任务', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('flowTaskTodo', '待办任务', 'BIZFRAME', '1', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gasMgmt', '燃料管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gasaccount', '燃料账户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('gastransactions', '燃料交易明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('generalSettings', '一般设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInit', 'KEY初始化', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInitRecord', 'KEY初始化记录', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyInventoryMgmt', 'KEY物料管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('keyPurchase', 'KEY申请单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageAppeal', '申诉管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageBank', '合作银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageBigContract', '反向保理额度管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageCoreCompany', '核心企业', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageFuel', '燃油管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageIntegral', '积分管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageKeys', 'KEY管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrg', '组织管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrgRelation', '组织关系设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageOrgUser', '组织', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('managePayable', '应付账款', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageProvider', '供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageRecable', '应收账款管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageServiceBank', '服务银行列表', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageSignature', '签名管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageSupplierAccount', '保理专户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageTradeContract', '资金交易', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('manageTripartiteAgreement', '三方协议管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('match', '撮合融资意向', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('noticesManager', '公告管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgBankRelation', '核心企业分配银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgContractMgmt', '联系人管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('orgSupplierRelation', '核心企业分配供应商', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organization', '组织机构', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organizationContact', '联系人管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('organizationQuery', '组织机构', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableChx', '应付账款审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableExpireList', '应付账款到期付款清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntention', '融资意向审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntentionApply', '发起融资意向', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableIntentionList', '优先融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableMgmt', '应付账款管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableQuote', '融资确认审批', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('payableQuoteQuery', '应付账款报价查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('platformTemplate', '平台模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('platformTemplateManage', '平台模板', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('recableQuoteQuery', '应收账款报价查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('regionMgmt', '区域管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('returnPayableIntentionList', '退回融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('schedule', '计划任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('signature', '签约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierAccount', '供应商专户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierAccountQuery', '供应商专户查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierBlackList', '供应商黑名单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierView', '供应商查看', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supplierWhiteList', '供应商白名单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supportBank', '支持银行', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('supportPayableIntentionList', '支持融资意愿清单', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscompany', '企业管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscompanyinfo', '企业信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syscontract', '协议设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('syspackage', '套餐设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemParam', '系统参数', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemParamManage', '系统参数管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('systemsettings', '系统设置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('taTemplateSignature', '三方协议模板签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('task', '任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('taskmanage', '任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tdrctablelist', '数据权限管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tenant', '企业', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('trade', '交易', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountBalance', '交易账户余额', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountDetail', '交易账户明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountMgmt', '交易账户管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccounts', '交易账户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeAccountsQuery', '交易账户查询', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeBalance', '交易账户余额', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tradeTransaction', '交易账户明细', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChx', '三方协议签约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChxDone', '已办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementChxTodo', '待办任务', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementDone', '已完成合约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementMgmt', '发起三方协议', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementRunning', '在途合约', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementSignature', '三方协议签名', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tripartiteAgreementTempMgmt', '三方协议模版管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tsvcinterface', '通用查询配置', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('tsvcmanage', '辅助开发管理', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('userManager', '用户', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warning', '预警监控', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningAnnulMessage', '预警撤销信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningManage', '预警', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningMessage', '预警信息', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningObject', '预警对象', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('warningRule', '预警规则', 'BIZFRAME', '2', null, null, null, null);
INSERT INTO `tsys_trans` VALUES ('workBench', '工作台', 'BIZFRAME', '2', null, null, null, null);

-- ----------------------------
-- Table structure for tsys_user
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user`;
CREATE TABLE `tsys_user` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户代码',
  `user_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户名称',
  `user_pwd` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `org_id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT 'QA:组织ID,外键:TSYS_ORGANIZATION.ORG_ID',
  `user_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '取数据字典[SYS_BIZ_USER_CATE] 0-柜员 1-用户',
  `user_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此用户状态 取数据字典[SYS_BIZ_USER_STATUS] 0-正常 1-注销 2-禁用',
  `lock_status` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '用于表示此用户是否被锁定 取数据字典[SYS_BIZ_LOCK_STATUS] 0-签退 1-登录 2-非正常签退 3-锁定',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `pass_modify_date` datetime DEFAULT NULL COMMENT '密码修改时间',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `ext_flag` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展标识',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `ext_field_1` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段1',
  `ext_field_2` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段2',
  `ext_field_3` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段3',
  `ext_field_4` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段4',
  `ext_field_5` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段5',
  `user_order` int(11) DEFAULT NULL COMMENT 'QA:用户指令',
  `c_identitytype` char(3) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:身份证件类型',
  `c_identityno` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:证件号码',
  `c_credentials` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT 'QA:证书',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`user_id`),
  KEY `nk_biz_user_name` (`user_name`) USING BTREE,
  KEY `nk_biz_user_org_id` (`org_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of tsys_user
-- ----------------------------
INSERT INTO `tsys_user` VALUES ('1000000100101', '平台经办', '3f23b9a79038c4f580007bcba528a320', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, '4002545654', '10000');
INSERT INTO `tsys_user` VALUES ('1000000100102', '平台复核', 'ff73132e2f18750d566e7fb1993df50a', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, '798ee0bc1e43212beba5387e17fd2575', null, '0', null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('1000000100103', '平台审核', '2c0de3d00fc77152c63904a700c746a0', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, '4048030770', '10000');
INSERT INTO `tsys_user` VALUES ('10000100001301', '经办', '27ca609e3f0001b5ec301ccb4c6ae2db', '0_100001000013', '1', '2', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000100001302', '复核', 'ecb8fef18e3c5e636f6d480196f23c53', '0_100001000013', '1', '2', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000100001303', '审核', '4ae67c73c240deea65be790252cfd380', '0_100001000013', '1', '2', '0', '2017-11-23 19:21:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000102', '平台', '53ce2f5222879fa73864db147cac1850', '6000001', '1', '0', '0', '2017-11-23 10:18:23', '2017-11-23 10:18:23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000123123132', '12312312312444', 'c7aec6af9bc36f2d05b66b90efb1c996', '0_10000001', '1', '0', '0', '2017-11-17 13:39:13', '2017-11-17 13:39:13', null, null, null, null, null, null, null, null, null, null, null, null, null, '12414124124142', '10000');
INSERT INTO `tsys_user` VALUES ('100001993', '审核人', '666666', '6000001', '1', '0', '0', '2017-11-24 17:12:16', '2017-11-27 10:05:56', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('100001994', '审核人22', '34d52e8bcf0dce7f1dfab60df10195fd', '6000001', '1', '0', '0', '2017-11-24 17:12:41', '2017-11-27 09:07:38', null, null, null, null, 'test', null, null, null, null, null, null, null, null, '22', '10000');
INSERT INTO `tsys_user` VALUES ('100001995', '审核人333', 'a52693e320b13c69c3a8fe75a8b491e3', '6000001', '1', '0', '0', '2017-11-27 10:18:44', '2017-11-27 10:21:38', '2017-11-27 10:21:38', null, null, null, 'test11111', null, null, null, null, null, null, null, null, '11', '10000');
INSERT INTO `tsys_user` VALUES ('10000300000201', '经办', '43e65dd4846a5d375a1d4528180e39bc', '0_100003000002', '1', '2', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000300000202', '复核', 'ebdc57fd7f72196b5a395139abe81c34', '0_100003000002', '1', '2', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000300000203', '审核', '3c935916b04f3c91f7e42005fca810de', '0_100003000002', '1', '2', '0', '2017-11-24 14:53:04', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('10000333333', '平台经办', '666666', '6000001', '1', '0', '0', '2017-11-23 10:17:41', '2017-11-23 10:17:41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10000');
INSERT INTO `tsys_user` VALUES ('100003333333333', '得我群翁3', '6d3eb3b90c6f7babe5562887f0a4d1a9', '6000001', '1', '0', '0', '2017-11-16 15:56:20', '2017-11-20 16:06:29', '2017-11-20 16:06:29', null, null, null, null, null, null, null, null, null, null, null, null, '1123123131', '10461');
INSERT INTO `tsys_user` VALUES ('admin', '系统管理员', '4d73d1e38f442bfd71bb08d772830b60', '6000001', '1', '0', '0', null, null, null, null, null, null, null, null, null, null, '524e1c2b0be677e6a86c8a5451a57d85,30164108ac7c54832000e8afee998bd0,37155e91144e679433efdd4119a7b7a3', null, '0', null, null, '4002013877', '10000');

-- ----------------------------
-- Table structure for tsys_user_login
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_login`;
CREATE TABLE `tsys_user_login` (
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:用户代码，外键TSYS_USER.USER_ID',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次成功登录日',
  `last_login_ip` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '最近登录操作IP',
  `login_fail_times` int(11) DEFAULT NULL COMMENT '登录累计失败次数',
  `last_fail_date` datetime DEFAULT NULL COMMENT '最后登录失败日',
  `ext_field` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  `org_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '组织ID',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `tenant_cnshortname` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户中文简称',
  `tenant_shortname` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '用户英文代码',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_user_login
-- ----------------------------
INSERT INTO `tsys_user_login` VALUES ('1000000100101', null, '127.0.0.1', '0', null, '1334', '10000', '6000001', '平台经办', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('1000000100102', null, '127.0.0.1', '0', null, '411', '10000', '6000001', '平台复核', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('1000000100103', null, '127.0.0.1', '0', null, '164', '10000', '6000001', '平台审核', '策赢平台', 'CeYing', null);
INSERT INTO `tsys_user_login` VALUES ('100003333333333', '2017-11-20 16:07:24', '127.0.0.1', '1', '2017-11-20 16:07:24', null, '10461', '6000001', '得我群翁3', null, null, null);
INSERT INTO `tsys_user_login` VALUES ('admin', '2018-01-10 16:47:34', '127.0.0.1', '0', '2018-01-10 16:32:03', '7023', '10000', '6000001', '系统管理员', '策赢平台', 'CeYing', null);

-- ----------------------------
-- Table structure for tsys_user_message
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_message`;
CREATE TABLE `tsys_user_message` (
  `msg_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '消息代码',
  `msg_title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '消息标题',
  `send_user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '发送者ID',
  `receive_user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '接收者ID',
  `send_date` datetime DEFAULT NULL COMMENT '站内消息发送日期时间',
  `msg_content` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '站内消息内容',
  `msg_type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '站内消息类型据字典[BIZ_MSG_TYPE] 1-站内邮件 2-站内消息',
  `msg_isred` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '站内消息是否已读取数据字典[BIZ_IS_READ]  0-未读  1-已读',
  `ext_field` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展字段',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`msg_id`),
  KEY `nk_biz_usermsg_send` (`send_user_id`) USING BTREE,
  KEY `nk_biz_usermsg_title` (`msg_title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户消息表';

-- ----------------------------
-- Records of tsys_user_message
-- ----------------------------

-- ----------------------------
-- Table structure for tsys_user_right
-- ----------------------------
DROP TABLE IF EXISTS `tsys_user_right`;
CREATE TABLE `tsys_user_right` (
  `trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:交易编号，外键TSYS_SUBTRANS.TRANS_CODE',
  `sub_trans_code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:子交易号，外键:TSYS_SUBTRANS.SUB_TRANS_CODE',
  `user_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QA:授权用户，外键TSYS_USER.USER_ID',
  `create_by` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分配人',
  `create_date` decimal(22,0) DEFAULT NULL COMMENT '分配时间',
  `right_flag` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '用于表示该授权的操作授权标志 取数据字典[SYS_BIZ_RIGHT_FLAG] 1-操作 2-授权',
  `right_enable` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '用于表示该授权的是否禁止标志 取数据字典[SYS_BIZ_RIGHT_ENABLE] 0-禁止 1-可用',
  `tenant_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`trans_code`,`sub_trans_code`,`user_id`,`right_flag`),
  KEY `nk_biz_userright_trans_code` (`trans_code`,`sub_trans_code`) USING BTREE,
  KEY `nk_biz_userright_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tsys_user_right
-- ----------------------------
INSERT INTO `tsys_user_right` VALUES ('BIZFRAME', 'BIZFRAME', '100001995', null, '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayable', 'accountsPayable', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('accountsPayableQuery', 'accountsPayableQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreement', 'agreement', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementQuery', 'agreementQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTemp', 'agreementTemp', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('agreementTempQuery', 'agreementTempQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('appeal', 'appeal', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('appealQuery', 'appealQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContract', 'bigContract', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('bigContractQuery', 'bigContractQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('comprehensiveQuery', 'comprehensiveQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organization', 'organization', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationContact', 'organizationContact', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('organizationQuery', 'organizationQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccount', 'supplierAccount', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('supplierAccountQuery', 'supplierAccountQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccounts', 'tradeAccounts', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeAccountsQuery', 'tradeAccountsQuery', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeBalance', 'tradeBalance', 'admin', 'admin', '0', '2', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '1', null, null);
INSERT INTO `tsys_user_right` VALUES ('tradeTransaction', 'tradeTransaction', 'admin', 'admin', '0', '2', null, null);

-- ----------------------------
-- Table structure for t_tatemplateoperations
-- ----------------------------
DROP TABLE IF EXISTS `t_tatemplateoperations`;
CREATE TABLE `t_tatemplateoperations` (
  `urid` varchar(32) NOT NULL DEFAULT '' COMMENT '主键ID',
  `tatemplate_id` varchar(32) NOT NULL COMMENT '三方协议模板ID',
  `operator` varchar(32) NOT NULL COMMENT '操作员KEY',
  `operate_org_id` varchar(32) NOT NULL COMMENT '操作组织ID',
  `operate_date` datetime NOT NULL COMMENT '操作日期',
  `operate_flag` varchar(4) NOT NULL COMMENT '操作标志:100-银行经办待发布,101-银行经办已发布,102-银行复核签约,103-银行审批签约,201-核心企业经办签约,202-核心企业复核签约,203-核心企业审批签约',
  `signature` varchar(2000) DEFAULT NULL COMMENT '签名信息',
  `createby` varchar(32) NOT NULL COMMENT '创建人',
  `createdon` datetime NOT NULL COMMENT '创建时间',
  `lastmodifiedby` varchar(32) DEFAULT NULL COMMENT '修改人',
  `lastmodifiedon` datetime DEFAULT NULL COMMENT '修改时间',
  `rowversion` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `relateoperate_id` varchar(32) DEFAULT NULL COMMENT '关联操作ID',
  `blockchainaddress` varchar(256) DEFAULT NULL COMMENT '区块链地址',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方协议模板操作表';

-- ----------------------------
-- Records of t_tatemplateoperations
-- ----------------------------
INSERT INTO `t_tatemplateoperations` VALUES ('025225f9e67940c4b10dfae3f1f1c36a', '0d17a926025749b4a5f5caf641de7bfb', '系统管理员', '6000001', '2018-01-10 16:45:18', '100', '签名', '系统管理员', '2018-01-10 16:45:18', null, null, '1', '待发布', 'null', null);
INSERT INTO `t_tatemplateoperations` VALUES ('9b5009776fb74aa786a51c90f914c615', 'c2b7047fd80a40efac5bd399885d5c45', '系统管理员', '6000001', '2018-01-10 16:45:24', '100', '签名', '系统管理员', '2018-01-10 16:45:24', null, null, '1', '待发布', 'null', null);

-- ----------------------------
-- Table structure for t_tripartiteagreementtemplate
-- ----------------------------
DROP TABLE IF EXISTS `t_tripartiteagreementtemplate`;
CREATE TABLE `t_tripartiteagreementtemplate` (
  `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户ID',
  `tatemplate_code` varchar(32) DEFAULT NULL COMMENT '三方协议模板编号',
  `tatemplate_version` int(11) DEFAULT NULL COMMENT '三方协议模板版本',
  `bank_id` varchar(32) DEFAULT NULL COMMENT '银行ID',
  `corecompany_id` varchar(32) DEFAULT NULL COMMENT '核心企业ID',
  `credit_limit` decimal(22,2) DEFAULT NULL COMMENT '授信额度',
  `isresourse` varchar(4) DEFAULT NULL COMMENT '有追无追:1-有追,2-无追,3-两者皆可',
  `isactive` varchar(4) DEFAULT NULL COMMENT '是否有效 :0—无效；1—有效',
  `createby` varchar(32) DEFAULT NULL COMMENT '创建人',
  `createdon` datetime DEFAULT NULL COMMENT '创建日期',
  `last_modifiedby` varchar(32) DEFAULT NULL COMMENT '修改人',
  `last_modifiedon` datetime DEFAULT NULL COMMENT '修改日期',
  `rowversion` decimal(4,0) DEFAULT NULL COMMENT '修改版本',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `template_content` blob COMMENT '模板内容',
  `last_operateflag` varchar(4) DEFAULT NULL COMMENT '最近一次操作标志',
  `businesstype` varchar(4) DEFAULT NULL COMMENT '业务类型：101：反向保理；201：正向保理；301：应收账款质押',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='三方协议模板表';

-- ----------------------------
-- Records of t_tripartiteagreementtemplate
-- ----------------------------
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('0d17a926025749b4a5f5caf641de7bfb', '10000', '60000010_1000010000021', '1', '6000001', '0_100001000002', '1.00', null, '2', '系统管理员', '2018-01-10 16:45:18', null, null, '1', null, 0x762A1A8E2C1EF6EA9E8DF6B476E6A98DD6BBF34E77DA39E8F5F69D, '100', null);
INSERT INTO `t_tripartiteagreementtemplate` VALUES ('c2b7047fd80a40efac5bd399885d5c45', '10000', '60000010_1000020000021', '1', '6000001', '0_100002000002', '1.00', null, '2', '系统管理员', '2018-01-10 16:45:24', null, null, '1', null, 0x762A1A8E2C1EF6EA9E8DF6B476E6A98DD6BBF34E77DA39E8F5F69D, '100', null);

-- ----------------------------
-- View structure for tsys_user_rights
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_rights`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_rights` AS select distinct `ur`.`trans_code` AS `trans_code`,`ur`.`sub_trans_code` AS `sub_trans_code`,`ur`.`right_flag` AS `right_flag`,`ur`.`user_id` AS `user_id` from `tsys_user_right` `ur` union select distinct `rr`.`trans_code` AS `trans_code`,`rr`.`sub_trans_code` AS `sub_trans_code`,`rr`.`right_flag` AS `right_flag`,`urs`.`user_id` AS `user_id` from (`tsys_role_right` `rr` join `tsys_user_roles` `urs`) where ((`rr`.`role_code` = `urs`.`ROLE_CODE`) and (`rr`.`right_flag` = `urs`.`right_flag`)) ;

-- ----------------------------
-- View structure for tsys_user_roles
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_roles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_roles` AS select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,`ru`.`right_flag` AS `right_flag`,`u`.`user_id` AS `user_id` from ((`tsys_role_user` `ru` join `tsys_user` `u`) join `tsys_role` `r`) where ((`ru`.`role_code` = `r`.`role_code`) and (`ru`.`user_code` = `u`.`user_id`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'1' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'2' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) ;
