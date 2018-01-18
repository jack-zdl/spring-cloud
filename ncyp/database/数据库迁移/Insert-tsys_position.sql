SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

INSERT INTO `ncyp`.`tsys_position`(`position_code`, `position_name`, `parent_code`, `org_id`, `role_code`, `position_path`, `remark`, `ext_field_1`, `ext_field_2`, `ext_field_3`)
VALUES ('0_101common', '浙江保融科技有限公司北京分公司普通岗', '0_101head', '0_101', NULL, '#bizroot#0_1head#0_101head#0_101common#', NULL, NULL, NULL, NULL),
  ('0_103head', '浙江保融科技有限公司广州分公司主管岗', '0_1head', '0_103', NULL, '#bizroot#0_1head#0_103head#', NULL, NULL, NULL, NULL),
  ('0_103common', '浙江保融科技有限公司广州分公司普通岗', '0_103head', '0_103', NULL, '#bizroot#0_1head#0_103head#0_103common#', NULL, NULL, NULL, NULL),
  ('0_2head', '浙江财资科技有限公司主管岗', '0_1head', '0_2', NULL, '#bizroot#0_1head#0_2head#', NULL, NULL, NULL, NULL),
  ('0_2common', '浙江财资科技有限公司普通岗', '0_2head', '0_2', NULL, '#bizroot#0_1head#0_2head#0_2common#', NULL, NULL, NULL, NULL),
  ('0_101head', '浙江保融科技有限公司北京分公司主管岗', '0_1head', '0_101', NULL, '#bizroot#0_1head#0_101head#', NULL, NULL, NULL, NULL),
  ('0_1common', '浙江财资科技有限公司普通岗', '0_1head', '0_1', NULL, '#bizroot#0_1head#0_1common#', NULL, NULL, NULL, NULL),
  ('0_102head', '浙江保融科技有限公司上海分公司主管岗', '0_1head', '0_102', NULL, '#bizroot#0_1head#0_102head#', NULL, NULL, NULL, NULL),
  ('0_102common', '浙江保融科技有限公司上海分公司普通岗', '0_102head', '0_102', NULL, '#bizroot#0_1head#0_102head#0_102common#', NULL, NULL, NULL, NULL),
  ('0_10301head', '浙江保融科技有限公司深圳子公司主管岗', '0_103head', '0_10301', NULL, '#bizroot#0_1head#0_103head#0_10301head#', NULL, NULL, NULL, NULL),
  ('0_10301common', '浙江保融科技有限公司深圳子公司普通岗', '0_10301head', '0_10301', NULL, '#bizroot#0_1head#0_103head#0_10301head#0_10301common#', NULL, NULL, NULL, NULL),
  ('0_201head', '浙江财资科技有限公司江苏分公司主管岗', '0_2head', '0_201', NULL, '#bizroot#0_1head#0_2head#0_201head#', NULL, NULL, NULL, NULL),
  ('0_201common', '浙江财资科技有限公司江苏分公司普通岗', '0_201head', '0_201', NULL, '#bizroot#0_1head#0_2head#0_201head#0_201common#', NULL, NULL, NULL, NULL),
  ('0_202head', '浙江财资科技有限公司河南分公司主管岗', '0_2head', '0_202', NULL, '#bizroot#0_1head#0_2head#0_202head#', NULL, NULL, NULL, NULL),
  ('0_202common', '浙江财资科技有限公司河南分公司普通岗', '0_202head', '0_202', NULL, '#bizroot#0_1head#0_2head#0_202head#0_202common#', NULL, NULL, NULL, NULL),
  ('0_1head', '浙江保融科技有限公司主管岗', 'bizroot', '0_1', NULL, '#bizroot#0_1head#', NULL, NULL, NULL, NULL),
  ('0_001002common', '浙江财资科技有限公司普通岗', '0_001002head', '0_001002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002common#', NULL, NULL, NULL, NULL),
  ('0_001001002001head', '浙江保融深圳子公司主管岗', '0_001001002head', '0_001001002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#', NULL, NULL, NULL, NULL),
  ('0_001001head', '浙江保融科技有限公司主管岗', '0_101common', '0_001001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#', NULL, NULL, NULL, NULL),
  ('0_001001common', '浙江保融科技有限公司普通岗', '0_001001head', '0_001001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001common#', NULL, NULL, NULL, NULL),
  ('0_001002head', '浙江财资科技有限公司主管岗', '0_101common', '0_001002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#', NULL, NULL, NULL, NULL),
  ('0_001001002001common', '浙江保融深圳子公司普通岗', '0_001001002001head', '0_001001002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002001head#0_001001002001common#', NULL, NULL, NULL, NULL),
  ('0_001001001head', '浙江保融科技上海分公司主管岗', '0_001001head', '0_001001001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#', NULL, NULL, NULL, NULL),
  ('0_001001001common', '浙江保融科技上海分公司普通岗', '0_001001001head', '0_001001001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001001head#0_001001001common#', NULL, NULL, NULL, NULL),
  ('0_001001002head', '浙江保融广州分公司主管岗', '0_001001head', '0_001001002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#', NULL, NULL, NULL, NULL),
  ('0_001001002common', '浙江保融广州分公司普通岗', '0_001001002head', '0_001001002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001001head#0_001001002head#0_001001002common#', NULL, NULL, NULL, NULL),
  ('0_001002001head', '浙江财资北京分公司主管岗', '0_001002head', '0_001002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#', NULL, NULL, NULL, NULL),
  ('0_001002001common', '浙江财资北京分公司普通岗', '0_001002001head', '0_001002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002001head#0_001002001common#', NULL, NULL, NULL, NULL),
  ('0_001002002head', '浙江财资江苏分公司主管岗', '0_001002head', '0_001002002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#', NULL, NULL, NULL, NULL),
  ('0_001002002common', '浙江财资江苏分公司普通岗', '0_001002002head', '0_001002002', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002common#', NULL, NULL, NULL, NULL),
  ('0_001002002001head', '浙江财资南京子公司主管岗', '0_001002002head', '0_001002002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#', NULL, NULL, NULL, NULL),
  ('0_001002002001common', '浙江财资南京子公司普通岗', '0_001002002001head', '0_001002002001', NULL, '#bizroot#0_1head#0_101head#0_101common#0_001002head#0_001002002head#0_001002002001head#0_001002002001common#', NULL, NULL, NULL, NULL);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;