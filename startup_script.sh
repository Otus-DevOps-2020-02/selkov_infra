#!/bin/bash

#Install ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

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

#Copy Reddit app code to our server
git clone -b monolith https://github.com/express42/reddit.git

#Move to Reddit's directory and install bundle
cd reddit && bundle install

#Start the app server
puma -d
