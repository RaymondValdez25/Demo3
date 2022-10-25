#!/bin/bash  

Instance_ID=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters Name=tag:Name,Values=Prod_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)

echo $Instance_ID
echo "Instance_ID=$Instance_ID" >> $GITHUB_ENV
