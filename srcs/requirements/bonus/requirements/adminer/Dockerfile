FROM alpine:3.16.3

RUN apk update && apk upgrade && apk add curl

RUN apk add php8 php8-ctype php8-fpm php8-phar php8-redis

RUN apk add  php8-curl php8-dom php8-exif php8-fileinfo php8-pdo php8-pdo_mysql

RUN apk add php8-mysqli php8-openssl php8-sodium php8-xml php8-zip

RUN mkdir -p /usr/share/nginx/html/adminer


COPY ./tools/adminer-4.8.1.php /usr/share/nginx/html/adminer/index.php

ENTRYPOINT php -S '[::]: 8083' -t /usr/share/nginx/html/adminer/ 
