FROM centos:centos7
MAINTAINER judexzhu

RUN yum -y update \ 
        && yum clean all \
        && yum install -y epel-release \
        && yum install -y nginx iproute

EXPOSE 80
COPY index.html /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
