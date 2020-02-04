FROM alpine:latest
LABEL maintainer="Alexandre Schwartzmann <admin@arcanexus.com>"
RUN apk update && apk upgrade \
  && apk add curl wget git tig bash tree vim openssl openssh nmap \
  && apk add docker-cli docker-compose \
  && curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl \
  && chmod +x /usr/bin/kubectl \
  # && kubectl version --client \
  && pip3 install -U pip ansible \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
  && apk add openrc &&  mkdir /run/openrc && touch /run/openrc/softlevel \
  && syslogd
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]

EXPOSE 22