#!/bin/sh

if [ "${AWS_ENV}" = "local" ]
then alias sam="samlocal"
fi

case "$1" in

  validate)

    sam validate \
      --template-file .devops/template.yaml \
      --profile $AWS_PROFILE

    ;;

  deploy)

    GatewayFunctionECR=$(echo $(aws ecr describe-repositories --profile "${AWS_PROFILE}" --repository-names "${AWS_STACK}-gateway-function-ecr" --query 'repositories[0].repositoryUri' || aws ecr create-repository --profile "${AWS_PROFILE}" --repository-name "${AWS_STACK}-gateway-function-ecr" --query 'repository.repositoryUri') | tr -d '"')

    sam sync \
      --profile $AWS_PROFILE \
      --stack-name $AWS_STACK \
      --template-file .devops/template.yaml \
      --image-repositories GatewayFunction=$GatewayFunctionECR \
      --capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM CAPABILITY_IAM \
      --parameter-overrides "AwsEnv=${AWS_ENV} AwsRegion=${AWS_REGION} AwsEndpoint=${AWS_ENDPOINT}"

    rm -rf .aws-sam

    ;;

  destroy)

    sam delete \
      --stack-name $AWS_STACK \
      --profile $AWS_PROFILE

    ;;

  *)

    echo "Unknown option :("
    exit 1

    ;;

esac
