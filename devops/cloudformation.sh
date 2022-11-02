#!/bin/sh

if [ "${AWS_ENV}" = "local" ]
then alias sam="samlocal"
fi

sam deploy \
    --profile "${AWS_PROFILE}" \
    --stack-name "${AWS_STACK}" \
    --template-file devops/template.yml \
    --resolve-s3 \
    --capabilities CAPABILITY_IAM \
    --parameter-overrides "AwsEnv=${AWS_ENV} AwsRegion=${AWS_REGION} AwsEndpoint=${AWS_ENDPOINT}"
