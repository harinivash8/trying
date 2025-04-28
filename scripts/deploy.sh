#!/bin/bash

# Stop and remove any running containers
docker stop twig-tomcat || true
docker rm twig-tomcat || true

# Pull the new Docker image from Docker Hub
docker pull mydockerhubusername/twig-tomcat:latest

# Run the Docker container with Tomcat serving the WAR file
docker run -d -p 8080:8080 --name twig-tomcat mydockerhubusername/twig-tomcat:latest
