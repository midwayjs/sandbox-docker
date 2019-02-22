CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_traces` (
`timestamp` datetime NOT NULL COMMENT 'Timestamp',
`scope` varchar(128) NOT NULL COMMENT 'Application Scope',
`scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
`env` varchar(128) NOT NULL COMMENT 'Environment, Such as dev, prod',
`hostname` varchar(512) NOT NULL COMMENT 'Host Name',
`ip` varchar(512) NOT NULL COMMENT 'IP',
`uuid` varchar(256) NOT NULL COMMENT 'Unique ID',
`trace_id` varchar(256) DEFAULT NULL COMMENT 'Related Trace ID',
`version` int(11) DEFAULT NULL COMMENT 'Reserved, Version',
`trace_spans` mediumtext,
`unix_timestamp` bigint(20) DEFAULT NULL,
`trace_duration` int(11) DEFAULT NULL,
`pid` varchar(256) DEFAULT NULL,
`trace_name` text,
`trace_status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Trace Logs'
;
