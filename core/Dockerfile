FROM sjackman/linuxbrew:ubuntu
MAINTAINER Shaun Jackman <sjackman@gmail.com>

RUN apt-get install -y curl g++ make ruby

RUN useradd -m linuxbrew

USER linuxbrew
ENV PATH /home/linuxbrew/.linuxbrew/bin:$PATH
RUN yes |ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/linuxbrew/go/install)"
