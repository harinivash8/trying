#!/bin/bash
set -e

# Stop any running container with the same name
echo Stopping existing container if exists...
docker stop twig-tomcat || true
docker rm twig-tomcat || true

# Build and run the Docker container
echo Running the new container...
docker build -t twig-tomcat /home/ec2-user/
docker run -d --name twig-tomcat -p 8080:8080 /home/ec2-user/twig-tomcat:latest
