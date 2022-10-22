#!/bin/bash  
        
publicIP=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].InstanceId \
--filters Name=tag:Name,Values=Test_Quote_Server Name=instance-state-name,Values=running,pending \
--output=text)
#sleep 120

echo echoing IPs $publicIP

#curl http://$publicIP:3000/search?search_string=graves



aws ec2 describe-instances \
    --filters Name=instance-type,Values=t2.micro,t3.micro Name=availability-zone,Values=us-east-2c