CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `group_name` varchar(128) NOT NULL COMMENT 'Group Name',
  `host_list` text COMMENT 'Host List, IP, Hostname',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as deleted',
  `hash` varchar(128) NOT NULL COMMENT 'md5(scope|scope_name|group_name) as Unique Hash',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_hash` (`hash`(36)) COMMENT 'Mark Hash as Unique key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sandbox Groups'
;
