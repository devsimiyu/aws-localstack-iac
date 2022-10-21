#!/bin/sh

set -e

aws_endpoint=$([ "$1" = "local" ] && echo "--endpoint-url http://localhost:4566")
aws_profile=$([ ! -z "$DEFAULT_PROFILE" ] && echo "--profile $DEFAULT_PROFILE")

echo "Health check on $1"

aws $aws_endpoint $aws_profile lambda list-functions
aws $aws_endpoint $aws_profile cloudformation list-stacks
aws $aws_endpoint $aws_profile apigateway get-rest-apis
