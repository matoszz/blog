.PHONY: build run build-run

build: # build the local image
	@docker build --no-cache -t mkdocs:local .

run: # server it up on localhost
	@docker run --rm -it -p 8000:80 -v ${PWD}:/docs mkdocs:local

build-run: # build + run
	@docker build --no-cache -t mkdocs:local .
	@docker run --rm -it -p 8000:80 -v ${PWD}:/docs mkdocs:local
