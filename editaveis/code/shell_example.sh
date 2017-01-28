#!/bin/bash
FILE=/etc/nginx

cat << EOF > /etc/nginx/conf.d/mysite.conf
upstream mysite {
  server 127.0.0.1:8081;
}

server {
  listen      *:80;
  server_name 196.164.86.12;

  location /mysite/ {
  }
}
EOF

systemctl restart nginx
