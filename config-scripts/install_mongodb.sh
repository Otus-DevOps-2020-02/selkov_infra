#!/bin/bash
#Add keys and repo for MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'

#Update packs and install mongodb-org
sudo apt update
sudo apt install -y mongodb-org

#Start MongoDB
sudo systemctl start mongod

#Add to autorun
sudo systemctl enable mongod

#Show status
sudo systemctl status mongod
