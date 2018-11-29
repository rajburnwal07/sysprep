#!/bin/bash

echo "System Preparation"

echo "Installing Ansible...."
echo Install pre-requisite packages
sudo yum check-update; sudo yum install -y gcc libffi-devel python-devel openssl-devel epel-release
sudo yum install -y python-pip python-wheel

echo "Install Ansible and Azure SDKs via pip"
sudo pip install ansible[azure]

sudo yum install -y git unzip sshpass 

echo "Installing docker"
sudo yum install -y docker
sudo systemctl enable docker && systemctl start docker

sudo yum install -y java

echo "Build Jenkins Docker Image"
sudo docker build -f Jenkins/Dockerfile -t cmpjenkins:latest Jenkins/.
sudo docker run -itd -p 8282:8080 -p 50001:50000 -v jenkins-data:/var/jenkins_home --name=jenkins-cmp cmpjenkins