#!/bin/bash  

EC2_ID=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters Name=tag:Name,Values=Prod_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)

echo "EC2_INSTANCE_ID=$EC2_ID" >> $GITHUB_ENV

aws ec2 modify-instance-attribute \
--instance-id $EC2_ID \
--groups sg-0329da65af5ecbc8b


