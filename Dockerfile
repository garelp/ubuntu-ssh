# ------------------------
# SSH Server support
# ------------------------
ARG UBUNTU_VERSION=bionic
FROM ubuntu:$UBUNTU_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server iproute2 net-tools dnsutils netcat curl iputils-tracepath iputils-ping wget lftp tcpdump ca-certificates \
    && mkdir -p /opt/startup \
    && echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init_container.sh /opt/startup
RUN chmod 755 /opt/startup/init_container.sh

EXPOSE 2222

ENTRYPOINT ["/opt/startup/init_container.sh"]

