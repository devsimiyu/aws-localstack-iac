include .env
export

local:
	sh cloudformation/deploy.sh "local"

prod:
	sh cloudformation/deploy.sh "prod"

healthcheck:
	sh cloudformation/health.sh "${e}"
