# Build Linuxbrew Docker images
# Written by Shaun Jackman

# The Docker Hub repository
r=sjackman/linuxbrew

all: build docker-images.png

clean:
	rm -f */image docker-images.png

build: latest/image standalone/image

install-deps:
	brew install docker graphviz

push: all
	docker push $r:ubuntu
	docker push $r:core
	docker push $r:latest
	docker push $r:standalone

.PHONY: all clean install-deps push
.DELETE_ON_ERROR:
.SECONDARY:

# Image dependencies
core/image: ubuntu/image
latest/image: core/image
standalone/image: core/image

%/image: %/Dockerfile
	docker build -t $r:$* $*
	docker images --no-trunc |awk '$$1=="$@" {print $$3}' >$@

docker-images.png:
	docker images --viz |dot -Tpng -o docker-images.png

index.html: README.md docker-images.png
	pandoc -o $@ $<
