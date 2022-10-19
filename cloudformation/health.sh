aws_endpoint=$([ "$1" == "local" ] && echo "--endpoint-url http://localhost:$LOCALSTACK_SERVICE_PORT")
aws_profile=$([ ! -z "$AWS_PROFILE" ] && echo "--profile $AWS_PROFILE")

echo "Health check on $1"

aws $aws_endpoint $aws_profile lambda list-functions
aws $aws_endpoint $aws_profile cloudformation list-stacks
