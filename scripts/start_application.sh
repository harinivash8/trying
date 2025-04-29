#!/bin/bash
# Build and start the container locally
cd /home/ec2-user/trying
docker build -t tomcat-app .
docker run -d -p 8080:8080 --name tomcat-app tomcat-app
