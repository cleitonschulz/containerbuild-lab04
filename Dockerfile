FROM scratch
ADD amzn2-container-raw-2.0.20220805.0-x86_64.tar.xz /

ARG IMAGE_CONTAINERBUILD1 IMAGE_CONTAINERBUILD1_URL IMAGE_CONTAINERBUILD1_VERSAO IMAGE_CONTAINERBUILD1_CERT IMAGE_CONTAINERBUILD1_CERTKEY IMAGE_CONTAINERBUILD1_CERTDIR

RUN yum update -y

RUN yum install net-tools procps -y

RUN amazon-linux-extras install nginx1 -y

copy ajustes-site.sh /bin/

run chmod 744 /bin/ajustes-site.sh

#CMD ["/bin/bash"]
#CMD ["/usr/sbin/init"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/ajustes-site.sh"]