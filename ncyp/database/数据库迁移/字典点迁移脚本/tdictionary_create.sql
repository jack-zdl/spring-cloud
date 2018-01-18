DROP TABLE IF EXISTS `ncyp`.`tdictionary`;
CREATE TABLE `ncyp`.`tdictionary` (
  `c_sysname` VARCHAR(16) BINARY NOT NULL,
  `l_keyno` BIGINT(10) NOT NULL,
  `c_keyvalue` VARCHAR(64) BINARY NOT NULL,
  `c_caption` VARCHAR(255) BINARY NULL,
  `c_modify` CHAR(1) BINARY NULL,
  `c_memo` VARCHAR(64) BINARY NULL,
  `c_english` VARCHAR(60) BINARY NULL,
  `l_order` BIGINT(10) NULL,
  PRIMARY KEY (`c_sysname`, `l_keyno`, `c_keyvalue`),
  UNIQUE INDEX `idx_tdictionary` (`l_keyno`, `c_keyvalue`(64), `c_sysname`(16))
)
ENGINE = INNODB;