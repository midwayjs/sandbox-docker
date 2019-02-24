const http = require('http');

class SimpleHTTPServer {

  start() {
    const {port, host} = this.getPort();
    return new Promise((resolve) => {
      this.getServer().listen({ port, host }, resolve);
    });
  }

  stop() {
    return new Promise((resolve) => {
      this.getServer().close(resolve);
    });
  }

  getServer() {
    if(!this.server) {
      this.server = this.createServer();
    }
    return this.server;
  }

  createServer() {
    return http.createServer((req, res) => {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end('okay');
    });
  }

  getPort() {
    return {port: 8888, host: '0.0.0.0'};
  }

}

const server = new SimpleHTTPServer();
server.start();

