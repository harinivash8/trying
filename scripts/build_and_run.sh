#!/bin/bash

cd /home/ec2-user/twig-app

# Stop existing container
docker stop twig-app || true
docker rm twig-app || true

# Build and run
docker build -t twig-app .
docker run -d --name twig-app twig-app
