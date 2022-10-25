#!/bin/bash  

EC2_INSTANCE_ID=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters Name=tag:Name,Values=${Environment}_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)

echo $EC2_INSTANCE_ID
echo "EC2_INSTANCE_ID=$EC2_INSTANCE_ID" >> $GITHUB_ENV
