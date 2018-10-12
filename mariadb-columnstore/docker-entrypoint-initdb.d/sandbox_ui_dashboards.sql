CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_ui_dashboards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `dashboard_name` varchar(256) NOT NULL COMMENT '大盘名称',
  `target` tinyint(3) unsigned DEFAULT '1' COMMENT '大盘适配目标，集群：1，机器：2',
  `config` text NOT NULL COMMENT '大盘配置',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `focus` tinyint(3) unsigned DEFAULT '0' COMMENT '是否置顶',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sandbox v2 大盘'
;
