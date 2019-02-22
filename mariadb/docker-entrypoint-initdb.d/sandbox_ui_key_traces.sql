CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_ui_key_traces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `trace_name` varchar(2048) NOT NULL COMMENT 'Trace Name',
  `focus` tinyint(3) unsigned DEFAULT '1' COMMENT 'Mark as focused',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as deleted',
  `hash` varchar(128) NOT NULL COMMENT 'md5(scope|scope_name|trace_name) as Unique Hash',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`hash`(36)) COMMENT 'Mark Hash as Unique'
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='Sandbox UI Key Traces'
;
