FROM sjackman/linuxbrew-gcc
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN brew install bzip2 curl

# Install git without tcl-tk to prevent the error:
# Tapping homebrew/dupes. You must: brew install git
RUN brew install git --with-brewed-curl --with-brewed-openssl --without-tcl-tk

RUN brew tap homebrew/dupes
RUN brew install coreutils findutils gawk gnu-sed gnu-which grep make
RUN brew install ruby

RUN brew doctor
