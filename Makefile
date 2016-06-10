# Build Linuxbrew Docker images
# Written by Shaun Jackman

# The Docker Hub repository
u=sjackman

# The tag
t=develop

all: build docker-images.png

clean:
	rm -f */image docker-images.gv docker-images.png

build: linuxbrew/image linuxbrew-gcc/image linuxbrew-standalone/image

install-deps:
	brew install docker graphviz

push: all
	docker push $u/linuxbrew-core:$t
	docker push $u/linuxbrew:$t
	docker push $u/linuxbrew-gcc:$t
	docker push $u/linuxbrew-standalone:$t

.PHONY: all clean install-deps push
.DELETE_ON_ERROR:
.SECONDARY:

# Image dependencies
linuxbrew/image: linuxbrew-core/image
linuxbrew-gcc/image: linuxbrew-core/image
linuxbrew-standalone/image: linuxbrew-gcc/image

%/image: %/Dockerfile
	docker build -t $u/$*:$t $*
	docker images --no-trunc |awk '$$1 ":" $$2 =="$u/$*:$t" {print $$3}' >$@

docker-images.gv:
	docker images --viz >$@

%.png: %.gv
	dot -Tpng -o docker-images.png $<

index.html: README.md docker-images.png
	pandoc -o $@ $<
