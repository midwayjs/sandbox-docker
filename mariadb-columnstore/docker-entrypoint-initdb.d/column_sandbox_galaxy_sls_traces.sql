CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_traces` (
`timestamp` datetime NOT NULL COMMENT '时间分表字段',
`scope` varchar(128) NOT NULL COMMENT '应用域 lookup',
`scope_name` varchar(256) NOT NULL COMMENT '应用名称 lookup',
`env` varchar(128) NOT NULL COMMENT '环境 lookup',
`hostname` varchar(512) NOT NULL COMMENT '机器名 filter',
`ip` varchar(512) NOT NULL COMMENT 'IP filter',
`uuid` varchar(256) NOT NULL COMMENT '链路唯一 ID filter',
`trace_id` varchar(256) DEFAULT NULL COMMENT '?? ID filter',
`version` int(11) DEFAULT NULL COMMENT '??????',
`trace_spans` mediumtext,
`unix_timestamp` bigint(20) DEFAULT NULL,
`trace_duration` int(11) DEFAULT NULL,
`pid` varchar(256) DEFAULT NULL,
`trace_name` text,
`trace_status` int(11) DEFAULT '1'
) ENGINE=Columnstore DEFAULT CHARSET=utf8mb4 COMMENT='sls 采集的 trace log' 
;
