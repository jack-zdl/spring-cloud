SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `ncyp`.`tsys_position`;
CREATE TABLE `ncyp`.`tsys_position` (
  `position_code` VARCHAR(64) BINARY NOT NULL,
  `position_name` VARCHAR(64) BINARY NOT NULL,
  `parent_code` VARCHAR(64) BINARY NULL,
  `org_id` VARCHAR(40) BINARY NULL,
  `role_code` VARCHAR(16) BINARY NULL,
  `position_path` VARCHAR(1024) BINARY NULL,
  `remark` VARCHAR(256) BINARY NULL,
  `ext_field_1` VARCHAR(256) BINARY NULL,
  `ext_field_2` VARCHAR(256) BINARY NULL,
  `ext_field_3` VARCHAR(256) BINARY NULL,
  PRIMARY KEY (`position_code`),
  INDEX `indx_biz_pos_name` (`position_name`(64)),
  INDEX `indx_biz_pos_org_id` (`org_id`(40)),
  INDEX `indx_biz_pos_path` (`position_path`(500)),
  INDEX `indx_biz_pos_pcode` (`parent_code`(64)),
  INDEX `indx_biz_pos_role_code` (`role_code`(16))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

DROP TABLE IF EXISTS `ncyp`.`tsys_pos_user`;
CREATE TABLE `ncyp`.`tsys_pos_user` (
  `position_code` VARCHAR(64) BINARY NOT NULL,
  `user_id` VARCHAR(16) BINARY NOT NULL,
  PRIMARY KEY (`user_id`, `position_code`),
  INDEX `indx_biz_posuser_pos_code` (`position_code`(64)),
  INDEX `indx_biz_posuser_user_id` (`user_id`(16))
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;