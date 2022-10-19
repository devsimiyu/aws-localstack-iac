aws_endpoint=$([ "$1" == "local" ] && echo "--endpoint-url http://localhost:$LOCALSTACK_SERVICE_PORT")

echo "Deploying stack to $1"

aws cloudformation deploy \
    $aws_endpoint \
    --stack-name intacct-utilization \
    --template-file cloudformation/stack.yml \
    --parameter-overrides file://cloudformation/parameters.json
