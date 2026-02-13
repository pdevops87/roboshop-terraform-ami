# Makefile
.PHONY: help git dev-apply

help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_-]+:.*##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

git: ## Pull latest code from git repo
	git pull

dev-apply: ## Terraform init & apply for dev environment
	terraform init
	terraform apply -auto-approve

dev-destroy: ## Terraform init & destroy for dev environment and to prevent destroy from a state list
	terraform init
	terraform state rm aws_ami.ami
	terraform destroy -auto-approve
