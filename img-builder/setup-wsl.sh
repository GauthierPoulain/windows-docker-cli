#!/bin/bash

set -x

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y curl sudo

curl https://get.docker.com | sh

if ! getent group docker > /dev/null 2>&1; then
    groupadd docker
fi

useradd -m -s /bin/bash <NEW_USER>
echo "<NEW_USER>:<NEW_PASS>" | chpasswd
usermod -aG sudo <NEW_USER>
usermod -aG docker <NEW_USER>

echo "[user]" > /etc/wsl.conf
echo "default=<NEW_USER>" >> /etc/wsl.conf
echo "[boot]" >> /etc/wsl.conf
echo "systemd=true" >> /etc/wsl.conf

cat /etc/wsl.conf

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
