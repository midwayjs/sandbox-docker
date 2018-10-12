CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_trace_nodes` (
  `timestamp` datetime NOT NULL COMMENT '时间分表字段',
  `scope` varchar(128) NOT NULL COMMENT '应用域 lookup',
  `scope_name` varchar(256) NOT NULL COMMENT '应用名称 lookup',
  `env` varchar(128) NOT NULL COMMENT '环境 lookup',
  `hostname` varchar(512) NOT NULL COMMENT '机器名 filter',
  `ip` varchar(512) NOT NULL COMMENT 'ip filter',
  `uuid` varchar(256) NOT NULL COMMENT '链路唯一 ID filter',
  `span_name` varchar(512) DEFAULT NULL COMMENT '???? filter',
  `span_duration` int(11) DEFAULT NULL COMMENT '???? ms',
  `span_type` int(11) DEFAULT NULL COMMENT '?? RPC ??',
  `span_tags` mediumtext COMMENT '?? tags filter',
  `span_id` varchar(128) DEFAULT NULL COMMENT '?? ID filter',
  `span_rpcid` varchar(128) DEFAULT NULL COMMENT '?? RPC ID filter',
  `span_code` varchar(128) DEFAULT NULL,
  `span_error` tinyint(4) DEFAULT '0',
  `span_method` varchar(128) DEFAULT NULL,
  `span_timestamp` varchar(128) DEFAULT NULL,
  `pid` varchar(256) DEFAULT NULL,
  `trace_id` varchar(256) DEFAULT NULL,
  `trace_name` text,
  `span_target` mediumtext
) ENGINE=Columnstore DEFAULT CHARSET=utf8mb4 COMMENT='sls 采集的链路数据，分结点后' 
;
