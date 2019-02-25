import * as os from 'os';
import * as md5 from 'md5';
const hostname = os.hostname();
const pid = process.pid;
let seedIndex = 1;

export class ReporterUtil {
  static unix(timestamp?) {
    timestamp = timestamp || Date.now();
    return Math.floor(timestamp / 1000);
  }
  static getSeed() {
    return md5(hostname + pid + Date.now() + seedIndex++);
  }
}

export function mapToObj(map: Map<string, any>): Object {
  const obj = Object.create(null);
  for (let [k, v] of map) {
    obj[k] = v;
  }
  return obj;
}


export function spanToJson(span) {
  return {
    name: span.operationName,
    timestamp: span.startTime,
    duration: span.duration,
    context: contextToJson(span.context()),
    references: span.references.map((reference) => {
      return contextToJson(reference.referencedContext());
    }),
    tags: mapToObj(span.tags),
    logs: span.logs
  }
}

export function contextToJson(context) {
  const result = {
    traceId: context.traceId,
    parentId: context.parentId,
    spanId: context.spanId,
    rpcId: context.rpcId
  };
  for (const [key, value] of context.userData.entries()) {
    if (value !== undefined) {
      result[key] = value;
    }
  }
  return result;
}

