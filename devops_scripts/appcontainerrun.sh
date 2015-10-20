#!/bin/bash

cp /tmp/Dockerfile Dockerfile
sed -i "s/APPVER/$APP_VERSION/g" Dockerfile
docker build -t jenkins_img:${BUILD_NUMBER} .
docker tag jenkins_img:${BUILD_NUMBER} localhost:5000/jenkins_img:${BUILD_NUMBER}
docker push localhost:5000/jenkins_img:${BUILD_NUMBER}
docker stop APP1
docker rm APP1
docker run -p 8889:8080 -d --name APP1 localhost:5000/jenkins_img:${BUILD_NUMBER}
docker stop APP2
docker rm APP2
docker run -p 8888:8080 -d --name APP2 localhost:5000/jenkins_img:${BUILD_NUMBER}
## commit new image
## tag new image
## push new image
