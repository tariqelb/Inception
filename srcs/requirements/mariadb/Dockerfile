FROM alpine:3.16.3

RUN apk update && apk upgrade  && apk add openrc

RUN apk add mariadb mariadb-client

COPY ./tools/launch_mariadb_script.sh /launch_mariadb_script.sh

RUN rm  -rf /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY ./tools/wplogindb.sql /wplogindb.sql

ENTRYPOINT ["sh", "/launch_mariadb_script.sh"]
