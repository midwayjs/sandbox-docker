CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_fault_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `related_module` varchar(256) NOT NULL COMMENT '相关模块',
  `filter_rule` text NOT NULL COMMENT '过滤规则',
  `fault_rule` text NOT NULL COMMENT '故障逻辑，包含故障类型和值',
  `disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sandbox v2 故障规则'
;
