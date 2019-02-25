FROM mariadb/server
ENV MARIADB_RANDOM_ROOT_PASSWORD true
ADD ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
