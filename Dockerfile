FROM centos:centos8
MAINTAINER Alexandre Schwartzmann <schwartzmann.a@gmail.com>
ADD k8s.repo /etc/yum.repos.d/k8s.repo
RUN yum install -y epel-release && yum install -y dnf-plugins-core tig && yum clean all && \
    dnf clean all && \
    dnf -y install 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled PowerTools && \
    dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm && \
    dnf -y install git vim tree wget curl unzip jq && \
    dnf -y install python2-pip python3-pip && \
    dnf -y install kubelet kubeadm kubectl --disableexcludes=kubernetes && \
    dnf -y install docker-ce # --nobest
RUN systemctl disable firewalld
RUN pip3 install --upgrade pip ; pip3 install ansible docker-py j2cli docker-compose
RUN pip2 install --upgrade pip ; pip3 install ansible
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
RUN alias pip='pip2' && alias python='python2'
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]

EXPOSE 22