#!/bin/bash

#Install ruby
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

#Show result
ruby -v
bundler -v
