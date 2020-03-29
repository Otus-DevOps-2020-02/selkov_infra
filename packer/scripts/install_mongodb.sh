#!/bin/bash
set -e

#Add keys and repo for MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list

#Update packs and install mongodb-org
apt update
apt install -y mongodb-org

#Start MongoDB
systemctl start mongod

#Add to autorun
systemctl enable mongod
