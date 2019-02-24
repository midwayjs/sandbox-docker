import {ReporterManager} from 'pandora-component-reporter-manager';
import {componentName, dependencies, componentConfig} from 'pandora-component-decorator';
import address = require('address');
import {hostname} from 'os';
import {SandboxMetricsLogHubReporter} from './SandboxMetricsLogHubReporter';
import {SandboxTraceLogHubReporter} from './SandboxTraceLogHubReporter';
import {SandboxErrorLogLogHubReporter} from './SandboxErrorLogLogHubReporter';

@componentName('sandboxLogHubReporter')
@dependencies(['reporterManager', 'fileLoggerService'])
@componentConfig({
  sandboxLogHubReporter: {
    endpoint: 'http://sandbox.endpoint/',
    globalTags: {
      appName: process.env.SANDBOX_APP_NAME,
      host: hostname(),
      ip: process.env.SANDBOX_IP || address.ip(),
      env: process.env.SANDBOX_ENV,
      pid: process.pid.toString(),
    },
  }
})
export default class ComponentSandboxFileReporter {

  ctx: any;
  constructor(ctx) {
    this.ctx = ctx;
    if(!ctx.config.sandboxLogHubReporter.appName) {
      ctx.config.sandboxLogHubReporter.appName = ctx.appName;
    }
  }

  async start() {
    this.startAtAllProcesses();
  }

  async startAtSupervisor() {
    this.startAtAllProcesses();
  }

  startAtAllProcesses() {
    const reporterManager: ReporterManager = this.ctx.reporterManager;
    reporterManager.register('sandboxMetricsFileReporter', new SandboxMetricsLogHubReporter(this.ctx));
    reporterManager.register('sandboxTraceFileReporter', new SandboxTraceLogHubReporter(this.ctx));
    reporterManager.register('sandboxErrorLogFileReporter', new SandboxErrorLogLogHubReporter(this.ctx));
  }

}