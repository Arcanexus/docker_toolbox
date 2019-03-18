FROM centos:centos7
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install git tig vim tree wget curl \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip \
    yum -y install docker docker-compose \
    yum -y install kubernetes-client 
RUN pip install --upgrade pip ; pip install ansible docker-py 
RUN mkdir /opt/helm ; cd /opt/helm ; wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-linux-amd64.tar.gz
RUN cd /opt/helm ; tar -zxf helm-v2.13.0-linux-amd64.tar.gz
ENV PATH="/opt/helm/linux-amd64/:${PATH}"
RUN mkdir /opt/awx ; cd /opt/awx ; git clone https://github.com/ansible/awx.git
WORKDIR /opt/
