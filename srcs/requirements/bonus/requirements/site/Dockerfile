FROM alpine:3.16.3

RUN apk update && apk upgrade

RUN apk add --update nodejs npm

RUN addgroup -S nginx && adduser -S nginx -G nginx

RUN /bin/mkdir -p /usr/share/nginx/html

RUN chown -R nginx:nginx /usr/share/nginx

COPY ./tools/launch_site.sh /launch_site.sh
COPY ./tools/style.css /style.css
COPY ./tools/script.js /script.js
COPY ./tools/index.html /index.html


ENTRYPOINT ["sh", "/launch_site.sh"]
