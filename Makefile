include .env
export

localstack:
	docker compose up -d procore-intacct-localstack

deploy:
	sh devops/cloudformation.sh

package:
	sh devops/cloudformation.sh "package"

sync:
	sam sync --stack-name $(AWS_STACK) --watch
