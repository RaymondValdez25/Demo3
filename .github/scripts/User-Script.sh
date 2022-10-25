#!/bin/bash

aws s3 cp "s3://raymondsdemo3workbucket/deployment.tar.gz" \
deployment.tar.gz
gunzip deployment.tar.gz
tar -xf deployment.tar
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
. ~/.nvm/nvm.sh
nvm install --lts
nvm use --delete-prefix v18.12.0
node -e "console.log('Running Node.js ' + process.version)"
npm install pm2@latest -g
cd ServerSide
pm2 start server.js
