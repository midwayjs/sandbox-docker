FROM petergrace/opentsdb-docker
ADD opentsdb.conf /etc/opentsdb.conf
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
