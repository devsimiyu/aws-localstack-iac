include .env
export

deploy:
	sh cloudformation/deploy.sh "${e}"

healthcheck:
	sh cloudformation/health.sh "${e}"
