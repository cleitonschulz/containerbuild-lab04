FROM scratch
ADD amzn2-container-raw-2.0.20220805.0-x86_64.tar.xz /

ARG IMAGE_CONTAINERBUILD1 IMAGE_CONTAINERBUILD1_URL IMAGE_CONTAINERBUILD1_VERSAO IMAGE_CONTAINERBUILD1_CERT IMAGE_CONTAINERBUILD1_CERTKEY IMAGE_CONTAINERBUILD1_CERTDIR

CMD ["/bin/bash"]