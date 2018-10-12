CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_ui_key_traces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `trace_name` varchar(2048) NOT NULL COMMENT '链路名称',
  `focus` tinyint(3) unsigned DEFAULT '1' COMMENT '是否置顶',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `hash` varchar(128) NOT NULL COMMENT 'md5(scope|scope_name|trace_name) 标识唯一',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`hash`(36)) COMMENT 'md5 标识链路唯一'
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='sandbox v2 关键链路'
;
