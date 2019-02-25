import urllib = require('urllib');
import {ReporterUtil, spanToJson} from './ReporterUtil';

export class SandboxTraceLogHubReporter {
  type = 'trace';
  ctx: any;
  url: string;
  constructor(ctx: any) {
    this.ctx = ctx;
    const {sandboxLogHubReporter: config} = this.ctx.config;
    this.url = `${config.endpoint}${config.endpoint.endsWith('/') ? '' : '/'}v2/api/log-hub/put-trace`;
  }
  async report (data: any[]): Promise<void> {
    const globalTags = this.getGlobalTags();
    const nextList = [];
    for(const traceData of data) {
      const traceData2nd = {...traceData};
      /* istanbul ignore else */
      if(traceData.spans) {
        traceData2nd.spans = [];
        for(const span of traceData.spans) {
          if(span.toJSON) {
            // 如果 span 有 toJSON 接口，则使用 toJSON 接口获得序列化对象
            traceData2nd.spans.push(span.toJSON());
          } else {
            traceData2nd.spans.push(spanToJson(span));
          }
        }
      }
      nextList.push({
        ...traceData2nd,
        // rename traceName to name
        traceName: undefined,
        name: traceData2nd.traceName,
        seed: ReporterUtil.getSeed(),
        unix_timestamp: ReporterUtil.unix(traceData2nd.timestamp),
        ...globalTags
      });
    }
    try {
      await urllib.request(this.url, {
        method: 'POST',
        contentType: 'json',
        data: nextList
      });
    } catch(err) {
      this.ctx.logger.warn(err);
    }
  }
  getGlobalTags() {
    const {sandboxLogHubReporter: config} = this.ctx.config;
    return config.globalTags;
  }
}
