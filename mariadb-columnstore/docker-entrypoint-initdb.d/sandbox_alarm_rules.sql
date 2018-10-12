CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_alarm_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `rule_name` varchar(256) NOT NULL COMMENT '规则名称',
  `rule_type` tinyint(3) unsigned DEFAULT '1' COMMENT '规则分类，1：指标，2：错误，3：链路',
  `follower` text NOT NULL COMMENT '关注人',
  `creator` varchar(128) NOT NULL COMMENT '创建人',
  `message` text COMMENT '自定义消息',
  `execute_rule` text NOT NULL COMMENT '执行规则',
  `disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `action` varchar(128) NOT NULL COMMENT '通知方式',
  `action_params` text COMMENT '通知方式参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sandbox v2 报警规则'
;
