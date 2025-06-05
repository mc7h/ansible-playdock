.PHONY: help

local_image=mc7h/ansible-playdock:latest

help:
	@echo "Usage: make <command>"
	@grep -E '^[a-zA-Z0-9_-]+:([^=]|$$)' Makefile | \
		grep -v '^\.' | \
		awk -F: '{printf "  \033[1;32m%-20s\033[0m %s\n", $$1, $$2}'

docker-build:
	docker build -t $(local_image) .

docker-serve:
	docker run \
		-d \
  		--name ansible-playdock \
  		-p 2222:22 \
		$(local_image)

# Install Ansible collection requirements
galaxy:
	ansible-galaxy install -r requirements.yml

# Run ansible-lint (this is expected to fail)
lint:
	ansible-lint --profile min main.yaml

# Run playbook against Docker (requires sshpass)
run:
	ansible-playbook main.yaml -i hosts --limit container

# Stop and remove the Docker container
clean:
	docker stop ansible-playdock || true
	docker rm ansible-playdock || true
