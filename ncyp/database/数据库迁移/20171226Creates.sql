-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `boss`
  CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `boss`;
-- -------------------------------------
-- Tables

DROP TABLE IF EXISTS `boss`.`tsys_kind`;
CREATE TABLE `boss`.`tsys_kind` (
  `kind_code` VARCHAR(16) BINARY NOT NULL,
  `kind_type` VARCHAR(8) BINARY NOT NULL,
  `kind_name` VARCHAR(32) BINARY NOT NULL,
  `parent_code` VARCHAR(16) BINARY NULL,
  `mnemonic` VARCHAR(16) BINARY NOT NULL,
  `tree_idx` VARCHAR(256) BINARY NULL,
  `ext_flag` VARCHAR(8) BINARY NULL,
  `lifecycle` VARCHAR(8) BINARY NULL,
  `platform` VARCHAR(8) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  PRIMARY KEY (`kind_code`),
  INDEX `indx_biz_kind_name` (`kind_name`(32)),
  INDEX `indx_biz_kind_pcode` (`parent_code`(16))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_log`;
CREATE TABLE `boss`.`tsys_log` (
  `log_id` VARCHAR(32) BINARY NOT NULL,
  `org_id` VARCHAR(40) BINARY NULL,
  `org_name` VARCHAR(128) BINARY NULL,
  `user_id` VARCHAR(32) BINARY NULL,
  `user_name` VARCHAR(32) BINARY NULL,
  `access_date` DECIMAL(22, 0) NOT NULL,
  `access_time` DECIMAL(22, 0) NOT NULL,
  `sub_trans_code` VARCHAR(32) BINARY NULL,
  `trans_code` VARCHAR(32) BINARY NULL,
  `oper_contents` VARCHAR(1024) BINARY NULL,
  `ip_add` VARCHAR(64) BINARY NULL,
  `host_name` VARCHAR(64) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`log_id`),
  INDEX `index_access_d` (`access_date`),
  INDEX `indx_biz_log_content` (`oper_contents`(500)),
  INDEX `indx_biz_log_org_id` (`org_id`(40)),
  INDEX `indx_biz_log_org_name` (`org_name`(128)),
  INDEX `indx_biz_log_trans` (`sub_trans_code`(32), `trans_code`(32)),
  INDEX `indx_biz_log_user_id` (`user_id`(32)),
  INDEX `indx_biz_log_user_name` (`user_name`(32)),
  CONSTRAINT `fk_log_tenantid` FOREIGN KEY `fk_log_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_menu`;
CREATE TABLE `boss`.`tsys_menu` (
  `menu_code` VARCHAR(32) BINARY NOT NULL,
  `kind_code` VARCHAR(16) BINARY NOT NULL,
  `trans_code` VARCHAR(32) BINARY NULL,
  `sub_trans_code` VARCHAR(32) BINARY NULL,
  `menu_name` VARCHAR(32) BINARY NOT NULL,
  `menu_arg` VARCHAR(256) BINARY NULL,
  `menu_icon` VARCHAR(256) BINARY NULL,
  `menu_url` VARCHAR(256) BINARY NULL,
  `window_type` VARCHAR(8) BINARY NULL,
  `window_model` VARCHAR(8) BINARY NULL,
  `tip` VARCHAR(256) BINARY NULL,
  `hot_key` VARCHAR(8) BINARY NULL,
  `parent_code` VARCHAR(32) BINARY NULL,
  `order_no` DECIMAL(22, 0) NULL,
  `open_flag` VARCHAR(8) BINARY NULL,
  `tree_idx` VARCHAR(256) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  PRIMARY KEY (`menu_code`, `kind_code`),
  INDEX `indx_biz_menu_code` (`menu_code`(32)),
  INDEX `indx_biz_menu_name` (`menu_name`(32)),
  INDEX `indx_biz_menu_pcode` (`parent_code`(32)),
  INDEX `indx_biz_menu_trans_code` (`trans_code`(32), `sub_trans_code`(32)),
  INDEX `indx_biz_menu_treeidx` (`tree_idx`(256)),
  CONSTRAINT `fk_menu_source` FOREIGN KEY `fk_menu_source` (`trans_code`, `sub_trans_code`)
    REFERENCES `boss`.`tsys_subtrans` (`trans_code`, `sub_trans_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sysmenu_kind` FOREIGN KEY `fk_sysmenu_kind` (`kind_code`)
    REFERENCES `boss`.`tsys_kind` (`kind_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_organization`;
CREATE TABLE `boss`.`tsys_organization` (
  `org_id` VARCHAR(40) BINARY NOT NULL,
  `dimension` VARCHAR(8) BINARY NULL,
  `org_code` VARCHAR(32) BINARY NULL,
  `org_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `parent_id` VARCHAR(40) BINARY NULL,
  `manage_id` VARCHAR(40) BINARY NULL,
  `position_code` VARCHAR(64) BINARY NULL,
  `org_cate` VARCHAR(8) BINARY NULL,
  `org_level` VARCHAR(8) BINARY NULL,
  `org_order` DECIMAL(22, 0) NULL,
  `org_path` VARCHAR(1024) BINARY NULL,
  `sso_org_code` VARCHAR(32) BINARY NULL,
  `sso_parent_code` VARCHAR(32) BINARY NULL,
  `ext_id` VARCHAR(128) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `status` DECIMAL(22, 0) NULL DEFAULT 0,
  `tenant_id` DECIMAL(22, 0) NULL,
  `shortorgname` VARCHAR(16) BINARY NULL,
  `createdate` VARCHAR(20) BINARY NULL,
  `lastmodifiedon` VARCHAR(20) BINARY NULL,
  `platformsupplierrate` DOUBLE NULL,
  `corecompanyrate` DOUBLE NULL,
  `areaid` VARCHAR(32) BINARY NULL,
  `financenumber` DECIMAL(22, 0) NULL,
  `address` VARCHAR(512) BINARY NULL,
  `legalperson` VARCHAR(64) BINARY NULL,
  PRIMARY KEY (`org_id`),
  INDEX `indx_biz_org_code` (`org_code`(32)),
  INDEX `indx_biz_org_dimension` (`dimension`(8)),
  INDEX `indx_biz_org_name` (`org_name`(64)),
  INDEX `indx_biz_org_path` (`org_path`(500))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;


DROP TABLE IF EXISTS `boss`.`tsys_org_user`;
CREATE TABLE `boss`.`tsys_org_user` (
  `user_id` VARCHAR(32) BINARY NOT NULL,
  `org_id` VARCHAR(40) BINARY NOT NULL,
  `role_code` VARCHAR(40) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  INDEX `indx_biz_orguser_org_id` (`org_id`(40)),
  INDEX `indx_biz_orguser_user_id` (`user_id`(32)),
  UNIQUE INDEX `uk_sysorguser` (`user_id`(32), `org_id`(40), `role_code`(40)),
  CONSTRAINT `fk_org_user_orgid` FOREIGN KEY `fk_org_user_orgid` (`org_id`)
    REFERENCES `boss`.`tsys_organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_org_user_tenantid` FOREIGN KEY `fk_org_user_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_userid_orguser` FOREIGN KEY `fk_userid_orguser` (`user_id`)
    REFERENCES `boss`.`tsys_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_package`;
CREATE TABLE `boss`.`tsys_package` (
  `package_id` VARCHAR(32) BINARY NOT NULL,
  `package_code` VARCHAR(32) BINARY NOT NULL,
  `package_name` VARCHAR(32) BINARY NOT NULL,
  `isactive` CHAR(1) BINARY NOT NULL DEFAULT 1,
  `create_date` DATETIME NOT NULL,
  `modify_date` DATETIME NULL,
  PRIMARY KEY (`package_id`)
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_package_detail`;
CREATE TABLE `boss`.`tsys_package_detail` (
  `package_id` VARCHAR(32) BINARY NOT NULL,
  `trans_code` VARCHAR(32) BINARY NOT NULL,
  `sub_trans_code` VARCHAR(32) BINARY NOT NULL,
  PRIMARY KEY (`package_id`, `trans_code`, `sub_trans_code`)
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_parameter`;
CREATE TABLE `boss`.`tsys_parameter` (
  `param_code` VARCHAR(64) BINARY NOT NULL,
  `rel_org` VARCHAR(40) BINARY NOT NULL,
  `kind_code` VARCHAR(16) BINARY NOT NULL,
  `param_name` VARCHAR(64) BINARY NOT NULL,
  `param_value` VARCHAR(1024) BINARY NOT NULL,
  `ext_flag` VARCHAR(8) BINARY NULL,
  `lifecycle` VARCHAR(8) BINARY NULL,
  `platform` VARCHAR(8) BINARY NULL DEFAULT '0',
  `param_desc` VARCHAR(256) BINARY NULL,
  `param_regex` VARCHAR(64) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`param_code`, `rel_org`),
  INDEX `indx_biz_param_code` (`param_code`(64)),
  INDEX `indx_biz_param_name` (`param_name`(64)),
  INDEX `indx_biz_param_org` (`rel_org`(40)),
  INDEX `indx_biz_param_value` (`param_value`(500)),
  CONSTRAINT `fk_parameter_tenantid` FOREIGN KEY `fk_parameter_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_para_kind` FOREIGN KEY `fk_para_kind` (`kind_code`)
    REFERENCES `boss`.`tsys_kind` (`kind_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_role`;
CREATE TABLE `boss`.`tsys_role` (
  `role_code` VARCHAR(16) BINARY NOT NULL,
  `role_name` VARCHAR(64) BINARY NULL,
  `creator` VARCHAR(32) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `parent_id` VARCHAR(16) BINARY NULL,
  `role_path` VARCHAR(256) BINARY NULL,
  `role_order` DECIMAL(22, 0) NULL DEFAULT 0,
  `create_date` DATETIME NULL DEFAULT null,
  `modify_date` DATETIME NULL DEFAULT null,
  `org_id` VARCHAR(40) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`role_code`),
  INDEX `indx_biz_role_creator` (`creator`(32)),
  INDEX `indx_biz_role_name` (`role_name`(64))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_role_right`;
CREATE TABLE `boss`.`tsys_role_right` (
  `trans_code` VARCHAR(32) BINARY NOT NULL,
  `sub_trans_code` VARCHAR(32) BINARY NOT NULL,
  `role_code` VARCHAR(16) BINARY NOT NULL,
  `create_by` VARCHAR(32) BINARY NULL,
  `create_date` DECIMAL(22, 0) NULL,
  `begin_date` DECIMAL(22, 0) NOT NULL,
  `end_date` DECIMAL(22, 0) NOT NULL,
  `right_flag` VARCHAR(8) BINARY NOT NULL,
  `right_enable` VARCHAR(8) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`trans_code`, `sub_trans_code`, `role_code`, `begin_date`, `end_date`, `right_flag`),
  INDEX `indx_biz_roleright_flag` (`right_flag`(8)),
  INDEX `indx_biz_roleright_role_code` (`role_code`(16)),
  INDEX `indx_biz_roleright_trans_code` (`trans_code`(32), `sub_trans_code`(32)),
  CONSTRAINT `fk_right_role` FOREIGN KEY `fk_right_role` (`role_code`)
    REFERENCES `boss`.`tsys_role` (`role_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rright_trans` FOREIGN KEY `fk_rright_trans` (`trans_code`, `sub_trans_code`)
    REFERENCES `boss`.`tsys_subtrans` (`trans_code`, `sub_trans_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_role_user`;
CREATE TABLE `boss`.`tsys_role_user` (
  `user_code` VARCHAR(32) BINARY NOT NULL,
  `role_code` VARCHAR(16) BINARY NOT NULL,
  `right_flag` VARCHAR(8) BINARY NOT NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`user_code`, `role_code`, `right_flag`),
  INDEX `indx_biz_roleuser_flag` (`right_flag`(8)),
  INDEX `indx_biz_roleuser_ru` (`user_code`(32), `role_code`(16)),
  CONSTRAINT `fk_roleuser_role` FOREIGN KEY `fk_roleuser_role` (`role_code`)
    REFERENCES `boss`.`tsys_role` (`role_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_roleuser_user` FOREIGN KEY `fk_roleuser_user` (`user_code`)
    REFERENCES `boss`.`tsys_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_user_tenantid` FOREIGN KEY `fk_role_user_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_subtrans`;
CREATE TABLE `boss`.`tsys_subtrans` (
  `trans_code` VARCHAR(32) BINARY NOT NULL,
  `sub_trans_code` VARCHAR(32) BINARY NOT NULL,
  `sub_trans_name` VARCHAR(256) BINARY NULL,
  `rel_serv` VARCHAR(256) BINARY NULL,
  `rel_url` VARCHAR(256) BINARY NULL,
  `ctrl_flag` VARCHAR(8) BINARY NULL,
  `login_flag` VARCHAR(8) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `ext_field_1` VARCHAR(256) BINARY NULL,
  `ext_field_2` VARCHAR(256) BINARY NULL,
  `ext_field_3` VARCHAR(256) BINARY NULL,
  PRIMARY KEY (`trans_code`, `sub_trans_code`),
  INDEX `indx_biz_sbutrans_sub_code` (`sub_trans_code`(32)),
  INDEX `indx_biz_sbutrans_trans_code` (`trans_code`(32)),
  CONSTRAINT `fk_trans_sub` FOREIGN KEY `fk_trans_sub` (`trans_code`)
    REFERENCES `boss`.`tsys_trans` (`trans_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_tenant`;
CREATE TABLE `boss`.`tsys_tenant` (
  `tenant_id` DECIMAL(22, 0) NOT NULL,
  `tenant_code` VARCHAR(32) BINARY NOT NULL,
  `tenant_name` VARCHAR(64) BINARY NOT NULL,
  `tenant_shortname` VARCHAR(16) BINARY NULL,
  `tenant_type` VARCHAR(8) BINARY NOT NULL,
  `tenant_status` VARCHAR(8) BINARY NOT NULL,
  `telno` VARCHAR(32) BINARY NULL,
  `mobile` VARCHAR(32) BINARY NULL,
  `email` VARCHAR(256) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `tenant_order` INT(8) NULL,
  `create_date` DATETIME NULL,
  `modify_date` DATETIME NULL,
  `ext_field_1` VARCHAR(256) BINARY NULL,
  `ext_field_2` VARCHAR(256) BINARY NULL,
  `ext_field_3` VARCHAR(256) BINARY NULL,
  `tenant_cnshortname` VARCHAR(32) BINARY NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE INDEX `idk_tsys_company_code` (`tenant_code`(32))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_trans`;
CREATE TABLE `boss`.`tsys_trans` (
  `trans_code` VARCHAR(32) BINARY NOT NULL,
  `trans_name` VARCHAR(32) BINARY NOT NULL,
  `kind_code` VARCHAR(16) BINARY NULL,
  `model_code` VARCHAR(32) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `ext_field_1` VARCHAR(256) BINARY NULL,
  `ext_field_2` VARCHAR(256) BINARY NULL,
  `ext_field_3` VARCHAR(256) BINARY NULL,
  PRIMARY KEY (`trans_code`),
  INDEX `indx_biz_trans_name` (`trans_name`(32))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_user`;
CREATE TABLE `boss`.`tsys_user` (
  `user_id` VARCHAR(32) BINARY NOT NULL,
  `user_name` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_pwd` VARCHAR(256) BINARY NOT NULL,
  `org_id` VARCHAR(40) BINARY NOT NULL,
  `user_type` VARCHAR(8) BINARY NOT NULL,
  `user_status` VARCHAR(8) BINARY NOT NULL,
  `lock_status` VARCHAR(8) BINARY NOT NULL,
  `create_date` DATETIME NULL,
  `modify_date` DATETIME NULL,
  `pass_modify_date` DATETIME NULL,
  `mobile` VARCHAR(32) BINARY NULL DEFAULT null,
  `email` VARCHAR(256) BINARY NULL,
  `ext_flag` VARCHAR(8) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `ext_field_1` VARCHAR(256) BINARY NULL,
  `ext_field_2` VARCHAR(256) BINARY NULL,
  `ext_field_3` VARCHAR(256) BINARY NULL,
  `ext_field_4` VARCHAR(256) BINARY NULL,
  `ext_field_5` VARCHAR(256) BINARY NULL,
  `user_order` DECIMAL(22, 0) NULL,
  `c_identitytype` CHAR(3) BINARY NULL,
  `c_identityno` VARCHAR(40) BINARY NULL,
  `c_credentials` VARCHAR(40) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`user_id`),
  INDEX `indx_biz_user_name` (`user_name`(32)),
  INDEX `indx_biz_user_org_id` (`org_id`(40)),
  INDEX `indx_biz_user_remark` (`remark`(256)),
  CONSTRAINT `fk_org_user` FOREIGN KEY `fk_org_user` (`org_id`)
    REFERENCES `boss`.`tsys_organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_user_login`;
CREATE TABLE `boss`.`tsys_user_login` (
  `user_id` VARCHAR(32) BINARY NOT NULL,
  `last_login_date` DATETIME NULL,
  `last_login_ip` VARCHAR(40) BINARY NULL,
  `login_fail_times` DECIMAL(22, 0) NULL,
  `last_fail_date` DATETIME NULL,
  `ext_field` VARCHAR(16) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  `org_id` VARCHAR(32) BINARY NULL,
  `user_name` VARCHAR(32) BINARY NULL,
  `tenant_cnshortname` VARCHAR(32) BINARY NULL,
  `tenant_shortname` VARCHAR(16) BINARY NULL,
  `mobile` VARCHAR(32) BINARY NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_login` FOREIGN KEY `fk_user_login` (`user_id`)
    REFERENCES `boss`.`tsys_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_login_tenantid` FOREIGN KEY `fk_user_login_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_user_message`;
CREATE TABLE `boss`.`tsys_user_message` (
  `msg_id` VARCHAR(32) BINARY NOT NULL,
  `msg_title` VARCHAR(64) BINARY NULL,
  `send_user_id` VARCHAR(32) BINARY NOT NULL,
  `receive_user_id` VARCHAR(32) BINARY NOT NULL,
  `send_date` DECIMAL(22, 0) NULL,
  `msg_content` VARCHAR(4000) BINARY NULL,
  `msg_type` VARCHAR(8) BINARY NOT NULL,
  `msg_isred` VARCHAR(8) BINARY NOT NULL,
  `ext_field` VARCHAR(16) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`msg_id`),
  INDEX `indx_biz_usermsg_red` (`msg_isred`(8)),
  INDEX `indx_biz_usermsg_send` (`send_user_id`(32)),
  INDEX `indx_biz_usermsg_text` (`msg_content`(500)),
  INDEX `indx_biz_usermsg_title` (`msg_title`(64)),
  CONSTRAINT `fk_user_message_tenantid` FOREIGN KEY `fk_user_message_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `boss`.`tsys_user_right`;
CREATE TABLE `boss`.`tsys_user_right` (
  `trans_code` VARCHAR(32) BINARY NOT NULL,
  `sub_trans_code` VARCHAR(32) BINARY NOT NULL,
  `user_id` VARCHAR(32) BINARY NOT NULL,
  `create_by` VARCHAR(32) BINARY NULL,
  `create_date` DECIMAL(22, 0) NULL,
  `begin_date` DECIMAL(22, 0) NOT NULL,
  `end_date` DECIMAL(22, 0) NOT NULL,
  `right_flag` VARCHAR(8) BINARY NOT NULL,
  `right_enable` VARCHAR(8) BINARY NULL,
  `tenant_id` DECIMAL(22, 0) NULL,
  PRIMARY KEY (`trans_code`, `sub_trans_code`, `user_id`, `begin_date`, `end_date`, `right_flag`),
  INDEX `indx_biz_userright_flag` (`right_flag`(8)),
  INDEX `indx_biz_userright_trans_code` (`trans_code`(32), `sub_trans_code`(32)),
  INDEX `indx_biz_userright_user_id` (`user_id`(32)),
  CONSTRAINT `fk_right_user` FOREIGN KEY `fk_right_user` (`user_id`)
    REFERENCES `boss`.`tsys_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_uright_trans` FOREIGN KEY `fk_uright_trans` (`trans_code`, `sub_trans_code`)
    REFERENCES `boss`.`tsys_subtrans` (`trans_code`, `sub_trans_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_right_tenantid` FOREIGN KEY `fk_user_right_tenantid` (`tenant_id`)
    REFERENCES `boss`.`tsys_tenant` (`tenant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;



SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF

