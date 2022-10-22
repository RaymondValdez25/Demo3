#!/bin/bash
# AMI for AWS LINUX in the us-east-2 region
export AWS_LINUX_AMI="ami-0ca622d21decca9ad"
# Name of a key pair I will use to log in
export MY_KEY_PAIR="PuTTYKeyPair1"
# Public subnet in my VPC in us-east-2 region
export MY_PUBLIC_SUBNET="subnet-080c245137fc1dbc8"
# Security group for that VPC providing port 22 and 3000 access
export MY_SECURITY_GROUP="sg-0329da65af5ecbc8b"
#my instance name
export TAGS="ResourceType=instance,Tags=[{Key=Name,Value=Prod_Quote_Server}]"
#instance profile
#export IAM_PROFILE="RaymondValdez"
#ARN
export ARN_NAME="AmazonS3FullAccess"

echo $AWS_LINUX_AMI
echo $MY_PUBLIC_SUBNET
echo $MY_SECURITY_GROUP
echo $MY_KEY_PAIR
 
#Remove the dryrun flag when everything seems to be ready
aws --region us-east-2 ec2 run-instances \
 --image-id $AWS_LINUX_AMI --count 1 \
 --instance-type t2.micro \
 --subnet-id $MY_PUBLIC_SUBNET \
 --security-group-ids $MY_SECURITY_GROUP \
 --key-name $MY_KEY_PAIR \
 --tag-specifications $TAGS \
 --user-data file://.github/scripts/User-Script.sh \
 --iam-instance-profile Name=$ARN_NAME
