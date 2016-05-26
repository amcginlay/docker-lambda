#!/bin/bash

IMAGE_NAME=lambci/lambda-base

curl http://lambci.s3.amazonaws.com/fs/nodejs4.3.tgz | gzip -d | docker import - $IMAGE_NAME

curl http://lambci.s3.amazonaws.com/fs/nodejs.tgz -o ../nodejs/run/nodejs.tgz
cp ../nodejs/run/nodejs.tgz ../nodejs/build/

curl http://lambci.s3.amazonaws.com/fs/python2.7.tgz -o ../python2.7/run/python2.7.tgz
cp ../python2.7/run/python2.7.tgz ../python2.7/build/

echo "Sandbox user is: $(docker run $IMAGE_NAME stat -c '%U' /tmp)"

