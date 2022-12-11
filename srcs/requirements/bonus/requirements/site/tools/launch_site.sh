#!/bin/sh

mv -f /style.css /usr/share/nginx/html/style.css
mv -f /index.html /usr/share/nginx/html/index.html
mv -f /script.js /usr/share/nginx/html/script.js
echo "launch siteweb"

npm install --global http-server
http-server /usr/share/nginx/html/ -a 0.0.0.0 -p 0
