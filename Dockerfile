FROM ubuntu:22.04

ENV TZ=Asia/Shanghai \
    HOME_USER=ubuntu \
    HOME_PASSWORD=!23465 \
    CDN_NAME=itxx

COPY entrypoint.sh /entrypoint.sh
COPY reboot.sh /usr/local/sbin/reboot
COPY deamon.sh /usr/local/sbin/deamon
COPY mesh /usr/local/sbin/tunx

RUN useradd -m -s /bin/bash "$HOME_USER" && \
    echo "$HOME_USER:$HOME_PASSWORD" | chpasswd

RUN mkdir -p /etc/service/sshd && \
    echo '#!/bin/sh' > /etc/service/sshd/run && \
    echo 'sleep 1' >> /etc/service/sshd/run && \
    echo 'exec /usr/sbin/sshd -D 2>&1' >> /etc/service/sshd/run && \
    chmod +x /etc/service/sshd/run

RUN mkdir -p /etc/service/tunx && \
    echo '#!/bin/sh' > /etc/service/tunx/run && \
    echo 'sleep 1' >> /etc/service/tunx/run && \
    echo 'exec tunx -cdn-itai $CDN_NAME 2>&1' >> /etc/service/tunx/run && \
    chmod +x /etc/service/tunx/run

RUN echo '#!/bin/sh' > /home/$HOME_USER/.boot_ && \
    echo 'exit 0' >> /home/$HOME_USER/.boot_ && \
    chmod -x /home/$HOME_USER/.boot_

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y tzdata openssh-server sudo tini curl ca-certificates wget vim net-tools supervisor runit cron unzip iputils-ping telnet git iproute2 --no-install-recommends; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir /var/run/sshd; \
    chmod +x /entrypoint.sh; \
    chmod +x /usr/local/sbin/reboot; \
    chmod +x /usr/local/sbin/deamon; \
    chmod +x /usr/local/sbin/tunx; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime; \
    echo $TZ > /etc/timezone

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
