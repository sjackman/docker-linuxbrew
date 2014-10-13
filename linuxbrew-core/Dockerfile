FROM ubuntu
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN apt-get update
RUN apt-get install -y curl g++ make ruby

RUN useradd -m linuxbrew

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH /home/linuxbrew/.linuxbrew/bin:$PATH
RUN yes |ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
