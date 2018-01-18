-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `cyp`
  CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cyp`;
-- -------------------------------------
-- Tables

DROP TABLE IF EXISTS `ncyp`.`t_organizationrelation`;
CREATE TABLE `ncyp`.`t_organizationrelation` (
  `urid` VARCHAR(32) BINARY NOT NULL,
  `ourorgid` VARCHAR(32) BINARY NOT NULL,
  `opporgid` VARCHAR(32) BINARY NOT NULL,
  `priority` VARCHAR(2) BINARY NULL,
  `category` VARCHAR(2) BINARY NOT NULL,
  `corecompanysupplierrate` DECIMAL(8,4) NULL,
  `createdby` VARCHAR(32) BINARY NOT NULL,
  `createdon` DATETIME NOT NULL,
  `lastmodifiedby` VARCHAR(32) BINARY NULL,
  `lastmodifiedon` DATETIME NULL,
  `rowversion` INT(4) NOT NULL,
  `description` VARCHAR(256) BINARY NULL,
  `isblack` VARCHAR(2) BINARY NULL,
  `extensiondate` DECIMAL(22, 0) NULL DEFAULT 0,
  `organizationrelationid` VARCHAR(32) BINARY NULL,
  PRIMARY KEY (`urid`),
  UNIQUE INDEX `uk_orgrelation_ouropporgid` (`ourorgid`(32), `opporgid`(32), `organizationrelationid`(32)),
  CONSTRAINT `fk_orgrelation_opporgid` FOREIGN KEY `fk_orgrelation_opporgid` (`opporgid`)
    REFERENCES `cyp`.`tsys_organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orgrelation_ourorgid` FOREIGN KEY `fk_orgrelation_ourorgid` (`ourorgid`)
    REFERENCES `cyp`.`tsys_organization` (`org_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = INNODB;



SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF

