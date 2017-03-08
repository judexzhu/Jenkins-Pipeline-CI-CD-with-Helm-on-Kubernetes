FROM centos:centos7
MAINTAINER judexzhu

RUN yum -y update \ 
        && yum clean all \
        && yum install -y epel-release \
        && yum install -y nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
