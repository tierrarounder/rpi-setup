#! /bin/bash
#
# script to install docker, docker-compose, portainer on raspberry pi 4
#
sudo apt update && sudo apt upgrade
#
# Docker CE for Linux installation script
#
# See https://docs.docker.com/engine/install/ for the installation steps.
#
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker version
#
# install docker-compose
# https://jfrog.com/connect/post/install-docker-compose-on-raspberry-pi/
#
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
docker-compose version
#
# install portainer
# https://pimylifeup.com/raspberry-pi-portainer/
#
sudo docker pull portainer/portainer-ce:latest
sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
#
# check status
#
sudo docker ps
systemctl status docker
echo --sudo systemctl enable Docker-- if necessary
