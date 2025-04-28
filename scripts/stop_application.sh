#!/bin/bash
# Stop the running container
docker stop tomcat-app || true
docker rm tomcat-app || true
