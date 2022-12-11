FROM alpine:3.16.3

RUN apk update && apk upgrade && apk add curl

RUN apk add php8 php8-ctype php8-fpm php8-phar php8-redis

RUN apk add  php8-curl php8-dom php8-exif php8-fileinfo php8-pdo php8-pdo_mysql

RUN apk add php8-mysqli php8-openssl php8-sodium php8-xml php8-zip 

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf

RUN curl -ol https://wordpress.org/wordpress-6.0.1.tar.gz

RUN tar -xzvf l

RUN rm -rf /l

COPY ./tools/launch_php-fpm_script.sh  /launch_php-fpm_script.sh

RUN /bin/mkdir -p /usr/share/nginx/html

RUN /bin/rm -rf /wordpress/wp-config.php

RUN /bin/cp -rf /wordpress/. /usr/share/nginx/html/.

RUN addgroup -S nginx && adduser -S nginx -G nginx

ENTRYPOINT ["sh", "/launch_php-fpm_script.sh"]
