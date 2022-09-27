#!/bin/bash

mv /var/www/site1 /var/www/$IMAGE_CONTAINERBUILD1

mv /etc/nginx/conf.d/site1.conf /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

sed -i "s,sed_site_url,$IMAGE_CONTAINERBUILD1_URL,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf
sed -i "s,sed_site_dir,$IMAGE_CONTAINERBUILD1,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

/usr/sbin/nginx

exec /usr/sbin/init
