#!/bin/bash
set -xeo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update

apt-get install -y ca-certificates curl

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | tee /etc/apt/sources.list.d/docker.list

apt-get update

apt-get upgrade -y

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Création utilisateur et ajout au groupe sudo/docker
useradd -m -s /bin/bash <NEW_USER>
echo "<NEW_USER>:<NEW_PASS>" | chpasswd
usermod -aG sudo <NEW_USER>
usermod -aG docker <NEW_USER>

# Configuration WSL pour le boot
echo "[user]" > /etc/wsl.conf
echo "default=<NEW_USER>" >> /etc/wsl.conf
echo "[boot]" >> /etc/wsl.conf
echo "systemd=true" >> /etc/wsl.conf

# Nettoyage pour réduire la taille
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
