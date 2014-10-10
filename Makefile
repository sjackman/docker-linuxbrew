# Build the Linuxbrew Docker images
# Written by Shaun Jackman

r=sjackman

all: $r/linuxbrew

clean:
	rm -f $r/linuxbrew $r/linuxbrew-core

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

$r/stamp:
	mkdir -p $r
	touch $@

$r/linuxbrew: $r/linuxbrew-core

$r/%: %/Dockerfile $r/stamp
	docker build -t $r/$* $*
	docker images --no-trunc |awk '$$1=="$@" {print $$3}' >$@
