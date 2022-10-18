#!/bin/bash

aws s3 cp "s3://raymondsdemo3workbucket/deployment.tar.gz" \
deployment.tar.gz
gunzip deployment.tar.gz
tar -xf deployment.tar
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"
npm install pm2@latest -g
cd ServerSide
pm2 start server.js
