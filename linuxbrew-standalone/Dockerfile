FROM sjackman/linuxbrew-core
MAINTAINER Shaun Jackman <sjackman@gmail.com>

USER root
RUN apt-get -y install tcl
RUN ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
USER linuxbrew

RUN mkdir ~/.linuxbrew/lib \
	&& ln -s lib ~/.linuxbrew/lib64

RUN brew install glibc \
	&& brew unlink glibc

RUN brew install https://raw.githubusercontent.com/Homebrew/homebrew-dupes/master/zlib.rb
RUN brew reinstall binutils

RUN brew link glibc
RUN brew install gcc --with-glibc --only-dependencies
RUN brew install gcc --with-glibc -v

RUN brew install curl expat git
RUN brew tap homebrew/dupes
RUN brew install bzip2 coreutils findutils gawk gnu-sed gnu-which grep libpng libxml2 libxslt make ncurses readline

RUN ln -s ncursesw/curses.h ~/.linuxbrew/include/

RUN brew install ruby

ENV PATH ~/.linuxbrew/bin:~/.linuxbrew/sbin
RUN brew doctor
