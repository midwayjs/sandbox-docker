import { inject, post, controller, provide, priority } from 'midway';
import {LogHubService} from '../../lib/service/logHubService';

@priority(0)
@provide()
@controller('/v2/api/log-hub/')
export class LogHubCtrl {

  @inject('logHubService')
  private logHubService: LogHubService;

  @post('/put-trace')
  async putTrace(ctx) {
    const body = ctx.request.body;
    await this.logHubService.putTrace(body);
    ctx.body = 'ok';
  }

  @post('/put-metrics')
  async putMetrics(ctx) {
    const body = ctx.request.body;
    await this.logHubService.putMetrics(body);
    ctx.body = 'ok';
  }

  @post('/put-error')
  async putError(ctx) {
    const body = ctx.request.body;
    await this.logHubService.putError(body);
    ctx.body = 'ok';
  }

}
