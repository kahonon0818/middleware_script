#!/bin/bash

# Check if Docker is already installed
if command -v docker &>/dev/null; then
    echo "Docker is already installed."
    exit 0
fi

# Install required dependencies
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Update package cache and install Docker
sudo yum update -y
sudo yum install -y docker-ce

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the Docker group to run Docker without sudo
sudo usermod -aG docker $(whoami)

echo "Docker has been successfully installed."
