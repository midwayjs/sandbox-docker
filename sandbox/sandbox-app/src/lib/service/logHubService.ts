import { provide, inject, config } from 'midway';
import urllib = require('urllib');

@provide('logHubService')
export class Keycenter {

  @inject()
  protected traceModel;

  @inject()
  protected traceNodeModel;

  @config()
  config;

  async putTrace(traces) {


    // event.set('appName', ENV['SANDBOX_APP_NAME'] || 'pandora-dashboard')
    // event.set('host', ENV['SANDBOX_HOST'] || 'iz8vba2t85gkivly0gdwanz')
    // event.set('ip', ENV['SANDBOX_IP'] || '172.26.215.9')
    // event.set('env', ENV['SANDBOX_ENV'] || 'dev')
    // event.set('pid', '0')

    // filter {
    //
    //
    //   if [my_type] == 'sandbox_trace' {
    //     ruby {
    //       code => "
    //
    //     #timestamp
    //       timestamp = event.get('timestamp');
    //       event.set('timestamp', timestamp)
    //
    //     # scope
    //       event.set('scope', ENV['SANDBOX_SCOPE'] || 'sandbox')
    //
    //     # scope_name
    //       appName = event.get('appName')
    //       event.set('scope_name', appName)
    //
    //     # hostname
    //       event.set('hostname', event.get('host'))
    //
    //     # uuid
    //     # event.set('uuid', event.get('seed'))
    //       event.set('uuid', event.get('traceId'))
    //
    //     # trace_spans
    //       json_spans = LogStash::Json::dump(event.get('spans'))
    //       event.set('trace_spans', json_spans)
    //
    //     # unix_timestamp
    //       unix_timestamp = (timestamp / 1000).floor
    //       event.set('unix_timestamp', unix_timestamp)
    //
    //     # trace_duration
    //       event.set('trace_duration', event.get('duration'))
    //
    //     # trace_name
    //       event.set('trace_name', event.get('name'))
    //
    //     # trace_status
    //     # event.set('trace_status', event.get('status'))
    //       event.set('trace_status', 0)
    //
    //     # version
    //       event.set('version', 1)
    //
    //       "
    //     }
    //   }
    //
    //   if [my_type] == "sandbox_trace_node" {
    //     split {
    //       field => "spans"
    //     }
    //     ruby {
    //       code => "
    //
    //       span = event.get('spans')
    //
    //     # scope
    //       event.set('scope', ENV['SANDBOX_SCOPE'] || 'sandbox')
    //
    //     # scope_name
    //       appName = event.get('appName')
    //       event.set('scope_name', appName)
    //
    //     # hostname
    //       event.set('hostname', event.get('host'))
    //
    //     # span_name
    //       event.set('span_name', span['name'])
    //
    //     # span_duration
    //       event.set('span_duration', span['duration'])
    //
    //     # span_tags
    //       json_tags = LogStash::Json::dump(span['tags'])
    //       event.set('span_tags', json_tags)
    //
    //     # span_id
    //       spanId = span['context']['spanId'];
    //       event.set('span_id', span['context']['spanId'])
    //
    //     # span_rpcid
    //       event.set('span_rpcid', span['context']['rpcId'])
    //
    //     # span_timestamp
    //     # event.set('span_timestamp', span['timestamp'])
    //
    //     # timestamp
    //       event.set('timestamp', span['timestamp'])
    //
    //     # trace_id
    //       traceId = span['context']['traceId'];
    //       event.set('trace_id', traceId)
    //
    //     # trace_name
    //       event.set('trace_name', event.get('name'))
    //
    //     #span_error
    //       event.set('span_error', span['tags']['error'] && span['tags']['error']['value'] ? 1 : 0)
    //
    //     # uuid, no way to gen a uuid, use traceId + spanId as a substitution
    //       event.set('uuid', traceId + '-' + spanId)
    //
    //     # TODO: span_method
    //       event.set('span_method', span['method'])
    //
    //     # TODO: span_target
    //       event.set('span_target', span['target'])
    //
    //     # 下面几个暂时不实现
    //     # TODO: span_type
    //     # TODO: span_code
    //       "
    //     }
    //   }
    //
    // }
    //
    // output {
    //
    //   stdout {
    //     codec => rubydebug
    //   }
    //
    //   if [my_type] == 'sandbox_metrics' {
    //
    //     opentsdb {
    //       host => "172.26.215.10"
    //       port => 4242
    //       metrics => [
    //
    //         "%{metric}",
    //         "%{value}",
    //
    //         "scope",
    //         "%{scope}",
    //
    //         "ip",
    //         "%{ip}",
    //
    //         "scope_name",
    //         "%{appName}",
    //
    //         "hostname",
    //         "%{host}",
    //
    //         "env",
    //         "%{env}",
    //
    //         "pid",
    //         "%{pid}",
    //
    //         "level",
    //         "%{level}",
    //
    //         "type",
    //         "%{type}"
    //
    //       ]
    //     }
    //   }
    //
    //   if [my_type] == 'sandbox_trace' {
    //     jdbc {
    //       driver_jar_path => "/root/sandbox-docker/app/logstash/jdbc/mariadb-java-client-2.3.0.jar"
    //       connection_string => "jdbc:mariadb://172.26.215.10:3306/column_sandbox?user=sandbox&password=sandbox"
    //       statement => [ "INSERT INTO sandbox_galaxy_sls_traces (timestamp, scope, scope_name, env, hostname, ip, uuid, trace_id, version, trace_spans, unix_timestamp, trace_duration, pid, trace_name, trace_status) values (FROM_UNIXTIME(?/1000), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", "timestamp", "scope", "scope_name", "env", "hostname", "ip", "uuid", "trace_id", "version", "trace_spans", "unix_timestamp", "trace_duration", "pid", "trace_name", "trace_status" ]
    //     }
    //   }
    //
    //   if [my_type] == "sandbox_trace_node" {
    //     jdbc {
    //       driver_jar_path => "/root/sandbox-docker/app/logstash/jdbc/mariadb-java-client-2.3.0.jar"
    //       connection_string => "jdbc:mariadb://172.26.215.10:3306/column_sandbox?user=sandbox&password=sandbox"
    //       statement => [ "INSERT INTO sandbox_galaxy_sls_trace_nodes (timestamp, scope, scope_name, env, hostname, ip, uuid, span_name, span_duration, span_tags, span_id, span_rpcid, span_error, span_timestamp, pid, trace_id, trace_name, span_method, span_target ) VALUES (FROM_UNIXTIME(?/1000), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, FROM_UNIXTIME(?/1000), ?, ?, ?, ?, ? )", "timestamp", "scope", "scope_name", "env", "hostname", "ip", "uuid", "span_name", "span_duration", "span_tags", "span_id", "span_rpcid", "span_error", "span_timestamp", "pid", "trace_id", "trace_name", "span_method", "span_target" ]
    //     }
    //   }
    //
    // }


  }

  async putMetrics(data) {
    const {tsdb} = this.config;
    const {host, port} = tsdb;
    return urllib.request(`http://${host}:${port}/api/put`, {
      data: data
    });
  }

}
