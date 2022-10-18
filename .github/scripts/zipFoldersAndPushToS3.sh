#!/bin/bash
pwd
tar -cvf deployment.tar data serverSide
gzip deployment.tar
aws s3 --dryrun cp deployment.tar.gz\
 "s3://raymondsdemo3workbucket/deployment.tar.gz"
