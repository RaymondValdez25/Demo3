#!/bin/bash
Instances=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId  \
--filters Name=tag:Name,Values=Test_Quote_Server Name=instance-state-name,Values=running,pending,stopped,stopping \
--output=text)

if [ x"${Instances}" == "x" ]; then
     echo "No value found for the variable"
  else
     echo "Value found for the variable $Instances"
     aws ec2 terminate-instances --instance-ids $Instances
  fi