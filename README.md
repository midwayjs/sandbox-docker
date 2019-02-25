# sandbox-docker

一份基于 Docker Compose 的单机部署的配置。

## 简要说明

Checkout 本项目，并运行如下命令即可启动。

```shell
sudo docker-compose build && sudo docker-compose up
```

访问 7001 端口即可查看数据。

## 组件介绍

1. /sandbox
  * Sandbox 监控平台应用程序，其使用 Pandora.js 启动。
2. /mariadb
  * MariaDB 的一个实例，用于存储错误日志和链路数据
  * 配有数据自动清理功能，默认保留 3 天数据
3. /opentsdb
  * 用于存储 Metrics 数据

## 如何接入更多应用

应用使用 Pandora.js 启动，并安装 `pandora-component-sandbox-log-hub-reporter`。

并在应用目录增加如下配置：

```javascript
exports.components = {
  // 配置使用 LogHub 向 Sandbox 写入数据
  sandboxLogHubReporter: {
    path: 'pandora-component-sandbox-logger-hub-reporter'
  },
  // 打开基于 Patch 和 AsyncHooks 自动获取数据
  autoPatching: {
    path: 'pandora-component-auto-patching'
  }
};

exports.sandboxLogHubReporter = {
  // 配置 LogHub 的地址，即 Sandbox 平台的地址
  endpoint: 'http://127.0.0.1:7001/'
};

exports.trace = {
  // 配置链路采样率
  sampling: 10
};
```

然后运行 `pandora start` 即可前台启动应用。然后再等一会，如果没有意外，新应用就会出现在 Sandbox 的应用列表上了。

