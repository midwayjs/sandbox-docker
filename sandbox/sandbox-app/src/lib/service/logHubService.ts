import { provide, inject, config, logger } from 'midway';
import urllib = require('urllib');

const METRICS_BATCH_SLICE_SIZE = 20;
const DEFAULT_SCOPE = 'sandbox';
const DEFAULT_ENV = 'prod';


@provide('logHubService')
export class LogHubService {

  @logger()
  protected logger;

  @inject()
  protected traceModel;

  @inject()
  protected traceNodeModel;

  @inject()
  protected errorModel;

  @config('tsdb')
  tsdbConfig;

  async putTrace(traces) {
    for(const trace of traces) {
      try {
        await this.putTraceRecord(trace);
      } catch(err) {
        this.logger.warn(err);
      }
      try {
        await this.putTraceNodeRecord(trace);
      } catch(err) {
        this.logger.warn(err);
      }
    }
  }

  async putTraceRecord(trace) {

    const record = {
      timestamp: new Date(trace.timestamp),
      scope: trace.scope || DEFAULT_SCOPE,
      scopeName: trace.appName,
      env: trace.env || DEFAULT_ENV,
      hostname: trace.host,
      ip: trace.ip,
      pid: trace.pid,
      uuid: trace.seed || trace.traceId,
      traceId: trace.traceId,
      traceSpans: trace.spans ? JSON.stringify(trace.spans) : null,
      unixTimestamp: trace.unix_timestamp || Math.floor(trace.timestamp / 1000),
      traceDuration: trace.duration,
      traceName: trace.name,
      traceStatus: trace.status,
      version: 1
    };

    return this.traceModel.create(record, { raw: true });

  }

  async putTraceNodeRecord(trace) {

    if(!trace.spans) {
      return;
    }

    for(const span of trace.spans) {

      try {

        const traceId = span.context && span.context.traceId || trace.traceId;
        const spanId = span.context && span.context.spanId;

        const record = {

          timestamp: span.timestamp,
          spanTimestamp: span.timestamp,

          scope: trace.scope || DEFAULT_SCOPE,
          scopeName: trace.appName,
          env: trace.env || DEFAULT_ENV,
          hostname: trace.host,
          ip: trace.ip,
          pid: trace.pid,


          spanName: span.name,
          spanDuration: span.duration,
          spanTags: span.tags ? JSON.stringify(span.tags) : null,
          spanId: spanId,
          spanRpcId: span.context && span.context.rpcId,
          traceId: traceId,
          traceName: trace.name,
          spanError: span.tags && span.tags.error ? 1 : 0,

          uuid: traceId + '-' + spanId,

          spanMethod: span.method,
          spanTarget: span.target

        };

        await this.traceNodeModel.create(record, { raw: true });

      } catch(err) {
        this.logger.warn(err);
      }

    }

  }

  async putMetrics(list) {

    const {host, port} = this.tsdbConfig;
    const nextList = [];

    for(const one of list) {
      try {
        if(one.value == null || one.metric == null) {
          continue;
        }
        nextList.push({
          metric: one.metric,
          timestamp: one.timestamp,
          value: one.value || 0,
          tags: {
            scope: one.scope || DEFAULT_SCOPE,
            ip: one.ip,
            scope_name: one.appName,
            hostname: one.host,
            env: one.env || DEFAULT_ENV,
            pid: one.pid,
            level: one.level,
            type: one.type
          }
        });
      } catch(err) {
        this.logger.warn(err);
      }
    }

    for(let idx = 0, len = Math.ceil(nextList.length / METRICS_BATCH_SLICE_SIZE); idx < len; idx++) {
      const start = idx * METRICS_BATCH_SLICE_SIZE;
      const end = (idx + 1) * METRICS_BATCH_SLICE_SIZE;
      const slice = nextList.slice(start, end);
      try {
        const resp = await urllib.request(`http://${host}:${port}/api/put?summary&details`, {
          method: 'POST',
          contentType: 'json',
          headers: {
            'Content-Type': 'application/json',
          },
          timeout: 10000,
          data: slice
        });
        if (resp.status !== 200) {
          if (resp.data && resp.data.error) {
            const err = new Error(resp.data.error.message);
            Object.assign(err, resp.data.error);
            throw err;
          } else {
            throw new Error('TSDB unknown error with http code: ' + resp.status);
          }
        }
      } catch(err) {
        this.logger.warn(err);
      }
    }

  }


  async putError(list) {

    for(const one of list) {

      try {

        const record = {
          timestamp: new Date(one.timestamp),
          unixTimestamp: one.unix_timestamp,

          scope: one.scope || DEFAULT_SCOPE,
          scopeName: one.appName,
          ip: one.ip,
          hostname: one.host,
          env: one.env || DEFAULT_ENV,
          pid: one.pid,
          errorType: one.errorType,
          errorMessage: one.message,
          errorStack: one.stack,
          traceId: one.traceId,
          logPath: one.path,
          uuid: one.seed,

          version: 1
        };

        await this.errorModel.create(record, { raw: true });

      } catch(err) {
        this.logger.warn(err);
      }

    }

  }

}
