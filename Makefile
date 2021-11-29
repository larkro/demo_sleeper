image: ## docker build the image
	docker build -t lakr/demo_sleeper:0.1 .

run: ## docker run the demo
	docker run lakr/demo_sleeper:0.1

docker: image run

local: ## Run the demo on the host system
	./demo_sleeper.rb

scale: ## Run 5 instances
	docker-compose up --remove-orphans --scale=demo=5

all: image run scale local

# Yes, I think all code should be linted
lint: ## Run standardrb on Ruby, hadolint on Dockerfile
	standardrb demo_sleeper.rb
	docker run --rm -i hadolint/hadolint < Dockerfile
	make -n all
# could even do 
# $ make -n all lint
# to lint the lint step

help:  ## Display this output.
	@egrep '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: clean help lint all scale local docker run image
.DEFAULT_GOAL := help
