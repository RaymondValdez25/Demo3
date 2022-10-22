#!/bin/bash        
        
publicIP=$(aws ec2 describe-instances \
--region us-east-2 \
--instance-ids \
--query Reservations[].Instances[].PublicIpAddress \
--filters "Name=tag:Name,Values=Test_Quote_Server" \
--output=text)
sleep 120
curl http://$publicIP:3000/search?search_string=graves
