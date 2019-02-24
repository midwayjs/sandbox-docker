import urllib = require('urllib');
import {ReporterUtil} from './ReporterUtil';

export class SandboxMetricsLogHubReporter {
  type = 'metrics';
  ctx: any;
  url: string;
  constructor(ctx: any) {
    this.ctx = ctx;
    const {sandboxLogHubReporter: config} = this.ctx.config;
    this.url = `${config.endpoint}${config.endpoint.endsWith('/') ? '' : '/'}v2/api/log-hub/put-metrics`;
  }
  async report (data: any[]): Promise<void> {
    const globalTags = this.getGlobalTags();
    const nextList = [];
    for(const metricObject of data) {
      nextList.push({
        ...metricObject,
        ...globalTags,
        tags: {
          ...metricObject.tags,
          ...globalTags
        },
        unix_timestamp: ReporterUtil.unix(metricObject.timestamp),
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
