#!/usr/bin/env sh
runsvdir /etc/service &
usermod -aG sudo $HOME_USER
echo "$HOME_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/init-users
echo 'PermitRootLogin no' > /etc/ssh/sshd_config.d/my_sshd.conf
if [ -x "/home/$HOME_USER/.boot_" ]; then
    mkdir -p /etc/service/init && ln -sf "/home/$HOME_USER/.boot_" /etc/service/init/run
fi

exec "$@"