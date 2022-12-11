FROM alpine:3.16.3

RUN  apk update && apk upgrade

RUN  apk add redis

RUN rm -rf /etc/redis.conf

COPY ./conf/redis.conf /etc/redis.conf

COPY ./tools/launch_redis.sh /launch_redis.sh

ENTRYPOINT ["sh", "/launch_redis.sh"] 
