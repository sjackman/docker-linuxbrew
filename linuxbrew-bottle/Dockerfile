FROM sjackman/linuxbrew-gcc
MAINTAINER Shaun Jackman <sjackman@gmail.com>

ENV HOMEBREW_BUILD_BOTTLE dependencies
ENV HOMEBREW_BUILD_FROM_SOURCE 1
ENV HOMEBREW_DEVELOPER 1

# Install tcl for git
RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/tcl-tk.rb --without-tk

RUN brew install bzip2 curl git

# Fix error setting certificate verify locations
RUN brew postinstall openssl

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
