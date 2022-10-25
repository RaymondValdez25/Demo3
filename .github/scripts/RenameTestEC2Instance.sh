#!/bin/bash

EC2_ID=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters Name=tag:Name,Values=Test_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)


echo EC2_ID
aws ec2 create-tags --resources $EC2_ID --tag "Key=Name,Value=Prod_Quote_Server"