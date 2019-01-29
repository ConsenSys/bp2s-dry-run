#!/bin/sh

# Install docker
sudo apt-get -y remove docker docker-engine docker.io
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
sudo su - $USER

# Install docker-compose completion and alias
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

while true; do
    read -p "Do you wish to add alias doco=docker-compose? [y/n]" yn
    case $yn in
        [Yy]* ) echo -e '\nalias doco=docker-compose\ncomplete -F _docker_compose doco' >> ~/.bashrc; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
