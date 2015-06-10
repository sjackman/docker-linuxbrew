FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir $HOME/.linuxbrew/lib \
	&& ln -s lib $HOME/.linuxbrew/lib64

RUN brew install glibc

RUN brew unlink glibc
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
RUN brew reinstall binutils
RUN brew link glibc

RUN brew install patchelf
RUN brew install gcc --with-glibc --only-dependencies
RUN brew install gcc --with-glibc -v

RUN brew doctor
