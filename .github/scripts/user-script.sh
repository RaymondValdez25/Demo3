#!/bin/bash

aws s3 cp "s3://raymondsdemo3workbucket/deployment.tar.gz" \
deployment.tar.gz
gunzip deployment.tar.gz
tar -xf deployment.tar
npm install pm2@latest -g
cd ServerSide
pm2 start server.js
