#!/bin/bash
cd /home/ec2-user
docker load -i twig-app.tar
docker run -d --name twig-app -p 8080:8080 twig-app
