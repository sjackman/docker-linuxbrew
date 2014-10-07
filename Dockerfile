FROM ubuntu
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN apt-get update
RUN apt-get install -y curl g++ make ruby

RUN useradd -m linuxbrew
RUN sudo -u linuxbrew -i /bin/bash

RUN PATH=~/.linuxbrew/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN yes |ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
RUN brew install hello && brew test -v hello; brew remove hello
