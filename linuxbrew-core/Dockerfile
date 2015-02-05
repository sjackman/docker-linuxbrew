FROM ubuntu
MAINTAINER Shaun Jackman <sjackman@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qq curl g++ gawk m4 make patch ruby tcl git

RUN useradd -m linuxbrew
RUN echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
ENV unset LD_LIBRARY_PATH HOMEBREW_CC
ENV prefix /home/linuxbrew/linuxbrew
ENV PATH $prefix/bin:$prefix/sbin:$PATH

RUN git clone https://github.com/Homebrew/linuxbrew.git $prefix
RUN brew doctor || true
