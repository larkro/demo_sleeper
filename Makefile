build:
	docker build -t lakr/demo_sleeper:0.1 .

run:
	docker run lakr/demo_sleeper:0.1

docker: build run

local:
	./demo_sleeper.rb

scale:
	docker-compose up --remove-orphans --scale=demo=5

all: build run scale local

# Yes, I think all code should be linted
lint:
	standardrb demo_sleeper.rb
	docker run --rm -i hadolint/hadolint < Dockerfile
	make -n all
# could even do 
# $ make -n all lint
# to lint the lint step
