#!/bin/sh

set -e

aws_sam=$([ "$1" = "local" ] && echo "samlocal" || "sam")
aws_profile=$([ ! -z "$DEFAULT_PROFILE" ] && echo "--profile $DEFAULT_PROFILE")

echo "Deploying stack to $1"

$aws_sam deploy $aws_profile \
    --resolve-s3 \
    --force-upload \
    --stack-name $DEFAULT_STACK \
    --template-file cloudformation/stack.yml
