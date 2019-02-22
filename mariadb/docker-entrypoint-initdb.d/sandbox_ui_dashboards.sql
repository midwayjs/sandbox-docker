CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_ui_dashboards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `dashboard_name` varchar(256) NOT NULL COMMENT 'Dashboard Name',
  `target` tinyint(3) unsigned DEFAULT '1' COMMENT 'Dashboard Level, Cluster: 1, Single Host: 2',
  `config` text NOT NULL COMMENT 'Dashboard Configs',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as deleted',
  `focus` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as focused',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sandbox UI Dashboards'
;
