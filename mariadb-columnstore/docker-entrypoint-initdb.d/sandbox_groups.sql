CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `group_name` varchar(128) NOT NULL COMMENT '分组名称',
  `host_list` text COMMENT '机器列表, ip, hostname',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `hash` varchar(128) NOT NULL COMMENT 'md5(scope|scope_name|group_name) 标识唯一',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_hash` (`hash`(36)) COMMENT 'hash 唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sandbox v2 应用自定义分组'
;
