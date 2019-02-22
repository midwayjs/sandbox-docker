import { inject, post, controller, provide, priority } from 'midway';

@priority(0)
@provide()
@controller('/v2/api/log-hub/')
export class MetricsCtrl {

  @inject('logHubService')
  private logHubService;

  @post('/trace')
  async putTrace(ctx) {
    const body = ctx.request.body;
    await this.logHubService.putTrace(body);
    ctx.body = 'ok';
  }

  @post('/metrics')
  async putMetrics(ctx) {
    const body = ctx.request.body;
    await this.logHubService.putMetrics(body);
    ctx.body = 'ok';
  }

}
