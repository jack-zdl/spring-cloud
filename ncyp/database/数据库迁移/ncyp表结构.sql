/*
Navicat MySQL Data Transfer

Source Server         : ncyp
Source Server Version : 50717
Source Host           : 192.168.6.253:3306
Source Database       : ncyp

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-10 16:46:32
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
-- View structure for tsys_user_rights
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_rights`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_rights` AS select distinct `ur`.`trans_code` AS `trans_code`,`ur`.`sub_trans_code` AS `sub_trans_code`,`ur`.`right_flag` AS `right_flag`,`ur`.`user_id` AS `user_id` from `tsys_user_right` `ur` union select distinct `rr`.`trans_code` AS `trans_code`,`rr`.`sub_trans_code` AS `sub_trans_code`,`rr`.`right_flag` AS `right_flag`,`urs`.`user_id` AS `user_id` from (`tsys_role_right` `rr` join `tsys_user_roles` `urs`) where ((`rr`.`role_code` = `urs`.`ROLE_CODE`) and (`rr`.`right_flag` = `urs`.`right_flag`)) ;

-- ----------------------------
-- View structure for tsys_user_roles
-- ----------------------------
DROP VIEW IF EXISTS `tsys_user_roles`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tsys_user_roles` AS select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,`ru`.`right_flag` AS `right_flag`,`u`.`user_id` AS `user_id` from ((`tsys_role_user` `ru` join `tsys_user` `u`) join `tsys_role` `r`) where ((`ru`.`role_code` = `r`.`role_code`) and (`ru`.`user_code` = `u`.`user_id`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'1' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) union select distinct `r`.`role_code` AS `ROLE_CODE`,`r`.`role_name` AS `ROLE_NAME`,`r`.`creator` AS `CREATOR`,`r`.`remark` AS `REMARK`,`r`.`parent_id` AS `PARENT_ID`,`r`.`role_path` AS `ROLE_PATH`,'2' AS `right_flag`,`pu`.`user_id` AS `user_id` from ((`tsys_role` `r` join `tsys_position` `pos`) join `tsys_pos_user` `pu`) where ((`r`.`role_code` = `pos`.`role_code`) and (`pu`.`position_code` = `pos`.`position_code`)) ;
