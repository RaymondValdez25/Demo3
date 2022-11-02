#!/bin/bash

aws s3 cp "s3://raymondsdemo3workbucket/deployment.tar.gz" \
deployment.tar.gz
gunzip deployment.tar.gz
tar -xf deployment.tar
export PATH=$PATH:"/home/ec2-user/.nvm/versions/node/v16.17.0/bin"
cd ServerSide
pm2 start server.js
