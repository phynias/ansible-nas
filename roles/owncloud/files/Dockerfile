FROM webhippie/alpine:latest
#-amd64@sha256:0ee91a4aac95e8ee0fd67eb4d9ede7dcfcd7396873fad5e04425e335b5eb69a4

VOLUME ["/var/lib/mysql", "/var/lib/backup", "/etc/mysql/conf.d", "/etc/mysql/init.d"]
EXPOSE 3306

WORKDIR /var/lib/mysql
CMD ["/usr/bin/container"]

RUN apk update && \
  apk upgrade && \
  mkdir -p /var/lib/mysql && \
  groupadd -g 1000 mysql && \
  useradd -u 1000 -d /var/lib/mysql -g mysql -s /bin/bash -m mysql
RUN  apk add  mariadb=~11.4 mariadb-client=~11.4 mariadb-server-utils=~11.4 tzdata
RUN  rm -rf /var/cache/apk/* /etc/mysql/* /etc/my.cnf* /var/lib/mysql/* || true

COPY ./overlay /
#  echo 'http://dl-cdn.alpinelinux.org/alpine/v3.14/main' >> /etc/apk/repositories && \
