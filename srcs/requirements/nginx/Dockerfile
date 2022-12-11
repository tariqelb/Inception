FROM alpine:3.16.3

RUN apk update && apk upgrade && apk add nginx

RUN apk add openssl

COPY ./conf/nginx_selfsigned.crt /etc/ssl/certs/nginx_selfsigned.crt

COPY ./conf/nginx_selfsigned.key /etc/ssl/private/nginx_selfsigned.key

RUN /bin/mkdir -p /usr/share/nginx/html

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
