# Build the Linuxbrew Docker images
# Written by Shaun Jackman

# The Docker Hub repository
r=sjackman

all: build docker-images.png

clean:
	rm -f \
		$r/linuxbrew \
		$r/linuxbrew-core \
		$r/ubuntu \
		docker-images.png

build: $r/linuxbrew

install-deps:
	brew install docker graphviz

push: all
	docker push $r/ubuntu
	docker push $r/linuxbrew-core
	docker push $r/linuxbrew

.PHONY: all clean install-deps push
.DELETE_ON_ERROR:
.SECONDARY:

# Image dependencies
$r/linuxbrew-core: $r/ubuntu
$r/linuxbrew: $r/linuxbrew-core

$r/stamp:
	mkdir -p $r
	touch $@

$r/%: %/Dockerfile $r/stamp
	docker build -t $r/$* $*
	docker images --no-trunc |awk '$$1=="$@" {print $$3}' >$@

docker-images.png:
	docker images --viz |dot -Tpng -o docker-images.png

index.html: README.md docker-images.png
	pandoc -o $@ $<
