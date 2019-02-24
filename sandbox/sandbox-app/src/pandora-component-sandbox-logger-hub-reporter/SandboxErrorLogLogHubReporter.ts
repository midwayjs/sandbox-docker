import urllib = require('urllib');
import {ReporterUtil} from './ReporterUtil';

export class SandboxErrorLogLogHubReporter  {
  type = 'errorLog';
  ctx: any;
  url: string;
  constructor(ctx: any) {
    this.ctx = ctx;
    const {sandboxLogHubReporter: config} = this.ctx.config;
    this.url = `${config.endpoint}${config.endpoint.endsWith('/') ? '' : '/'}v2/api/log-hub/put-error`;
  }
  async report (data: any[]): Promise<void> {
    const globalTags = this.getGlobalTags();
    const nextList = [];
    for(const errorLog of data) {
      nextList.push({
        ...errorLog,
        unix_timestamp: ReporterUtil.unix(errorLog.timestamp),
        seed: ReporterUtil.getSeed(),
        ...globalTags
      });
    }
    try {
      await urllib.request(this.url, {
        method: 'POST',
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