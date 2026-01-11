IMAGE_NAME := dotfiles-ubuntu
CONTAINER_NAME := dotfiles-dev-container
DOCKERFILE := Dockerfile.ubuntu

HOST_UID := $(shell id -u)
HOST_GID := $(shell id -g)
# ----------------------------------

GREEN  := $(shell tput -Txterm setaf 2)
RESET  := $(shell tput -Txterm sgr0)

.PHONY: help build run clean

help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${GREEN}make build${RESET}   Build the base Docker image'
	@echo '  ${GREEN}make run${RESET}     Run the container with your local dotfiles mounted'
	@echo '  ${GREEN}make clean${RESET}   Remove the Docker image'
	@echo ''

build:
	# --- NEW: Pass arguments to build command ---
	docker build \
		--build-arg HOST_UID=$(HOST_UID) \
		--build-arg HOST_GID=$(HOST_GID) \
		-t $(IMAGE_NAME) -f $(DOCKERFILE) .

run:
	docker run -it --rm \
		--name $(CONTAINER_NAME) \
		-v "$(PWD):/home/jaysh/dotfiles" \
		-v "$(HOME)/.ssh:/mnt/host-ssh:ro" \
		-v "$(HOME)/.gnupg:/mnt/host-gpg:ro" \
		-w /home/jaysh/dotfiles \
		$(IMAGE_NAME)

clean: ## Remove the image
	docker rmi $(IMAGE_NAME)
