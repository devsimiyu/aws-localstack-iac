aws_endpoint=$([ "$1" == "local" ] && echo "--endpoint-url http://localhost:$LOCALSTACK_SERVICE_PORT")

echo "Health check on $1"

aws $aws_endpoint lambda list-functions
aws $aws_endpoint s3api list-buckets
aws $aws_endpoint cloudformation list-stacks
