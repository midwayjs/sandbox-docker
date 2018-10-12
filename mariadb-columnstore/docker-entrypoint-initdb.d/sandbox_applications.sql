CREATE DATABASE IF NOT EXISTS sandbox;

CREATE TABLE `sandbox`.`sandbox_applications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `scope` varchar(128) NOT NULL COMMENT '应用域',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称',
  `scope_id` bigint(20) unsigned DEFAULT NULL COMMENT '应用 ID',
  `description` text COMMENT '应用描述',
  `bu` varchar(256) DEFAULT NULL COMMENT '应用所属 BU',
  `owner` varchar(128) NOT NULL COMMENT '应用负责人',
  `appops` text COMMENT '应用相关人员',
  `alinode_id` varchar(256) DEFAULT NULL COMMENT 'alinode 应用 id',
  `alinode_token` varchar(256) DEFAULT NULL COMMENT 'alinode 应用 token',
  `flag` int(10) unsigned DEFAULT '0' COMMENT '状态标识',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否删除',
  `state` int(10) unsigned DEFAULT NULL COMMENT '状态记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1985 DEFAULT CHARSET=utf8 COMMENT='sandbox v2 应用表'
;
