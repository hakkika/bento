#!/bin/sh -eux

# Install what ever Platform team's developer environment requires

# Docker CE
# Docker Compose

# Chromium Browser
# XFCE Desktop (xubuntu-desktop)
# IntelliJ Idea (snap install)
# Oracle Java


export DEBIAN_FRONTEND=noninteractive

apt-get install -y xubuntu-core^ xfce4-taskmanager xfce4-systemload-plugin gedit xarchiver chromium-browser wget curl firefox git unzip libpython2.7

add-apt-repository -y ppa:webupd8team/atom
apt-get update
apt-get -y install atom

add-apt-repository -y ppa:webupd8team/java
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java8-installer
apt-get -y install maven

# Install Docker CE
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get -y install docker-ce
systemctl enable docker
usermod -aG docker vagrant


snap install intellij-idea-community --classic --stable
