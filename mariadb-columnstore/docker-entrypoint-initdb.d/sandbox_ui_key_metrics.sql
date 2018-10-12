CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_ui_key_metrics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `config` text NOT NULL COMMENT '配置',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sandbox v2 应用关键指标'
;
