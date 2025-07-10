#!/bin/bash

# superuser uses yum package manager to update all installed packages
# and answer yes to any encountering question.
sudo yum update -y

# Install git
sudo yum install git -y
git —version

# Clone evershop repo
git clone https://github.com/TheMetaSetter/evershop-sysops.git

# Enable and install Docker
sudo amazon-linux-extras install docker -y

# Start Docker
sudo systemctl start docker

# Enable Docker on boot
sudo systemctl enable docker

# Allow the ec2-user to run Docker
sudo usermod -aG docker ec2-user

# Log out of your SSH session and log back in
newgrp docker

# Verify everything works
docker version

# Download the standalone docker-compose binary
sudo curl -L \
  https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose