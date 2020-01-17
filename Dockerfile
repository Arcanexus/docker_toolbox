FROM centos:centos8
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>
RUN yum install -y epel-release && yum install -y dnf-plugins-core && yum clean all && \
    dnf clean all && \
    # dnf config-manager --set-enabled PowerTools && \
    dnf -y install git tig vim tree wget curl cntlm unzip jq \
    dnf -y install python-pip python3-pip \
    dnf -y install docker docker-compose \
    dnf -y install kubernetes-client 
RUN pip3 install --upgrade pip ; pip3 install ansible docker-py j2cli
RUN pip install --upgrade pip ; pip3 install ansible
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]

EXPOSE 22