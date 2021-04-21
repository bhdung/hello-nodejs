#!/bin/bash

container_name='app-nodejs-demo'
exits=$(docker ps -a | grep $container_name 2>/dev/null)

if [ ! "${exits}" ]; then
  docker image prune -a -f
  docker run -td --restart unless-stopped --name $container_name -p 3000:3000 hdung1091/hello-nodejs:latest
  
else
  docker stop $container_name && docker rm $container_name
  docker image prune -a -f
  docker run -td --restart unless-stopped --name $container_name -p 3000:3000 hdung1091/hello-nodejs:latest  
fi