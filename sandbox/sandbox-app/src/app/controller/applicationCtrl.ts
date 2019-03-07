import * as sandboxCore from 'sandbox-core';
import {TSDB, SandboxApplication, wrapJson} from 'sandbox-core';
import {get, inject, config} from 'midway';

export class ApplicationCtrl extends sandboxCore.ApplicationCtrl {


  @inject('tsdb')
  tsdb: TSDB;

  @config('coreMetrics')
  coreMetrics;

  @inject()
  defaultPlatformAdapter;
  @get('/listByUser')
  async listByUser(ctx) {

    const theMetricsName = this.coreMetrics.cpuUsage.metric;
    const ret = await this.tsdb.query({
      start: '1h-ago',
      queries: [
        {
          metric: theMetricsName,
          aggregator: 'avg',
          downsample: '1h-avg',
          tags: {
            scope_name: '*', scope: '*'
          }
        }
      ]
    });
    const result: Partial<SandboxApplication>[] = [];
    for(const item of ret) {
      const {scope, scope_name} = item.tags;
      result.push({
        id: scope + ':' + scope_name,
        flag: 0,
        scope: scope,
        scopeName: scope_name
      });
    }
    ctx.body = wrapJson({
      data: result,
      total: result.length
    });

  }
}

