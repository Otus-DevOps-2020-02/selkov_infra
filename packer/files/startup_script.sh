#!/bin/bash

#Install ruby
apt update
apt install -y ruby-full ruby-bundler build-essential

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

#Copy Reddit app code to our server
git clone -b monolith https://github.com/express42/reddit.git

#Move to Reddit's directory and install bundle
cd reddit && bundle install

#Start the app server
#puma -d

#Start the app using systemd unit
sudo cp /home/appuser/reddit.service /etc/systemd/system/
sudo systemctl enable reddit.service
sudo systemctl start reddit.service
