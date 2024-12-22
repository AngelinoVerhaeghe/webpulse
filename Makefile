.PHONY: help up stop down orphans recreate

# Run `make help` to see an overview of all commands/utilities

## —— 🐝 Utilities ——————————————————————————————————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' \
		| sed -e 's/\[32m##/[33m/'

## —— 🐳 Docker —————————————————————————————————————————————————————————————————
up:	## Run the project, including all docker containers
	docker-compose -f ./docker/compose.yml up -d

stop:	## Stop the project, the docker containers won't be removed
	docker-compose -f ./docker/compose.yml stop

down:	## Stop the project, the docker containers *will* be removed
	docker-compose -f ./docker/compose.yml down

orphans: ## Remove all docker containers that are not in use
	docker-compose -f ./docker/compose.yml up -d --remove-orphans

recreate: ## Recreate the project, including all docker containers
	docker-compose -f ./docker/compose.yml up -d --force-recreate
