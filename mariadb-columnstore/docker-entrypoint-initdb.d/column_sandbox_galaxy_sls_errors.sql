CREATE DATABASE IF NOT EXISTS column_sandbox;

CREATE TABLE `column_sandbox`.`sandbox_galaxy_sls_errors` (
`timestamp` datetime NOT NULL COMMENT '时间分表字段',
`scope` varchar(128) NOT NULL COMMENT '应用域 lookup',
`scope_name` varchar(256) NOT NULL COMMENT '应用名称 lookup',
`env` varchar(128) NOT NULL COMMENT '应用环境 lookup',
`hostname` varchar(512) NOT NULL COMMENT '机器名 filter',
`ip` varchar(512) NOT NULL COMMENT 'ip filter',
`uuid` varchar(256) NOT NULL COMMENT '日志唯一ID filter',
`error_type` varchar(512) DEFAULT NULL COMMENT '???? filter',
`error_stack` mediumtext COMMENT '???? filter',
`unix_timestamp` bigint(20) DEFAULT NULL COMMENT 'unix?????',
`log_path` mediumtext COMMENT '???? filter',
`error_message` mediumtext,
`version` int(11) DEFAULT NULL,
`trace_id` varchar(256) DEFAULT NULL,
`pid` varchar(256) DEFAULT NULL
) ENGINE=Columnstore DEFAULT CHARSET=utf8mb4 COMMENT='sls 采集的错误日志' 
;
