#Get the public IP of the instance
PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

if [ -z "$PUBLIC_IP" ]; then
  echo "Error: Failed to retrieve the public IP address for instance $INSTANCE_ID."
  exit 1
fi

# Step 7: Check if the Route 53 record already exists with the same IP
EXISTING_IP=$(aws route53 list-resource-record-sets \
  --hosted-zone-id "$HOSTED_ZONE_ID" \
  --query "ResourceRecordSets[?Name=='$RECORD_NAME'].ResourceRecords[0].Value" \
  --output text)

if [ "$EXISTING_IP" == "$PUBLIC_IP" ]; then
  echo "DNS record for $RECORD_NAME already points to the correct IP ($PUBLIC_IP). No update needed."
else
  # Update the Route 53 record
  echo "Updating DNS record $RECORD_NAME to point to $PUBLIC_IP..."
  aws route53 change-resource-record-sets \
    --hosted-zone-id "$HOSTED_ZONE_ID" \
    --change-batch "{
        \"Changes\": [{
            \"Action\": \"UPSERT\",
            \"ResourceRecordSet\": {
                \"Name\": \"$RECORD_NAME\",
                \"Type\": \"A\",
                \"TTL\": 60,
                \"ResourceRecords\": [{\"Value\": \"$PUBLIC_IP\"}]
            }
        }]}"
  echo "DNS record $RECORD_NAME updated to IP: $PUBLIC_IP"
fi

echo "Instance $INSTANCE_ID with IP $PUBLIC_IP is ready and DNS record updated." 
explain this script easily understanbale. what is the use of it
