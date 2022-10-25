#!/bin/bash  

publicIP=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].PublicIpAddress  \
--filters Name=tag:Name,Values=${Environment}_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)

echo $publicIP
echo "EC2_PUBLIC_IP=$publicIP" >> $GITHUB_ENV