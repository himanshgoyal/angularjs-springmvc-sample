#!/bin/bash

APP_VERSION="$1"
sed -i "s/APPVER/$APP_VERSION/g" Dockerfile
docker build -t jenkins_img:${APP_VERSION} .
docker tag jenkins_img:${APP_VERSION} localhost:5000/jenkins_img:${APP_VERSION}
docker push localhost:5000/jenkins_img:${APP_VERSION}
docker stop APP1
docker rm APP1
docker run -p 8889:8080 -d --name APP1 localhost:5000/jenkins_img:${APP_VERSION}
