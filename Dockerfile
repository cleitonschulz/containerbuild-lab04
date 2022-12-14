FROM scratch
ADD amzn2-container-raw-2.0.20220805.0-x86_64.tar.xz /

ARG IMAGE_CONTAINERBUILD1 IMAGE_CONTAINERBUILD1_URL IMAGE_CONTAINERBUILD1_VERSAO IMAGE_CONTAINERBUILD1_CERT IMAGE_CONTAINERBUILD1_CERTKEY IMAGE_CONTAINERBUILD1_CERTDIR IMAGE_CONTAINERBUILD_DEBUG IMAGE_CONTAINERBUILD_SSL

#RUN yum update -y

RUN amazon-linux-extras enable nginx1 -y

RUN yum install net-tools procps nginx -y

RUN ln -s -f /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

copy ajustes/ajustes-site.sh /usr/bin/ajustes-site.sh

RUN mkdir -p /var/www/

copy var/site1 /var/www/site1

copy nginx-conf/site1.conf /etc/nginx/conf.d/site1.conf 
copy nginx-conf/site1-redirect.conf /etc/nginx/conf.d/site1-redirect.conf 
copy nginx-conf/site2.conf /etc/nginx/conf.d/site2.conf 
copy nginx-conf/parametros.conf /etc/nginx/conf.d/parametros.conf

run chmod 744 /bin/ajustes-site.sh

#CMD ["/bin/bash"]
#CMD ["/usr/sbin/init"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/usr/bin/ajustes-site.sh"]
