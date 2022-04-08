# export IMG_NAME          := swiftmr/addon/frontend
# export IMG_REGISTRY      := 489983749905.dkr.ecr.ap-northeast-2.amazonaws.com
# export DOCKER_BUILDKIT   := 1
# export BUILDKIT_PROGRESS := plain

.DEFAULT_GOAL := help

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: start
start: ## build & start
	./scripts/start.sh

.PHONY: publish
publish: ## publish
	./scripts/publish.sh
