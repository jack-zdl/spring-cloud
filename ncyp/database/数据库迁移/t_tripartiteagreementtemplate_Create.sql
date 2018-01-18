/*
Navicat MySQL Data Transfer

Source Server         : mysql57
Source Server Version : 50717
Source Host           : localhost:3307
Source Database       : boss

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-02 08:37:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_tripartiteagreementtemplate`
-- ----------------------------
DROP TABLE IF EXISTS `t_tripartiteagreementtemplate`;
CREATE TABLE `t_tripartiteagreementtemplate` (
  `urid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tenant_id` decimal(22,0) DEFAULT NULL,
  `tatemplate_code` varchar(32) DEFAULT NULL,
  `tatemplate_version` decimal(10,0) DEFAULT NULL,
  `bank_id` varchar(32) DEFAULT NULL,
  `corecompany_id` varchar(32) DEFAULT NULL,
  `credit_limit` double DEFAULT NULL,
  `isresourse` varchar(2) DEFAULT NULL,
  `isactive` varchar(1) DEFAULT NULL,
  `createby` varchar(32) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `last_modifiedby` varchar(32) DEFAULT NULL,
  `last_modifiedon` datetime DEFAULT NULL,
  `rowversion` decimal(4,0) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `template_content` blob,
  `last_operateflag` varchar(32) DEFAULT NULL,
  `businesstype` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tripartiteagreementtemplate
-- ----------------------------
