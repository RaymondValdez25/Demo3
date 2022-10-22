#!/bin/bash

aws s3 cp "s3://raymondsdemo3workbucket/deployment.tar.gz" \
deployment.tar.gz
gunzip deployment.tar.gz
tar -xf deployment.tar
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install --lts
npm install pm2@latest -g
cd ServerSide
pm2 start server.js