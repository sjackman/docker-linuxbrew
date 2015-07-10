FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir $HOME/.linuxbrew/lib \
	&& ln -s lib $HOME/.linuxbrew/lib64

RUN brew install glibc

RUN brew unlink glibc
RUN brew reinstall binutils
RUN brew link glibc

RUN brew install patchelf
RUN brew install gcc --with-glibc --only-dependencies
RUN brew fetch gcc

# Warning: Git could not be found in your PATH.
RUN brew doctor || true
