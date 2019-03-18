FROM centos:centos7
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install git tig vim tree wget curl \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip \
    yum -y install docker docker-compose \
    yum -y install kubernetes-client 
RUN pip install ansible docker-py 
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh \
    chmod 700 get_helm.sh \
    ./get_helm.sh
RUN mkdir /opt/awx ; cd /opt/awx ; git clone https://github.com/ansible/awx.git
WORKDIR /opt/awx
