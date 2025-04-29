#!/bin/bash

echo "Stopping existing container if exists..."
docker stop twig-tomcat || true
docker rm twig-tomcat || true

echo "Running the new container..."
cd /home/ec2-user/app || exit 1

docker build -t twig-tomcat .
docker run -d --name twig-tomcat -p 8080:8080 twig-tomcat
