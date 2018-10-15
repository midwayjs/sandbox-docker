CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_alarm_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gmt_create` datetime NOT NULL COMMENT 'Create Time',
  `gmt_modified` datetime NOT NULL COMMENT 'Last Modify Time',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `rule_name` varchar(256) NOT NULL COMMENT 'Rule Name',
  `rule_type` tinyint(3) unsigned DEFAULT '1' COMMENT 'Rule Type, 1: metrics, 2: Error, 3: Trace',
  `follower` text NOT NULL COMMENT 'Followers',
  `creator` varchar(128) NOT NULL COMMENT 'Creator',
  `message` text COMMENT 'Custom Message',
  `execute_rule` text NOT NULL COMMENT 'Execute Rule',
  `disabled` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as Disabled',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT 'Mark as deleted',
  `action` varchar(128) NOT NULL COMMENT 'Notifying Approach',
  `action_params` text COMMENT 'Params of Notifying Approach',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sandbox Alarm Rules'
;
