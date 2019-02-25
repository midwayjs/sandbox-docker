FROM node
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV UNDER_DOCKER true
ADD ./sandbox-app /sandbox-app
WORKDIR /sandbox-app
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && cnpm install
RUN npm run build
CMD ["npm", "run", "start_prod"]
