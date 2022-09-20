#!/bin/bash

sudo yum update -y                             # To update all packages
sudo amazon-linux-extras install docker -y    # To install docker latest version
sudo service docker start                      # To start docker service
sudo service docker status                     # To check status of docker service. If it's running or not.
sudo systemctl enable docker                   # To ensure that docker service start after each reboot 
sudo docker run --restart=on-failure:10 -d -p 9000:9000 --name sonarqube sonarqube
