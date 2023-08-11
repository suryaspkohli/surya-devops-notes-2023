#!/bin/bash
sudo yum update

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce-20.10.7 docker-ce-cli-20.10.7 containerd.io

sudo systemctl start docker 

sudo systemctl enable docker

docker version

echo " dcoker 20 is installed in your system"

