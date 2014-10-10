all: linuxbrew/stamp

clean:
	rm -f linuxbrew-core/stamp linuxbrew/stamp

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

linuxbrew/stamp: linuxbrew-core/stamp

%/stamp: %/Dockerfile
	docker build -t sjackman/$* $*
	touch $@
