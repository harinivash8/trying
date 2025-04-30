#!/bin/bash

# Stop any running container
docker stop twig-app || true
docker rm twig-app || true

# Run the new container with X11 forwarding
docker run -d \
  --name twig-app \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  twig-app
