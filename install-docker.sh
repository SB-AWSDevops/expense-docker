#!/bin/bash

R="\e[31m"
N="\e[0m"

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable Docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index again to include the Docker repository
sudo apt-get update

# Install Docker CE (Community Edition)
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Optionally, add your user to the docker group to run Docker commands without sudo
sudo usermod -aG docker ec2-user

#to get the changes apply to the user, logout and login again
echo -e "$R LOGOUT and LOGIN again $N"

# Verify Docker installation by running a hello-world container
sudo docker run hello-world
