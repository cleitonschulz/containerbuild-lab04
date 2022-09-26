#!/bin/bash

/usr/sbin/nginx

mv /var/www/site1 /var/www/$IMAGE_CONTAINERBUILD1

mv /etc/nginx/conf.d/site1.conf /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

sed -i "s,sed_site,$IMAGE_CONTAINERBUILD1_URL,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

exec /usr/sbin/init