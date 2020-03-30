#!/bin/bash

#Create VM
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image=reddit-full-1585568729 \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure

gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server
