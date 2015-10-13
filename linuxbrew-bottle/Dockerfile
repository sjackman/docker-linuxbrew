FROM sjackman/linuxbrew-gcc
MAINTAINER Shaun Jackman <sjackman@gmail.com>

ENV HOMEBREW_BUILD_BOTTLE dependencies
ENV HOMEBREW_BUILD_FROM_SOURCE 1
ENV HOMEBREW_DEVELOPER 1

RUN brew install openssl

# Fix error setting certificate verify locations
# and Error: Failed to download resource "openssl--cacert"
RUN brew postinstall openssl

RUN brew install bzip2 curl

# Install git without tcl-tk to prevent the error:
# Tapping homebrew/dupes. You must: brew install git
RUN brew install git --with-brewed-curl --with-brewed-openssl --without-tcl-tk

RUN brew tap homebrew/dupes
RUN brew install coreutils findutils gawk gnu-sed gnu-which grep make
RUN brew install ruby

RUN brew doctor

RUN mkdir bottles
WORKDIR bottles
ENV HOMEBREW_DEBUG 1
ENV HOMEBREW_VERBOSE 1
RUN brew list
RUN brew bottle --rb `brew list` || true
RUN brew bottle --merge *.bottle.rb
