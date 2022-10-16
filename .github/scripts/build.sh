#!/bin/bash
# AMI for AWS LINUX in the us-east-2 region
#export AWS_LINUX_AMI="ami-0ca622d21decca9ad"
# Name of a key pair I will use to log in
#export MY_KEY_PAIR="PuTTYKeyPair1"
# Public subnet in my VPC in us-east-2 region
#export MY_PUBLIC_SUBNET="subnet-080c245137fc1dbc8"
# Security group for that VPC providing port 22 and 3000 access
#export MY_SECURITY_GROUP="sg-0cddccc77ca099d24"
#Remove the dryrun flag when everything seems to be ready
#aws --region us-east-2 ec2 run-instances \
# --dry-run \
# --image-id $AWS_LINUX_AMI --count 1 \
# --instance-type t2.micro \
# --subnet-id $MY_PUBLIC_SUBNET \
# --security-group-ids $MY_SECURITY_GROUP \
# --key-name $MY_KEY_PAIR
echo hello world