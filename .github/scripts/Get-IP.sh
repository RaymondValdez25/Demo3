#!/bin/bash  

sleep 120     
publicIP=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].PublicIpAddress  \
--filters Name=tag:Name,Values=Test_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)


echo "EC2_PUBLIC_IP=$publicIP" >> $GITHUB_ENV