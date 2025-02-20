include .env

.PHONY: help
help: ## Show the help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: download-verapdf
download-verapdf:
	rm -rf verapdf
	docker run -d --rm --name verapdf ghcr.io/verapdf/cli:$(VERAPDF_VERSION)
	docker cp verapdf:/opt/verapdf/ verapdf
	docker kill verapdf

.PHONY: build
build: ## Build the Docker image
	docker build \
	-t $(DOCKER_REGISTRY)/$(DOCKER_REPOSITORY):snapshot \
	-f Dockerfile .