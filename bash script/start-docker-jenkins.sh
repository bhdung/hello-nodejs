#!/usr/bin/env bash
mkdir -p /home/jenkins/data
cd /home/jenkins
docker run --restart unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) -v /home/jenkins/data:/var/jenkins_home  -p 8080:8080  --user 1000:999 --name jenkins-server -d jenkins/jenkins:lts