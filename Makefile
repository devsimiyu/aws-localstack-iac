include .env
export

localstack:
	docker compose up -d procore-intacct-localstack

deploy: validate
	sh .devops/stack.sh "deploy"

validate:
	sh .devops/stack.sh "validate"

destroy:
	sh .devops/stack.sh "destroy"