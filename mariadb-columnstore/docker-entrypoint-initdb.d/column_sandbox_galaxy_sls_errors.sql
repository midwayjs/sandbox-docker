CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_errors` (
`timestamp` datetime NOT NULL COMMENT 'Timestamp',
`scope` varchar(128) NOT NULL COMMENT 'Application Scope',
`scope_name` varchar(256) NOT NULL COMMENT 'Application Name under Scope',
`env` varchar(128) NOT NULL COMMENT 'Environment, Such as dev, prod',
`hostname` varchar(512) NOT NULL COMMENT 'Host Name',
`ip` varchar(512) NOT NULL COMMENT 'IP',
`uuid` varchar(256) NOT NULL COMMENT 'Unique ID',
`error_type` varchar(512) DEFAULT NULL COMMENT 'Error Type',
`error_stack` mediumtext COMMENT 'Error Stack',
`unix_timestamp` bigint(20) DEFAULT NULL COMMENT 'Unix TS',
`log_path` mediumtext COMMENT 'Log Path',
`error_message` mediumtext,
`version` int(11) DEFAULT NULL,
`trace_id` varchar(256) DEFAULT NULL,
`pid` varchar(256) DEFAULT NULL
) ENGINE=Columnstore DEFAULT CHARSET=utf8mb4 COMMENT='Error logs'
;
