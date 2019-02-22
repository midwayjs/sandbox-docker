CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_fault_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `related_module` varchar(256) NOT NULL COMMENT 'Related Modules',
  `filter_rule` text NOT NULL COMMENT 'Filter Rule',
  `fault_rule` text NOT NULL COMMENT 'Fault Rule',
  `disabled` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as Disabled',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as Deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sandbox Fault Rules'
;
