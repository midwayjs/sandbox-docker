CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_trace_nodes` (
  `timestamp` datetime NOT NULL COMMENT 'Timestamp',
  `scope` varchar(128) NOT NULL COMMENT 'Application Scope',
  `scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
  `env` varchar(128) NOT NULL COMMENT 'Environment, Such as dev, prod',
  `hostname` varchar(512) NOT NULL COMMENT 'Host Name',
  `ip` varchar(512) NOT NULL COMMENT 'IP',
  `uuid` varchar(256) NOT NULL COMMENT 'Unique ID',
  `span_name` varchar(512) DEFAULT NULL COMMENT 'Span Name',
  `span_duration` int(11) DEFAULT NULL COMMENT 'Span Duration',
  `span_type` int(11) DEFAULT NULL COMMENT 'Span Type',
  `span_tags` mediumtext COMMENT 'Span Tags',
  `span_id` varchar(128) DEFAULT NULL COMMENT 'Span ID',
  `span_rpcid` varchar(128) DEFAULT NULL COMMENT 'Span RPC-ID',
  `span_code` varchar(128) DEFAULT NULL,
  `span_error` tinyint(4) DEFAULT '0',
  `span_method` varchar(128) DEFAULT NULL,
  `span_timestamp` varchar(128) DEFAULT NULL,
  `pid` varchar(256) DEFAULT NULL,
  `trace_id` varchar(256) DEFAULT NULL,
  `trace_name` text,
  `span_target` mediumtext
) ENGINE=Columnstore DEFAULT CHARSET=utf8mb4 COMMENT='Trace Nodes'
;
