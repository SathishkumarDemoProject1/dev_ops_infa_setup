#!/bin/bash

sudo yum update -y                             # To update all packages
sudo amazon-linux-extras install java-openjdk11 -y
sudo amazon-linux-extras install docker -y    # To install docker latest version
sudo service docker start                      # To start docker service
sudo service docker status                     # To check status of docker service. If it's running or not.
sudo systemctl enable docker                   # To ensure that docker service start after each reboot 
sudo usermod -a -G docker ec2-user             # To add ec2-user to docker group
sudo chmod 666 /var/run/docker.sock
sudo yum install git