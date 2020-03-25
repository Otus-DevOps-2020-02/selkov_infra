#!/bin/bash

#Copy Reddit app code to our server
git clone -b monolith https://github.com/express42/reddit.git

#Move to Reddit's directory and install bundle
cd reddit && bundle install

#Start the app server
puma -d

#Show listening port the app server
ps aux | grep puma
