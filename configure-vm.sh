#!/bin/sh

# Get Geth+IBFT source code
git clone https://github.com/getamis/go-ethereum.git geth
cd geth
git checkout c7547381b2ea8999e423970d619835c662176790
cd ..

# Get utilities for creating an Ethereum wallet
git clone https://github.com/vkobel/ethereum-generate-wallet.git

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

# Install docker-compose completion and alias
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
