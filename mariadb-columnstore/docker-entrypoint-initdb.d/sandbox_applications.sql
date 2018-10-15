CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `scope_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Reserved, Application ID under Scope',
  `description` text COMMENT 'Description',
  `bu` varchar(256) DEFAULT NULL COMMENT 'Reserved, BU',
  `owner` varchar(128) NOT NULL COMMENT 'Owner',
  `appops` text COMMENT 'Reserved, Application Related Persons',
  `alinode_id` varchar(256) DEFAULT NULL COMMENT 'Reserved, Application ID of Ali-Node Platform',
  `alinode_token` varchar(256) DEFAULT NULL COMMENT 'Reserved, Application Token of Ali-Node Platform',
  `flag` int(10) unsigned DEFAULT '0' COMMENT 'Flags',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as Deleted',
  `state` int(10) unsigned DEFAULT NULL COMMENT 'State',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1985 DEFAULT CHARSET=utf8 COMMENT='Sandbox Applications'
;
