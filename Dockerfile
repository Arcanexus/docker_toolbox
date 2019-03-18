FROM centos:centos7
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip \
    yum -y install docker docker-compose \
    yum -y install kubelet kubeadm kubectl 
RUN pip install ansible docker-py 
