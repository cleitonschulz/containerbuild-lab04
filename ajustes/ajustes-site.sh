#!/bin/bash

mv /var/www/site1 /var/www/$IMAGE_CONTAINERBUILD1

mv /etc/nginx/conf.d/site1.conf /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

sed -i "s,sed_site_url,$IMAGE_CONTAINERBUILD1_URL,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf
sed -i "s,sed_site_dir,$IMAGE_CONTAINERBUILD1,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf

if [ $IMAGE_CONTAINERBUILD_SSL = "SIM" ]
then
        mv /etc/nginx/conf.d/site1-redirect.conf /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf
	mv /etc/nginx/conf.d/site2.conf /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	sed -i "s,fullchain.pem,$IMAGE_CONTAINERBUILD1_CERT,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	sed -i "s,privkey.pem,$IMAGE_CONTAINERBUILD1_CERTKEY,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	sed -i "s,dhparam-2048.pem,$IMAGE_CONTAINERBUILD1_DHPARAM,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	sed -i "s,sed_site_url,$IMAGE_CONTAINERBUILD1_URL,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	sed -i "s,sed_site_dir,$IMAGE_CONTAINERBUILD1,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	if [ $IMAGE_CONTAINERBUILD_DEBUG = "SIM" ]
	then
		sed -i "s,#DEBUGSED,error_log /var/log/nginx/error.log debug;,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1-ssl.conf
	fi
else 
	mv /etc/nginx/conf.d/site2.conf mv /etc/nginx/conf.d/site2-DESATIVADO
        mv /etc/nginx/conf.d/site1-redirect.conf /etc/nginx/conf.d/site1-redirect-DESATIVADO
fi

if [ $IMAGE_CONTAINERBUILD_DEBUG = "SIM" ]
then
	sed -i "s,#DEBUGSED,error_log /var/log/nginx/error.log debug;,g" /etc/nginx/conf.d/$IMAGE_CONTAINERBUILD1.conf
fi

/usr/sbin/nginx

exec /usr/sbin/init
